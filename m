Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD99FC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60AA04179A;
	Wed, 26 Jul 2023 21:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60AA04179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xH0VF2LiGB29; Wed, 26 Jul 2023 21:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65BE740C4F;
	Wed, 26 Jul 2023 21:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65BE740C4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1A3A1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9FFF41E78
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9FFF41E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ge80TjBAy2QG for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:25:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E09B441E74
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E09B441E74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C01E6835E8; Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:25:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d1180aa483b624f1be27bd0858c2f6665ebf36c
X-Git-Newrev: 029296c748b235c8e09dba85502d464ca6af050d
X-Patchwork-Hint: ignore
Message-Id: <20230726212528.C01E6835E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: Add support for Rockchip
 binary blobs
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

commit: https://git.buildroot.net/buildroot/commit/?id=029296c748b235c8e09dba85502d464ca6af050d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently for some Rockchip SoCs binary blobs are needed, e.g., for
the RK3588 bl31 and tpl. These blobs are provided by Rockchip. This
patch adds U-Boot package options to use theses binaries, provided
by the rockchip-rkbin package, which is also introduced in this
patch series. The U-Boot package is modified so that it takes the
chosen binaries and automatically uses them during build.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
[yann.morin.1998@free.fr:
  - use already-qstripped variables from rockchip-rkbin
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in |  9 +++++++++
 boot/uboot/uboot.mk  | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ab0aaf2939..8b726eaa57 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -262,6 +262,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	  This option makes sure that the i.MX firmwares are copied into
 	  the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
+	bool "U-Boot needs rockchip-rkbin"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
+	help
+	  For some Rockchip SoCs U-Boot needs binary blobs from
+	  Rockchip.
+	  This option makes sure that the needed binary blobs are copied
+	  into the U-Boot source directory.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 592e1db0b8..f0a85ee1ca 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -209,6 +209,23 @@ endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
+UBOOT_DEPENDENCIES += rockchip-rkbin
+define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
+	$(INSTALL) -D -m 0644 $(@D)/u-boot-rockchip.bin $(BINARIES_DIR)/u-boot-rockchip.bin
+endef
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
+ifneq ($(ROCKCHIP_RKBIN_BL31_FILENAME),)
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_BL31_FILENAME))
+endif
+ifneq ($(ROCKCHIP_RKBIN_TPL_FILENAME),)
+UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TPL_FILENAME))
+endif
+ifneq ($(ROCKCHIP_RKBIN_TEE_FILENAME),)
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TEE_FILENAME))
+endif
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
