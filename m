Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76573C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F22608B7;
	Wed,  3 Aug 2022 19:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F22608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qlv1AvXIX2HI; Wed,  3 Aug 2022 19:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA4060767;
	Wed,  3 Aug 2022 19:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA4060767
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 148B91BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40A681298
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40A681298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEg0Bpx9BYCb for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:47:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D73A812EC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D73A812EC
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 19:47:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o22so7297382edc.10
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 12:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q14SDWZf6Uxt96Uialjh4eJY8y1ueh2p4IHVrN16nQg=;
 b=HmqCpP2nVzlGYY3Idypge3AAxO36xRMDYR+tXApdJtonGAp6OpgaOgjiGkuo+9J1GF
 ZSSFqeswSt+7taarynu68cqFXKE3C2v6q/7+MSzr87LOg7MT0vM03fGB2X3u/rY41zZd
 0ssVmzhK5MeFxm0Xq20qbDGXC3bHezIeY3SEPhkwfCQiJRN9VlCrJShG0dN6HXfLNC/O
 SPsv5GTwlDwOQ0amSNK2Ct0gQBtPqgflmEZIlSDu1+l14CvAMiUdsfwsIr6w6mA4Pfc0
 UH8yRZ21b/nhRVMjhRNviTgMUI4IvB/KNJCdtNA3DpWj5wv0KN5LPJ7eVbdx4RJ2qdcM
 nhpQ==
X-Gm-Message-State: ACgBeo0BJjtnLb7Se2x6yZp5PCs+Zea4GkTbjGslluMQyR6TpCsuwcl7
 QtLUa9BKL+rvcNTuTOe6ZM7xSUw/PRo=
X-Google-Smtp-Source: AA6agR6GrLzfD2qeJFS4+/NjeGg6oMEFFnazp/6PdEq+bob7F0bLT+VXgWuue7zBUo4sz+oDOGG1tA==
X-Received: by 2002:a05:6402:5252:b0:43e:14ec:46f with SMTP id
 t18-20020a056402525200b0043e14ec046fmr7589462edd.398.1659556043478; 
 Wed, 03 Aug 2022 12:47:23 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090631ce00b006f3ef214daesm7563490ejf.20.2022.08.03.12.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 12:47:23 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 21:46:13 +0200
Message-Id: <20220803194615.9209-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803194615.9209-1-francois.perrad@gadz.org>
References: <20220803194615.9209-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q14SDWZf6Uxt96Uialjh4eJY8y1ueh2p4IHVrN16nQg=;
 b=YDXQAn838icoCQlrRmm5sX0lWAnv/0vLVGnbR2N3X4yroVp11xvl7SjtYl/sc8OL/Z
 mYAAN4MuJ1+zldmYyEbru5NQfbMyJjCeVt41DMv/dUlZWdbZob52EY7ImZErlNhW51Zf
 gr1SEbBCQ/nVKT6q2nISaZttk+CLeNQlgSThytVVngcNc4EEHYv52lArnZwjfwK3iy1q
 zlxbip31UWxZ1TKNCayhE1k+MZb54OF+fN57UACNVClfsyakRst0wfTIdwgRW5cSmyYe
 bxqea+cq3bTVBtZl3WyRId3mU9IHwnOiJ6+iVfiLxHx9XlwVyS6SUyRNVvZK+tlPskBX
 v/OA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YDXQAn83
Subject: [Buildroot] [PATCH v3 1/3] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW that allows
TF-A to encapsulate a pre-loader RCW (Reset Configuration Word) file
into BL2.

Upcoming NXP QorIQ family board needs this option.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 boot/arm-trusted-firmware/Config.in               | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10..0f91953bf 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -85,6 +85,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	  platforms were ATF encapsulates the second stage bootloader
 	  (such as U-Boot).
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
+	bool "Include RCW"
+	select BR2_PACKAGE_HOST_QORIQ_RCW
+	help
+	  Include the RCW in BL2.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	bool "Build BL31 image"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 35a95a7ec..eb9b656fe 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -133,6 +133,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
 endef
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-rcw
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
