Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8307FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFF240829;
	Fri,  2 Jan 2026 17:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id be5uyZrVMWnC; Fri,  2 Jan 2026 17:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40184049C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767376427;
	bh=bFReXTW3ULvR8EZcM9iLXGLweUy5sJEQbTmN/BHiqCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OE8fu1dhS5D36QbrMr+H6Rzu9PYoBiP3H61ZdaU307nZftiaQcb1hUI90yKyrtumm
	 PByw8hqxlun/X1Okat89GslpI6BoQskAy88zz4hvPWtyUraX4cG9lIBHM+Eu4MJOHO
	 MvDAlhFR67wz2JOJmpOwxsG7amzi5gb7SJftCB7gOTksXQmmIehsOZrdMfJexNOMTI
	 vdWpCJhSSshLEuaaaPGXKffztl6yPrJECktMe1Kfe6HKkXNP+gySAsNE1XLNJKjdK6
	 EoBqCCm2jXnHD1QqQh5mbn3ca0osC+gjhV73mve9fy4VvbJWpzxo+ax0hvGfEO5I1q
	 nzuUMec7x2XoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F40184049C;
	Fri,  2 Jan 2026 17:53:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A442D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834DA403E2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmJ4u47UPmPj for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21A64035B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D21A64035B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:53:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2C3884A80; Fri,  2 Jan 2026 17:53:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:51:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3140b9a171ddea5f2a290e37959cf4704ffed41e
X-Git-Newrev: 2ef9fd947ea7a672cf95ab11eea5046e960cddd7
X-Patchwork-Hint: ignore
Message-Id: <20260102175343.C2C3884A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add ADSP LDR binary format
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ef9fd947ea7a672cf95ab11eea5046e960cddd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in           | 8 ++++++++
 boot/uboot/uboot.mk            | 5 +++++
 package/adsp-ldr/adsp-ldr.hash | 2 +-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d40e1e95e0..5efe6d498b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -479,6 +479,14 @@ config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
 	  file for flashing by combining the spl/boot.bin and
 	  u-boot.itb files into a unified binary.
 
+config BR2_TARGET_UBOOT_FORMAT_ADSP_LDR
+	bool "u-boot.ldr"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Boot stream format for Analog Devices, Inc. ADSP-SCxxx
+	  processors including 32-bit SC589, SC592, and SC594, as
+	  well as 64-bit SC596 and SC598
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7bd0937df2..b5c04215a4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -257,6 +257,11 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TEE_FILENAME))
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
+UBOOT_BINS += u-boot.ldr
+UBOOT_DEPENDENCIES += host-adsp-ldr
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
diff --git a/package/adsp-ldr/adsp-ldr.hash b/package/adsp-ldr/adsp-ldr.hash
index 459b48cf09..d708db3d38 100644
--- a/package/adsp-ldr/adsp-ldr.hash
+++ b/package/adsp-ldr/adsp-ldr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a1b1b5700b75e47bae7f656cd61f8c635f5d3c82a90e20dfe594e0a3315e4eef  LICENSE
 sha256  0f240aa5aad9300d8f4bc7ffd9cc1c53e01dfd6120de4f20f60d4d4176d99c10  adsp-ldr-v1.0.1.tar.xz
+sha256  c965604b194588b5799b75fcc11cc39be09220e580ae96e2a72848f042de56a7  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
