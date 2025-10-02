Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D8DCAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0467B847E6;
	Thu,  2 Oct 2025 15:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPSTgBnrn5ZZ; Thu,  2 Oct 2025 15:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 855EB847D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 855EB847D0;
	Thu,  2 Oct 2025 15:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6177E13D
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50A2661B43
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXs-bk7dup87 for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 15:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8022761C02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8022761C02
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8022761C02
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:56:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6349e3578adso2033424a12.1
 for <buildroot@buildroot.org>; Thu, 02 Oct 2025 08:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759420566; x=1760025366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMXDNII8Q3NvyFNKSX2Gbby6JfjsrA4NZxTXbL01IcU=;
 b=RduuEurBD68rEmtR76ebZEcRYAzCfTyB+X5jhBlr2WajShFNZZ12QShW1otZgPOX+y
 mbHeQoV3/cBoCmvAG9YbAToofY96wQCfTYIHYDAoPlhZX2X4lktBuexxQsvPYgPZEJ5E
 GNpI3kpbj+5/hPxhvgFgUMyL4+0zvV/VaTfIRuSPVZRAoSh/GVdzZyB6DL3jsPYqr4Ql
 JUxx/wK9oP+RuA/VuXS2vICBlLj07GphCuDkHzH75+RoIi5esC/sNZeZRRMrIC+8PxUg
 71vTXa2DaACDby4SUvsx6/1THRjxhQm0Z2aYAD26rQzFr1QYjA/k9QaLrUAW7Ql0Ylah
 399g==
X-Gm-Message-State: AOJu0YxSyOfVkU7BTkRxmSgNohEvmDjLgMXPbLmd/puVxzqfwN3SIBGn
 fROMhiLNijtO7tm0/1fcl3ytbCFy2Kb7pdO8fAKO2AxxZqA7/VdclYyzSwyk+r6D88/b95hCtuq
 OB9rzi1c=
X-Gm-Gg: ASbGncsNK+q5464tNBH4NU7MCUlX3ORrrLpy67vOC1Jp0Wl0TVvt2uPR8WM2fUeH1+V
 FmxDxB0shQkomAs4OlITTCleIAH4BBdAt9XETYCpXaRDXALED8iqPNJdxCE73ORirVLVvL/agu0
 fBh2n8isyl3MGK7zJ9QvloJJgeSeEr4RG6Jz7AkgO7MSzrX4jvEW4ObzdQJ6vxp5td8QZZxsc4m
 FpFO96vPypoe3EFaJwh0c+RGTuCRIXO2+r8TVnSspVvqIt+XZ2cMY7PG2lX0c8b1W0lWXEHHbUR
 Ek0Cyi8du7kSedv2g3wmWe868rnri0/nLe2T2bk96db6A6r0SvyB4hLcacSyB/IxqhzWrIqlgxz
 /N2zed+GF4yVXkCRAc3bNs57+MNYwG4zoN013Sz5B97JNuusXzGXf0jgX2P4NUAsYLclGV/19zJ
 Kf8UB3L9k=
X-Google-Smtp-Source: AGHT+IH/kqD7AoFcy7PyQzqaMEK/jf3fR/tcV2NJXhEe2gn8jUdUWK+0mn6NUqsc+GInSsNQW9tDUA==
X-Received: by 2002:a17:907:8694:b0:b3b:b839:577b with SMTP id
 a640c23a62f3a-b46e42b6948mr1098104766b.12.1759420566255; 
 Thu, 02 Oct 2025 08:56:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d129:d23d:efca:4c23])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e613sm222407766b.81.2025.10.02.08.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 08:56:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  2 Oct 2025 17:56:02 +0200
Message-ID: <20251002155602.872945-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002155602.872945-1-dario.binacchi@amarulasolutions.com>
References: <20251002155602.872945-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759420566; x=1760025366;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMXDNII8Q3NvyFNKSX2Gbby6JfjsrA4NZxTXbL01IcU=;
 b=YaJlmqDp8792uOXHX/JodreF/67dbiKf/OlkyILDq/pXXFHJPn4nLQB/ieEXCebwNW
 xqB/LX/IOnVVy28EXVRBx6KRrb9CCSJ2Wb1bLG3UlJkVt1NsKAVYH3qgb5h14IbQDYVS
 PVSDrpqwNFrUZyx1/4BYiCUSW8MDQuJSin9vA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YaJlmqDp
Subject: [Buildroot] [PATCH v2 2/2] package/expat: bump to version 2.7.3
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

Release notes:
https://github.com/libexpat/libexpat/blob/R_2_7_3/expat/Changes

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- bump from version 2.7.2 to 2.7.3

 package/expat/expat.hash | 2 +-
 package/expat/expat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 2346efbde56b..9d99c38a451b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  21b778b34ec837c2ac285aef340f9fb5fa063a811b21ea4d2412a9702c88995c  expat-2.7.2.tar.xz
+sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 02dda3b12c13..07aba205cfd0 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.2
+EXPAT_VERSION = 2.7.3
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
