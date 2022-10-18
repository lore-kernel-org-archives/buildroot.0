Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBF2C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 08:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503958305C;
	Tue, 18 Oct 2022 08:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503958305C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B3y_kJvyzpVo; Tue, 18 Oct 2022 08:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8508E8302F;
	Tue, 18 Oct 2022 08:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8508E8302F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1501BF34E
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A68418A2
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A68418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyk2nfy68QzL for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 08:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B3A41886
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B3A41886
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 08:07:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r14so19324255edc.7
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 01:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9n3deVq3CJcOfKTMvr4KgCgXy8QoXMbLO6uGHPrRV94=;
 b=lX8ULXlVPTqWOUbRIWjDAa/7plB51b4MjmOJFL2hThXToEBdFfS7PSRxkXlkBJj+9w
 NE3x/4NtYvc08mqDH5dmgCu9t4jorE64hNZK1zfF78zdt7XGvqw/BawR8vfw+dtJpiTD
 x9mY2rGcZLhcNka57Bj0Nc+iq5CI/qOkGot6Po5QtKw38MxDRQcoC7arxBtUTP9SsGhn
 NXCN/oWpSkxjdKD/GuOq0YzMSgoXcdTcU4YW7t1axJ0VhL34uqYz6IhEqtZP4TVg+09y
 AB9mlNa4BHpsGXpMae/BHKhkPMXd0fLCyw0W3WVkOLYEJB7Afu1GR6/nMxsRrp19SaeQ
 pR+Q==
X-Gm-Message-State: ACrzQf14xJ2cQHYyhjB1AmZ+W6t2DwX2JVHdMpCa4sP+c7WvWyB/5FvQ
 ZuJdx/UZlEo+Bi8bhplBhrWqfudN0L0=
X-Google-Smtp-Source: AMsMyM58dxKLW19YkBwIaiuG3O7wWVZxrXmbb4pzgPqOzt8xhNTAa8FUChcHb0X2ImfutwGBBPGY+A==
X-Received: by 2002:a05:6402:540d:b0:450:bda7:f76e with SMTP id
 ev13-20020a056402540d00b00450bda7f76emr1505012edb.249.1666080433851; 
 Tue, 18 Oct 2022 01:07:13 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 sd42-20020a1709076e2a00b00722e50dab2csm7158174ejc.109.2022.10.18.01.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:07:12 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 10:06:53 +0200
Message-Id: <20221018080653.1586970-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9n3deVq3CJcOfKTMvr4KgCgXy8QoXMbLO6uGHPrRV94=;
 b=CTINzvFEIZd71LmKarcxbBvNV547+JLmG2lQtCPmGKpSbcuafI1IGjOstqlmXbdnMZ
 ByHJ4fCWX1n/2FKCamtOu1RZr8N5AZfPFB9NyfANPZxnSzVZJaiBXC1speKZjU7hXZKs
 gUr2HrO/BCLCjFg7NXooN1ArSeQTvKimlvfULtZCBfRtrXCkcrVaoeQQ/QEWZ/WV2SGs
 H84tRASZ2D52EGAXCke3HxzzREpRpmd1dKViO7v/Ps14lqzJC12fzfPxX2MsoJ376U0K
 Tt0aCvw0WuXIT+6eShuZowkbHBQykiLSpsayms/Z5vfYSNQjlnBbmayF/jYIUcswtbTM
 l17A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CTINzvFE
Subject: [Buildroot] [PATCH 1/2] configs/kontron_smarc_sal28: use U-Boot
 2022.10
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
Cc: Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
since this are dependencies for building mkeficapsule u-boot tool.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_smarc_sal28_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 877903a1fe..25846c8cbd 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -22,11 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.rom"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
