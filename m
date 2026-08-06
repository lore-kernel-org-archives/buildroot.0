Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F195C55838
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 05:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71ED80BD1;
	Thu,  6 Aug 2026 05:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azpHbT48TDH5; Thu,  6 Aug 2026 05:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4520380B91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785994120;
	bh=J7zm3AKsvN1Zwn6l1f7ij3vyM/iURRzIrS3BEhuHFuY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ODcAKA10RembYYQWyC8NmgCFRIjMDP37qHNnJaKyF1mW1OFh+qL1HQQaikkrXqQe8
	 SZGfATnr7Ou1/jK+w/v0jMiom51dD+F8kkZMijmLKmpQIR2zIZNfx6F9hcRbug/oKN
	 46WAslg8/nan0hTv+2lokwh4t4k90oGQ3kJeW1uzaJ9WLWvFluIOEz0lTc8/vU3jC/
	 bnWDPJqpVd0UjSL24lBaXyUoe7uad2MxtyREYOSax8hD2/E9zgh1/6yx6+lq6Q8n/D
	 rt7byzU1fiB3fdTuNKriOHz5gaSlxWwpEfqyGa4RZDGWZM0munpeN2KHW2y9Qsilu/
	 kvI778BFHK5Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4520380B91;
	Thu,  6 Aug 2026 05:28:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E54C42B6
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 05:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D74C96069B
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 05:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1EXP4ZxEw80 for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 05:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B360605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B360605D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B360605D7
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 05:28:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b3cd.dip0.t-ipconnect.de [84.161.179.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA0AAA4C46FB;
 Thu,  6 Aug 2026 07:28:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wrqea-000000006GJ-47xZ;
 Thu, 06 Aug 2026 05:28:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Aug 2026 07:28:29 +0200
Message-ID: <20260806052829.4881-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785994110;
 bh=DBmDmBtMHVEtGFPdTVzAP6Diz9QLI5QpeqrC+5yGtvM=;
 h=From:To:Cc:Subject:Date:From;
 b=rSE9bwthzc6hVw7bTOWjuletOXJyxXirFU9y74tvfc0Q4X8rbvT+gogYFx7ridH+q
 Xh8eOjLIxZdbMmsSb2/SJCV06ejFSISTmZlTUD1JIPUDnMvaGtf4wNB1kHPf8YcYFD
 udZusD1uNdQZbhJO54h8biCfltFL4qy3F5b9R6sZKdHcJG6pF4lCDA2SHUDkJMQ4Ex
 cyk1M92jp6bxCEdVOkeyFytq5NijOaoHDuSIbmVSg+yV5p1zDHcDByIhAdXg26ys04
 o7SMlJjWqcZToexD5emcFSoIEm1lt8mWQDHH7J5SlvBBvF/ktmzfRag9Sjvqyk7me5
 9pf3TRF3ulUEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rSE9bwth
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.14.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3147/
https://docs.python.org/release/3.14.7/whatsnew/changelog.html

Rebased patch 0010 due to upstream commit:
https://github.com/python/cpython/commit/04735deeb2dbdc6404eb38544541abf387d71069#diff-b9d5f29e160364d4616b4bcc3b04538fca8d1d1cca809af4196bcaf16c7c5d40

Removed patches 0011-0015 which are included in this release.

Fixes CVE-2026-12003 and others.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline including almost all external python modules built
python3 successfully but crashed due to lack of free disk space:
https://gitlab.com/bkuhls/buildroot/-/commits/f6a31521d51315228f57e5c2f9384bd7abf85585

Gitlab pipeline building only python3 passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e01ff38bf1f65e4f7881debbbd455e525c25b478

 ...mpilation-of-Modules-_remote_debuggi.patch |  15 +-
 ...ix-symlink-escape-via-tarfile-hardli.patch |  83 ----------
 ...ormalize-all-line-endings-CR-CRLF-an.patch |  71 --------
 ...ake-tarfile._Stream.seek-break-at-EO.patch |  76 ---------
 ...ass-filter_function-to-TarFile._extr.patch | 151 ------------------
 ...ix-quadratic-complexity-in-increment.patch | 123 --------------
 package/python3/python3.hash                  |   4 +-
 package/python3/python3.mk                    |  17 +-
 8 files changed, 10 insertions(+), 530 deletions(-)
 delete mode 100644 package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
 delete mode 100644 package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
 delete mode 100644 package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
 delete mode 100644 package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
 delete mode 100644 package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch

diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
index b000a68e9b..833bcc9cc8 100644
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -7,8 +7,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
 
 Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
 
-[ Bernd Kuhls: ported to Python 3.14.4]
-[ Vincent Fazio: update to apply cleanly to 3.14.3 ]
+[ Bernd Kuhls: ported to Python 3.14.7]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
@@ -29,9 +28,9 @@ diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_modu
 index b46538b76df..e86a27d5812 100644
 --- a/Modules/_remote_debugging_module.c
 +++ b/Modules/_remote_debugging_module.c
-@@ -834,7 +834,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
-         PyErr_SetString(PyExc_RuntimeError, "Failed to find the AsyncioDebug section in the process.");
-         _PyErr_ChainExceptions1(exc);
+@@ -1329,7 +1329,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
+             _PyErr_ChainExceptions1(exc);
+         }
      }
 -#elif defined(__linux__)
 +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
