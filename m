Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BCEE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 419A4403CA;
	Thu,  2 Jan 2025 10:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4jlYuQC8tFQ; Thu,  2 Jan 2025 10:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002EA40401
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 002EA40401;
	Thu,  2 Jan 2025 10:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D47DEE0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10FC6077D
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiv0DYcFEnPP for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB80560771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB80560771
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB80560771
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa6b500a685so144992766b.2
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 02:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735812544; x=1736417344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQWza7lAf9g1fAptTsI89OA9eKc01C9sQSQUIskqcPk=;
 b=l+IBDTn6gByZC8mCtB6DfPnKjyKH0vrKjJJdlwJkLMYWIQ/PPEdTSEnsd2PB8rVl8f
 s7mC5E4J/lXbqMva6TvVUjXnhGNnaIvpPGvyFAUniinPiGddmGOX7MLmmziL+G+jpeav
 oCzwnF1fjt8uoCGomtkPesXeAVX3kmVv1rLDA6cjXgHLcQRBUB7czj6Xa/ev1+nj4+ml
 ly8HPBsmei7M6V3+IJ3/TAc63LT4OuMjqA50Mg2WnutT9IAhe6hWJh9x+twZhHHRGmwX
 fCqa08guuQfE8vTjOZ3Hbe3CQe2HBQai2JA1dR/lj5FmIV27TrSFVca5rkQtIg4jG3XX
 Fhbg==
X-Gm-Message-State: AOJu0YwtOKp6yYmkdll0r4D9F+Gjdz9Zsfx2R4Y+ApVJb4JsJysFIs/u
 Lv08lXX4FKP4DChlRyY/BMOfl2Wc41MeNJMBIzLiBejqmltpK5gcbMTL16xTsiRn51XjiEXhPNp
 9Af4=
X-Gm-Gg: ASbGncuPH4Yoss9NxRer85rscK0EDS0XU594DcdU5mN+FqaCpTDsqbv+cGwCMszHq/f
 ezlNsxn11jHSPwekWKG6Y6ElfdXpyjXLpq5I2dDGM1KgOgMOeC9L85FTz3ACxuvbBm43pAMh7IL
 5nV3gZ2CLsb6e3uPzfI2BSTZLKAbJItWE05sFHjsfsorlNEN9GnV0qoc6zVVnCBPWjpd7Ke/+V6
 yuqxScFZb6PlewACIF4Lg53j5AVuO361Cnf8MT5gwB1xZ6q1/85fwP3LidiyLbNfiFT0Fm+HTHi
 r1g6srgbAWaq
X-Google-Smtp-Source: AGHT+IHT5wyCbTJovbsUczoXnry3CjgIhX44lLKBAMsgxFGqWrvq8eXtP66Krm8m+f04TFPA0kuyhw==
X-Received: by 2002:a17:907:9496:b0:aa6:9407:34d3 with SMTP id
 a640c23a62f3a-aac335532e1mr1484998866b.9.1735812543860; 
 Thu, 02 Jan 2025 02:09:03 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b10sm1759295866b.37.2025.01.02.02.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 02:09:03 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 11:08:53 +0100
Message-ID: <20250102100854.8937-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
References: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735812544; x=1736417344;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQWza7lAf9g1fAptTsI89OA9eKc01C9sQSQUIskqcPk=;
 b=iRNlkZP/Tz4BbXvx+bUEZ8C4hhHCWhXy8rGldDhoR16C+yIr3wUpq8o7XNkC9z6UlP
 UByMdrBnksozZ10IzJKigPxAu37xZ7zAeQWfAnejWH6SRH3UKkuO25xkUe2+8UoCIDdN
 u4vdgMaCmJebjpkxZC7hA4Y1E1VAmdSkZikoo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iRNlkZP/
Subject: [Buildroot] [PATCH 4/5] package/flutter-packages: bump to version
 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 9730f65bf2..615c1142b8 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe87edffd828f7081f5622c592cb5871a2bc107dc03ff2610ddb6599f4f0137b  flutter-packages-85c4934bda545beff36133dc63e47de5b5c5c56b.tar.gz
+sha256  769de0bbccc6c5b04ccc0be72652c1a9b22d6b4e03b0477a3c7fccacfdb04177  flutter-packages-3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 37f8141e7a..3dbbebb067 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 85c4934bda545beff36133dc63e47de5b5c5c56b
+FLUTTER_PACKAGES_VERSION = 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
