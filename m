Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FC3CAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 15:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF0F847C3;
	Thu,  2 Oct 2025 15:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaFKf8-Stv8x; Thu,  2 Oct 2025 15:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5180B847C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5180B847C8;
	Thu,  2 Oct 2025 15:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AEB172
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA3961B43
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pN8IWRbgekwU for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 15:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 069FA61B68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069FA61B68
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 069FA61B68
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:56:07 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso216949366b.3
 for <buildroot@buildroot.org>; Thu, 02 Oct 2025 08:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759420565; x=1760025365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIokeEfw2x1tsaSV8MeRtXlL4YYZF89jSoDm77EuJUU=;
 b=NsIdrssfUkSzwttvjnH3cG+wWZTVBxlTHFakidlvPX3nWm5RX+NLePM4x3u1wmLms+
 Eh24fFWFrRB0jioyT0XTDJ2t3+tf+1Tk+ZqmbBuqw/TjIyoZ1RiLISzWhFuUavUMgjkJ
 KhiD7f3LVe/J4W9PGbO7V+5xjdgKln6umgoBVKOadTYBqnWDGOHTmUVZZqEL7IBfdN1r
 k/hb5sqF53PnkfyWQ9a+KaWuV1NFG70khvUGRYO1Gn4g+qKYawseHazxyyUjVDyU70rQ
 YAF55ZMfX+WMf1wagzzgUJ9xH382Xn75YzTwJE5OmBI8+rbOCORWZbOh4p4MB/NMuncU
 B3Cw==
X-Gm-Message-State: AOJu0YwG7Lza8mmhLX5ISQvb5jesJdtdl3tiINHuOBAmG94F7c4kEnaa
 pr4Rbh9yoN1apd9/jPkgdwGen0KObFcCNFaRmNCUl5m4zCCnrk3Z0D/BDjRjQqL4Sp2oKZbNfiR
 ar1frQMI=
X-Gm-Gg: ASbGncv6xn82G6aU3nbbRk3zatKYU6os3Orkk42HLj7eUemyvYBCLPdURqgyYkEd28f
 0VuldFri/WO3UT1uXClEer2p/BdRmlZ0UwXkmNGa9ImQhDPMxYWpSzQT0nY5Rwi5eTmaI6dw9kP
 BzTyVsTK/r17qGbzs8UrhM1tlGgov+kROhmHWncIXCHyhrkFkGWgban7MCd6uZBM6VQ8ArIdGe7
 BlidQPebFE8xSzZbc4nQEzeWefONwrvaGm4r9+LKMBbkY/eqQ9AgihwtFVXmkz166nfZQZb41ov
 arZ1L28TfP/eRfrUnAy+AYs8TYtSRHq9NF1VW3QGCej+ijGryTJW0CO/AajlMklh4MJ7B+6bz4z
 //VH7JyqnyF11dhFGxjQLuiaWzLXER/JHLlXONtE1VxWYr4oNEnAA21MKQ+uhWKFDKxdaJYChoZ
 VbcCJuKdw=
X-Google-Smtp-Source: AGHT+IFg26be8lM/PGippXEnsVs+8sTm8nuJ0mUsvqFdEXsweigi4KDHdt7kW8QGukFsHrovQDPk6Q==
X-Received: by 2002:a17:907:60d6:b0:b3d:5088:213d with SMTP id
 a640c23a62f3a-b46e985e262mr1058407966b.42.1759420565441; 
 Thu, 02 Oct 2025 08:56:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d129:d23d:efca:4c23])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e613sm222407766b.81.2025.10.02.08.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 08:56:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  2 Oct 2025 17:56:01 +0200
Message-ID: <20251002155602.872945-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759420565; x=1760025365;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UIokeEfw2x1tsaSV8MeRtXlL4YYZF89jSoDm77EuJUU=;
 b=XjTJyShGgRqaQcqu/9UW2mHGEo5flNKOWVXoLgQI0WpvXkE5qOkwRggNUwuwc+qiID
 xu9h18ARD9DRGvflZ88I7Pizw/K66DEg0fp1nFo6VZ9qUAs5qTxPOZ5/IURX5G5HLOXE
 rn/NgLbJCCJIwHkr8UPU7gtz5MS7yclrh2qzM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XjTJyShG
Subject: [Buildroot] [PATCH v2 1/2] package/expat: security bump to version
 2.7.2
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

This bump includes the security fix for CVE-2025-59375.

Release notes:
https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-59375

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v2

 package/expat/expat.hash | 2 +-
 package/expat/expat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 87bbf86e1aaa..2346efbde56b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  354552544b8f99012e5062f7d570ec77f14b412a3ff5c7d8d0dae62c0d217c30  expat-2.7.1.tar.xz
+sha256  21b778b34ec837c2ac285aef340f9fb5fa063a811b21ea4d2412a9702c88995c  expat-2.7.2.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 51b45b01bb15..02dda3b12c13 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.1
+EXPAT_VERSION = 2.7.2
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
