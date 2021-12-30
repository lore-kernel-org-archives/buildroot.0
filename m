Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C59DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346BC80BDC;
	Thu, 30 Dec 2021 14:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzDkcPK2OsGe; Thu, 30 Dec 2021 14:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8397080BC5;
	Thu, 30 Dec 2021 14:26:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20DB71BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D22860BFE
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZP_R3J8hm-fx for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:26:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E507607DE
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:26:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 70CA582AE0; Thu, 30 Dec 2021 14:20:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:26:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0979a9e13c45afa20d60122747409cf82164147c
X-Git-Newrev: 5521539eb124c0550bf012dd24074ce039da83e6
X-Patchwork-Hint: ignore
Message-Id: <20211230142046.70CA582AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add support for bundling TEE
 in ELF format into U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=5521539eb124c0550bf012dd24074ce039da83e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some U-Boot platforms (e.g. rockchip) can bundle OPTEE's tee.elf
into the U-Boot image. This patch brings the necessary changes to
enable this feature.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 9 +++++++++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a58f7b7572..bffb7cfb19 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -229,6 +229,15 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
 
 endchoice
 
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
+	bool "U-Boot needs OPTEE TEE"
+	depends on BR2_TARGET_OPTEE_OS_CORE
+	help
+	  Some platforms (such as Rockchip) encapsulate the TEE inside
+	  U-Boot. This option makes sure optee-os gets built prior to
+	  U-Boot, and that the TEE variable pointing to OPTEE's
+	  tee.elf, is passed during the Buildroot build.
+
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c89216fac4..574fc7089a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -175,6 +175,11 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
+UBOOT_DEPENDENCIES += optee-os
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
