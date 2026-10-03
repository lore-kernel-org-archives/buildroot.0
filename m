Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1FCCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D347360623;
	Sat,  3 Oct 2026 17:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vR4XzquegYs; Sat,  3 Oct 2026 17:34:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B050660629
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048881;
	b=BtM3Gp7TUQmKFvGzFRftmkphXl5pydW4FpN3xyb3v+y6PQ8vUi4SqXt2upT6Y5Sh4FQn
	 4v+3I/YCROwhdvmBYNKYXw8BBm++QVq9MonV7pn07+9yQeMJzEsiJOjm/s2LR1LVuVJAu
	 niCCzxipXBbZ1fARu2JgJKuLBntGKhzocGiC6a2TxBYU27rJbBZo3tqFZbtzBRkdrzkby
	 p6uc6DbPwUJ3qALUc0O4zne4f2ZhIoRiFmxZsi9yTSyUUNuU5CiqQ0hXjYii47WybwIe/
	 62+ZWm1hdYbS6Q7nQkd2A6qC7N/1yNl276nrU1PhNCgvilpYeqH/PUEgGloJoKvdV0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oQMkrAw3SmWbyLVQXt0+00+ca5pNhBZ+7qTr5y01gpU=;
	b=A6e5JGNX8s+JbbDRUtl+YhbVjxXO/txxlt1syk6DhLxKYhSKluW7Pf5Zg3M0p7zT9izF
	 0ZfxxKTAFda2JaGAyr7lZcZuEAVEqV1WVzzaDqXh9V8TppE2DI3Dw798awLmL9OLjbipC
	 iQN62bCpczv3bllk4a7HvRjsPv6CD8M8o9i/nXuev2uUgR0+WCsLYaiqL2iCPKnPGwzFS
	 7D0qO0C5hkgy3wyZwGmOniBNI3BoQ8N0nRzRvgK9OlULVS472HK6Q9romq7ln8hBWyWWF
	 N1NpYkmHbS2bCGJw+hP25at2sxyIxXDTrcFJm4muaL97qRJeOJxL/CLmRs5IBkTWJSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048881;
	bh=oQMkrAw3SmWbyLVQXt0+00+ca5pNhBZ+7qTr5y01gpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NFZ1ORE3Wv5zlsOYCI8T07+h52pjpLt/+MAQjZasWouKa12+1sk8bUvZlEYLieJCh
	 fXigBikyfjmfD8VP3P68Tfj7sMp6T/g17uCFYkune+EpAzOjzg3PDJUoZynuscZMJb
	 Q6iZi+slmq10vhNIMyU8ULSKpuJi2d0SSToUGdzazqwkhhAXZ53Sn/7rZDqG61OuDo
	 dCG2jp6Jf9XrUQeRA13CPTi78yldifbdwTpqjPeR8eSDWN6VxTZlqTI5Z3hDytYWEk
	 tUZ7seQmrd6cfXtrTfs59jlUhvdWiQCYoEp/LooS1+XvC10qFJHagfi8BHPw0UVlgo
	 YZMQ7ovIiWHuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B050660629;
	Sat,  3 Oct 2026 17:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93210263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7888340064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeSkYNlARXVd for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:34:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 828BA40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048878;
 b=ZUPbWP/W/TUT988Y/F2rI2HsqwNAOx37r+5ieoOs9oT1t35mUWnwRpyixRXu69BFdElV
 rtWfgFS217q8oFe8ONJLqcYMVbHXMod3E5DHxVwE7p9te7yTU29S+Q0vC+erDHWfAKhdn
 VpiLxI+A9t4ilQ6IP/LLR6L1FZbsCDsPf0lCe+weGVstxfsPlgdjZc3bkQg3aI6Ye5HMa
 4Tz/xV6w6uKCKVtfC5bZvw7Y4N4RGBPLpbJenWZfparAxJXz7DvWQiNTZTbebRZQjDFPX
 /ixOAa7he23hUQrXTmdm6cwLJEKwdDFj3VGrIBrBO9QLbj12N4ssjrGCduHo8+bhZzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048878;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3+r2tWFBFahQC5ohiAy2X5WqFemDgr9Uwsj+r2JGIdY=;
 b=MDCWApu6Fj+9R7RXO18zidy0fJv9RnT9OX65fgKD7XtCAjs5rRMEmtRaPqFSgWO4cz0y
 rG6VqNx3KYmiykUOV7v+vZCSz9juCqXcsa6h6lt0gRGdACu3McSPozVzr8wgq4TO5G6II
 B5AKVDTKeeM3dT3un25urgi6jtO7D+6JAX1kTjBHIwihhvuQUF7YbNxCkDW2HvbikP32f
 xds10wFfDQzncU1lLjz6/tPS+/WbtIE+4soc365CfYc7UR1T+HrhtqmALv0nFx7PCf+kb
 RD2uK/UMYGnFzLjWShqpypnAbt3VTt3regRjHWOL+Dvgk/S7NuaFKnlZpi54sXjYj+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 828BA40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:34:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B39668B524; Sat,  3 Oct 2026 17:33:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b524480bde6d461f333e6070a7c79030ba59380e
