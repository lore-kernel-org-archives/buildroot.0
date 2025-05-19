Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC837C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D17404A9;
	Mon, 19 May 2025 15:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OvK_0gqkmbI; Mon, 19 May 2025 15:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF08404C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF08404C1;
	Mon, 19 May 2025 15:11:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D89D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 199C680D55
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-ezW86DFfuV for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9447180E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9447180E07
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9447180E07
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:11:45 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-32807137b94so33215761fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747667503; x=1748272303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kU4HJkBUZG70EdXv1ravh3KQ0bhlkuf7spQrq67W+7k=;
 b=bW+q3ul3VW2zYdwJmFc1dWDrj3y8rGzUSHYB8NazKFf+6CGHAI0KC0afkPtcLkqwPJ
 kf9ZuX2B5sXvYIlkD/vwBP009wjbP9vOTrrBG9MTiL8j47tKAGJdiMgdlCPQZG+XwR+k
 zonejY1y8HbKi9KmCTmpg7cd0wiIUVbFTNXQX8U3pJwj3I7KI5nq0VlqY1LxFl1BmnEp
 5DzxIyXqiOORu2jTzU45YYhrbaG1UkeRulISmhoRD0E7KV41X/8nnzYaKs6YfvUGklTK
 m2DVbZ2tLRTuKuAigUctWlzd7x+siuYC8+KcyC0EagiAoEc3SPW/ZNeJ70ptpzxK1ene
 Nixw==
X-Gm-Message-State: AOJu0YwVrFIo/gVO0G0WAcs8N3UM04fp7R+DHe1/39OuHAIRyhN35toD
 w2cAzA6kPPhQ5cUOBTiqgfRzuT5zJ8g8uc6maE1rCV/lN7ZiSqwhEHMMbT44By9Jv7WN9HkB8mT
 k1Fo1B3Q=
X-Gm-Gg: ASbGncuLLyVOdwaTWCPDn31Gyg6GT8p3d9iuhUpQkYqayQS1aD0kzU3jFfHK3xwbZnv
 DQujxvB08yuKlVHLTFWnYu619nCMATsWsHvqEkqnQVqRot/324SQmIP1ceOTHSW5DmqnF75oXR4
 7MaGyvibwiqses2mEZ7U+mPQWOP+QodvDlLIsOzpnFxhbwDHihXlK0b39Q3U/zsZEKTqNqlYCDj
 Kk3D5Z9O8YrTfMO/3Nt9Oy7VGTgBo0Lb5yxLoip9yTjGxbMyJaJB126vLuj1vXO+WVzEdZZ+7H8
 UPeBzkRhh+8UsCebxAqugGBP4m3ICKys7SkIZKRnmLrmLRA3WwdH8+IxoaUBv8Hxw1vqAjnLwIW
 jXRzcijk=
X-Google-Smtp-Source: AGHT+IHbOgDiPJ9V2/AvI03WdNsu99laDQL6ujGJPd+LX+qS1JX4ZMgNKw3d7wiM1gbPW4YwlWXkWQ==
X-Received: by 2002:a05:6000:22c5:b0:3a3:697f:a46 with SMTP id
 ffacd0b85a97d-3a3697f0bdcmr5890480f8f.11.1747667008073; 
 Mon, 19 May 2025 08:03:28 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d224sm13534032f8f.12.2025.05.19.08.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 08:03:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 17:03:14 +0200
Message-ID: <20250519150314.4117224-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747667503; x=1748272303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kU4HJkBUZG70EdXv1ravh3KQ0bhlkuf7spQrq67W+7k=;
 b=cZqxnwzLr6v0H5+PG6Tc9W0ae50gwcKLpzM3CZzORa1KCKYggRnO6AfRPHnTRqFWz5
 0oDj0zpdRHDKcxIWg310HjVO6gzfWXQ5+zHZfZS5ShOG9QbGIuO5yHtkFj2rgDsjPKUT
 i6DYWQDDmNJGXvr1TGxMEvJ1q4DzT58o0HiAhtW/1Uvx7vK5AKP1OZV4i20Nuf73dVN3
 QC39b5mExAQdXpaFm56hMqH41Iau/4jXWRgZfdOpKqYvFA3j9u//PVXQeFDfB3xWITBj
 0SHKPM6FESYjLBTZxpl/MSZM6jqSnrJ1XwvXfUHC8Q/xjZKxmY4iHI+Zo8CwM3GiGjcD
 6buQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cZqxnwzL
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-tornado: apply
 security patch for CVE-2025-47287
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following CVE:
- CVE-2025-47287: When Tornado's ``multipart/form-data`` parser encounters
                  certain errors, it logs a warning but continues trying to
                  parse the remainder of the data. This allows remote
                  attackers to generate an extremely high volume of logs,
                  constituting a DoS attack.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
