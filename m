Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEFAC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 05:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C38EF819BC;
	Mon,  4 Jul 2022 05:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C38EF819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaGxR559F9zG; Mon,  4 Jul 2022 05:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD54D802CB;
	Mon,  4 Jul 2022 05:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD54D802CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2A401BF3C0
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DE35826C1
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE35826C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOrcLybzIrof for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 05:57:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA2AA82681
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA2AA82681
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:57:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id d2so14869655ejy.1
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 22:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdqkqTzSuzXcakmWvNHN2AXUSWpb7+siUkTz03XM6+E=;
 b=UX6EwAB15vKm4YlovCef6KldAWFT3SalnL0e1RSDLrlvbly+PlLOHURZicV0cxUfZQ
 lThmxMzkuN9pN604moI7Vh8/coviT/g7roO4hwAeQY4ScPEN1MqKt+9K/YdINsDEtOJn
 p9qJJ9NXeY7ze3j3uF5aqMoUAUxzUluKWQEiteS6LJ6vE0TTbKqK5AbHipbZWdgCObzA
 mhFLo9DQRZZxanVkT2Ly78DxSGsEY3L+4h1Rwyssi4loJ4Tj5IKda2A5RbENzVmOegil
 QHL4fzIGtSfLgblkry/SAWfwm7m7rhk5egboUaq8SeIQKyT3rkuvFVvpR35ePHiUbbZr
 UQ6w==
X-Gm-Message-State: AJIora8fVhnOluFAbkV947xMzf1yAfP7uwuKgCF2TAFGFj0tmfH5fDhr
 rZQqO/mn9MnbGWbSWi9CR3oLU4h810g=
X-Google-Smtp-Source: AGRyM1u9hBhKIbYU5ZsUFan9zx8xiJ36mOBKlO6gXkCnY0Wf5wF29rBa6C9VmA6SmzQYTHq02fnlsQ==
X-Received: by 2002:a17:907:a421:b0:726:ee5f:718a with SMTP id
 sg33-20020a170907a42100b00726ee5f718amr26746974ejc.368.1656914223662; 
 Sun, 03 Jul 2022 22:57:03 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906780600b006fef557bb7asm13729888ejm.80.2022.07.03.22.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:57:03 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 07:56:49 +0200
Message-Id: <20220704055649.2780-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704055649.2780-1-heiko.thiery@gmail.com>
References: <20220704055649.2780-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdqkqTzSuzXcakmWvNHN2AXUSWpb7+siUkTz03XM6+E=;
 b=mTUPV7KTr2tAyOl5oP9qGeehdWww42yJlJGQAmWMGb3Fmr6WJwzanDQJaUCBUF/GJF
 IViaSdweKgkmkq/ue6Tb/gSxlzKfhHvPsEybyfpud+oYakoTUxrOBYDUmNymmZwQx77b
 87VGyX0e2dd3i4T1b2mOtIrXolbHL+rMMX34ObZoWK631ycIYn8YQLcD5SHLrbEKvvdp
 BSGHJSoL99Jguejd3XUYs41HW7+HDpZHIPniZDTjdBUgnZZEL+NDDpnIlRWMbTEI/knU
 qvQbzhzIuVoYkAIcr3UG4A6++xzJFChVqOz8z2VuIT+6lRGuJ9DiIzcp1MDzlcjVgD5y
 g/4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mTUPV7KT
Subject: [Buildroot] [PATCH 2/4] package/sysrepo: bump version to 2.1.64
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 7232711b46..1db33df626 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1182b9d5e1178ad74b3bde6d282b86d17b60e206cd8a014895f74252492d96ab  sysrepo-2.1.42.tar.gz
+sha256  357a50851e4cc052b484b924ed0a5808c29159a7c9d48d9b1b8c42784c4b6917  sysrepo-2.1.64.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index c999bd0ea7..0ed27e3cfb 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.1.42
+SYSREPO_VERSION = 2.1.64
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
