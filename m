Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79180C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 12:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A6040502;
	Mon, 10 Jan 2022 12:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkAZCNchg7hG; Mon, 10 Jan 2022 12:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDC36405D8;
	Mon, 10 Jan 2022 12:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 340661BF275
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CDDF405D8
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0IossbWV_4I for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 12:48:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B79C740502
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 12:48:33 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4D293100006;
 Mon, 10 Jan 2022 12:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641818911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJp0nFIppUK8zXqQSiX0a07eKLt8vwI5RP2TsYOlPxQ=;
 b=YG6zw5jpX+F+buA1YRN1VpTABekWeL3v0JXmZoWxMQWP17KgR7Jho7szXFvQBW1KalSA3U
 hA905B8SxduSGSGL3x6G6wo/zAZw9NJSC0g+1l6AKsfa0XmRes/bw4FaqeZFncXGCcUwz1
 D5CpcxQxXNjNnRh+iNwjxkPvJMS2weIo5Vn0scKpfiDmSNfagfXg+jL/EHLJZ7oc0a3CTF
 tddYPCC8fR3HtPcNVxQ3B55k/0hMBzU40APnBaUqcV3dUsFDrBvqKwePy8BfcLZ+nR8ZD1
 b7H08yoLI8QK9seVPFRcq7YugnCyuuKa5PiiYAF247BfR6Zzh+9UfsuSvrFWtA==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 13:46:44 +0100
Message-Id: <20220110124644.1388438-3-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110124644.1388438-1-thierry.bultel@linatsea.fr>
References: <20220110124644.1388438-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/3] fs/cpio: new option to use dracut tool
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
Changes v3 -> v4
  - Config.in: applied Yann's comments on syntax and option in choice
  - do no export TARGET_CROSS but give it in command line instead
  - use $(ROOTFS_CPIO_DIR) as base for tmp directory
  - let original, full cpio, first in the code, and dracut mode after
  - removed unwanted comment in dracut.conf (in tests)

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 fs/cpio/Config.in                     | 35 ++++++++++
 fs/cpio/cpio.mk                       | 36 +++++++++++
 support/testing/conf/dracut.conf      | 93 +++++++++++++++++++++++++++
 support/testing/tests/fs/test_cpio.py | 44 +++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 support/testing/conf/dracut.conf
 create mode 100644 support/testing/tests/fs/test_cpio.py

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index c1151a2881..efc5bd7857 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -7,6 +7,41 @@ config BR2_TARGET_ROOTFS_CPIO
 
 if BR2_TARGET_ROOTFS_CPIO
 
+choice
+	prompt "cpio type"
+	default BR2_TARGET_ROOTFS_CPIO_FULL
+
+config BR2_TARGET_ROOTFS_CPIO_FULL
+	bool "cpio the whole root filesystem (ie the content of 'target')"
+	help
+	  Build a cpio archive containing the whole the root filesystem.
+
+comment "dracut cpio needs busybox, or systemd init system"
+	depends on !BR2_INIT_BUSYBOX
+	depends on !BR2_INIT_SYSTEMD
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT
+	bool "Invoke dracut to make an initramfs"
+	select BR2_PACKAGE_HOST_DRACUT
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSTEMD
+	help
+	  Builds an additional initramfs using dracut.
+	  This can be useful to create a recovery system,
+	  for instance.
+
+endchoice
+
+if BR2_TARGET_ROOTFS_CPIO_DRACUT
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
+	string "configuration file"
+endif
+
+
+endif # BR2_TARGET_ROOTFS_CPIO
+
+if BR2_TARGET_ROOTFS_CPIO_FULL
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_CPIO_NONE
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 81f8c393d1..62e73de8be 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,6 +29,8 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
+
 # --reproducible option was introduced in cpio v2.12, which may not be
 # available in some old distributions, so we build host-cpio
 ifeq ($(BR2_REPRODUCIBLE),y)
@@ -53,4 +55,38 @@ endef
 ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
 endif
 
+else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
+
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
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
+
+	TARGET_CROSS="$(TARGET_CROSS)" \
+	$(HOST_DIR)/sbin/dracut \
+		$(ROOTFS_CPIO_DRACUT_CMD_OPTS) \
+		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
+		-M \
+		--force \
+		--keep \
+		$@
+endef
+
+endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
+
 $(eval $(rootfs))
diff --git a/support/testing/conf/dracut.conf b/support/testing/conf/dracut.conf
new file mode 100644
index 0000000000..5aeecd18ce
--- /dev/null
+++ b/support/testing/conf/dracut.conf
@@ -0,0 +1,93 @@
+#Simple dracut config for a system without systemd
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
