Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 09:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214A460E52;
	Fri, 21 Oct 2022 09:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214A460E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dr3ezgpZSH1b; Fri, 21 Oct 2022 09:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F155260E58;
	Fri, 21 Oct 2022 09:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F155260E58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2167E1BF9BA
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F108F60E52
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F108F60E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QduZimEuSDc3 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 09:16:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EEEE60E36
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EEEE60E36
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 09:16:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z97so3414655ede.8
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvdysI2gTxP6wHL7jgCJFMY2+WRO2aTPHvVWQd+CXC8=;
 b=hi9FJzmWIIPBF6a4PdfMEeVkx/3CY5oLdBsEYbeuxpB4v+q1iIeJuGwZ8GSxMWf72/
 M1VHvkD4JkFwgjSK2nnP25YK3Ve2AhlPP0M0j8xn2D5DnvCcxZmv8ptfnv+QMZXvXgRY
 OIqDoXGvHsqSa2eZAckMmGRrmhFZaHIonblXp+fdaH+oilBaugCteG4UeqqPmHiCC+Ax
 /m9wBICbugn/Cr7gTmBCtB7Jsx0u9pJxAD3t81TEKEswGe1Af0bz4Ey0LPowfdoaoszI
 WFJdn5kidyR7V9MaBq9xpZWJUGJX2SIH1rNEM3cTEHas0KM5+/9+mN9bm7q/AHxxvCxf
 7+eQ==
X-Gm-Message-State: ACrzQf1imp1RQnbEfJ8SCUCdPgTNcJyhvqybJn+Qn5XrVwiyMW3UU6Gu
 YZK2LkEcgpuKngRgP9BrMUojf0liw0kyhw==
X-Google-Smtp-Source: AMsMyM70wIfiW2JYZnQUEpLVcVmq+dAdNmhvqqmEWgPRzwCs2ujMI6CodwFMlmtXom8FYvgvJBPsjA==
X-Received: by 2002:a17:906:2699:b0:781:a473:9791 with SMTP id
 t25-20020a170906269900b00781a4739791mr14782215ejc.644.1666343779494; 
 Fri, 21 Oct 2022 02:16:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8478:6e00:12e2:7130:278e:732f])
 by smtp.gmail.com with ESMTPSA id
 kx7-20020a170907774700b0078d793e7927sm11470368ejc.4.2022.10.21.02.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 02:16:19 -0700 (PDT)
From: Oguz Ozhan <oguz.ozhan@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 11:15:30 +0200
Message-Id: <20221021091531.2989489-2-oguz.ozhan@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021091531.2989489-1-oguz.ozhan@mind.be>
References: <20221021091531.2989489-1-oguz.ozhan@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvdysI2gTxP6wHL7jgCJFMY2+WRO2aTPHvVWQd+CXC8=;
 b=BBW0/E58F9bTVdqjlvnX9yzUz44oOQO4IMVxz/IDiGykV5ge54Cdz1Io2gxNApieQ2
 0sn1yXM2bH2gKJFAUyo5arx4N5BIkGnRs3PDe97cfFUnHwUsGNJqQUU00QF3cHMzRp+f
 QZGec3EuM6QBqUM3qvDeAoQXXf2+yiL8lltQLSdWomdtBzveajZhnBzBbqJJKMJd5mcQ
 eY2E3KhOchSipeQUWK+wCTH2RSfYuG8aMnjQeTX68OnVbPLv4JvPHKX2zY8YWFiQlji1
 29sXqyvHfRADfjS+WTPv9dc8TNWQJyTnLMdiVWa9hEnXsTEMYnCx2LpHGNwRpAiszvKX
 i0Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BBW0/E58
Subject: [Buildroot] [PATCH 2/3] support/testing: replace nose2 with pytest
 - run-tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Oguz Ozhan <oguz.ozhan@mind.be>, Oguz Ozhan <oguz.ozhan@mind.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Oguz Ozhan <oguz.ozhan@mind.com>

