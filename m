Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80528C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 537D282349;
	Tue,  6 Feb 2024 12:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6ZP1RSQ9UW3; Tue,  6 Feb 2024 12:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C92508299E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92508299E;
	Tue,  6 Feb 2024 12:59:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054601BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD1D411A2
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD1D411A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Du2jf7dw9Dk9 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:58:58 +0000 (UTC)
Received: from mail2.eaton.com (mail2.eaton.com [192.104.67.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8813A4044A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8813A4044A
Received: from mail2.eaton.com (simtcimsva02.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A98C211A225
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 07:58:56 -0500 (EST)
Received: from mail2.eaton.com (simtcimsva02.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93CA311A20F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 07:58:56 -0500 (EST)
Received: from USLTCSPGWY01.napa.ad.etn.com (USLTCSPGWY01.napa.ad.etn.com
 [151.110.126.202]) by mail2.eaton.com (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 07:58:56 -0500 (EST)
Received: from USSTCSPGWY03.napa.ad.etn.com (151.110.126.247) by
 USLTCSPGWY01.napa.ad.etn.com (151.110.126.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 6 Feb 2024 07:58:56 -0500
Received: from localhost (151.110.234.152) by USSTCSPGWY03.napa.ad.etn.com
 (151.110.126.205) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 6 Feb 2024 07:58:55 -0500
To: <buildroot@buildroot.org>
Date: Tue, 6 Feb 2024 12:58:33 +0000
Message-ID: <20240206125833.10103-1-laurentbadel@eaton.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eaton.com; 
 s=eaton-s2020-01; t=1707224337;
 bh=sjYDk1VHy5NODTHXf4yLYFxR3SQ2d3QBSVkloI1FWlY=; h=From:To:Date;
 b=SO6KioAOCCAYRyN6bcVR3/4P00pLrgbtftSRlCLByrWQcROq/5SWEBzKHhAE2T6yl
 kCM6V6KplS5FlybWNhNlKfJW4qkZqGOobST3DoAeUrep+BUeD9+TJ8LXGyryQ6hLnj
 3ITvxxqUQpUZtNU6cJfQhIT6aQdLfyFp/cmBv56R3etR42TlqIdbZCgM7NslP+u2sQ
 4+a6k6V0ItvNZ5Tk7bbcnCj3zICFWd/BpkFEte7HDZ0afbUPL+lBkjwvAJ923pPtBi
 SMgnKvVtnAI67lz5o7KtELgZcgpTH3kF7eh0jhPw+aM/fxObw6vUMfk21gm7uUcTHR
 tyv+3sMX5XvCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=eaton.com header.i=@eaton.com
 header.a=rsa-sha256 header.s=eaton-s2020-01 header.b=SO6KioAO
Subject: [Buildroot] [PATCH V2] boot/mxs-bootlets: add support for zImage
 with appended DTB
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
From: Laurent Badel via buildroot <buildroot@buildroot.org>
Reply-To: Laurent Badel <laurentbadel@eaton.com>
Cc: Laurent Badel <laurentbadel@eaton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building a zImage with appended DTBs, buildroot creates copies of
the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
take this into consideration and passes only the original zImage
(without DTB appended) to elftosb to generate the SB file. Thus,
make sure that the correct zImage files are used in this process.

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 36 +++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index adc22767..efcee16a 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -38,20 +38,21 @@ endif
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
 MXS_BOOTLETS_LICENSE = GPL-2.0+
 
+MXS_BOOTLETS_BOOTSTREAM_EXTS = .sb
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
 MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX)
 
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
 MXS_BOOTLETS_DEPENDENCIES += linux
 MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX)
 
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
 MXS_BOOTLETS_DEPENDENCIES += uboot
 MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX)
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
@@ -65,10 +66,18 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
 		$(MAKE1) -C $(@D) linux_prep
 endef
+
 define MXS_BOOTLETS_SED_LINUX
 	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
+	
+define MXS_BOOTLETS_SED_ZIMAGE
+	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage$(1)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+endef
+
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB), y)
+	MXS_BOOTLETS_BOOTSTREAM_EXTS = $(foreach dts_name,$(LINUX_DTS_NAME),.$(strip $(dts_name)).sb)
+endif
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
@@ -83,7 +92,13 @@ endef
 
 MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
 
-define MXS_BOOTLETS_BUILD_CMDS
+define MXS_BOOTLETS_ELFTOSB_CMD
+	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+	-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
+	-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASENAME)$(1)
+endef
+
+define MXS_BOOTLETS_BUILD_CMDS	
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
 		$(MAKE1) -C $(@D) power_prep
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -94,13 +109,16 @@ define MXS_BOOTLETS_BUILD_CMDS
 	$(MXS_BOOTLETS_SED_BAREBOX)
 	$(MXS_BOOTLETS_SED_LINUX)
 	$(MXS_BOOTLETS_SED_UBOOT)
-	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
-		-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
-		-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
+	$(foreach ext, $(MXS_BOOTLETS_BOOTSTREAM_EXTS),
+		$(call MXS_BOOTLETS_SED_ZIMAGE,$(subst .sb,,$(ext)))
+		$(call MXS_BOOTLETS_ELFTOSB_CMD,$(ext))
+	)
 endef
 
 define MXS_BOOTLETS_INSTALL_TARGET_CMDS
-	cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
+	$(foreach ext, $(MXS_BOOTLETS_BOOTSTREAM_EXTS),
+		cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASENAME)$(ext) $(BINARIES_DIR)/
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
