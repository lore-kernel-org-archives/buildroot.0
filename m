Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05BCC8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 14:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C55819CC;
	Tue,  8 Jul 2025 14:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPCTLmgISvdy; Tue,  8 Jul 2025 14:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F459819D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F459819D1;
	Tue,  8 Jul 2025 14:21:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75D9512E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 14:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C27360ACD
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 14:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sQ6bLGaPI3c for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 14:21:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B84060A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B84060A95
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B84060A95
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 14:21:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so820586166b.3
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 07:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751984502; x=1752589302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pwzsSz4X0gsz+iz1LUB0n1sSMZofU8d+jlUMUamKNj8=;
 b=UWydkZKVtr/y0eYFwaAPJo0rKZJx/RulQpk9rBr3LfK5GjeK+Xb+HDy+Xi2nC1xcAM
 3LQU3M6EjcvP/vHNskGv7aXRYsAavCo8b1x6eZ3r4ogkQGh7DA6Y/rtgrjZORZBYBNPt
 jqLtw01dIRR2u6bxlUe11QJ/xk554KlBmn+fy2XHBTkx+7X54bsTsG7AX9x5bZPORY0G
 +mKpsRyCWymu5zjowGfUei1YqwBH3knrLblnOt+zg9mEXmh1aZmYO5iL1G2sm35Tb/iG
 rD9XIICJRM+QQkJUhXURvUaJ934GPNdskA+lT3tXrTpzjfe2ICMT0ydGf3tr1C5I0BKj
 /qEg==
X-Gm-Message-State: AOJu0YzGR19ELsBuMYbw9Ck7+3ADX7V2vNrjj2yfbKHYStqhhbPYiIyo
 jMwPud3FFrS1ALGhrTa70p6pwSGkUyX8ryFRIJwzyCNzOhhptEAxCep4UCmwpQ==
X-Gm-Gg: ASbGnctlbkugPVh+pd5DtuF69uU6dUxaa0lAhnZYzGqyRvLiJ2Dk1j8BvbWaTRj1AeO
 CFRelbzDMJs8iXMioiHomvnLuh3uO0VP8RM3J0fRmLP8Z6lLZA/6/nn63j6+6Pre+xK4KKXbrhu
 4MYzdvsircQGLSvdmJ1nDyw2FSeXGfSM0QmdpZZF0Pv5S1kXCaeLNYhd6FgCeZrhmmGG4NSF8Id
 Nz9D67yP8qrArViIBSZ/n0H0v751pf2hIOpkX6bIh1pz76PE7bM6Yi4EeRXs3f2yB/d5Zl0yOXv
 txwTVeutrA0wLwT0myv4yBFsmDGUP/uUYMmjywF7GbC8NhPVIjNIo5/IUDCX5M7wXsdejK6od8/
 3up9LptJPHKtZk04LHJ66/6GJMxy+trabSaiz+QdYWeY=
X-Google-Smtp-Source: AGHT+IFOnrrTqgfIn8gQVqd5/U8Kq3V6Wgerj/tRdKoWHrHyMegz0t+OvmfdYDS6uJC8fWgElep3iw==
X-Received: by 2002:a17:906:d550:b0:ade:4593:d7cd with SMTP id
 a640c23a62f3a-ae3fe5b6beemr1686013866b.13.1751984502059; 
 Tue, 08 Jul 2025 07:21:42 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6ac36c7sm918815266b.91.2025.07.08.07.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 07:21:41 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Tue,  8 Jul 2025 16:21:38 +0200
Message-Id: <20250708142138.2223430-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1751984502; x=1752589302; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pwzsSz4X0gsz+iz1LUB0n1sSMZofU8d+jlUMUamKNj8=;
 b=hWsscpva7D0+NWHVmdnUaQyNiK0JKjD+ojrlJelyz/UXEpaC9d3MIPr/hAMIZ1blRm
 vzXWHPZjplmbfGN+viguFJ4gBDPfgWSZEfGmHjDFGIfHbesqfhI0TVz2I2DcUOBd+/Yk
 uz96dWyHk6PavUCUkbZROWs2idpQ3OXlpqzf/CeFZdPA7LLjXFqk/HipJMmpAZT+36Hb
 GSoWS/pjNKEMGNH6LYFvCTjhc+9C9cyHekcFLr8tA92DPWSjQhaP7sB49SVIrY6ucxEr
 nkjhKj/+pEUZ8Xo0vFd8rMRRlRsJWhKge8Qbct0eTl8ZyvKK6KrNPY5E2Xhu/1hA57TP
 T9Mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hWsscpva
