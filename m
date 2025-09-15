Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDE8CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 23:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D32409F4;
	Mon, 15 Sep 2025 23:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tV5RBxYoeG9; Mon, 15 Sep 2025 23:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0F340A52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0F340A52;
	Mon, 15 Sep 2025 23:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5357812D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30FE54056C
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwSG7Ii4zY9F for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 23:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30B5640547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B5640547
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30B5640547
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:47:22 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-423fe622487so28547785ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 16:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757980042; x=1758584842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOB8J6wgN1k6iLlfdTdjo0BPnJbzt0tb5FkUAvuG+BA=;
 b=cPwOY7l93rskjhexPnC1v0noPOkmu0mmZtznEkxowZTE3bM13xBwiKkglMKv/q64wD
 VDU0k1t74K3NHdeyz/Qz1nPnM1cPmgbvrtrwgHNidqCz1PNaI4WphtKwXqQ0ASrIC38f
 rjiRc3giYpjOov9jcmYvwtbhzwWgQcCZpaeBSUimosKwc7Bp7x24LQYdMXb7Qrh5C9tY
 aBfnRbi0arXWnvywKckxnKpl89LDbJCtMnsB17mScu2BGx+SdGfDu/FS91APC/OQsHuN
 Qwg4EYp+L/NKMuwV5lbXaxquP7GvwffN80hEoy8NSDjHRPXE8+JVTSUlSJCAZJaohjJU
 ewuA==
X-Gm-Message-State: AOJu0YxUey9D6PH6KBJN03ZoCFljUxHP36PahFq3U7GIbro358PspZ4y
 rbQxjqJb9D6jW7jC2ekOyE509FjELy2SY+aRJFLNwATAQ6p3ib10B/WqHxCUyA==
X-Gm-Gg: ASbGncvzlNS9itqlv9Q0muaN/VDroIH0nlUR1jKOMQBIstoJ8LNZwSjoa6R8vRB5r9F
 leUgDJEROcJckbBfopnbhjtJx/y2vg+KI6vIUD2+FWqU8DdRaBBeuckLXI06NkQM3cfkJ6px5st
 57zE8p4ha64r9Kt2sSfCjYF1rT52bm8pyb+CjJjjMWpJEZttWzBsSQO/s+bxt07xGAFP3mt5M68
 LNsRY1J89ouW/k/9NQJVc0oGPwLBtqTj0i0WvZguKONLUfpDdjW0QVv61Ut8cLQvKhFw3zry5Ju
 HOIVhXhJMEnnuzDEP30bBCcHf7oNaPxO7hR88K/L0tbULQeJrQSzNg8rWHZPNbOifK2WJOiTVPz
 jJI69DZJV3NXyShX/ldr1cIa6KKCWk6gCGuHSEUFTLb0m9XVa4V2/LeSKONOnSWnuND6msSERI+
 fZdYOKMyA0/2U=
X-Google-Smtp-Source: AGHT+IG5xzsi2jn2FJAxojFvZ1XU05DFjdSge2XqHtp4tza43vwSlaMiVZ699mrsT+Ris9JqOihIcQ==
X-Received: by 2002:a05:6e02:2587:b0:3e5:4bc5:539a with SMTP id
 e9e14a558f8ab-420a3ca7919mr127085115ab.19.1757980041700; 
 Mon, 15 Sep 2025 16:47:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41dfb240f88sm61804955ab.42.2025.09.15.16.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 16:47:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 17:47:20 -0600
Message-ID: <20250915234720.2443123-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757980042; x=1758584842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sOB8J6wgN1k6iLlfdTdjo0BPnJbzt0tb5FkUAvuG+BA=;
 b=W0DnSWM2o8COcZAV/61ghWUtJ0djs845pZnBqX5NJ7n09XQ2o+IMHCnsjU1QQFXhLO
 JLRF+YSHbi4URbCQ0RQOZYLS5bw8O800vlhscWXADKe8+JJezTGDV8cLUlRxCs53VfTm
 wPZrw5dI20cQ0Pd/Y0w/2xgI4fa6tl2zEjuhDQSkgw9xT+Z5zI8fCAWqKhoN47egpHRp
 P8fs2BqoVDIRC5HLfZVkuVQC8qWUbgoNEORsXNBjt1cgCukSw9XoLPz0In4eWUcyO+aU
 C3nX52LzoWeIUs+fjQxIloUYf7+E1NOZVtFB8n/fMu+Ku4A0vJrdBsxPUn2vScnLZS/D
 CBWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W0DnSWM2
Subject: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.54.2
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

License hash changed due to formatting changes:
https://gitlab.gnome.org/GNOME/pygobject/-/commit/e80a612fd78c46c97a9d1f1bb29dc93344e24aba

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...tor.get_map-look-up-file-objects-by-.patch | 164 ------------------
 package/python-gobject/python-gobject.hash    |   6 +-
 package/python-gobject/python-gobject.mk      |   4 +-
 3 files changed, 5 insertions(+), 169 deletions(-)
 delete mode 100644 package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch

