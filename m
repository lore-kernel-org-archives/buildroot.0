Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7BAC5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF4640C5D;
	Fri, 30 May 2025 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1-J9yKns6Y6; Fri, 30 May 2025 19:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4FE040C6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4FE040C6F;
	Fri, 30 May 2025 19:51:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B704236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5112400C2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gxinf7-28F3v for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C28340062
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C28340062
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB00F87791; Fri, 30 May 2025 19:51:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 21:49:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ef6f9496eb88e75af192627e30dd1b9b44c6bbf
X-Git-Newrev: dbc64cb4e54a584f186e182139f1d3bc08a56784
X-Patchwork-Hint: ignore
Message-Id: <20250530195147.EB00F87791@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tornado: apply
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dbc64cb4e54a584f186e182139f1d3bc08a56784
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixes the following CVE:
- CVE-2025-47287: When Tornado's ``multipart/form-data`` parser encounters
                  certain errors, it logs a warning but continues trying to
                  parse the remainder of the data. This allows remote
                  attackers to generate an extremely high volume of logs,
                  constituting a DoS attack.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-47287

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: reword commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...tputil-raise-errors-instead-of-logging-in.patch | 234 +++++++++++++++++++++
 package/python-tornado/python-tornado.mk           |   3 +
 2 files changed, 237 insertions(+)

diff --git a/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
new file mode 100644
index 0000000000..85f5852bf7
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
+ from tornado.escape import native_str, parse_qs_bytes, utf8
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
+             self.path_kwargs = dict(
+                 (k, self.decode_argument(v, name=k)) for (k, v) in kwargs.items()
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
