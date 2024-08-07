Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593F7C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9FB0608EC;
	Wed,  7 Aug 2024 20:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_1lINgvNFWF; Wed,  7 Aug 2024 20:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A7B608EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A7B608EE;
	Wed,  7 Aug 2024 20:54:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21F5A1BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA4481517
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH_j205E1k5A for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985C1814BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 985C1814BB
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:54:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77539846DF; Wed,  7 Aug 2024 20:54:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69629bae7ccb2431a70d0cffce2fadf62560ebdf
X-Git-Newrev: e506946347430e8bc721b55248e625d6668f4c72
X-Patchwork-Hint: ignore
Message-Id: <20240807205422.77539846DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] suport/testing/tests/package/test_flutter:
 extend to check rendering is happening
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e506946347430e8bc721b55248e625d6668f4c72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7f0af11cee31 (support/testing/tests/package/test_flutter.py: new
runtime test) added a simple test that just checked that the systemd
unit launching the application, was active.

It is perfectly possible, from a systemd perspective, that the unit is
active, while the application actually crashes.

Instead, what we need to check, is that the application does actually
render "something"; we don't really care what, as long as we know it is
actually rendering, thus the graphical stack is working and the
aplication stack is running.

Extend the flutter runtime test to also check that the framebuffer is
modified by the application when it is running, similarly to what we do
in the weston test.

We drop the activation of the unit and start it manually, as we want to
check the state of the CRC before, while, and after the application
runs.

We also need to disable the blinking cursor on the console, or we would
not be able to detect whether a change in CRC is due to the application
starting rendering, or to the cursor blinking. We tell the kernel to
disable the cursor with the appropriate kernel command line parameter.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_flutter.py      | 35 ++++++++++++++++++----
 .../flutter-markdown-example.service               |  1 -
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 3a150a69e1..08aa497417 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -1,8 +1,11 @@
 import os
+import time
 import infra.basetest
 
+from ..graphics_base import GraphicsBase
 
-class TestFlutter(infra.basetest.BRTest):
+
+class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
@@ -40,7 +43,7 @@ class TestFlutter(infra.basetest.BRTest):
         self.emulator.boot(
             arch="aarch64",
             kernel=kern,
-            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+            kernel_cmdline=["root=/dev/vda console=ttyAMA0 vt.global_cursor_default=0"],
             options=["-M", "virt",
                      "-cpu", "cortex-a57",
                      "-m", "512M",
@@ -49,7 +52,27 @@ class TestFlutter(infra.basetest.BRTest):
                      "-vnc", "none",
                      "-drive", f"file={img},if=virtio,format=raw"])
         self.emulator.login()
-        cmd = "systemctl is-active flutter-markdown-example"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "active")
+
+        # Get the CRC from the current ramebuffer
+        empty_crc = self.get_n_fb_crc(count=1)[0]
+
+        # Start the example App. It can take a bit of time to start,
+        # so lets try a few times. 600 samples should cover about 10s
+        # @60Hz (although, the rendering could be much slower on slow
+        # machines)
+        self.assertRunOk("systemctl start flutter-markdown-example", timeout=10)
+        for i in range(600):
+            gallery_crc = self.get_n_fb_crc(count=1)[0]
+            if gallery_crc != empty_crc:
+                break
+            time.sleep(1)
+        self.assertNotEqual(gallery_crc, empty_crc, "gallery app did not render anything on screen")
+
+        # Stop the application, and check it restored the framebuffer content
+        self.assertRunOk("systemctl stop flutter-markdown-example", timeout=10)
+        for i in range(600):
+            gallery_crc = self.get_n_fb_crc(count=1)[0]
+            if gallery_crc == empty_crc:
+                break
+            time.sleep(1)
+        self.assertEqual(gallery_crc, empty_crc, "gallery app did not stop rendering")
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
deleted file mode 120000
index 83e731ba2d..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
+++ /dev/null
@@ -1 +0,0 @@
-../../../../usr/lib/systemd/system/flutter-markdown-example.service
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