The patch herebelow is an alternative to the version bump of python-tornado
v6.4.2 -> v6.5 proposed in my previous email
(https://lists.buildroot.org/pipermail/buildroot/2025-May/779833.html).
Indeed, we may not want to perform a minor version bump of that package in
Buildroot LTS 2025.02.x; otherwise simply ignore this patch
---
 ...l-raise-errors-instead-of-logging-in.patch | 234 ++++++++++++++++++
 package/python-tornado/python-tornado.mk      |   3 +
 2 files changed, 237 insertions(+)
 create mode 100644 package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch

diff --git a/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
new file mode 100644
index 0000000000..ee8942ea6d
--- /dev/null
+++ b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
@@ -0,0 +1,234 @@
+From cc61050e8f26697463142d99864b562e8470b41d Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Thu, 8 May 2025 13:29:43 -0400
+Subject: [PATCH] httputil: Raise errors instead of logging in
+ multipart/form-data parsing
+
+We used to continue after logging an error, which allowed repeated
+errors to spam the logs. The error raised here will still be logged,
+but only once per request, consistent with other error handling in
+Tornado.
+
+Upstream: https://github.com/tornadoweb/tornado/commit/b39b892bf78fe8fea01dd45199aa88307e7162f3
+
+CVE: CVE-2025-47287
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ tornado/httputil.py             | 30 +++++++++++-------------------
+ tornado/test/httpserver_test.py |  4 ++--
+ tornado/test/httputil_test.py   | 13 ++++++++-----
+ tornado/web.py                  | 17 +++++++++++++----
+ 4 files changed, 34 insertions(+), 30 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index 7044aca02..ef460985e 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -34,7 +34,6 @@
+ from urllib.parse import urlencode, urlparse, urlunparse, parse_qsl
+ 
+ from tornado.escape import native_str, parse_qs_bytes, utf8, to_unicode
+-from tornado.log import gen_log
+ from tornado.util import ObjectDict, unicode_type
+ 
+ 
+@@ -884,25 +883,22 @@ def parse_body_arguments(
+     """
+     if content_type.startswith("application/x-www-form-urlencoded"):
+         if headers and "Content-Encoding" in headers:
+-            gen_log.warning(
+-                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
++            raise HTTPInputError(
++                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
+             )
+-            return
+         try:
+             # real charset decoding will happen in RequestHandler.decode_argument()
+             uri_arguments = parse_qs_bytes(body, keep_blank_values=True)
+         except Exception as e:
+-            gen_log.warning("Invalid x-www-form-urlencoded body: %s", e)
+-            uri_arguments = {}
++            raise HTTPInputError("Invalid x-www-form-urlencoded body: %s" % e) from e
+         for name, values in uri_arguments.items():
+             if values:
+                 arguments.setdefault(name, []).extend(values)
+     elif content_type.startswith("multipart/form-data"):
+         if headers and "Content-Encoding" in headers:
+-            gen_log.warning(
+-                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
++            raise HTTPInputError(
++                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
+             )
+-            return
+         try:
+             fields = content_type.split(";")
+             for field in fields:
+@@ -911,9 +907,9 @@ def parse_body_arguments(
+                     parse_multipart_form_data(utf8(v), body, arguments, files)
+                     break
+             else:
+-                raise ValueError("multipart boundary not found")
++                raise HTTPInputError("multipart boundary not found")
+         except Exception as e:
+-            gen_log.warning("Invalid multipart/form-data: %s", e)
++            raise HTTPInputError("Invalid multipart/form-data: %s" % e) from e
+ 
+ 
+ def parse_multipart_form_data(
+@@ -942,26 +938,22 @@ def parse_multipart_form_data(
+         boundary = boundary[1:-1]
+     final_boundary_index = data.rfind(b"--" + boundary + b"--")
+     if final_boundary_index == -1:
+-        gen_log.warning("Invalid multipart/form-data: no final boundary")
+-        return
++        raise HTTPInputError("Invalid multipart/form-data: no final boundary found")
+     parts = data[:final_boundary_index].split(b"--" + boundary + b"\r\n")
+     for part in parts:
+         if not part:
+             continue
+         eoh = part.find(b"\r\n\r\n")
+         if eoh == -1:
+-            gen_log.warning("multipart/form-data missing headers")
+-            continue
++            raise HTTPInputError("multipart/form-data missing headers")
+         headers = HTTPHeaders.parse(part[:eoh].decode("utf-8"))
+         disp_header = headers.get("Content-Disposition", "")
+         disposition, disp_params = _parse_header(disp_header)
+         if disposition != "form-data" or not part.endswith(b"\r\n"):
+-            gen_log.warning("Invalid multipart/form-data")
+-            continue
++            raise HTTPInputError("Invalid multipart/form-data")
+         value = part[eoh + 4 : -2]
+         if not disp_params.get("name"):
+-            gen_log.warning("multipart/form-data value missing name")
+-            continue
++            raise HTTPInputError("multipart/form-data missing name")
+         name = disp_params["name"]
+         if disp_params.get("filename"):
+             ctype = headers.get("Content-Type", "application/unknown")
+diff --git a/tornado/test/httpserver_test.py b/tornado/test/httpserver_test.py
+index 570cb64ca..f197cfef8 100644
+--- a/tornado/test/httpserver_test.py
++++ b/tornado/test/httpserver_test.py
+@@ -1148,9 +1148,9 @@ def test_gzip_unsupported(self):
+         # Gzip support is opt-in; without it the server fails to parse
+         # the body (but parsing form bodies is currently just a log message,
+         # not a fatal error).
+-        with ExpectLog(gen_log, "Unsupported Content-Encoding"):
++        with ExpectLog(gen_log, ".*Unsupported Content-Encoding"):
+             response = self.post_gzip("foo=bar")
+-        self.assertEqual(json_decode(response.body), {})
++        self.assertEqual(response.code, 400)
+ 
+ 
+ class StreamingChunkSizeTest(AsyncHTTPTestCase):
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 30fbec4d7..7a09beaa3 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -12,7 +12,6 @@
+ )
+ from tornado.escape import utf8, native_str
+ from tornado.log import gen_log
+-from tornado.testing import ExpectLog
+ from tornado.test.util import ignore_deprecation
+ 
+ import copy
+@@ -195,7 +194,9 @@ def test_missing_headers(self):
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "multipart/form-data missing headers"):
++        with self.assertRaises(
++            HTTPInputError, msg="multipart/form-data missing headers"
++        ):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+@@ -209,7 +210,7 @@ def test_invalid_content_disposition(self):
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "Invalid multipart/form-data"):
++        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+@@ -222,7 +223,7 @@ def test_line_does_not_end_with_correct_line_break(self):
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "Invalid multipart/form-data"):
++        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+@@ -236,7 +237,9 @@ def test_content_disposition_header_without_name_parameter(self):
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "multipart/form-data value missing name"):
++        with self.assertRaises(
++            HTTPInputError, msg="multipart/form-data value missing name"
++        ):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+diff --git a/tornado/web.py b/tornado/web.py
+index 0303f547e..2f702d648 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -1801,6 +1801,14 @@ async def _execute(
+         try:
+             if self.request.method not in self.SUPPORTED_METHODS:
+                 raise HTTPError(405)
++
++            # If we're not in stream_request_body mode, this is the place where we parse the body.
++            if not _has_stream_request_body(self.__class__):
++                try:
++                    self.request._parse_body()
++                except httputil.HTTPInputError as e:
++                    raise HTTPError(400, "Invalid body: %s" % e) from e
++
+             self.path_args = [self.decode_argument(arg) for arg in args]
+             self.path_kwargs = {
+                 k: self.decode_argument(v, name=k) for (k, v) in kwargs.items()
+@@ -1992,7 +2000,7 @@ def _has_stream_request_body(cls: Type[RequestHandler]) -> bool:
+ 
+ 
+ def removeslash(
+-    method: Callable[..., Optional[Awaitable[None]]]
++    method: Callable[..., Optional[Awaitable[None]]],
+ ) -> Callable[..., Optional[Awaitable[None]]]:
+     """Use this decorator to remove trailing slashes from the request path.
+ 
+@@ -2021,7 +2029,7 @@ def wrapper(  # type: ignore
+ 
+ 
+ def addslash(
+-    method: Callable[..., Optional[Awaitable[None]]]
++    method: Callable[..., Optional[Awaitable[None]]],
+ ) -> Callable[..., Optional[Awaitable[None]]]:
+     """Use this decorator to add a missing trailing slash to the request path.
+ 
+@@ -2445,8 +2453,9 @@ def finish(self) -> None:
+         if self.stream_request_body:
+             future_set_result_unless_cancelled(self.request._body_future, None)
+         else:
++            # Note that the body gets parsed in RequestHandler._execute so it can be in
++            # the right exception handler scope.
+             self.request.body = b"".join(self.chunks)
+-            self.request._parse_body()
+             self.execute()
+ 
+     def on_connection_close(self) -> None:
+@@ -3332,7 +3341,7 @@ def transform_chunk(self, chunk: bytes, finishing: bool) -> bytes:
+ 
+ 
+ def authenticated(
+-    method: Callable[..., Optional[Awaitable[None]]]
++    method: Callable[..., Optional[Awaitable[None]]],
+ ) -> Callable[..., Optional[Awaitable[None]]]:
+     """Decorate methods with this to require that the user be logged in.
+ 
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 45883b844d..0a33a57ed4 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -13,4 +13,7 @@ PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
 PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
+# 0001-httputil-raise-errors-instead-of-logging-in.patch
+PYTHON_TORNADO_IGNORE_CVES += CVE-2025-47287
+
 $(eval $(python-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
