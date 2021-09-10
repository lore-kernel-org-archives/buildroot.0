Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE48C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B304061026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B304061026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9062340754;
	Fri, 10 Sep 2021 14:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGaG-sw99mGb; Fri, 10 Sep 2021 14:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE05B40727;
	Fri, 10 Sep 2021 14:10:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 631711BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 534B560B42
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id No188-22YVFK for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:10:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABB7B60603
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:10:11 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ho42so4487316ejc.9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7zSeJVOgDgFCKqbRO+Q+f/8o36HRfXdLNE6nyz9i/A=;
 b=eC13BBFTC0X0yGcubU0sH/sbvLyZWTNoR7qgxTJNV0Iyl8zcYU/WWlH3QGfHYg6i4h
 2ZC+z+WKWP3NCR/AYYepw5RKjINBRNTiaZKzxzXhvuQeDAGXUoFJjr1ar2YP4fLfDLis
 pzIAAJKDxQM6DIaywIJ9a80D4gz4ozhsmTiJaer4Dpsd1nyq+FFVFH1uqF1Xz5aYOOKF
 hZBGMVFiuMKWZrjhnG0Q7iGSZdhjCYnixrAbLLeJ6Hl8scybDhloiGh1SS8oh43Iy2ze
 eIGxijWnOcF4+rBdPqiAZPfHqdzuVQEoNlym8kc708eYjExYDctGXnSRkPa2eCct9e8A
 cswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7zSeJVOgDgFCKqbRO+Q+f/8o36HRfXdLNE6nyz9i/A=;
 b=xJixWwemugujP01qoWAfRnUZ8BooR6S9pPApgk14OdNEla2csCs++CVuQlnhF5YBro
 D6j6BSdhUXP9/oQVosoXY7MAGL/55I7e5SZdUhm+YudfpKIuuFW2kF8HhzoZ7swz0LgN
 zBQVuRGodVgsElFfHwqzM3pn5oaeD9Lo59D6lvZuQ05anfSRT4bycU/jRrYPYuW9nljA
 bBBqJD26oDorclPGiv2lIovgj8G+KG2tBzb/X3HmzQC9vGVDPvp4F/wuNeFONirswYpA
 qXnrmbxrDZaqh3p2K7Y1z6KOSm0HN9HpFiYQ7GSMuIK3zYtJuDc1ulJrkWvwp1mAjcU2
 1m8w==
X-Gm-Message-State: AOAM531czwKETRnw2EOAq4gxlLLi1GK/uOJI7MEAURz52nlCpmk4p9gi
 NfDN0FSOf8sWcjQICtV20EibT6IP25M=
X-Google-Smtp-Source: ABdhPJwz6gKV6NiZyn04l34Ok5W9hSDDIF2mJQxXMvxIVupN9eghwE1ZJt8OJQHCswgpC4lwpfG3zw==
X-Received: by 2002:a17:906:a417:: with SMTP id
 l23mr9029642ejz.120.1631283009580; 
 Fri, 10 Sep 2021 07:10:09 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id c10sm2536754eje.37.2021.09.10.07.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:10:09 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 16:09:27 +0200
Message-Id: <20210910140925.28138-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210910140925.28138-1-heiko.thiery@gmail.com>
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] boot/uboot: copy ATF bl31 binary to
 uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

If the U-Boot image is to be built with binman and the ATF binary is
used, the file is expected in the toplevel directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/uboot.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4f3c9b7c3a..1a840d9cc1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -162,8 +162,16 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
+define UBOOT_COPY_ATF_FIRMWARE
+	cp $(BINARIES_DIR)/bl31.elf $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 else
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
+define UBOOT_COPY_ATF_FIRMWARE
+	cp $(BINARIES_DIR)/bl31.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
 endif
 endif
 
-- 
2.30.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
