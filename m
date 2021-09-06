Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A27CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:43:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386506069E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 386506069E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76A0403EC;
	Mon,  6 Sep 2021 09:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G54K5g_IVH8P; Mon,  6 Sep 2021 09:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F8D8403DE;
	Mon,  6 Sep 2021 09:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 918311BF3BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 802F3607A7
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AowP1PqI5Rgk for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 09:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD4166065D
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 09:42:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso4476654wms.3
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7zSeJVOgDgFCKqbRO+Q+f/8o36HRfXdLNE6nyz9i/A=;
 b=ExWLUPkkX654tSF8l1MTxsPveGBUnfDUglJ5GRN5/GAW/mZhVwa9BKuxDTTvs6CJCd
 ogRqytMkZ0jSYBuWziOe5wQ4vJ389T4sw3TfsgxLvFVdaPyeH4VR+H3KOosMRUo8OFzq
 5xtH6LvNfmrk6cRr/FEaOS5jpw/kJsMpeDIgVWh19ehUn3iJQJtTHZI9rfT4lCZMArq6
 kV60uMokmepioV2Tgbtadd8nxenZe7sxg4cflnAzCNt7slQDSUc6Mvazh7bd0AGjq/Gz
 JOirl+Gc0xh+pKvbWpzOXocefsYeeBR18nks5Svl6q29FEq0pXFcIDKD+U/HiEJqrlND
 sd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7zSeJVOgDgFCKqbRO+Q+f/8o36HRfXdLNE6nyz9i/A=;
 b=JadZMrljewppPqVdVKB+PzK9U5veu7Rcho7VaOA9Z0ZcUdT/Xo8an6Vri/quGIp05c
 yNoo9Xv6RxCHNMEmBgCG3sr7Rx1jpvPKkVabykPo5OyPaEKY5juJlmIiMyjt+qdWbnK2
 muOJjV3H/bD2pfYjFbsddY7XvMfg4myHxaNeYr4pQmMB9hpsR6i1w4mHWdNHOZliBwZ7
 CHFrhLqhK3hlQ2E14bcs7Th3r4pUEMkfCtWBqochaV7/DjyokCGVGJXpq3kgcCDX1rUj
 YdhbAm+vWa1mdZhvhFkr5USRZYHQ5IAB4154mIiAFdaJUxM4FWxfLgFwQkObG5TPiUsD
 wz/A==
X-Gm-Message-State: AOAM531Lo6/xRkvVNLrzUIdTeMKuodUmGRvRNttc9mIvHAJzfhz++wpN
 KgPWvmFkZooKk1SLJKIljViQZePrvlw=
X-Google-Smtp-Source: ABdhPJylOmVZPAwV8/zbFSffE5Ob2KkZTL15L7e5GhboisfW6wcKLkKozGGI2KRXSW//gGkXsx5iMg==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr10382717wmi.147.1630921363851; 
 Mon, 06 Sep 2021 02:42:43 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id l26sm6727653wmi.13.2021.09.06.02.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:42:43 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 11:42:16 +0200
Message-Id: <20210906094214.6142-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210906094214.6142-1-heiko.thiery@gmail.com>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] boot/uboot: copy ATF bl31 binary to uboot
 package dir
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
 Refik Tuzakli <tuzakli.refik@gmail.com>,
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
