Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4DCC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33849608C5;
	Wed,  7 Aug 2024 20:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WLLwC-yjAWT; Wed,  7 Aug 2024 20:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C36608DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C36608DC;
	Wed,  7 Aug 2024 20:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B633B1BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A49C440BC9
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3gwRAIHggIB for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F55540BB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F55540BB6
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:54:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66722846DE; Wed,  7 Aug 2024 20:54:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:53:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 698c9f12c48463c6c39a747109e8b39d5a4fa660
X-Git-Newrev: 69629bae7ccb2431a70d0cffce2fadf62560ebdf
X-Patchwork-Hint: ignore
Message-Id: <20240807205422.66722846DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/test/graphics_base: add
 helper to test graphics rendering
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

commit: https://git.buildroot.net/buildroot/commit/?id=69629bae7ccb2431a70d0cffce2fadf62560ebdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 4edb0e3456ef (support/testing/tests/package/test_weston.py: new
runtime test), the weston test was introduced, and thus was the first
that needed to test that rendering was happening.

Now we also have a test for a flutter application, and we'll want to
have it test the rendering too.

Move the corresponding code to a helper that can be reused by other
tests, rather than duplicate (or reinvent) it.

Switch weston to using that new helper.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/graphics_base.py       | 39 ++++++++++++++++++
 support/testing/tests/package/test_weston.py | 61 +++++-----------------------
 3 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c472aa4c53..38a19aafcf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3384,6 +3384,7 @@ F:	package/weston/
 F:	package/wtfutil/
 F:	package/zisofs-tools/
 F:	support/download/
+F:	support/testing/tests/graphics_base.py
 
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
diff --git a/support/testing/tests/graphics_base.py b/support/testing/tests/graphics_base.py
new file mode 100644
index 0000000000..15a4c00bb2
--- /dev/null
+++ b/support/testing/tests/graphics_base.py
@@ -0,0 +1,39 @@
+class GraphicsBase:
+    def get_n_fb_crc(self, *, count=10, uniq=False, timeout=-1):
+        """
+        Return count DRM CRC from the framebuffer. If uniq is True,
+        only unique CRCs are returned (which may be less than the
+        requested cont).
+        Returns a possibly empty list of integers.
+        Set timeout to -1 for no timeout, or to a positive number for
+        a timeout of that many seconds.
+        """
+        # DRM CRCs are exposed through a sysfs pseudo file
+        try:
+            self.debugfs_mounted
+        except AttributeError:
+            # Note: some init system (e.g. systemd) may have this already
+            # mounted, so check beforehand
+            self.assertRunOk("mountpoint /sys/kernel/debug/ || mount -t debugfs none /sys/kernel/debug/")
+            self.debugfs_mounted = True
+
+        # The first column is the frame number, the second column is the
+        # CRC measure. We use "head" to get the needed CRC count.
+        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
+        cmd = f"head -{count} {disp_crc_path}"
+
+        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
+        # and '\0'. We remove the '\0' to have a text-only output.
+        cmd += " | tr -d '\\000'"
+
+        # Finally, we drop the frame counter, and keep only the second
+        # column (CRC values)
+        cmd += " | cut -f 2 -d ' '"
+
+        if uniq:
+            cmd += " | sort -u"
+
+        output, exit_code = self.emulator.run(cmd, timeout=timeout)
+        self.assertTrue(exit_code == 0, f"'{cmd}' failed with exit code {exit_code}")
+
+        return [int(crc, 16) for crc in output]
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index df1b7a4135..f37a73565f 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -2,9 +2,10 @@ import os
 import time
 
 import infra.basetest
