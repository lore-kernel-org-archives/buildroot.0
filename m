Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2666DC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9552341776;
	Sun,  7 May 2023 21:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9552341776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4ak_E9qVkbr; Sun,  7 May 2023 21:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94DE5400D6;
	Sun,  7 May 2023 21:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DE5400D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD7191BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9436A4013B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9436A4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rV9yoD0lTB1L for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:02:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF1D400D6
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF1D400D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3E0786069; Sun,  7 May 2023 21:02:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 22:59:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c110bb17ade18f446dd663c984dc3ef48b20fc64
X-Git-Newrev: d06dca38bb0373a13736a349f7795713458a2188
X-Patchwork-Hint: ignore
Message-Id: <20230507210246.A3E0786069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: cleanup kconfig fixup processing
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

commit: https://git.buildroot.net/buildroot/commit/?id=d06dca38bb0373a13736a349f7795713458a2188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following is an attempt o cleanup the output generated when fixing
up a Linux's Kconfig:

- Quiet the conditional check host-pahole to avoid having the message
   used to describe a failure generate in the output in its script form.
- Move the initramfs fixups to their own conditional macros, and move
   the comments out of the macro (mainly for developers managing the
   implementation).
- Adding a generic "Updating kernel config..." message, to help inform
   builders that the framework is actively processing Kconfig's (while
   users may be pondering why the closing of a `linux-menuconfig` is
   doing).

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr:
  - introduce LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
  - use MESSAGE to display... a message...
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 37797fc4f0..8027274c32 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -127,7 +127,7 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
-	if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
+	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
 		echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole (BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE)" 1>&2; \
 		exit 1; \
 	fi
@@ -366,7 +366,22 @@ define LINUX_FIXUP_CONFIG_ENDIANNESS
 endef
 endif
 
+# As the kernel gets compiled before root filesystems are
+# built, we create a fake cpio file. It'll be
+# replaced later by the real cpio archive, and the kernel will be
+# rebuilt using the linux-rebuild-with-initramfs target.
+ifneq ($(BR2_TARGET_ROOTFS_INITRAMFS),)
+define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
+	@mkdir -p $(BINARIES_DIR)
+	$(Q)touch $(BINARIES_DIR)/rootfs.cpio
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
+endef
+endif
+
 define LINUX_KCONFIG_FIXUP_CMDS
+	@$(call MESSAGE,"Updating kernel config with fixups")
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES))
 	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)))
@@ -401,16 +416,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_64K_PAGES))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD))
-	# As the kernel gets compiled before root filesystems are
-	# built, we create a fake cpio file. It'll be
-	# replaced later by the real cpio archive, and the kernel will be
-	# rebuilt using the linux-rebuild-with-initramfs target.
-	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
-		mkdir -p $(BINARIES_DIR)
-		touch $(BINARIES_DIR)/rootfs.cpio
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
+	$(LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO)
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
