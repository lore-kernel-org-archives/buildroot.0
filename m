Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F47AE64AB3
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 14:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54EE81205;
	Tue,  3 Dec 2024 14:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrEXJ2aosbhl; Tue,  3 Dec 2024 14:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84F281213
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84F281213;
	Tue,  3 Dec 2024 14:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B48960
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C7181213
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xBpw-wFt1vO for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 14:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=becher.jannik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B1A481205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B1A481205
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B1A481205
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:39:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso934354366b.1
 for <buildroot@buildroot.org>; Tue, 03 Dec 2024 06:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733236769; x=1733841569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itJdeEgFW1VfwUVZwXwDp6CnGQcPhbVx6PDr4wly/5E=;
 b=eE+yJQ8R+gLt/7f+Q3wfQF1n0b7jppZd15xQYvL1BQLTSnl94HdDK8/f1vgm6/+Pyz
 uaaA0cqg+qOj4fRv9fSQpHrMzVTAI+p059PWARNl0iNgInww1VZBhupZCFaJusOHjSA9
 ZKVN/OauQqjYhdzvH6JeGledLBBovwDWgK+CFkw1jg1iIc8geDjy0HBqvMo/cioc9qTV
 su8NmdYun7XU+bVpd8hYGlDIG9167ZrYHpxc4nZAH76BD1BzGNf8NzGrUmOHyPfte03D
 hGIEDiaTixWJLMWwvKuxSbBABrs4hi9eCAkf9mFKNGRvlIQUWFaeKdFnKUnmdq3rEnLc
 LDIw==
X-Gm-Message-State: AOJu0Yzx+z0cBnqGquh5K2lTQvPzOF2Qw739cabpWYTW7vTaoD/kYeNY
 UbsEtpF4IKJC+MVFf8pEPgdTDva1Kr5QZ0DrsZsdLCGI0uiAmkuQvTIr33iJ
X-Gm-Gg: ASbGncuMcmuxFkYeOm6xBIB8xKXWncrmR2PdoqBvZowArIKnJI5P4wuJjOayMCY2dI+
 YqTHJ+z9tyY5zxkCxSXiiDX89RiLw1jWVBcl8miEPcKZXDsmwM6k6oqBKNVzdWsKzqhfvNCd0/Z
 fjmxiNwKd7b47nuisI6YYD5EARe9CiikefGpIa38WARhfRCBeIbP4oJWREP+4Auw03ZopZhfO8N
 eFi8bBT4J5H33lBK1lmcjGB2368Cxx8gi0VDMufgMf0+5boysF1Szek4AvC5vpkGRKqOgTW1oJu
 1sVqBcrrQHymY5xnfVhrUnE=
X-Google-Smtp-Source: AGHT+IFaE9HCpduWO91n7Hs74yPlvrEMRc0fgmbFtlStSO9kJG+fOxsx+bruVvK0b95tK8BnOLC/pg==
X-Received: by 2002:a17:907:7802:b0:aa5:2edf:2795 with SMTP id
 a640c23a62f3a-aa5f7d4edb0mr215955166b.20.1733236769201; 
 Tue, 03 Dec 2024 06:39:29 -0800 (PST)
Received: from localhost.localdomain (p5492bafd.dip0.t-ipconnect.de.
 [84.146.186.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59990a848sm623829466b.150.2024.12.03.06.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:39:28 -0800 (PST)
From: Jannik Becher <becher.jannik@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jannik Becher <becher.jannik@gmail.com>
Date: Tue,  3 Dec 2024 15:39:20 +0100
Message-ID: <20241203143921.32446-1-becher.jannik@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733236769; x=1733841569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=itJdeEgFW1VfwUVZwXwDp6CnGQcPhbVx6PDr4wly/5E=;
 b=TZ6IDnCxfWf3oXVEopIlk5d/uygO/pPXdHUhW8eGMv56Fg+YS3EeGh58azxwbePduS
 6LNtbfy+shEf5TXd+BLVW1MjFXrXoj6xlqmSR9vsbufiAnzBWEQGzC/G07kEOJmj2OkV
 ytpqmGFn3SFVJKTvaxqca4oCauTq3im54D0oNzyAEo9J/1b9c6+Qp+vDD5FjdG9kG60w
 b/6HNgUYeMZhDizvq2WSszy34VDPTgSINeQn6dc+fQqLcikVqoLYLVUSb/Nx6N0pOUFV
 3BvDO33hKqoTlP9fgHbPV7hbBuUwSLuRKwMMqs1gJr6t/6t0Gxy1K2g/prDdLo8tDFV/
 8XpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TZ6IDnCx
Subject: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump version to 1.6.2
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

Signed-off-by: Jannik Becher <becher.jannik@gmail.com>
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 67a152c6ae..1a772d7ea6 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7e4d8f3497c0bc0b64a151c0d074349fe7614767563642d6fedb19567eafa1e1  igh-ethercat-f5dc109176400f540a8682a2c9ee20d411d14d61.tar.gz
+sha256  3ddd1687327c9c589e3b53dc6fde2e60d76aba07e8662bf46e51807ff7815214  igh-ethercat-ca66cd6ae9b821bfbec6d68ee1b43da359c5894c.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 5b618ab54a..0d36b6d725 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 IGH_ETHERCAT_VERSION = f5dc109176400f540a8682a2c9ee20d411d14d61
+IGH_ETHERCAT_VERSION = ca66cd6ae9b821bfbec6d68ee1b43da359c5894c
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
