Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292EFEC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D1180F02;
	Thu,  7 Sep 2023 15:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D1180F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrULnut02wOd; Thu,  7 Sep 2023 15:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998EE813EA;
	Thu,  7 Sep 2023 15:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998EE813EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F4C1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C657241E5F
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C657241E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjntmEt1v06t for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 392A341D86
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392A341D86
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33808869E0; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 20:18:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40ff422160e1a5018bbfac53fd9acec702123d8f
X-Git-Newrev: 4edb0e3456efc844f4c483f56c3ee6586c88a0f2
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.33808869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_weston.py: new runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4edb0e3456efc844f4c483f56c3ee6586c88a0f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test is a followup of the discussion at:
https://lists.buildroot.org/pipermail/buildroot/2023-July/671639.html

It provides an example of a runtime tests using standard Linux graphic
components (Kernel, DRM, Mesa3D, weston).

Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr:
  - use an overlay rather than create config file at runtime
  - sleep in python not in target
  - increase delay to capture DRI CRCs
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_weston.py       | 177 +++++++++++++++++++++
 .../tests/package/test_weston/linux-vkms.fragment  |   2 +
 .../package/test_weston/overlay/etc/weston.ini     |  15 ++
 4 files changed, 196 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88b05e8ea8..8fa987bdde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1817,6 +1817,8 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_weston.py
+F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
new file mode 100644
index 0000000000..276788c649
--- /dev/null
+++ b/support/testing/tests/package/test_weston.py
@@ -0,0 +1,177 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestWeston(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_WAYLAND_UTILS=y
+        BR2_PACKAGE_WESTON=y
+        BR2_PACKAGE_WESTON_SIMPLE_CLIENTS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+                infra.filepath("tests/package/test_weston/overlay"),
+                infra.filepath("tests/package/test_weston/linux-vkms.fragment")
+             )
+
+    def gen_read_disp_crcs_cmd(self, count=1):
+        # DRM CRCs are exposed through a sysfs pseudo file, one measure
+        # per line. The first column is the frame number, the second
+        # column is the CRC measure. We use "head" to get the needed
+        # CRC count.
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
+        return cmd
+
+    def gen_count_unique_disp_crcs_cmd(self, count=10):
+        # We get the command generating one CRC per line...
+        cmd = self.gen_read_disp_crcs_cmd(count)
+        # ...then count the number of unique values
+        cmd += " | uniq | wc -l"
+        return cmd
+
+    def start_weston(self):
+        self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
+
+        cmd = "weston"
+        cmd += " --config=/etc/weston.ini"
+        cmd += " --continue-without-input"
+        cmd += " --log=/tmp/weston.log"
+        cmd += " &> /dev/null &"
+        self.assertRunOk(cmd)
+
+        self.assertRunOk("export WAYLAND_DISPLAY=wayland-1")
+
+    def wait_for_weston(self):
+        # We wait for the wayland socket to appear...
+        wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
+        cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
+        self.assertRunOk(cmd, timeout=10)
+
+    def stop_weston(self):
+        cmd = "killall weston && sleep 3"
+        self.assertRunOk(cmd)
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-smp", "4",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # Check the weston binary can execute
+        self.assertRunOk("weston --version")
+
+        self.start_weston()
+        self.wait_for_weston()
+
+        # Check a simple info client can communicate with the compositor
+        self.assertRunOk("wayland-info", timeout=10)
+
+        # This test will use the Kernel VKMS DRM Display CRC support,
+        # which is exposed in debugfs. See:
+        # https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
+        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
+
+        # We get 10 consecutive DRM frame CRCs and count how many
+        # unique CRCs we have. Since weston is supposed to run idle,
+        # we should have 10 times the same display CRC.
+        cmd = self.gen_count_unique_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), 1)
+
+        # We save the CRC value of an empty weston desktop for
+        # later...
+        cmd = self.gen_read_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        weston_desktop_crc = int(output[0], 16)
+
+        # We start the weston-simple-egl in background...  Every
+        # rendered frame is supposed to be different (as the triangle
+        # animation is derived from the system time). Since all the
+        # rendering (client application and compositor) is in
+        # software, we sleep a bit to let those program to settle.
+        self.assertRunOk("weston-simple-egl >/dev/null 2>&1 &")
+        time.sleep(8)
+
+        # Since the weston-simple-egl client is supposed to run and
+        # display something, we are now supposed to measure a
+        # different display CRC than the one we measured when the
+        # desktop was empty.
+        cmd = self.gen_read_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertNotEqual(int(output[0], 16), weston_desktop_crc)
+
+        # While weston-simple-egl is running, we check the VKMS DRM
+        # CRCs are now changing. We get many CRCs, one per display
+        # driver refresh (at ~60Hz). Since all the rendering is in
+        # software, we can expect a slow frame rate. In 300 captured
+        # CRCs (5s), we expect at least 5 different values (i.e. 1 fps).
+        # This guarantees the rendering pipeline is working, while we
+        # remain very permissive to slow emulation situations.
+        # Increase timeout, as the command is expected to run about 5s,
+        # which is the default timeout.
+        cmd = self.gen_count_unique_disp_crcs_cmd(300)
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertGreaterEqual(int(output[0]), 5)
+
+        # We stop weston-simple-egl, and sleep a bit to let Weston do
+        # its cleanup and desktop repaint refresh...
+        self.assertRunOk("killall weston-simple-egl")
+        time.sleep(4)
+
+        # After we stopped the application, we should have the initial
+        # weston desktop background. The CRC we measure now should be
+        # the same as the one we saved earlier.
+        cmd = self.gen_read_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0], 16), weston_desktop_crc)
+
+        self.stop_weston()
+
+        # Now weston is supposed to be stopped,
+        # a simple client is expected to fail.
+        _, exit_code = self.emulator.run("wayland-info")
+        self.assertNotEqual(exit_code, 0)
diff --git a/support/testing/tests/package/test_weston/linux-vkms.fragment b/support/testing/tests/package/test_weston/linux-vkms.fragment
new file mode 100644
index 0000000000..3fc7a5dded
--- /dev/null
+++ b/support/testing/tests/package/test_weston/linux-vkms.fragment
@@ -0,0 +1,2 @@
+CONFIG_DEBUG_FS=y
+CONFIG_DRM_VKMS=y
diff --git a/support/testing/tests/package/test_weston/overlay/etc/weston.ini b/support/testing/tests/package/test_weston/overlay/etc/weston.ini
new file mode 100644
index 0000000000..534b5c1f4a
--- /dev/null
+++ b/support/testing/tests/package/test_weston/overlay/etc/weston.ini
@@ -0,0 +1,15 @@
+# The shell "clock-format" is set to "none", in order to have stable
+#  display output, independant from the time. The display output can
+# then be reliably checked with VKMS CRC.
+# "startup-animation" and "close-animation" are set to "none" for
+# faster transitions (fade animations with a software GLES
+# implementation tend to be slow).
+# Finally, we force the smallest standard display output mode
+# resolution, again for faster test execution.
+[shell]
+clock-format=none
+startup-animation=none
+close-animation=none
+[output]
+name=Virtual-1
+mode=640x480
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