X-Git-Newrev: 084bfa6e6d53e3b3e3fe30edf59c804a7898bcd7
X-Patchwork-Hint: ignore
Message-Id: <20261003173323.B39668B524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-servestatic: new package
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
Content-Type: multipart/mixed; boundary="===============5129307746941830571=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5129307746941830571==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/084bfa6e6d53e3b3e3fe30edf59c804a7898bcd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Added package for ServeStatic, version 4.3.2.
https://github.com/Archmonger/ServeStatic

Added a runtime test that verifies static-file responses through both
the WSGI and ASGI interfaces. Also verified that the installed
servestatic command-line entry point starts successfully.

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   5 +
 package/Config.in                                  |   1 +
 package/python-servestatic/Config.in               |  11 ++
 package/python-servestatic/python-servestatic.hash |   3 +
 package/python-servestatic/python-servestatic.mk   |  13 +++
 .../tests/package/sample_python_servestatic.py     | 118 +++++++++++++++++++++
 .../tests/package/test_python_servestatic.py       |  19 ++++
 7 files changed, 170 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fa97fb36d..b57058a177 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3013,6 +3013,11 @@ F:	package/lrzip/
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Michel <sebastian.michel@oss.othermo.de>
+F:	package/python-servestatic/
+F:	support/testing/tests/package/sample_python_servestatic.py
+F:	support/testing/tests/package/test_python_servestatic.py
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	board/armadeus/
 F:	configs/armadeus*
diff --git a/package/Config.in b/package/Config.in
index dcca214383..dc829675ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1420,6 +1420,7 @@ menu "External python modules"
 	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-serial-asyncio/Config.in"
