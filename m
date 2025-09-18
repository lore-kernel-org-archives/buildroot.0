Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B89CA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 16:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C18460643;
	Thu, 18 Sep 2025 16:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dy3bG6dy61_9; Thu, 18 Sep 2025 16:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7057460648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7057460648;
	Thu, 18 Sep 2025 16:16:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AC8D279
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 589AF8145A
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pwRcTB9X4VB for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 16:16:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A60E8145B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A60E8145B
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A60E8145B
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:16:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b079c13240eso202860766b.1
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758212175; x=1758816975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Id2oNOJ6ccbTEe4k1v9ytXjLyq+GIfmYuhAITDNvUM=;
 b=h1QywrpQuX/3yxYgS/1Zf5VDltpo1PA9MA+2vexeM03kBQjtGppyCAMn9h20QHpKur
 k9NcXUqdXxIOSCZglL2T4wz0A4Pmo0iE+tyOF9VdiKARcILPRJX6Ij8IXu//H/DDDwfy
 cwy6G7i4gRbAT0Z4v3wYfwbe52DFxbOL9QfrHAaaQvH9orDpSb0dS59Z9kxvnIKXI7qo
 y/E4WOuEsve4co2etFKo8f37Sh2qUj8jN+cRwd5Uhx7If2sfGjCrj2UuUvbwF77pOI//
 lXz2exVEZQvMSRLP155vpk/OYMOMMPLOpM0NsGNcN1NIotQX0aVupNOeR2CWUa7XFqN4
 f6JQ==
X-Gm-Message-State: AOJu0YwqP7cVV4dhTOKnuBjB6wmYDpcpFl/jpbUklju7J1g29H0lYnWL
 qCu09/A4DZRZj5FzJf/g5jeesX4ezIeHfW2mj2Q/+lgeycv9aBBviFG4SLgRs6KFp7q1j2yyrnN
 MR2tW
X-Gm-Gg: ASbGncsThd8i82M2knQ57RJn3muVdwlA+KtIgj/WQZy9KjrXvcLX55gFvtRGvIBnmj1
 P+8PEiOyrPGuRvp8B7QQlNybaneZ4aJLjA4COE8e4P3NiaFB5XKBFlsSicjNvx355gf7az876El
 W/OljPRXz5qIMRv709aQYMtmE5VSaZNG5I6WDDzhrboevs+c70Nu7fwogRhEe5J1XVwQuqrEgRl
 bnJrYc4VTmxlMd7/4UcC0mktr8aOlR65r/FlzjcoDATDc816shWW4hQORpBQPVRPVfHPe4oicrT
 3i39cToh6OPHWZqVTemqVcwzJ8lzKpEmyYa2l5LcqrBRnY+jhYF8g99L+sW2iPPszVK5O7FCFyP
 1+uUUgCTeD1yCK2unIMelafizjqUawPXsqO9xuEg5Wc8nMubHznPaV+ccnux/X5607Nk5OGtRYz
 Es49L2ZhIc2CPuxUx5lxm6dTy9QjQvGO5UnD62BR8OPiBMb0FKiMCxAo8rcmNIxpKltrOAm5BUc
 UYZwqyhm1M=
X-Google-Smtp-Source: AGHT+IGEJ+8RcAAxOVSxnOwvhuYxO4LmP7gUGMWtt4YaFfuBj6Mtdrs0Bw115vVhrrOLkb5+9uOr6g==
X-Received: by 2002:a17:907:dac:b0:afe:e1e3:36a2 with SMTP id
 a640c23a62f3a-b1bb6beec18mr747965166b.31.1758212174822; 
 Thu, 18 Sep 2025 09:16:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fd1101c53sm224290866b.81.2025.09.18.09.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 09:16:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 18 Sep 2025 18:16:07 +0200
Message-ID: <20250918161607.2540235-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758212175; x=1758816975;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Id2oNOJ6ccbTEe4k1v9ytXjLyq+GIfmYuhAITDNvUM=;
 b=XmFdlbAIBg2nw7P9fqCP51w9bbnpAg3dfTPqa29LZaYao132T8q9rITtRxukE4w6rU
 aNxogdwYPetzHJkY9JsI9ZsVXYESzycB6JR8uA01QPRuGzdYZsn7vpgvN25ePMPPwRPX
 IcoLYhHNVIg2cM6Q4qw2f/3vjS7/Z58fcaysI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XmFdlbAI
Subject: [Buildroot] [PATCH 1/1] package/apr: bump to version 1.7.6
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
https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/apr/apr.hash | 4 ++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 7d231ee7cc57..1d4ba31ab23b 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-1.7.5.tar.bz2.sha256
-sha256  cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2  apr-1.7.5.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-1.7.6.tar.bz2.sha256
+sha256  49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32  apr-1.7.6.tar.bz2
 # Locally calculated
 sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index d5b132658a1e..1c7553a501a6 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.7.5
+APR_VERSION = 1.7.6
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