Subject: [Buildroot] [PATCH] package/python-tornado: bump to version 6.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/tornadoweb/tornado/releases/tag/v6.5.1

Drop an already upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...l-raise-errors-instead-of-logging-in.patch | 234 ------------------
 package/python-tornado/python-tornado.hash    |   4 +-
 package/python-tornado/python-tornado.mk      |   7 +-
 3 files changed, 4 insertions(+), 241 deletions(-)
 delete mode 100644 package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch

diff --git a/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
deleted file mode 100644
index 85f5852bf7..0000000000
--- a/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From cc61050e8f26697463142d99864b562e8470b41d Mon Sep 17 00:00:00 2001
-From: Ben Darnell <ben@bendarnell.com>
-Date: Thu, 8 May 2025 13:29:43 -0400
-Subject: [PATCH] httputil: Raise errors instead of logging in
- multipart/form-data parsing
-
-We used to continue after logging an error, which allowed repeated
-errors to spam the logs. The error raised here will still be logged,
-but only once per request, consistent with other error handling in
-Tornado.
-
-Upstream: https://github.com/tornadoweb/tornado/commit/b39b892bf78fe8fea01dd45199aa88307e7162f3
-
-CVE: CVE-2025-47287
-
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- tornado/httputil.py             | 30 +++++++++++-------------------
- tornado/test/httpserver_test.py |  4 ++--
- tornado/test/httputil_test.py   | 13 ++++++++-----
- tornado/web.py                  | 17 +++++++++++++----
- 4 files changed, 34 insertions(+), 30 deletions(-)
-
-diff --git a/tornado/httputil.py b/tornado/httputil.py
-index 7044aca02..ef460985e 100644
---- a/tornado/httputil.py
-+++ b/tornado/httputil.py
-@@ -34,7 +34,6 @@
- from urllib.parse import urlencode, urlparse, urlunparse, parse_qsl
- 
- from tornado.escape import native_str, parse_qs_bytes, utf8
--from tornado.log import gen_log
- from tornado.util import ObjectDict, unicode_type
- 
- 
-@@ -884,25 +883,22 @@ def parse_body_arguments(
-     """
-     if content_type.startswith("application/x-www-form-urlencoded"):
-         if headers and "Content-Encoding" in headers:
--            gen_log.warning(
--                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
-+            raise HTTPInputError(
-+                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
-             )
--            return
-         try:
-             # real charset decoding will happen in RequestHandler.decode_argument()
-             uri_arguments = parse_qs_bytes(body, keep_blank_values=True)
-         except Exception as e:
--            gen_log.warning("Invalid x-www-form-urlencoded body: %s", e)
--            uri_arguments = {}
-+            raise HTTPInputError("Invalid x-www-form-urlencoded body: %s" % e) from e
-         for name, values in uri_arguments.items():
-             if values:
-                 arguments.setdefault(name, []).extend(values)
-     elif content_type.startswith("multipart/form-data"):
-         if headers and "Content-Encoding" in headers:
--            gen_log.warning(
--                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
-+            raise HTTPInputError(
-+                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
-             )
--            return
-         try:
-             fields = content_type.split(";")
-             for field in fields:
-@@ -911,9 +907,9 @@ def parse_body_arguments(
-                     parse_multipart_form_data(utf8(v), body, arguments, files)
-                     break
-             else:
--                raise ValueError("multipart boundary not found")
-+                raise HTTPInputError("multipart boundary not found")
-         except Exception as e:
--            gen_log.warning("Invalid multipart/form-data: %s", e)
-+            raise HTTPInputError("Invalid multipart/form-data: %s" % e) from e
- 
- 
- def parse_multipart_form_data(
-@@ -942,26 +938,22 @@ def parse_multipart_form_data(
-         boundary = boundary[1:-1]
-     final_boundary_index = data.rfind(b"--" + boundary + b"--")
-     if final_boundary_index == -1:
--        gen_log.warning("Invalid multipart/form-data: no final boundary")
--        return
-+        raise HTTPInputError("Invalid multipart/form-data: no final boundary found")
-     parts = data[:final_boundary_index].split(b"--" + boundary + b"\r\n")
-     for part in parts:
-         if not part:
-             continue
-         eoh = part.find(b"\r\n\r\n")
-         if eoh == -1:
--            gen_log.warning("multipart/form-data missing headers")
--            continue
-+            raise HTTPInputError("multipart/form-data missing headers")
-         headers = HTTPHeaders.parse(part[:eoh].decode("utf-8"))
-         disp_header = headers.get("Content-Disposition", "")
-         disposition, disp_params = _parse_header(disp_header)
-         if disposition != "form-data" or not part.endswith(b"\r\n"):
--            gen_log.warning("Invalid multipart/form-data")
--            continue
-+            raise HTTPInputError("Invalid multipart/form-data")
-         value = part[eoh + 4 : -2]
-         if not disp_params.get("name"):
--            gen_log.warning("multipart/form-data value missing name")
--            continue
-+            raise HTTPInputError("multipart/form-data missing name")
-         name = disp_params["name"]
-         if disp_params.get("filename"):
-             ctype = headers.get("Content-Type", "application/unknown")
-diff --git a/tornado/test/httpserver_test.py b/tornado/test/httpserver_test.py
-index 570cb64ca..f197cfef8 100644
---- a/tornado/test/httpserver_test.py
-+++ b/tornado/test/httpserver_test.py
-@@ -1148,9 +1148,9 @@ def test_gzip_unsupported(self):
-         # Gzip support is opt-in; without it the server fails to parse
-         # the body (but parsing form bodies is currently just a log message,
-         # not a fatal error).
--        with ExpectLog(gen_log, "Unsupported Content-Encoding"):
-+        with ExpectLog(gen_log, ".*Unsupported Content-Encoding"):
-             response = self.post_gzip("foo=bar")
--        self.assertEqual(json_decode(response.body), {})
-+        self.assertEqual(response.code, 400)
- 
- 
- class StreamingChunkSizeTest(AsyncHTTPTestCase):
-diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
-index 30fbec4d7..7a09beaa3 100644
---- a/tornado/test/httputil_test.py
-+++ b/tornado/test/httputil_test.py
-@@ -12,7 +12,6 @@
- )
- from tornado.escape import utf8, native_str
- from tornado.log import gen_log
--from tornado.testing import ExpectLog
- from tornado.test.util import ignore_deprecation
- 
- import copy
-@@ -195,7 +194,9 @@ def test_missing_headers(self):
-             b"\n", b"\r\n"
-         )
-         args, files = form_data_args()
--        with ExpectLog(gen_log, "multipart/form-data missing headers"):
-+        with self.assertRaises(
-+            HTTPInputError, msg="multipart/form-data missing headers"
-+        ):
-             parse_multipart_form_data(b"1234", data, args, files)
-         self.assertEqual(files, {})
- 
-@@ -209,7 +210,7 @@ def test_invalid_content_disposition(self):
-             b"\n", b"\r\n"
-         )
-         args, files = form_data_args()
--        with ExpectLog(gen_log, "Invalid multipart/form-data"):
-+        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
-             parse_multipart_form_data(b"1234", data, args, files)
-         self.assertEqual(files, {})
- 
-@@ -222,7 +223,7 @@ def test_line_does_not_end_with_correct_line_break(self):
-             b"\n", b"\r\n"
-         )
-         args, files = form_data_args()
--        with ExpectLog(gen_log, "Invalid multipart/form-data"):
-+        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
-             parse_multipart_form_data(b"1234", data, args, files)
-         self.assertEqual(files, {})
- 
-@@ -236,7 +237,9 @@ def test_content_disposition_header_without_name_parameter(self):
-             b"\n", b"\r\n"
-         )
-         args, files = form_data_args()
--        with ExpectLog(gen_log, "multipart/form-data value missing name"):
-+        with self.assertRaises(
-+            HTTPInputError, msg="multipart/form-data value missing name"
-+        ):
-             parse_multipart_form_data(b"1234", data, args, files)
-         self.assertEqual(files, {})
- 
-diff --git a/tornado/web.py b/tornado/web.py
-index 0303f547e..2f702d648 100644
---- a/tornado/web.py
-+++ b/tornado/web.py
-@@ -1801,6 +1801,14 @@ async def _execute(
-         try:
-             if self.request.method not in self.SUPPORTED_METHODS:
-                 raise HTTPError(405)
-+
-+            # If we're not in stream_request_body mode, this is the place where we parse the body.
-+            if not _has_stream_request_body(self.__class__):
-+                try:
-+                    self.request._parse_body()
-+                except httputil.HTTPInputError as e:
-+                    raise HTTPError(400, "Invalid body: %s" % e) from e
-+
-             self.path_args = [self.decode_argument(arg) for arg in args]
-             self.path_kwargs = dict(
-                 (k, self.decode_argument(v, name=k)) for (k, v) in kwargs.items()
-@@ -1992,7 +2000,7 @@ def _has_stream_request_body(cls: Type[RequestHandler]) -> bool:
- 
- 
- def removeslash(
--    method: Callable[..., Optional[Awaitable[None]]]
-+    method: Callable[..., Optional[Awaitable[None]]],
- ) -> Callable[..., Optional[Awaitable[None]]]:
-     """Use this decorator to remove trailing slashes from the request path.
- 
-@@ -2021,7 +2029,7 @@ def wrapper(  # type: ignore
- 
- 
- def addslash(
--    method: Callable[..., Optional[Awaitable[None]]]
-+    method: Callable[..., Optional[Awaitable[None]]],
- ) -> Callable[..., Optional[Awaitable[None]]]:
-     """Use this decorator to add a missing trailing slash to the request path.
- 
-@@ -2445,8 +2453,9 @@ def finish(self) -> None:
-         if self.stream_request_body:
-             future_set_result_unless_cancelled(self.request._body_future, None)
-         else:
-+            # Note that the body gets parsed in RequestHandler._execute so it can be in
-+            # the right exception handler scope.
-             self.request.body = b"".join(self.chunks)
--            self.request._parse_body()
-             self.execute()
- 
-     def on_connection_close(self) -> None:
-@@ -3332,7 +3341,7 @@ def transform_chunk(self, chunk: bytes, finishing: bool) -> bytes:
- 
- 
- def authenticated(
--    method: Callable[..., Optional[Awaitable[None]]]
-+    method: Callable[..., Optional[Awaitable[None]]],
- ) -> Callable[..., Optional[Awaitable[None]]]:
-     """Decorate methods with this to require that the user be logged in.
- 
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index cf52729bb3..7ec58cbe7d 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  a14a7d70e304fcf96f06ccc2db98b98d  tornado-6.5.tar.gz
-sha256  c70c0a26d5b2d85440e4debd14a8d0b463a0cf35d92d3af05f5f1ffa8675c826  tornado-6.5.tar.gz
+md5  e3e3d74e2fedffacdacd8626d0c17a37  tornado-6.5.1.tar.gz
+sha256  84ceece391e8eb9b2b95578db65e920d2a61070260594819589609ba9bc6308c  tornado-6.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index f5b4609e0d..ee833938bd 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5
+PYTHON_TORNADO_VERSION = 6.5.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/63/c4/bb3bd68b1b3cd30abc6411469875e6d32004397ccc4a3230479f86f86a73
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/51/89/c72771c81d25d53fe33e3dca61c233b665b2780f21820ba6fd2c6793c12b
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
 PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
-# 0001-httputil-raise-errors-instead-of-logging-in.patch
-PYTHON_TORNADO_IGNORE_CVES += CVE-2025-47287
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
