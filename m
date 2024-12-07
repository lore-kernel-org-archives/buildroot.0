Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA7EC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089B642E93;
	Fri, 28 Feb 2025 16:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yy8fIcT5jrV2; Fri, 28 Feb 2025 16:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE5DF46BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5DF46BE3;
	Fri, 28 Feb 2025 16:35:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18CAD68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CEB41DEA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewaOvZsLhkxN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67745419CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67745419CF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6232383CA0; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 23:22:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5f18745057a8bd2e0a3dc40d77ea382c5f6e41f0
X-Git-Newrev: 6561a5d773d8e159556e2b911b315e3b5a0b89b1
X-Patchwork-Hint: ignore
Message-Id: <20250228162933.6232383CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: improve
 weston test reliability
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6561a5d773d8e159556e2b911b315e3b5a0b89b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The weston runtime test is unreliable, depending on the execution speed
of its runner. Example of failure is [1], and success is [2]. This
commit improves the test in several ways, to make it more robust to
execution speed variations:

- The command started in background (weston, weston-simple-egl) are
  now started in a subshell. This suppresses the job control messages
  when they are stopped. Those messages could interfere with the parsing
  of the output;

- Wait time are moved outside the emulator;

- The kernel argument vt.global_cursor_default=0 is added, to make sure
  cursors are globally disabled, since the test use vkms display CRCs;

- The memory of the emulator is increased to 512M. This test uses cpio
  initramfs, and the filesystem size increased;

- The vkms driver emulates a "vsync" event, but can generate a warning
  when the system is too slow. This warning is printed on the console by
  the klogd daemon in its default configuration. This commit adds the
  overlay file /etc/default/klogd to limit only kernel emergency
  messages to be printed on the console. This change fixes the failure
  seen in [1] ;

- Some sleep time values were adjusted to run on a "performant" idle
  host. Those values are not suitable in all situations. In the
  meantime a generic retry mechanism is added in the test infra, this
  commit adds a retry logic inspired from the test_flutter runtime
  test.

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8562483474
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236652

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_weston.py       | 36 ++++++++++++++++------
 .../package/test_weston/overlay/etc/default/klogd  |  1 +
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index f37a73565f..2ed59a7f15 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -40,11 +40,11 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
     def start_weston(self):
         self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
 
-        cmd = "weston"
+        cmd = "( weston"
         cmd += " --config=/etc/weston.ini"
         cmd += " --continue-without-input"
         cmd += " --log=/tmp/weston.log"
-        cmd += " &> /dev/null &"
+        cmd += " &> /dev/null & )"
         self.assertRunOk(cmd)
 
         self.assertRunOk("export WAYLAND_DISPLAY=wayland-1")
@@ -57,7 +57,8 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
         time.sleep(4)
 
     def stop_weston(self):
-        cmd = "killall weston && sleep 3"
+        cmd = "killall weston"
+        time.sleep(3)
         self.assertRunOk(cmd)
 
     def test_run(self):
@@ -65,14 +66,23 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
         kern = os.path.join(self.builddir, "images", "Image")
         self.emulator.boot(arch="aarch64",
                            kernel=kern,
-                           kernel_cmdline=["console=ttyAMA0"],
+                           kernel_cmdline=["console=ttyAMA0", "vt.global_cursor_default=0"],
                            options=["-M", "virt",
                                     "-cpu", "cortex-a57",
                                     "-smp", "4",
-                                    "-m", "256M",
+                                    "-m", "512M",
                                     "-initrd", img])
         self.emulator.login()
 
+        # This test uses the vkms DRM Kernel driver. This driver can
+        # generate kernel warning messages in some cases (e.g. "vblank
+        # timer overrun"). Those messages can happen on slow test
+        # runners. This warning is not an issue in this test: it is
+        # not checking performance here; it just checks the rendering
+        # pipeline is functional. For that reason, this test adds the
+        # file "/etc/default/klogd" to only show emergency messages
+        # (level value 0) on the console.
+
         # Check the weston binary can execute
         self.assertRunOk("weston --version")
 
@@ -96,14 +106,17 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
         # animation is derived from the system time). Since all the
         # rendering (client application and compositor) is in
         # software, we sleep a bit to let those program to settle.
-        self.assertRunOk("weston-simple-egl >/dev/null 2>&1 &")
-        time.sleep(8)
+        self.assertRunOk("( weston-simple-egl >/dev/null 2>&1 & )")
 
         # Since the weston-simple-egl client is supposed to run and
         # display something, we are now supposed to measure a
         # different display CRC than the one we measured when the
         # desktop was empty.
-        crc = self.get_n_fb_crc(count=1)[0]
+        for i in range(600):
+            crc = self.get_n_fb_crc(count=1)[0]
+            if crc != weston_desktop_crc:
+                break
+            time.sleep(1)
         self.assertNotEqual(crc, weston_desktop_crc)
 
         # While weston-simple-egl is running, we check the VKMS DRM
@@ -121,12 +134,15 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
         # We stop weston-simple-egl, and sleep a bit to let Weston do
         # its cleanup and desktop repaint refresh...
         self.assertRunOk("killall weston-simple-egl")
-        time.sleep(4)
 
         # After we stopped the application, we should have the initial
         # weston desktop background. The CRC we measure now should be
         # the same as the one we saved earlier.
-        crc = self.get_n_fb_crc(count=1)[0]
+        for i in range(600):
+            crc = self.get_n_fb_crc(count=1)[0]
+            if crc == weston_desktop_crc:
+                break
+            time.sleep(1)
         self.assertEqual(crc, weston_desktop_crc)
 
         self.stop_weston()
diff --git a/support/testing/tests/package/test_weston/overlay/etc/default/klogd b/support/testing/tests/package/test_weston/overlay/etc/default/klogd
new file mode 100644
index 0000000000..b4209f50b5
--- /dev/null
+++ b/support/testing/tests/package/test_weston/overlay/etc/default/klogd
@@ -0,0 +1 @@
+KLOGD_ARGS="-c 1"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