- From web page of nose2:
(https://docs.nose2.io/en/latest/)
nose2 vs pytest:
  - pytest is an excellent test framework and we encourage users to consider it for new projects.
  - It has a bigger team of maintainers and a larger community of users.

- pytest is more robust and has more ability compared to nose2

- Changes in this patch:
  - run-tests modified to use pytest instead of nose2 to call tests. A corresponding Collector class added for pytest to list the available tests
  - nose2 plugins removed which are not required anymore
  - in test_iso9660.py, local test_ routine names changed to not be accepted as test_ cases via pytest

Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
---
 support/testing/conf/unittest.cfg        |  3 --
 support/testing/run-tests                | 28 ++++++++++-------
 support/testing/tests/fs/test_iso9660.py | 40 ++++++++++++------------
 3 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/support/testing/conf/unittest.cfg b/support/testing/conf/unittest.cfg
index 4f516fb80a..0dfffcfbda 100644
--- a/support/testing/conf/unittest.cfg
+++ b/support/testing/conf/unittest.cfg
@@ -1,5 +1,2 @@
-[unittest]
-plugins = nose2.plugins.mp
-
 [multiprocess]
 always-on = True
diff --git a/support/testing/run-tests b/support/testing/run-tests
index bf40019362..f887bc6715 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -4,10 +4,16 @@ import multiprocessing
 import os
 import sys
 
-import nose2
+import pytest
 
 from infra.basetest import BRConfigTest
 
+class PyTestCollector:
+    def __init__(self):
+        self.collected = []
+    def pytest_collection_modifyitems(self, items):
+        for item in items:
+            self.collected.append(item.nodeid)
 
 def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
@@ -42,12 +48,10 @@ def main():
         BRConfigTest.logtofile = False
 
     if args.list:
-        print("List of tests")
-        nose2.discover(argv=[script_path,
-                             "-s", test_dir,
-                             "-v",
-                             "--collect-only"],
-                       plugins=["nose2.plugins.collect"])
+        collect_plugin = PyTestCollector()
+        pytest.main(['--collect-only', '-p', 'no:terminal', test_dir], plugins=[collect_plugin])
+        for nodeid in collect_plugin.collected:
+            print(nodeid)
         return 0
 
     if args.download is None:
@@ -106,15 +110,15 @@ def main():
         return 1
     BRConfigTest.timeout_multiplier = args.timeout_multiplier
 
-    nose2_args = ["-v",
-                  "-N", str(args.testcases),
-                  "-s", test_dir,
+    pytest_args = ["--workers", str(args.testcases),
+                  "--rootdir", test_dir,
                   "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
     if args.testname:
-        nose2_args += args.testname
+        pytest_args += args.testname
+
+    pytest.main(pytest_args)
 
-    nose2.discover(argv=nose2_args)
 
 
 if __name__ == "__main__":
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 692291267e..d2390cccf1 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -25,7 +25,7 @@ BASIC_CONFIG = \
     """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
 
 
-def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
+def do_test_mount_internal_external(emulator, builddir, internal=True, efi=False):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
     if efi:
         efi_img = os.path.join(builddir, "images", "OVMF.fd")
@@ -43,7 +43,7 @@ def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
     return exit_code
 
 
-def test_touch_file(emulator):
+def do_test_touch_file(emulator):
     _, exit_code = emulator.run("touch test")
     return exit_code
 
@@ -63,11 +63,11 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=False)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 1)
 
 
@@ -84,11 +84,11 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=False)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 1)
 
 
@@ -104,11 +104,11 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 0)
 
 
@@ -127,12 +127,12 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
                    infra.filepath("conf/grub2.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
                                                  efi=True)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 0)
 
 
@@ -155,22 +155,22 @@ class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
                    infra.filepath("conf/grub2.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
                                                  efi=False)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 0)
 
         self.emulator.stop()
 
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
                                                  efi=True)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 0)
 
 
@@ -189,11 +189,11 @@ class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
         """.format(infra.filepath("conf/isolinux.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=False)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 1)
 
 
@@ -209,11 +209,11 @@ class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
         """.format(infra.filepath("conf/isolinux.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=False)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 1)
 
 
@@ -228,9 +228,9 @@ class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
         """.format(infra.filepath("conf/isolinux.cfg"))
 
     def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
+        exit_code = do_test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True)
         self.assertEqual(exit_code, 0)
 
-        exit_code = test_touch_file(self.emulator)
+        exit_code = do_test_touch_file(self.emulator)
         self.assertEqual(exit_code, 0)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
