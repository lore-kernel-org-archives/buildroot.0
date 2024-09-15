Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED062C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFE784906;
	Sun, 15 Sep 2024 21:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sY-ecfOtxZD2; Sun, 15 Sep 2024 21:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A6C384909
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6C384909;
	Sun, 15 Sep 2024 21:42:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D48D1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1C136087F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ns0bOTmuyBoi for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCAEE60887
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCAEE60887
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1D5C83682; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:20:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd35be957e813d478325500cd0033b6912e77c44
X-Git-Newrev: 21e9bb0967a6534e73138a8e645a5c80fc442b0d
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.C1D5C83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fs: new erofs runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21e9bb0967a6534e73138a8e645a5c80fc442b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/fs/test_erofs.py             | 51 ++++++++++++++++++++++
 .../tests/fs/test_erofs/linux-erofs.fragment       |  1 +
 3 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e1d26b43fc..f291ba8e7c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1841,6 +1841,8 @@ F:	support/testing/tests/boot/test_optee_os.py
 F:	support/testing/tests/boot/test_optee_os/
 F:	support/testing/tests/fs/test_btrfs.py
 F:	support/testing/tests/fs/test_btrfs/
+F:	support/testing/tests/fs/test_erofs.py
+F:	support/testing/tests/fs/test_erofs/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/fs/test_erofs.py b/support/testing/tests/fs/test_erofs.py
new file mode 100644
index 0000000000..47c75262e0
--- /dev/null
+++ b/support/testing/tests/fs/test_erofs.py
@@ -0,0 +1,51 @@
+import os
+
+import infra.basetest
+
+
+class TestErofs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_erofs/linux-erofs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.46"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EROFS_UTILS=y
+        BR2_TARGET_ROOTFS_EROFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        root_dev = "/dev/vda"
+        disk = os.path.join(self.builddir, "images", "rootfs.erofs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = [f"root={root_dev}", "console=ttyAMA0"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in erofs format.
+        cmd = "mount | grep '/dev/root on / type erofs'"
+        self.assertRunOk(cmd)
+
+        # Since we are on a read-only mounted filesystem, we can run a
+        # check...
+        self.assertRunOk(f"fsck.erofs {root_dev}")
+
+        # We check we can dump the superblock.
+        self.assertRunOk(f"dump.erofs -s {root_dev}")
+
+        # We check we can dump statistics on the image.
+        self.assertRunOk(f"dump.erofs -S {root_dev}")
diff --git a/support/testing/tests/fs/test_erofs/linux-erofs.fragment b/support/testing/tests/fs/test_erofs/linux-erofs.fragment
new file mode 100644
index 0000000000..e14017aae4
--- /dev/null
+++ b/support/testing/tests/fs/test_erofs/linux-erofs.fragment
@@ -0,0 +1 @@
+CONFIG_EROFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
