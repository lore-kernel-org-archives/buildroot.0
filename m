Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0FBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 11:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FF060B6E;
	Thu, 23 Dec 2021 11:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaFwaXZlW28n; Thu, 23 Dec 2021 11:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7392F600CC;
	Thu, 23 Dec 2021 11:14:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B88951BF427
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5BEB40994
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGHpP88HxeH8 for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 11:14:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 344C84096F
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 11:14:05 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 51388FF802;
 Thu, 23 Dec 2021 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1640258044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNX2tRkA9TJHcZv1yao4IxFASIckYx8/peloQd2/jKQ=;
 b=KqHP9uXDHWc5gBbSFZnb9dBosn8ByOhka4GhkUHk5I6/Yj0IuJlhFKkbbxC0guYawRA3gs
 7/LX9gGskEjuQsWsVCwNEidekJrLLLIzeK8EZ3kS6jnMJO83oX0B8nh8cbXhfaZA47bcTR
 6D07fV1M3QWuLA+MnuqWedmrMZU57CrSNTmfr/c70h4ODkrEoFWb3ayLWGEAWIzwY3klOW
 y2fld2l7BfpEHejaLR2j6yPVGfmy3wDrFuVVw9yHL5i0B0pHqvkcfaImbAzm2dNx9ZtaI0
 T4TygsGjKCPuRmK5FQlhs5YODSfsVOH+ZclfEbxYbnGgZR5jljiShDq2YmJ0Wg==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 12:13:48 +0100
Message-Id: <20211223111348.3532601-3-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] fs/cpio: new option to use dracut tool
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds an option to invoke the dracut host tool, providing
a configuration file, instead of having a full cpio archive
of the whole target directory.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Changes v1 -> v2 (suggested by Arnoult and Yann)
  - was a new fs type, now an option of cpio
  - deals with the case of a build with no kernel
  - gets the kernel name in a smarter way
  - checks for the name of dracut configuration file
Changes v2 -> v3
  - fixed a typo on the --no-kernel option for dracut
  - removed the unneeded dependency to kernel
  - added tests for cpio, for both full, and dracut modes

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 fs/cpio/Config.in                     | 27 ++++++++
 fs/cpio/cpio.mk                       | 37 +++++++++++
 support/testing/conf/dracut.conf      | 93 +++++++++++++++++++++++++++
 support/testing/tests/fs/test_cpio.py | 44 +++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 support/testing/conf/dracut.conf
 create mode 100644 support/testing/tests/fs/test_cpio.py

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index c1151a2881..3d0f963a8d 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -7,6 +7,33 @@ config BR2_TARGET_ROOTFS_CPIO
 
 if BR2_TARGET_ROOTFS_CPIO
 
