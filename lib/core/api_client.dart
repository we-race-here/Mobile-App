import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          '',
          data: data,
          // queryParameters: {'apikey': ApiSecret.apiKey},
          options: Options(headers: {}));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://dev.weracehere.org/token/auth/',
        data: {
          'username': email,
          'password': password,
        },
        // queryParameters: {'apikey': ApiSecret.apiKey},
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://dev.weracehere.org/api/v1/account/me',
        // queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        '',
        data: data,
        // queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        '',
        // queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}