+from ..graphics_base import GraphicsBase
 
 
-class TestWeston(infra.basetest.BRTest):
+class TestWeston(infra.basetest.BRTest, GraphicsBase):
     config = \
         """
         BR2_aarch64=y
@@ -36,31 +37,6 @@ class TestWeston(infra.basetest.BRTest):
                 infra.filepath("tests/package/test_weston/linux-vkms.fragment")
              )
 
-    def gen_read_disp_crcs_cmd(self, count=1):
-        # DRM CRCs are exposed through a sysfs pseudo file, one measure
-        # per line. The first column is the frame number, the second
-        # column is the CRC measure. We use "head" to get the needed
-        # CRC count.
-        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
-        cmd = f"head -{count} {disp_crc_path}"
-
-        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
-        # and '\0'. We remove the '\0' to have a text-only output.
-        cmd += " | tr -d '\\000'"
-
-        # Finally, we drop the frame counter, and keep only the second
-        # column (CRC values)
-        cmd += " | cut -f 2 -d ' '"
-
-        return cmd
-
-    def gen_count_unique_disp_crcs_cmd(self, count=10):
-        # We get the command generating one CRC per line...
-        cmd = self.gen_read_disp_crcs_cmd(count)
-        # ...then count the number of unique values
-        cmd += " | uniq | wc -l"
-        return cmd
-
     def start_weston(self):
         self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
 
@@ -106,25 +82,14 @@ class TestWeston(infra.basetest.BRTest):
         # Check a simple info client can communicate with the compositor
         self.assertRunOk("wayland-info", timeout=10)
 
-        # This test will use the Kernel VKMS DRM Display CRC support,
-        # which is exposed in debugfs. See:
-        # https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
-        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
-
         # We get 10 consecutive DRM frame CRCs and count how many
         # unique CRCs we have. Since weston is supposed to run idle,
         # we should have 10 times the same display CRC.
-        cmd = self.gen_count_unique_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(int(output[0]), 1)
+        self.assertTrue(len(self.get_n_fb_crc(uniq=True)) == 1)
 
         # We save the CRC value of an empty weston desktop for
         # later...
-        cmd = self.gen_read_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        weston_desktop_crc = int(output[0], 16)
+        weston_desktop_crc = self.get_n_fb_crc(count=1)[0]
 
         # We start the weston-simple-egl in background...  Every
         # rendered frame is supposed to be different (as the triangle
@@ -138,10 +103,8 @@ class TestWeston(infra.basetest.BRTest):
         # display something, we are now supposed to measure a
         # different display CRC than the one we measured when the
         # desktop was empty.
-        cmd = self.gen_read_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertNotEqual(int(output[0], 16), weston_desktop_crc)
+        crc = self.get_n_fb_crc(count=1)[0]
+        self.assertNotEqual(crc, weston_desktop_crc)
 
         # While weston-simple-egl is running, we check the VKMS DRM
         # CRCs are now changing. We get many CRCs, one per display
@@ -152,10 +115,8 @@ class TestWeston(infra.basetest.BRTest):
         # remain very permissive to slow emulation situations.
         # Increase timeout, as the command is expected to run about 5s,
         # which is the default timeout.
-        cmd = self.gen_count_unique_disp_crcs_cmd(300)
-        output, exit_code = self.emulator.run(cmd, timeout=10)
-        self.assertEqual(exit_code, 0)
-        self.assertGreaterEqual(int(output[0]), 5)
+        crcs = self.get_n_fb_crc(count=300, timeout=10)
+        self.assertGreaterEqual(len(crcs), 5)
 
         # We stop weston-simple-egl, and sleep a bit to let Weston do
         # its cleanup and desktop repaint refresh...
@@ -165,10 +126,8 @@ class TestWeston(infra.basetest.BRTest):
         # After we stopped the application, we should have the initial
         # weston desktop background. The CRC we measure now should be
         # the same as the one we saved earlier.
-        cmd = self.gen_read_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(int(output[0], 16), weston_desktop_crc)
+        crc = self.get_n_fb_crc(count=1)[0]
+        self.assertEqual(crc, weston_desktop_crc)
 
         self.stop_weston()
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