@@ -42,9 +41,9 @@ diff --git a/Python/remote_debug.h b/Python/remote_debug.h
 index 8f9b6cd4c49..b7d17a0f345 100644
 --- a/Python/remote_debug.h
 +++ b/Python/remote_debug.h
-@@ -923,7 +923,7 @@
-             handle->pid);
-         _PyErr_ChainExceptions1(exc);
+@@ -1174,7 +1174,7 @@
+             _PyErr_ChainExceptions1(exc);
+         }
      }
 -#elif defined(__linux__)
 +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
diff --git a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
deleted file mode 100644
index d3454a7a6b..0000000000
--- a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 79c06bd5c6afa3c440d50faf7ee1b147c8832b4c Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jun 2026 15:58:47 +0200
-Subject: [PATCH] [3.14] gh-151558: Fix symlink escape via `tarfile`
- hardlink-extraction fallback (GH-151559)
-
-(cherry picked from commit 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
-
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-Upstream: https://github.com/python/cpython/commit/79c06bd5c6afa3c440d50faf7ee1b147c8832b4c
-CVE: CVE-2026-11940
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/tarfile.py                                |  3 +++
- Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
- ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
- 3 files changed, 30 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 39b1cd6514c..399f906efdf 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2784,6 +2784,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
-                     "makelink_with_filter: if filter_function is not None, "
-                     + "extraction_root must also not be None")
-             try:
-+                filter_function(
-+                    unfiltered.replace(name=tarinfo.name, deep=False),
-+                    extraction_root)
-                 filtered = filter_function(unfiltered, extraction_root)
-             except _FILTER_ERRORS as cause:
-                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 8503024a690..045377d620c 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
-                     self.expect_file("boom", symlink_to='../../link_here')
-                     self.expect_file("c", symlink_to='b')
- 
-+    @symlink_test
-+    def test_sneaky_hardlink_fallback_deep(self):
-+        # (CVE-2026-11940)
-+        with ArchiveMaker() as arc:
-+            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
-+            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
-+
-+        with self.check_context(arc.open(), 'data'):
-+            e = self.expect_exception(
-+                tarfile.LinkFallbackError,
-+                "link 's' would be extracted as a copy of "
-+                + "'a/b/s', which was rejected")
-+            self.assertIsInstance(e.__cause__,
-+                                  tarfile.LinkOutsideDestinationError)
-+
-+        for filter in 'tar', 'fully_trusted':
-+            with self.subTest(filter), self.check_context(arc.open(), filter):
-+                if not os_helper.can_symlink():
-+                    self.expect_file("a/")
-+                    self.expect_file("a/b/")
-+                else:
-+                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
-+                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
-+
-     @symlink_test
-     def test_exfiltration_via_symlink(self):
-         # (CVE-2025-4138)
-diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
-new file mode 100644
-index 00000000000..74459d5680e
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
-@@ -0,0 +1,3 @@
-+Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
-+filters where crafted archives could create a symlink pointing outside the
-+destination directory. This was a bypass of :cve:`2025-4330`.
--- 
-2.47.3
-
diff --git a/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch b/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
deleted file mode 100644
index 8c9b35a8d2..0000000000
--- a/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 71f2e02a52d47417a6fd69f456346cd8aa7aca98 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 24 Jun 2026 11:46:33 +0200
-Subject: [PATCH] [3.14] gh-143927: Normalize all line endings (CR, CRLF, and
- LF) in configparser (GH-143929) (GH-152003)
-
-gh-143927: Normalize all line endings (CR, CRLF, and LF) in configparser (GH-143929)
-(cherry picked from commit 5858e42c539dac8394636a6e9b30472b8994851f)
-
-Co-authored-by: Seth Larson <seth@python.org>
-
-Upstream: https://github.com/python/cpython/commit/71f2e02a52d47417a6fd69f456346cd8aa7aca98
-CVE: CVE-2026-0864
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/configparser.py                                   |  4 +++-
- Lib/test/test_configparser.py                         | 11 +++++++++++
- .../2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst    |  2 ++
- 3 files changed, 16 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
-
-diff --git a/Lib/configparser.py b/Lib/configparser.py
-index a53ac872764..3c452afe8ad 100644
---- a/Lib/configparser.py
-+++ b/Lib/configparser.py
-@@ -992,7 +992,9 @@ def _write_section(self, fp, section_name, section_items, delimiter, unnamed=Fal
-             value = self._interpolation.before_write(self, section_name, key,
-                                                      value)
-             if value is not None or not self._allow_no_value:
--                value = delimiter + str(value).replace('\n', '\n\t')
-+                # Convert all possible line-endings into '\n\t'
-+                value = (delimiter + str(value).replace('\r\n', '\n')
-+                         .replace('\r', '\n').replace('\n', '\n\t'))
-             else:
-                 value = ""
-             fp.write("{}{}\n".format(key, value))
-diff --git a/Lib/test/test_configparser.py b/Lib/test/test_configparser.py
-index 8d8dd2a2bf2..4783943f71a 100644
---- a/Lib/test/test_configparser.py
-+++ b/Lib/test/test_configparser.py
-@@ -526,6 +526,17 @@ def test_default_case_sensitivity(self):
-             cf.get(self.default_section, "Foo"), "Bar",
-             "could not locate option, expecting case-insensitive defaults")
- 
-+    def test_crlf_normalization(self):
-+        cf = self.newconfig({"key1": "a\nb","key2": "a\rb", "key3": "a\r\nb", "key4": "a\r\nb"})
-+        buf = io.StringIO()
-+        cf.write(buf)
-+        cf_str = buf.getvalue()
-+        self.assertNotIn("\r", cf_str)
-+        self.assertNotIn("\r\n", cf_str)
-+        self.assertEqual(cf_str.count("\n"), 10)
-+        self.assertEqual(cf_str.count("\n\t"), 4)
-+        self.assertTrue(cf_str.endswith("\n\n"))
-+
-     def test_parse_errors(self):
-         cf = self.newconfig()
-         self.parse_error(cf, configparser.ParsingError,
-diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
-new file mode 100644
-index 00000000000..ca554997e5c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
-@@ -0,0 +1,2 @@
-+Normalize all line endings (CR, CRLF, and LF) to LF+TAB when writing
-+multi-line configparser values.
--- 
-2.47.3
-
diff --git a/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch b/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
deleted file mode 100644
index 7db9439639..0000000000
--- a/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From e86666c9dd256d52d0fbef6feb1ea4a51768fdec Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jun 2026 15:46:18 +0200
-Subject: [PATCH] [3.14] gh-151981: Make tarfile._Stream.seek break at EOF
- (GH-151982) (#151992)
-
-(cherry picked from commit f50bf13566189c8d0ce5a814f33eff3d89951896)
-
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-Upstream: https://github.com/python/cpython/commit/e86666c9dd256d52d0fbef6feb1ea4a51768fdec
-CVE: CVE-2026-11972
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/tarfile.py                                   |  4 +++-
- Lib/test/test_tarfile.py                         | 16 ++++++++++++++++
- ...026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst |  2 ++
- 3 files changed, 21 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index e6734db24f6..39b1cd6514c 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -524,7 +524,9 @@ def seek(self, pos=0):
-         if pos - self.pos >= 0:
-             blocks, remainder = divmod(pos - self.pos, self.bufsize)
-             for i in range(blocks):
--                self.read(self.bufsize)
-+                data = self.read(self.bufsize)
-+                if not data:
-+                    break
-             self.read(remainder)
-         else:
-             raise StreamError("seeking backwards is not allowed")
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index d974c7d46ec..8503024a690 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4762,6 +4762,22 @@ def valueerror_filter(tarinfo, path):
-         with self.check_context(arc.open(errorlevel='boo!'), filtererror_filter):
-             self.expect_exception(TypeError)  # errorlevel is not int
- 
-+    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
-+    def test_getmembers_big_size(self, format):
-+        # gh-151981: A loop in seek() for streaming files tried to read the
-+        # declared number of blocks even at EOF
-+        tinfo = tarfile.TarInfo("huge-file")
-+        tinfo.size = 1 << 64
-+        bio = io.BytesIO()
-+        # Write header without data
-+        bio.write(tinfo.tobuf(format))
-+
-+        # Reset & try to get contents
-+        bio.seek(0)
-+        with tarfile.open(fileobj=bio, mode="r|") as tar:
-+            with self.assertRaises(tarfile.ReadError):
-+                tar.getmembers()
-+
- 
- class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
-     testdir = os.path.join(TEMPDIR, "testoverwrite")
-diff --git a/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst b/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
-new file mode 100644
-index 00000000000..2123ab8e081
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
-@@ -0,0 +1,2 @@
-+In :mod:`tarfile`, seeking a stream now stops when end of the stream is
-+reached.
--- 
-2.47.3
-
diff --git a/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch b/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
deleted file mode 100644
index 3b38594c75..0000000000
--- a/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 5e0ef3f1afe892e4f64eb83368db57ac4c40cba0 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 29 Jun 2026 21:11:22 +0200
-Subject: [PATCH] [3.14] gh-151987: Pass filter_function to
- `TarFile._extract_one()` during `.extract()` (GH-151988) (#152609)
-
-(cherry picked from commit 7ccdbaba2c54250a70d7f25632152df7655a5e0a)
-
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Seth Michael Larson <seth@python.org>
-
-Upstream: https://github.com/python/cpython/commit/5e0ef3f1afe892e4f64eb83368db57ac4c40cba0
-CVE: CVE-2026-4360
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/tarfile.py                                |  3 +-
- Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
- ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
- 3 files changed, 96 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index cb09e307c46..d3c48999700 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2538,7 +2538,8 @@ def extract(self, member, path="", set_attrs=True, *, numeric_owner=False,
-         tarinfo, unfiltered = self._get_extract_tarinfo(
-             member, filter_function, path)
-         if tarinfo is not None:
--            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
-+            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
-+                              filter_function=filter_function)
- 
-     def _get_extract_tarinfo(self, member, filter_function, path):
-         """Get (filtered, unfiltered) TarInfos from *member*
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 804c3e6d809..f3b61d9fbad 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4470,6 +4470,98 @@ def test_chmod_outside_dir(self):
-                     st_mode = cc.outerdir.stat().st_mode
-                     self.assertNotEqual(st_mode & 0o777, 0o777)
- 
-+    @symlink_test
-+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
-+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
-+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
-+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
-+    def test_chown_links_on_extract(self, link_type):
-+        with ArchiveMaker() as arc:
-+            arc.add("test.txt",
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+            arc.add("link",
-+                    type=link_type,
-+                    linkname='test.txt',
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+
-+        with (
-+            os_helper.temp_dir() as tmpdir,
-+            arc.open() as tar,
-+            unittest.mock.patch("os.chown") as mock_chown,
-+            unittest.mock.patch("os.lchown") as mock_lchown,
-+            unittest.mock.patch("os.geteuid") as mock_geteuid,
-+        ):
-+            # Set UID to 0 so chown() is attempted.
-+            mock_geteuid.return_value = 0
-+            tar.extract("link", path=tmpdir, filter='data')
-+            extract_path = os.path.join(tmpdir, "link")
-+
-+            if link_type == tarfile.SYMTYPE:
-+                mock_chown.assert_not_called()
-+                mock_lchown.assert_called_once_with(extract_path, -1, -1)
-+            else:
-+                mock_chown.assert_has_calls([
-+                    unittest.mock.call(extract_path, -1, -1),
-+                    unittest.mock.call(extract_path, -1, -1)
-+                ])
-+                mock_lchown.assert_not_called()
-+
-+    @symlink_test
-+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
-+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
-+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
-+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
-+    def test_chown_links_on_extractall(self, link_type):
-+        with ArchiveMaker() as arc:
-+            arc.add("test.txt",
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+            arc.add("link",
-+                    type=link_type,
-+                    linkname='test.txt',
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+
-+        with (
-+            os_helper.temp_dir() as tmpdir,
-+            arc.open() as tar,
-+            unittest.mock.patch("os.chown") as mock_chown,
-+            unittest.mock.patch("os.lchown") as mock_lchown,
-+            unittest.mock.patch("os.geteuid") as mock_geteuid,
-+        ):
-+            # Set UID to 0 so chown() is attempted.
-+            mock_geteuid.return_value = 0
-+            tar.extractall(path=tmpdir, filter='data')
-+            extract_link_path = os.path.join(tmpdir, "link")
-+            extract_file_path = os.path.join(tmpdir, "test.txt")
-+
-+            if link_type == tarfile.SYMTYPE:
-+                mock_chown.assert_called_once_with(extract_file_path, -1, -1)
-+                mock_lchown.assert_called_once_with(extract_link_path, -1, -1)
-+            else:
-+                mock_chown.assert_has_calls([
-+                    unittest.mock.call(extract_file_path, -1, -1),
-+                    unittest.mock.call(extract_link_path, -1, -1)
-+                ])
-+                mock_lchown.assert_not_called()
-+
-+    def test_extract_filters_target(self):
-+        # Test that when extract() falls back to extracting (rather than
-+        # linking) a hardlink target, it filters the target.
-+        with ArchiveMaker() as arc:
-+            arc.add("target")
-+            arc.add("link", hardlink_to="target")
-+        def testing_filter(member, path):
-+            if member.name == 'target':
-+                # target: set read-only
-+                return member.replace(mode=stat.S_IRUSR)
-+            # link: don't overwrite the mode
-+            return member.replace(mode=None)
-+        tempdir = pathlib.Path(TEMPDIR) / 'extract'
-+        with os_helper.temp_dir(tempdir), arc.open() as tar:
-+            tar.extract("link", path=tempdir, filter=testing_filter)
-+            path = tempdir / 'link'
-+            if os_helper.can_chmod():
-+                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
-+
-     def test_link_fallback_normalizes(self):
-         # Make sure hardlink fallbacks work for non-normalized paths for all
-         # filters
-diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
-new file mode 100644
-index 00000000000..9eea7b32c4d
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
-@@ -0,0 +1,2 @@
-+The :meth:`tarfile.TarFile.extract` method now applies the given filter when
-+it extracts a link target from the archive as a fallback.
--- 
-2.47.3
-
diff --git a/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch b/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
deleted file mode 100644
index e9c3f40cc0..0000000000
--- a/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 07efb08123ba9367a7107325adb9d5626dca1ca9 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sat, 4 Jul 2026 20:08:05 +0200
-Subject: [PATCH] [3.14] gh-153030: Fix quadratic complexity in incremental
- parsing in HTMLParser (GH-153031) (GH-153039)
-
-When an unterminated construct (e.g. a tag or comment) spanned many
-feed() calls, rescanning the growing buffer and concatenating new data
-onto it were both quadratic.  New data is now accumulated in a list and
-only joined and parsed once enough has piled up.
-(cherry picked from commit bcf98ddbc40ec9b3ee87da0124a5660b19b7e606)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
-
-Upstream: https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9d5626dca1ca9
-CVE: CVE-2026-15308
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/html/parser.py                            | 32 +++++++++++++++++--
- Lib/test/test_htmlparser.py                   | 20 ++++++++++++
- ...-07-04-17-00-00.gh-issue-153030.RovkP6.rst |  3 ++
- 3 files changed, 53 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
-
-diff --git a/Lib/html/parser.py b/Lib/html/parser.py
-index 38ddf9ef442..fbe0d3665e0 100644
---- a/Lib/html/parser.py
-+++ b/Lib/html/parser.py
-@@ -157,6 +157,9 @@ def reset(self):
-         self.cdata_elem = None
-         self._support_cdata = True
-         self._escapable = True
-+        self._pending = []
-+        self._pending_len = 0
-+        self._parse_threshold = 1
-         super().reset()
- 
-     def feed(self, data):
-@@ -165,11 +168,36 @@ def feed(self, data):
-         Call this as often as you want, with as little or as much text
-         as you want (may include '\n').
-         """
--        self.rawdata = self.rawdata + data
--        self.goahead(0)
-+        # Accumulate new data in a list and only join and parse it once
-+        # enough has piled up.  Rescanning an unparsed buffer (e.g. an
-+        # unterminated tag) and concatenating onto it on every call would
-+        # both be quadratic in the input size.
-+        self._pending_len += len(data)
-+        if self._pending_len < self._parse_threshold:
-+            self._pending.append(data)
-+        else:
-+            if not self._pending:
-+                self.rawdata += data
-+            else:
-+                self._pending.append(data)
-+                self.rawdata += ''.join(self._pending)
-+                self._pending.clear()
-+            self._pending_len = 0
-+            n = len(self.rawdata)
-+            self.goahead(0)
-+            if len(self.rawdata) < n:
-+                # Some data was parsed; resume on the next call.
-+                self._parse_threshold = 1
-+            else:
-+                # Nothing was parsed; wait until the buffer doubles.
-+                self._parse_threshold = len(self.rawdata)
- 
-     def close(self):
-         """Handle any buffered data."""
-+        if self._pending:
-+            self.rawdata += ''.join(self._pending)
-+            self._pending.clear()
-+            self._pending_len = 0
-         self.goahead(1)
- 
-     __starttag_text = None
-diff --git a/Lib/test/test_htmlparser.py b/Lib/test/test_htmlparser.py
-index 6b7624f1150..3fdaed4ff46 100644
---- a/Lib/test/test_htmlparser.py
-+++ b/Lib/test/test_htmlparser.py
-@@ -1041,6 +1041,26 @@ def check(source):
-         check("<![CDATA[" * 9 * n)
-         check("<!doctype" * 35 * n)
- 
-+    @support.requires_resource('cpu')
-+    def test_incremental_no_quadratic_complexity(self):
-+        # An unterminated construct fed in many small chunks used to take
-+        # quadratic time, both to rescan and to concatenate the buffer.
-+        # Now it takes a fraction of a second.
-+        def check(prefix, chunk, suffix):
-+            parser = html.parser.HTMLParser()
-+            parser.feed(prefix)
-+            for _ in range(200_000):
-+                parser.feed(chunk)
-+            parser.feed(suffix)
-+            parser.close()
-+        chunk = "a" * 64
-+        check("<!--", chunk, "-->")       # comment
-+        check("<?", chunk, ">")           # processing instruction
-+        check("<!doctype ", chunk, ">")   # doctype
-+        check("<![CDATA[", chunk, "]]>")  # CDATA section
-+        check("<a href='", chunk, "'>")   # start tag
-+        check("<script>", chunk, "</script>")  # RAWTEXT element
-+
- 
- class AttributesTestCase(TestCaseBase):
- 
-diff --git a/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst b/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
-new file mode 100644
-index 00000000000..d1d60593f4b
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
-@@ -0,0 +1,3 @@
-+Fixed quadratic complexity in incremental parsing of long unterminated
-+constructs (such as tags or comments) in :class:`html.parser.HTMLParser`,
-+which could be exploited for a denial of service.
--- 
-2.47.3
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 0f2436fb23..97302bc750 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3146/
-sha256  143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63  Python-3.14.6.tar.xz
+# From https://www.python.org/downloads/release/python-3147/
+sha256  3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81  Python-3.14.7.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9a47a1f306..cb5e1a4b85 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -13,21 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
-PYTHON3_IGNORE_CVES += CVE-2026-11940
-
-# 0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
-PYTHON3_IGNORE_CVES += CVE-2026-0864
-
-# 0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
-PYTHON3_IGNORE_CVES += CVE-2026-11972
-
-# 0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
-PYTHON3_IGNORE_CVES += CVE-2026-4360
-
-# 0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
-PYTHON3_IGNORE_CVES += CVE-2026-15308
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
