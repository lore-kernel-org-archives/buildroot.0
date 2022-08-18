Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BFC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E0661083;
	Sun, 11 Sep 2022 08:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29E0661083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yxHnr44zTjl; Sun, 11 Sep 2022 08:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3852361053;
	Sun, 11 Sep 2022 08:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3852361053
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D413C1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BABD61053
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BABD61053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_fJjBNSWoBM for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B48B860ACA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B48B860ACA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B171183620; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 22:49:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87f4900826bd4387a098fdb9a003e66a0ca057c8
X-Git-Newrev: d8f0ec7a468c30d401b2e51e4bbfe985997f8e0c
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.B171183620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/cpio: new option to use dracut tool
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8f0ec7a468c30d401b2e51e4bbfe985997f8e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds an option to invoke the dracut host tool, providing
a configuration file, instead of having a full cpio archive
of the whole target directory.

A default configuration file is provided. It assumes busybox init.
ideally, a different default should be used in case of systemd init, but
that's left for future work.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
[arnout@mind.be: many changes]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: some additional fixups]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/cpio/Config.in   | 35 ++++++++++++++++++++
 fs/cpio/cpio.mk     | 33 +++++++++++++++++++
 fs/cpio/dracut.conf | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index c1151a2881..861e9a929e 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -7,6 +7,41 @@ config BR2_TARGET_ROOTFS_CPIO
 
 if BR2_TARGET_ROOTFS_CPIO
 
+choice
+	prompt "cpio type"
+	default BR2_TARGET_ROOTFS_CPIO_FULL
+
+config BR2_TARGET_ROOTFS_CPIO_FULL
+	bool "cpio the whole root filesystem"
+	help
+	  Build a cpio archive containing the whole the root filesystem.
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT
+	bool "Invoke dracut to make a partial initramfs"
+	select BR2_PACKAGE_HOST_DRACUT
+	help
+	  Build an additional initramfs using dracut. This only contains
+	  a subset of the rootfs, as determined by the configuration
+	  file.
+	  This can be useful to create a recovery system, for instance.
+
+endchoice
+
+if BR2_TARGET_ROOTFS_CPIO_DRACUT
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
+	string "dracut configuration file"
+	default "fs/cpio/dracut.conf"
+	help
+	  Dracut configuration file. It determines which parts of the
+	  rootfs get included in the cpio image. See dracut.conf(5) or
+	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
+
+	  The default configuration file is suitable for busybox init.
+	  It doesn't, however, pivot_root into a full rootfs.
+
+endif
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_CPIO_NONE
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 81f8c393d1..fa66b1c710 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -36,6 +36,8 @@ ROOTFS_CPIO_DEPENDENCIES += host-cpio
 ROOTFS_CPIO_OPTS += --reproducible
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
+
 define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && \
 	find . \
@@ -44,6 +46,37 @@ define ROOTFS_CPIO_CMD
 	> $@
 endef
 
+else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
+
+ROOTFS_CPIO_DEPENDENCIES += host-dracut
+
+ROOTFS_CPIO_DRACUT_CONF_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE))
+ifeq ($(BR_BUILDING):$(ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
+endif
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+ROOTFS_CPIO_DEPENDENCIES += linux
+ROOTFS_CPIO_OPTS += --kver $(LINUX_VERSION_PROBED)
+else
+ROOTFS_CPIO_OPTS += --no-kernel
+endif
+
+define ROOTFS_CPIO_CMD
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
+	$(HOST_DIR)/bin/dracut \
+		$(ROOTFS_CPIO_OPTS) \
+		-c $(ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		--sysroot $(TARGET_DIR) \
+		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
+		-M \
+		--force \
+		--no-compress \
+		$@
+endef
+
+endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
+
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
 ROOTFS_CPIO_DEPENDENCIES += host-uboot-tools
 define ROOTFS_CPIO_UBOOT_MKIMAGE
diff --git a/fs/cpio/dracut.conf b/fs/cpio/dracut.conf
new file mode 100644
index 0000000000..2337736c4e
--- /dev/null
+++ b/fs/cpio/dracut.conf
@@ -0,0 +1,92 @@
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
+# Dracut modules needed
+add_dracutmodules+=" \
+busybox-init
+"
+
+# Modules to ignore
+omit_dracutmodules+=" \
+bash \
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
