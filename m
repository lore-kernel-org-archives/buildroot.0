Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4EAC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 15:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004E381396;
	Fri, 17 Jan 2025 15:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts59iltQOgtM; Fri, 17 Jan 2025 15:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE32082EBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE32082EBA;
	Fri, 17 Jan 2025 15:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A071469
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC8082EBA
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqSG9KlP6xrt for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 15:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BD1E81396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BD1E81396
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BD1E81396
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:53:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 44747C09B7
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:38:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B6FA60005;
 Fri, 17 Jan 2025 15:38:51 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Jens Kleintje <scooby22@web.de>
Date: Fri, 17 Jan 2025 15:38:49 +0000
Message-Id: <20250117153849.3234827-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737128331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CQDpqtlENcPFM8p9xCgifBtI5dogoZzQ948Ur7BE0kg=;
 b=M07Nsv1rIe33DzP+Z32Lnds1HFAfLupchFnq8FC3VDsPQn6t9zzWWC8Hgv1JcMZxYcX+pV
 i7wTluLbXeUNVv3j3F0+hnlR9kHIfq31GYLhcpMCehrDn153KBstfOr5qAgmKaS2/LMpeS
 91Dm6gXXgHxtDCmY5sHq62cx3GK4iL6Aq2tnmPclCvvijMq98EJDc3uwEN3lSbzuC2eqr7
 cklbM3LqJ5aUunC26sOUEKtA6MuTjgef+2v6k9IQ0Co6+VvcZ1P4usucTZIYETQinUFNTh
 crcIKcgX/FuemL3RvvMBawClXFJ6E+y3Qf2oMLOlz2/vdI4oX28LwyNudBOCfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M07Nsv1r
Subject: [Buildroot] [PATCH] package/gcnano-binaries: bump version to 6.4.19
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the last v6.6-stm32mp-r1 kernel from the
STMicroelectronics BSP.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index d3c64d44a3..a63bd81869 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c7454ac44c9e3ead20a978a5c009e8489fa90ce5cf291be31016a7f497bea26  gcnano-binaries-bbaae49a0e4859ed53f898a250269c8a237261bc.tar.gz
+sha256  cdfc314e4a7fc4ec3e5c98067858868bc74a08f6d3ddb9308b05ee43468ffc7f  gcnano-binaries-359d5007ef19575f6b8ca3071cf90d3848778ae7.tar.gz
 sha256  29c78804b097b5cfee0e802bef9f60348a635640eadd8a91b7ce82ddf17fbf5a  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 03912ea585..85009eb0e8 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.15
+GCNANO_BINARIES_LIB_VERSION = 6.4.19
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
 
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
-GCNANO_BINARIES_VERSION = bbaae49a0e4859ed53f898a250269c8a237261bc
+GCNANO_BINARIES_VERSION = 359d5007ef19575f6b8ca3071cf90d3848778ae7
+GCNANO_BINARIES_USERLAND_DATE_VERSION = 20240911
 ifeq ($(BR2_arm),y)
-GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-20240206
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-$(GCNANO_BINARIES_USERLAND_DATE_VERSION)
 GCNANO_BINARIES_ARCH_TYPE = arm
 GCNANO_BINARIES_SOC_PLATFORM = st-mp1
 else
-GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-20240517
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-$(GCNANO_BINARIES_USERLAND_DATE_VERSION)
 GCNANO_BINARIES_ARCH_TYPE = arm64
 GCNANO_BINARIES_SOC_PLATFORM = st-mp2
 endif
@@ -68,7 +69,7 @@ define GCNANO_BINARIES_INSTALL
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
 	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|23.0.3|" $$file > $$file.temp ; \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|24.0.5|" $$file > $$file.temp ; \
 		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
 	done
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