diff --git a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
deleted file mode 100644
index a275abd9c7..0000000000
--- a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 4b97688d527276fc1e835fed71dbb73bbd09ac11 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Tue, 25 Mar 2025 13:29:04 +0100
-Subject: [PATCH] gi.events._Selector.get_map(): look up file objects by file
- descriptor
-
-File objects and their underlying file descriptors must be treated as
-equivalent for lookup, or one may incorrectly be treated as not
-registered when the other was used for the registration, leading to
-bugs.
-
-Fixes: #689
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
-Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/commit/4b97688d527276fc1e835fed71dbb73bbd09ac11
----
- gi/events.py         | 36 +++++++++++++++++++++-----
- tests/test_events.py | 61 ++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 90 insertions(+), 7 deletions(-)
-
-diff --git a/gi/events.py b/gi/events.py
-index da4775dc..9eba1629 100644
---- a/gi/events.py
-+++ b/gi/events.py
-@@ -28,6 +28,7 @@ import threading
- import selectors
- import weakref
- import warnings
-+from collections.abc import Mapping
- from contextlib import contextmanager
- from . import _ossighelper
- 
-@@ -508,9 +509,33 @@ if sys.platform != 'win32':
-         # Subclass to attach _tag
-         pass
- 
-+    class _FileObjectMapping(Mapping):
-+        def __init__(self, fd_dict):
-+            self.fd_dict = fd_dict
-+
-+        def __len__(self):
-+            return len(self.fd_dict)
-+
-+        def get(self, fileobj, default=None):
-+            fd = _fileobj_to_fd(fileobj)
-+            return self.fd_dict.get(fd, default)
-+
-+        def __getitem__(self, fileobj):
-+            value = self.get(fileobj)
-+            if value is None:
-+                raise KeyError("{!r} is not registered".format(fileobj))
-+            return value
-+
-+        def __iter__(self):
-+            return iter(self.fd_dict)
-+
-     class _Selector(_SelectorMixin, selectors.BaseSelector):
-         """A Selector for gi.events.GLibEventLoop registering python IO with GLib."""
- 
-+        def __init__(self, context, loop):
-+            super().__init__(context, loop)
-+            self._map = _FileObjectMapping(self._fd_to_key)
-+
-         def attach(self):
-             self._source.attach(self._loop._context)
- 
-@@ -559,15 +584,12 @@ if sys.platform != 'win32':
-         # We could override modify, but it is only slightly when the "events" change.
- 
-         def get_key(self, fileobj):
--            fd = _fileobj_to_fd(fileobj)
--            return self._fd_to_key[fd]
-+            return self._map[fileobj]
- 
-         def get_map(self):
--            """Return a mapping of file objects to selector keys."""
--            # Horribly inefficient
--            # It should never be called and exists just to prevent issues if e.g.
--            # python decides to use it for debug purposes.
--            return {k.fileobj: k for k in self._fd_to_key.values()}
-+            """Return a mapping of file objects or file descriptors to
-+            selector keys."""
-+            return self._map
- 
- 
- else:
-diff --git a/tests/test_events.py b/tests/test_events.py
-index a6585468..9dbf3827 100644
---- a/tests/test_events.py
-+++ b/tests/test_events.py
-@@ -46,6 +46,7 @@ import sys
- import gi
- import gi.events
- import asyncio
-+import socket
- import threading
- from gi.repository import GLib, Gio
- 
-@@ -344,3 +345,63 @@ class GLibEventLoopPolicyTests(unittest.TestCase):
-         self.assertEqual(order, [GLib.PRIORITY_HIGH] * 3 +
-                                 [GLib.PRIORITY_DEFAULT] * 3 +
-                                 [GLib.PRIORITY_DEFAULT_IDLE] * 3)
-+
-+    @unittest.skipIf(sys.platform == 'win32', 'add reader/writer not implemented')
-+    def test_source_fileobj_fd(self):
-+        """Regression test for
-+        https://gitlab.gnome.org/GNOME/pygobject/-/issues/689
-+        """
-+        class Echo:
-+            def __init__(self, sock, expect_bytes):
-+                self.sock = sock
-+                self.sent_bytes = 0
-+                self.expect_bytes = expect_bytes
-+                self.done = asyncio.Future()
-+                self.data = bytes()
-+
-+            def send(self):
-+                if self.done.done():
-+                    return
-+                if self.sent_bytes < len(self.data):
-+                    self.sent_bytes += self.sock.send(
-+                        self.data[self.sent_bytes:])
-+                    print('sent', self.data)
-+                if self.sent_bytes >= self.expect_bytes:
-+                    self.done.set_result(None)
-+                    self.sock.shutdown(socket.SHUT_WR)
-+
-+            def recv(self):
-+                if self.done.done():
-+                    return
-+                self.data += self.sock.recv(self.expect_bytes)
-+                print('received', self.data)
-+                if len(self.data) >= self.expect_bytes:
-+                    self.sock.shutdown(socket.SHUT_RD)
-+
-+        async def run():
-+            loop = asyncio.get_running_loop()
-+            s1, s2 = socket.socketpair()
-+            sample = b'Hello!'
-+            e = Echo(s1, len(sample))
-+            # register using file object and file descriptor
-+            loop.add_reader(s1, e.recv)
-+            loop.add_writer(s1.fileno(), e.send)
-+            s2.sendall(sample)
-+            await asyncio.wait_for(e.done, timeout=2.0)
-+            echo = bytes()
-+            for _ in range(len(sample)):
-+                echo += s2.recv(len(sample))
-+                if len(echo) == len(sample):
-+                    break
-+            # remove using file object and file descriptor
-+            loop.remove_reader(s1)
-+            loop.remove_writer(s1.fileno())
-+            s1.close()
-+            s2.close()
-+            # check if the data was echoed correctly
-+            self.assertEqual(sample, echo)
-+
-+        policy = self.create_policy()
-+        loop = policy.get_event_loop()
-+        loop.run_until_complete(run())
-+        loop.close()
--- 
-2.49.0
-
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index e49c7ddd08..be19fc1900 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
-sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
-sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.2.sha256sum
+sha256  03cffeb49d8a1879b621d8f606ac904218019a0ae699b1cd3780a8ee611e696b  pygobject-3.54.2.tar.gz
+sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 3021937887..0d96c299cf 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.52
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_VERSION_MAJOR = 3.54
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
