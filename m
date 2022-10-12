Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9680C4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 18:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10ABA60B2E;
	Wed, 12 Oct 2022 18:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10ABA60B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgIynS1OEuhZ; Wed, 12 Oct 2022 18:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2307860A79;
	Wed, 12 Oct 2022 18:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2307860A79
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA3391BF5A8
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 18:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A212E8141F
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 18:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A212E8141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACeF4yH4x5mO for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 18:39:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8860E81391
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8860E81391
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 18:39:12 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y80so4416946iof.3
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 11:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPfNa9/99UN9tV1q2j/gEudEeQ2H5/qoisxrGSII+Po=;
 b=m9i+Yhqc32D4tzy/3YOUlteAf/Qi5sfTwQNIKFrd88qaZZrUQ2yU7QKzLrLhFJ5kdN
 yMjKyjHI5rkh4MFF3BCblmLm2D33iv6yUEj+9lNAXpDFezMp8Yjn+WFxEl2AWC0kTotV
 eCjZaB2c1ULcFpsc/G/UpNDLYGCODB/zQ0Gm0A/t53FA9CC9enOXbINefDWMMH1f95Zr
 3iAnpsRbpxcu/Ca+BpihlBk71ZP0SzFeJP4lFu1KwtY1qFoh1Iyq741NCG08oNdNvIXc
 rimKbMwJELpDATDgeVYZNIQ2vJBwJdi1lA3sA8CJeZJS7Q8tZNJox/XL4oqxZwjUxfuK
 +60g==
X-Gm-Message-State: ACrzQf0RmVqJ9J2a3TlKr3SEfVUALV+RgQuOLXPRRsJ97JAMkCIvMBI1
 qKrzRO47gBp1eQyBlbEIsfalSdpp2r4upQ==
X-Google-Smtp-Source: AMsMyM6swltiNPCM0Znc0gGrOZaQQduadMWvVtr5PJfG18eLwkc2FXJ8c6Ev1mkOrlXYR6dLy3fQRg==
X-Received: by 2002:a05:6638:3452:b0:363:69f8:549f with SMTP id
 q18-20020a056638345200b0036369f8549fmr17027422jav.190.1665599951188; 
 Wed, 12 Oct 2022 11:39:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056602178400b006bc48537658sm3197739iox.0.2022.10.12.11.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:39:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 12:39:07 -0600
Message-Id: <20221012183907.1651460-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wPfNa9/99UN9tV1q2j/gEudEeQ2H5/qoisxrGSII+Po=;
 b=qVWHXE7Qot3Cee3Hbe5BR5HYEgWDcrgh3qfa0mClOL+IO5jB0lI8v6i7JZCsuwIY0h
 XToNNILugAZKDX1ZpmOIhPhGZMq3EDpTmDLexvsfzM+n4R6ICbKo0N1CLEcMrsWsZT1M
 eBlhyg8s5Q0geFeaorsGcInUMzhiovUqoWANdRLey0h3K4uB2D44qKZHHdK9IIJErw7U
 EO/l/DWE7QvszjR63Qh5lcxiEUiGM+47lz5Zfj7oS6CI7bR5GyUSg7UEjJwpklJ4cYSm
 GNzTS3xTGP2O4BPWuAuN7HH8Q/ECx2HYLFHSg4yAbT7OgZrTL5OG1ZDzFHhke3Gs8hE0
 s+jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qVWHXE7Q
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump to version
 20221012
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update brcmfmac4356-sdio.vamrs,rock960.txt filename to
brcmfmac4356-sdio.AP6356S.txt due to rename:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/brcm?id=4ffcf980a535c1f26aa994ecf64a1b9d1ed6216e

Update WHENCE file hash due to date/firmware file updates.

Add missing LICENSE.ice_enhanced and LICENCE.moxa hashes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 6 ++++--
 package/linux-firmware/linux-firmware.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 382e9cb2ba..d81223e311 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182  linux-firmware-20220310.tar.xz
+sha256  e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5  linux-firmware-20221012.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -14,9 +14,11 @@ sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENC
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
 sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
+sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
+sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
 sha256  2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c  LICENCE.qat_firmware
 sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
 sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
@@ -33,6 +35,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9  WHENCE
+sha256  6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d68733841  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 64d096df14..ea97166d93 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20220310
+LINUX_FIRMWARE_VERSION = 20221012
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -643,7 +643,7 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac4373.bin \
 	brcm/brcmfmac4330-sdio.Prowise-PT301.txt \
 	brcm/brcmfmac4356-pcie.gpd-win-pocket.txt \
-	brcm/brcmfmac4356-sdio.vamrs,rock960.txt
+	brcm/brcmfmac4356-sdio.AP6356S.txt
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
