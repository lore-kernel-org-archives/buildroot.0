Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB4DCEB2FA
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 18:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BE38405B;
	Sat, 15 Nov 2025 18:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1bKNZIhPLuP; Sat, 15 Nov 2025 18:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4418404A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D4418404A;
	Sat, 15 Nov 2025 18:21:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54528D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A4F64057D
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_zDHeVwrsjt for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78DB940546
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DB940546
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78DB940546
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso5189894a12.2
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763230883; x=1763835683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d32qkww0n7ckJ8TsU1057ef9Pnlj6L4ReG8ZjE5kJNg=;
 b=gY1hifpBNpkYN7ScgWcdmUSQYlAlr/oyr1FP44oqXvbtB1l2WNOlYKqR5LKaaCyNQP
 5yF8E0YnyISmOUXxFWGOFhfCZbuy8lZ835lbT5yVFghzTXeM8wKPfnyjiHFJdiMdRxu5
 WxD3hubvt4fAiJbDpZVBBlrqhbaNT5nIHx9NrG+ASKVX2dPUwxuI/wcdpZhwyos4uqS1
 nXxy27LAe2SX4wjeaUhyjVfiyqmK4cVVOXYzf2P4aDc1Q6U1HNeGOJryw4SrjR+rZ0Ap
 XvWCcOBfAZIuzxlOjI+z8shV3W/lAChaNpw2kzH7gSEmaRF2jqmANPFHzfhOI3W9Kmd5
 ajYw==
X-Gm-Message-State: AOJu0YwRXJCsivr2wkpEnQNBn4bLufK2KGHr/VLAGY6Kt/jp6H72uR9A
 hYLuq1f6jSEkAylkaIQZLtUWHmbPYbajQyC8Vpuuw95Sc1Mk85J/cCvYnno9fDraqgFfukG9qw9
 HiV2Q
X-Gm-Gg: ASbGncv37zMOMM7DisM9jxh0QUaKBHHj6NbufbANX5dhoqurJjByrwqm1SNojLMiH0l
 u/vDSKhqszQl7J532dh8aISgMeytQMvEFEpbXHe0K3iIR8bB75Dt4vVnIkXelTvHCpG0f8k9imV
 FzS0ezRqHathg8MklgMQUzxz5R4Dof91qaRqlxA0cQ50w/w3o7rjiwKE08Ram2fxbVI8XOsAHmf
 HbQWtif6k3pxHM5KjernRb1oJ31AdoYcLpSK3f8UIugmyrqdSzS5lbF5j4dEjxlg49bpZhvFY+I
 OtoNecJ4PmVPS9jKhTTLdxTinN394bvC8q8skrCETy9tTrctJETU3jWnTzRIZC+2fxAhKNPw9CO
 mdBtjwBEYFFK6qmqEjMAi1iKp4dMmScWiHj58BYqaVJy5D6U93Iu6b9IWOhYbeYb2iwHeOcbAW7
 Nx//VjHi2M2umx4sEOOS0tRHSbsnoIYGPDVj8xc9hEE14t6/EA90z3BT91v3zwl0dp+EHEx4HNM
 GMp1Ti0IVZWjeKT1US20Ky10seh1nAnMtYnnSA16Iw1nupNfg+ybMc=
X-Google-Smtp-Source: AGHT+IFwmvhdZYmsx6+Z+VxffUKI9HzsUYX4vpd9UendpyhYFVesWFRd4VmIWUKeaEso8EQtGixzOw==
X-Received: by 2002:a05:6402:40ce:b0:643:804a:fb5e with SMTP id
 4fb4d7f45d1cf-643804b042bmr1063944a12.21.1763230878354; 
 Sat, 15 Nov 2025 10:21:18 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4c5834sm6088324a12.33.2025.11.15.10.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 10:21:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 19:21:07 +0100
Message-ID: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763230883; x=1763835683;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d32qkww0n7ckJ8TsU1057ef9Pnlj6L4ReG8ZjE5kJNg=;
 b=ePchkOVUROo6R0+17JL9SjRipts3G1L7sv4rDS7Gq6MMqwkTPlpgZRM6lNXRlkveR/
 eEqnQ+DoUMSZhOuklkS+WSWiWeEMLeF3VesWYbJ7frAZ0kaef/wKvbu6bOI33lwjAoQH
 4BGb2U7DYHMcQUEt111pUJ/0HHVK9ClqqOHlo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ePchkOVU
Subject: [Buildroot] [PATCH 1/4] package/libnetconf2: bump to version to
 3.7.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 2d6394e81b5e..2efa29736192 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c95c00ad887295d1fa31098c859c74e330eead78b2eee8d008701af2d9df80e5  libnetconf2-3.7.1.tar.gz
+sha256  7146932ea4fc8e12b9152e23e18e46699174c531ef1e0fc351b05fcd12295a81  libnetconf2-3.7.10.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 79d8419a1134..dd873a3828d5 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 3.7.1
+LIBNETCONF2_VERSION = 3.7.10
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
