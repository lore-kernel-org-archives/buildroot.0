Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB7D41D74
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 10:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532E580839;
	Mon, 15 Dec 2025 10:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx3KSo9YrK5s; Mon, 15 Dec 2025 10:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43770810EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765795509;
	bh=SGSPObKPKUYtYYh0tprM6hFTzSBl3HXOAde948DS2rY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kW+u845rJdxAkfWr8Jg76hOG7hh0BmDzuTCdCIbkN5oupJ9n/6vKPsMmwtX4rtzO0
	 a7LulGAEikSkLUJRi1B/KTFg6t/Thz51kHU72pbdqlqc86RRxPLCqaR5T61Q/j2YfD
	 Y5WMN70ucCeH5PPD4u7Uc3vNFDTSvL4hoQrZ7pvUc2GIhNuxvdX8cngfsBuTN2k0QD
	 HiXXLPtLFYadI3MpFzr9K9gekAmKiIEDHmV9fxo1st1xrfsyy24sFwLmrY1bkOgQQb
	 R2wBEnXGvX56PnNRbYsVH/klSwNPPZ8l0X2bNQl/2UPQQwpWXN/tiozIV/yjaSjJtM
	 9YQJHgxgLVI2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43770810EE;
	Mon, 15 Dec 2025 10:45:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F41B4118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 10:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5A1440782
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 10:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe3qTPtsXcLM for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 10:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF2B940750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF2B940750
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF2B940750
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 10:45:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-649e28dccadso451866a12.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 02:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765795504; x=1766400304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zc2HQ/4DA40WCbTzMzWtgowEb+VFrNC042Oto3Ymb/4=;
 b=YLrg/2Sm4hTbX4rG9JZh22psy+OBIy+OzlElkpPxPj0J6429vN4acFjUsI4R1bSe28
 2R0JFXf02PIR9mly/TVUf90cxuB9zs11iVRSykUlWBeV3uAMPlrJOUNaC/Uj0ZwMlMI3
 RZUiBBmUuuxDc49Wb4Q8eUHuS2M2UU0T4wK/B6b+ko0yPlPVpJCIZebGAEIH761t5sjL
 W/uq8BbbC/p11+u2ADGL7wEFVqE2AIFc4YYVK6NJirgnvOVTL8gCZtmmfggdHf4EXOdz
 /MbTlTNcRUPihiKOfmiYVH8wcrl9kPPyPhpH+u7lwBEgz8ea7xczmzOl8PziJEIPYMWf
 PIog==
X-Gm-Message-State: AOJu0YwJ1C4mtqr74y8tFCB8PbP7ed9NWdf1PDB23iXUmpgVgh4BQQGi
 O0t9/pfHkdYt2B8+8UZYGxYfsZ+tmha+WVRaKf2DPnv8uc6dol+92nHwfDM2Mw==
X-Gm-Gg: AY/fxX75r1wa5ARkCnJJvBkD087ovnsDU2RSykfMv5JajuhiYaXbkxMMFNuqUDCcF4t
 5XCnq8EZIE6g5wXFpV0U1xJVSC/fDAxW7yXKTaRLXqt2WPy5Xb+65BdsHNuRNPywZ90Hl8rzaSa
 5UIuH84ro2x3PR/xCfbutf9E6xd6F6JDsl797LssdyvLC/KH8WRPQGtaAQQXZKvH27XWSWS6MP7
 wBuoJaNNpAGUM5yRYDL68t+GmTIMDUg0qOlzf2jWR4D4jyobwjuwtOb4kxQW7OPotjBbNEttbRW
 4mH/WSXrR6aeDZPynUfYcM5c8qL+18gwUdTw4zdGpgsAZWEqaR9DQVSL/+5bGi30wnXY/lrfOkU
 fpSCIov4r9bif2qOnivARNDrCsIqcJenchwhoV2fJ9KSTj2LWXNuw8cAESmw3l0fA08Jf+R/6Bg
 t7Ua2fY7+VocY3QGMOW/LnKyBhnEDsU5L9dLQuYaNkNvocTYnCcMyF+vHaI5TzzCt9mag=
X-Google-Smtp-Source: AGHT+IE1NbzTJLflhlLgnKrOK6IiqAvcCJ272nFrj4ANqcV6bA2PvYN4rNgbDslPwdjB0NaySyUTJg==
X-Received: by 2002:a05:6402:35cd:b0:643:1659:7584 with SMTP id
 4fb4d7f45d1cf-6499b349440mr9483012a12.33.1765795503503; 
 Mon, 15 Dec 2025 02:45:03 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm12971492a12.19.2025.12.15.02.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 02:45:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 11:44:52 +0100
Message-Id: <20251215104452.480722-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1765795504; x=1766400304; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zc2HQ/4DA40WCbTzMzWtgowEb+VFrNC042Oto3Ymb/4=;
 b=TFZJsGNJgKtg5Iff15N9/H04kk001ZhdKvHn+lVdpYeko9xU1z3Eq+NzTnXe9IWwi2
 PRgun873HG853nU6xynMf2eqYomSc6U+XBGA15I7ZzRp31Cu0lAkcrkjiFTCHxIaS2J1
 AJe59+xtM+0/ce4Q2z2TsVfL9u8J35J2BwjzCOJp8xqAnhhznTVfuxtyklrrlMSdRZCj
 b4OQft4WIRweJeOcSg63fTuJTngFupQxiWjBBc4VvTG2nCcU56eKtaOlP8GHkplq2wQ8
 YqAFb2KLawtqGoF0dR7ZsvixT4olx63/5xRUf8TTi0AM5oZRxOnCJTOtxkKXUyb/B9sT
 px5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TFZJsGNJ
Subject: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.2
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: yann.morin@orange.com, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 fl@n621.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.2

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libconfig/libconfig.hash | 2 +-
 package/libconfig/libconfig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 2b10dfc125..22f8473fc4 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
+sha256  e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee  libconfig-1.8.2.tar.gz
 sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 3fa2be3563..8bd494081c 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.8.1
+LIBCONFIG_VERSION = 1.8.2
 LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
