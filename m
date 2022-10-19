Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B0AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2257401FB;
	Wed, 19 Oct 2022 21:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2257401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KspjkUyFmIun; Wed, 19 Oct 2022 21:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79DC04016F;
	Wed, 19 Oct 2022 21:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DC04016F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1210D1BF983
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF1B441C10
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1B441C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkVrmPddKDdy for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:57:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5910841C57
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5910841C57
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:57:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a3so31237346wrt.0
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9N6YyX9bilDcrhmjKBYVRA8Us+WYjDHDvNlfkPDlZM=;
 b=1Jxk9WXM+HV/+X0l4Q0Dm1S0Srn2DcRWIfqgxGqxiaU9gh4ivnEWzLMWEx4a1hmGDt
 oQRIlLw/vb7q0qXNIZ0STqsWB1zTzAukeUc6ENuoEdygJCOGXInGSB/JFhDQeWMl6IFY
 98XMByEFNaXQCH9DgsKvSPOCqrZSCV4+hS3ZWBGC3hZGOSEY9dO6d06ziGJp4k9IrtaT
 CzFoGzzI4aMs6GD1m6TsiF3LLhP51gHoeT8JRR2n/CoERMqgZLuoaAX9bW6HaZXUWLK/
 ViWEshVcKr1lYwNg2Uec34LM5+75rgoUzY+tMhgtKi5G81b/92XZbPeWmB6Sy0/nKj+5
 pVww==
X-Gm-Message-State: ACrzQf1Sswvo/Wo/rhUwB5Wm+Y+v/d14Z85JJ+bIz420nAQOHxnlmeDZ
 1M5a7xBW3u2Q2gQaNw7KyMlrZRklQ2cMUg==
X-Google-Smtp-Source: AMsMyM42YOqBIWOu53yFJ4iMokqz1DMmBja3BCqjC4CSNjCu0A7pGAKOvFyilGKdt9QVIQp1eNJAbw==
X-Received: by 2002:a5d:440a:0:b0:230:d1bb:fbe with SMTP id
 z10-20020a5d440a000000b00230d1bb0fbemr6138638wrq.100.1666216673501; 
 Wed, 19 Oct 2022 14:57:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:8478:6e00:efb:6496:4749:9d6b])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b0022afce9ea93sm14639315wri.40.2022.10.19.14.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:57:53 -0700 (PDT)
From: Oguz Ozhan <oguz.ozhan@mind.be>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 23:57:40 +0200
Message-Id: <20221019215741.2854410-2-oguz.ozhan@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215741.2854410-1-oguz.ozhan@mind.be>
References: <20221019215741.2854410-1-oguz.ozhan@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9N6YyX9bilDcrhmjKBYVRA8Us+WYjDHDvNlfkPDlZM=;
 b=RreiEbUBQhvbQSm51dNKrUGzGGkjOA1fu2Hc5XkBgSPflch3yFr2MaVUjA95R7YiiV
 mGz0Y/mmCRKTqsRxCDTdzF+uX3hlrx7jS+lleOocyf5FAsxzd8qvqzpGtcqHsEcLY+Gn
 kNLoBe7gEuIyekhKR/PAXGTxgvZlh16VnB2+rKN8xlVVGU56QUjjNdYRKdscLRicsjxP
 8cBdzTBpYptYi8UBh0PYK6w948luNP0RCMZgIWSwlUSBJfpX8P0J14aSuoCntyIov5YX
 +99OJ8T0AiDFrAXARU3ZHW1oxeWz/lDUMyILbWQcpskRzllbdKSU6r/sZjVnUFh1/tI4
 xsqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RreiEbUB
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
Cc: Oguz Ozhan <oguz.ozhan@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
