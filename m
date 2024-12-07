Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C40E7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 15:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92255812F4;
	Sat,  7 Dec 2024 15:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IGWD_gB4Low; Sat,  7 Dec 2024 15:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D30812F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65D30812F3;
	Sat,  7 Dec 2024 15:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA987ECA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 15:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7690260704
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 15:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OkMXqF4pjAv for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 15:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F298606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F298606FF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F298606FF
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 15:01:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 514B9B0055E;
 Sat,  7 Dec 2024 16:01:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  7 Dec 2024 16:01:31 +0100
Message-ID: <20241207150131.1055326-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733583702;
 bh=qV/t3bgqJk2zQf8bcV0FPTQgcujGJUaTGt1R270HBfg=;
 h=From:To:Cc:Subject:Date:From;
 b=uWOTNdzxA8VY0NH0Z6WL8Ym4ePWu1063svtwrNV6/b5Qf9x8vxMmrz8wj24q+TDHn
 J1eh5rf0/gMb7X06nd/ORzqgJZZkuuO0YbEtJbfORtOI1/Q8k6yyO/wxXM8cL/Io0d
 +bErWlNcUSCOumHR6P2IynKKbmXgj7aRVKE/m1GaCHQeOXpJffcp7f5nV7nNfuK4T1
 jJU6TZ/xGP5ti1EjZmJuh2x0dRoLVQh8ErbfG+wbInadjFBqO+Z1yhdp/LiMaQO7U4
 kXtbWrcB1Lws7aEX1zQUTN72VOX0/q1J5XBGAHJyClI9qshYwW0PsrUCIH8larfzgi
 dl4+foSxOxdAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uWOTNdzx
Subject: [Buildroot] [PATCH 1/1] support/testing: improve weston test
 reliablity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 support/testing/tests/package/test_weston.py  | 36 +++++++++++++------
 .../test_weston/overlay/etc/default/klogd     |  1 +
 2 files changed, 27 insertions(+), 10 deletions(-)
 create mode 100644 support/testing/tests/package/test_weston/overlay/etc/default/klogd

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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