+	source "package/python-servestatic/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-servestatic/Config.in b/package/python-servestatic/Config.in
new file mode 100644
index 0000000000..b2a1e2a45d
--- /dev/null
+++ b/package/python-servestatic/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SERVESTATIC
+	bool "python-servestatic"
+	select BR2_PACKAGE_PYTHON_ASGIREF # runtime dependency
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime dependency for cli / servestatic.storage usage
+	help
+	  Production-grade static file server for Python WSGI and ASGI.
+
+	  ServeStatic runs standalone or as middleware for an existing
+	  WSGI, ASGI, or Django application.
+
+	  https://github.com/Archmonger/ServeStatic
diff --git a/package/python-servestatic/python-servestatic.hash b/package/python-servestatic/python-servestatic.hash
new file mode 100644
index 0000000000..6d1fb6ecf9
--- /dev/null
+++ b/package/python-servestatic/python-servestatic.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  1ab67d0654910c000864f9b6d7fefa8befc21a2156d539cf9e519afcc27c4d63  python-servestatic-4.3.2.tar.gz
+sha256  1770e2fc440cce75b2b2bd1580c6d59f58a497f0bb7abe91a0136bee0f688bf3  LICENSE.md
diff --git a/package/python-servestatic/python-servestatic.mk b/package/python-servestatic/python-servestatic.mk
new file mode 100644
index 0000000000..26d93fe9b5
--- /dev/null
+++ b/package/python-servestatic/python-servestatic.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-servestatic
+#
+################################################################################
+
+PYTHON_SERVESTATIC_VERSION = 4.3.2
+PYTHON_SERVESTATIC_SITE = $(call github,Archmonger,ServeStatic,$(PYTHON_SERVESTATIC_VERSION))
+PYTHON_SERVESTATIC_SETUP_TYPE = hatch
+PYTHON_SERVESTATIC_LICENSE = MIT
+PYTHON_SERVESTATIC_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_servestatic.py b/support/testing/tests/package/sample_python_servestatic.py
new file mode 100644
index 0000000000..22c69cdbcf
--- /dev/null
+++ b/support/testing/tests/package/sample_python_servestatic.py
@@ -0,0 +1,118 @@
+import asyncio
+import os
+import tempfile
+from collections.abc import Callable
+from types import TracebackType
+from typing import TypeAlias
+from wsgiref.types import StartResponse
+
+from asgiref.typing import HTTPScope, HTTPRequestEvent, ASGIVersions
+
+from servestatic import ServeStatic, ServeStaticASGI
+
+CONTENT = b"ServeStatic works on Buildroot.\n"
+
+_ExcInfo: TypeAlias = tuple[type[BaseException], BaseException, TracebackType]
+_OptExcInfo: TypeAlias = _ExcInfo | tuple[None, None, None]
+
+
+def assert_response_ok(status, headers, body):
+    assert status == 200
+    assert headers["content-length"] == str(len(CONTENT))
+    assert headers["content-type"].startswith("text/plain")
+    assert body == CONTENT
+
+
+def test_wsgi(content_directory):
+    app = ServeStatic(None, root=content_directory)
+    response_data = {}
+
+    class DummyStartResponse(StartResponse):
+        def __call__(self, status: str, headers: list[tuple[str, str]], exc_info: _OptExcInfo | None = None, /) -> \
+                Callable[[bytes], object]:
+            response_data["status"] = int(status.split()[0])
+            response_data["headers"] = {
+                key.lower(): value for key, value in headers
+            }
+            return super().__call__(status, headers, exc_info)
+
+    start_response = DummyStartResponse()
+
+    environ_test_request = {
+        "PATH_INFO": "/test_content.txt",
+        "REQUEST_METHOD": "GET",
+    }
+    response = app(environ_test_request, start_response)
+    try:
+        body = b"".join(response)
+    finally:
+        close = getattr(response, "close", None)
+        if callable(close):
+            close: Callable[None]
+            close()
+
+    assert_response_ok(
+        response_data["status"], response_data["headers"], body
+    )
+
+
+async def test_asgi(content_directory):
+    app = ServeStaticASGI(None, root=content_directory)
+    messages_received_from_application = []
+
+    async def receive() -> HTTPRequestEvent:
+        return HTTPRequestEvent(
+            type="http.request",
+            body=b"",
+            more_body=False,
+        )
+
+    # will be invoked when the application "sends" data back -> append all sent data to the messages list
+    async def send(message):
+        messages_received_from_application.append(message)
+
+    # run the test request
+    scope_test_request = HTTPScope(
+        type="http",
+        asgi=ASGIVersions(
+            version="3.0",
+            spec_version="2.5"
+        ),
+        http_version="1.1",
+        method="GET",
+        scheme="http",
+        path="/test_content.txt",
+        raw_path=b"/hello.txt",
+        query_string=b"",
+        root_path="",
+        headers=[],
+        client=("127.0.0.1", 12345),
+        server=("127.0.0.1", 80),
+        extensions=None
+    )
+    await app(scope_test_request, receive, send)
+
+    # first segment contains the headers
+    message_with_headers = messages_received_from_application[0]
+
+    # convert headers into correct form for assert_response_ok
+    headers = {
+        key.decode(): value.decode() for key, value in message_with_headers["headers"]
+    }
+
+    # collect content of all "body" type messages
+    body = b"".join(
+        message.get("body", b"")
+        for message in messages_received_from_application
+        if message["type"] == "http.response.body"
+    )
+
+    # assert everything works as expected
+    assert_response_ok(message_with_headers["status"], headers, body)
+
+
+with tempfile.TemporaryDirectory() as tmp_content_directory:
+    with open(os.path.join(tmp_content_directory, "test_content.txt"), "wb") as static_file:
+        static_file.write(CONTENT)
+    test_wsgi(tmp_content_directory)
+    asyncio.run(test_asgi(tmp_content_directory))
diff --git a/support/testing/tests/package/test_python_servestatic.py b/support/testing/tests/package/test_python_servestatic.py
new file mode 100644
index 0000000000..d9c762962a
--- /dev/null
+++ b/support/testing/tests/package/test_python_servestatic.py
@@ -0,0 +1,19 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonServeStatic(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SERVESTATIC=y
+        """
+
+    sample_scripts = ["tests/package/sample_python_servestatic.py"]
+
+    def run_sample_scripts(self):
+        self.assertRunOk(
+            "servestatic --help | grep -q 'Process static files'"
+        )
+
+        super().run_sample_scripts()

--===============5129307746941830571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5129307746941830571==--
