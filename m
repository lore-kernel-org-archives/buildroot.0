Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D748C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6C24F398;
	Wed, 19 Feb 2025 08:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MP6aPrZBlFqB; Wed, 19 Feb 2025 08:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD894503CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD894503CE;
	Wed, 19 Feb 2025 08:51:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AFBCC8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AFE2606A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVls_qnhSlD6 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71B1C60071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B1C60071
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71B1C60071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so7066770f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955049; x=1740559849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F0V++Z3CZx6eWOxWHCsKALrjQJu0HPv2di2XNNxLyCE=;
 b=FtMszALglSJiVOGjRH3zwtWRA/DDT5QmL3edntIldPOme/+SwvOjGRBFJ6I8OniXlI
 /EqzHsb0MrPz3AvYElgwSmxoGXKz/X7/UuCcsSqntLAB+YVr7poULCadrDRww9l+b0Au
 TnN0tTRNcIQgglj7+bpAVKRslGYLAw0BMH7+Rc3DdeWTKqnkzXEWOfigrybAfC7M7lnU
 JwQHa1HprpRv7raVUbo3VW0RGpr2fKOFOKM6ypCIXHI8AfD08syBDsWmhhIVI9nGiJud
 3KHsJJwq8C+W6q2sHja7qUtjjd4qxGsKe1Q35c23o0QrOR1AMUqGveP+s+AryISUbuvC
 +MTg==
X-Gm-Message-State: AOJu0Yz/jIHndCeKLuXV2pAp0nRCVXjXZR2MlbnpVHzVLTRWf0g6tPNS
 GyQySXUnUBJu8Y2P68kchr/L+Lj225+/tGzo+vvR9h3Kn0s0I4SwG9BJNA==
X-Gm-Gg: ASbGnctGAzPHhVnhnvmC13XrBC9dyz8fv0/GUCuf6Z1CJFSGGL0EIaz9O0uhE0kDEPR
 +7qngTwqSwMVLVRltWM/CUX0P4npNH6uJb3yFdJIYvH7XSffZKq+jI8ArJkaHzAfieHNyHDFhgo
 HKEci/GJxuvxBniLpHYvZsVUvsyLxcSN1b42tjgYXD5k153MfAYZ/xgHSta46dwK/EtYlzQ5+H0
 cTj28so/M563pAdG5+iLsuisY0hAfxNZXGB1vePclUmgEUp1sfkMwFJjrnGsp1iKGUe5PUuzv+8
 1XgWBN0DONmy7Sg6sDhzHUKXMA==
X-Google-Smtp-Source: AGHT+IHL5u/8hvFEayCBFi6P1kpQ3syDLQQ2o3GcJ028uW54xF+JXC4Xs6z10WMZ1RYLo7S6EKWaPw==
X-Received: by 2002:a05:6000:2c1:b0:38f:474f:f3f3 with SMTP id
 ffacd0b85a97d-38f474ff5bdmr11251776f8f.13.1739955049500; 
 Wed, 19 Feb 2025 00:50:49 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:49 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:25 +0100
Message-ID: <bb303413aac71d331e9afcf3c1649f193ef14a28.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955049; x=1740559849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0V++Z3CZx6eWOxWHCsKALrjQJu0HPv2di2XNNxLyCE=;
 b=NPU8gT0MoOtw0sS2oCY+YnK0p7FRqWNutF3SuVIDqKwDiljEevT7eNjEkuS583rGDV
 fzI7najstZk3phOtQiYnK1lesGNDosvE7c37fn6/Mm6OjH5+2eZHwD/xtquZ5WqVRCNA
 sB/ry+4K3LXzYuslpc41e38FBO0ZuWC3Bsk6ziMcKabc44ciXEPzw6Z4TyzdTwszAefz
 I8zUhqV5nnSU0UVYEs147AKKBwmIcpk0yW+p3caWfiIMChBFM1MLfLnv/5oczIhNNk4+
 N8x2zWnDxG3RJEp6eSnvfVM4xBRyrB13p3+4AYyL4tGb0hUXXKQw3M0zQ76eBdosMR3t
 EYog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NPU8gT0M
Subject: [Buildroot] [PATCH 10/27] package/boost: prepare for a configurable
 host variant
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though we do not envision a host boost with nothing disabled
(i.e. with everything enabled), we still model the _WITHOUT_FLAGS
variable after the similar variable for the target variant.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 1dcc4a4b3a..6af76e1302 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -35,10 +35,13 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
 BOOST_DEPENDENCIES += python3
 endif
 
+HOST_BOOST_FLAGS = \
+	--without-icu \
+	--with-toolset=gcc
+
 # keep host variant as minimal as possible
 # regex & system are needed by host-riscv-isa-sim
-HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),\
+HOST_BOOST_WITHOUT_FLAGS = \
 	atomic \
 	chrono \
 	container \
@@ -68,8 +71,10 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	timer \
 	type_erasure \
 	url \
-	wave\
-	)
+	wave
+
+HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED = $(subst $(space),$(comma),$(strip $(HOST_BOOST_WITHOUT_FLAGS)))
+HOST_BOOST_FLAGS += $(if $(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