+choice
+	prompt "cpio type"
+config BR2_TARGET_ROOTFS_CPIO_FULL
+	bool "cpio the whole root filesystem (ie the content of 'target')"
+	help
+	  Build a cpio archive containing the whole the root filesystem.
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT
+	bool "Invoke dracut to make an initramfs"
+	select BR2_PACKAGE_HOST_DRACUT
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Builds an additional initramfs using dracut.
+	  This can be useful to create a recovery system,
+	  for instance.
+
+if BR2_TARGET_ROOTFS_CPIO_DRACUT
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
+	string "configuration file"
+endif
+
+endchoice
+
+endif # BR2_TARGET_ROOTFS_CPIO
+
+if BR2_TARGET_ROOTFS_CPIO_FULL
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_CPIO_NONE
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 81f8c393d1..e0e0eb2b1e 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,6 +29,41 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
+
+export TARGET_CROSS
+ROOTFS_CPIO_DEPENDENCIES += host-dracut
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+ROOTFS_CPIO_DEPENDENCIES += linux
+endif
+
+ifeq ($(BR_BUILDING).$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y.)
+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
+endif
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+ROOTFS_CPIO_DRACUT_CMD_OPTS += --kver $(LINUX_VERSION_PROBED)
+else
+ROOTFS_CPIO_DRACUT_CMD_OPTS += --no-kernel
+endif
+
+define ROOTFS_CPIO_CMD
+	mkdir -p $(@D)/tmp
+	rm -rf $(@D)/tmp/*
+
+	$(HOST_DIR)/usr/bin/dracut_wrapper.sh \
+		$(ROOTFS_CPIO_DRACUT_CMD_OPTS) \
+		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		--tmpdir $(@D)/tmp \
+		-M \
+		--force \
+		--keep \
+		$@
+endef
+
+else ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
+
 # --reproducible option was introduced in cpio v2.12, which may not be
 # available in some old distributions, so we build host-cpio
 ifeq ($(BR2_REPRODUCIBLE),y)
@@ -53,4 +88,6 @@ endef
 ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
 endif
 
+endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
+
 $(eval $(rootfs))
diff --git a/support/testing/conf/dracut.conf b/support/testing/conf/dracut.conf
new file mode 100644
index 0000000000..eb793a3562
--- /dev/null
+++ b/support/testing/conf/dracut.conf
@@ -0,0 +1,93 @@
+#Yuco dracut config
+
+#Dracut configuration
+
+show_modules=yes
+i18n_install_all=no
+lvmconf=no
+mdadmconf=no
+early_microcode=no
+hostonly=no
+hostonly_cmdline=no
+use_fstab=no
+kernel_cmdline="rd.break=initqueue"
+do_strip=no
+
+# Dracut modules need
+add_dracutmodules+=" \
+busybox-buildroot \
+bash
+"
+
+# Modules to ignore
+omit_dracutmodules+=" \
+biosdevname \
+btrfs \
+bluetooth \
+busybox \
+caps \
+cifs \
+crypt \
+crypt-gpg \
+dash \
+dbus-broker \
+dbus-daemon \
+dm \
+dmraid \
+dmsquash-live-ntfs \
+dracut-systemd \
+fcoe \
+fcoe-uefi \
+fs-lib \
+iscsi \
+i18n \
+lvmmerge \
+lvm \ 
+lunmask \
+mdraid \
+memstrack \
+mksh \
+modsign \
+mount-root \
+multipath \
+nbd \
+network-legacy \
+network-wicked \
+nfs \
+nvdimm \
+nvmf \
+parse-lunmask \
+qemu \
+qemu-net \
+resume \
+rootfs-block \
+rngd \
+systemd \
+systemd-udevd \
+systemd-coredump \
+systemd-ask-password \
+systemd-timedated \
+systemd-rfkill \
+systemd-resolved \
+systemd-hostnamed \
+systemd-initrd \
+systemd-journald \
+systemd-ldconfig \
+systemd-networkd \
+systemd-timesyncd \
+systemd-veritysetup \
+systemd-modules-load \
+systemd-sysctl \
+systemd-repart \
+systemd-sysext \
+systemd-sysusers \
+systemd-tmpfiles \
+squash \
+ssh-client \
+stratis \
+tpm2-tss \
+udev-rules \
+url-lib \
+usrmount \
+"
+
diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
new file mode 100644
index 0000000000..5570693dc2
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio.py
@@ -0,0 +1,44 @@
+import os
+import infra.basetest
+
+CHECK_FS_CMD = "mount | grep 'rootfs on / type rootfs'"
+
+def boot_img(emulator, builddir):
+    img = os.path.join(builddir, "images", "rootfs.cpio")
+    emulator.boot(arch="armv7",
+                  kernel="builtin",
+                  options=["-initrd", "{}".format(img)])
+    emulator.login()
+    _, exit_code = emulator.run(CHECK_FS_CMD)
+    return exit_code
+
+class TestCpioDracut(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_INIT_BUSYBOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE="{}"
+        """.format(infra.filepath("conf/dracut.conf"))
+
+    def test_run(self):
+
+        exit_code = boot_img(self.emulator,
+                             self.builddir)
+        self.assertEqual(exit_code, 0)
+
+class TestCpioFull(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_INIT_BUSYBOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_FULL=y
+        """
+
+    def test_run(self):
+
+        exit_code = boot_img(self.emulator,
+                             self.builddir)
+        self.assertEqual(exit_code, 0)
+
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
