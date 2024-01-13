Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB1FC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C4960ACC;
	Sat, 13 Jan 2024 20:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C4960ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJs8wGvd64PZ; Sat, 13 Jan 2024 20:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17AB760ACD;
	Sat, 13 Jan 2024 20:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17AB760ACD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1D21BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3111A408F1
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3111A408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43hcpEX1T6a4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:27 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45CCD402FE
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45CCD402FE
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3bb53e20a43so5384821b6e.1
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177225; x=1705782025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltLQ1sRzG6Jmrio8JOnRBrb2jEqh5ICp68FXNccVbKg=;
 b=O9LiCJi4jNpeFfIXaQ3bYe4nJKKk3RB8zOPFrmujoTw/LYvPVLN4a6PxN4Q4QLI8Y5
 XwnRX4Ss/3Dc/zi77c+Bj2vioFRKfARdHQzbfiB8uThh4MSamFxO6OR+Mztzp4+cUvmX
 IrkH+Hn4lUgddmHDE5yyJ/4Xea9F8K4FMNXoyb0eb4Flnr+PPeEaK/1R4RaOw8gIQM6P
 qjZWeLKNKufmnwg6PEwq7aTTElWS/q7vHScWmvP1KmVZB+P+lPkyqXwG4ToittlHzaO0
 3tJ8Efh5htxwILfuow7K712vT7puKp3CHaPk+cLFROiNS69dmeSJpQp5WLA3R2e0QoGL
 LwkA==
X-Gm-Message-State: AOJu0YzIqBmmxifWefI1QbRsN1Pa+zUnIdvnsAtW8xhXyVDU5jwSaJPh
 57zJvClLRBZ5ZTqY5eEr94fST2D2na6PYXeu1mIJ/1e9BGg=
X-Google-Smtp-Source: AGHT+IH6PotsTp8KUSnlbnwFBLJ89gtEowBeL35hF9m/1kMTvvdndxunNd85FOPSuuSopLV7wiuLpg==
X-Received: by 2002:a05:6808:171c:b0:3bd:5f60:cb9 with SMTP id
 bc28-20020a056808171c00b003bd5f600cb9mr4054160oib.97.1705177225440; 
 Sat, 13 Jan 2024 12:20:25 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:12 -0700
Message-ID: <20240113202020.21747-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177225; x=1705782025;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltLQ1sRzG6Jmrio8JOnRBrb2jEqh5ICp68FXNccVbKg=;
 b=KaMxl7u6klB1DomA2S1+xEw+fjgUfgQPxc32Ud8AJZcqob/yayCZywXIDIOsP1lSiw
 aLcuWzwdTjN9d9lpxZgiUuZ4k9ERVEfC9Tuz2SIT4Fr+j7UoMqPQhS6LR2xmw25AEwlF
 FBLg3BEUXZBkghciLnA/Mzcsn6Fer6rog1dI8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KaMxl7u6
Subject: [Buildroot] [PATCH v2 02/10] package/depot-tools: bump version to
 8d14454ba4a35fd9d2483842b08815a2357ec86f
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 2109096901..70218e4658 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  5da23d7558975093c6a732f5743c7f224d16dd3f878a6a1b577b1b127a4098cc  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-br1.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index e3b840f29a..634258ffbb 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_VERSION = 8d14454ba4a35fd9d2483842b08815a2357ec86f
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
