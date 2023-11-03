Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8ADC4167B
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 00:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B8370433;
	Fri,  3 Nov 2023 00:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B8370433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aj1byy6eRRFk; Fri,  3 Nov 2023 00:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D06705FC;
	Fri,  3 Nov 2023 00:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D06705FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8FB81BF28E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 00:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D91970443
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 00:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D91970443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3nPnyVamH2y for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 00:07:01 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0485B703C1
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 00:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0485B703C1
Received: by mail-pg1-x542.google.com with SMTP id
 41be03b00d2f7-5bd33a450fdso713090a12.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 17:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698970019; x=1699574819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YtsFX9C1eZFo45AF4wNAPAcjN+vSReQ0p96STdkR8AM=;
 b=n1ReiILJTJiyghkjhLPlEJljwgfvvRS1oYztoFLQk9IlLJongTbRIgaiYKiai2dz3v
 NDuwjT1N9xCzeyusJ8HqTVzbU0/neKfKBb1ZbBnQ2sbilggFkCKoywERYujbNaoA216b
 M13mgw2c8PO6Ef1QwaH1hcduO89HNRatx3DMzBPFDnkYHy24cQp5+cccRTL20NEeDDYe
 6i1eTYzx8YxUCNVcOuXNZCUhJjcWgS+TKYLD9W6LStcQIeoHP2Nbue+bnvaj8+izXmJ2
 ML5qcAqgY9GjWUfOwsMiXnTlyRb7BBUDmpxL65MX1AcfPr2U1XJBnNEptJ44BhNGZbTq
 gOIw==
X-Gm-Message-State: AOJu0YxtTJQoztfEtrRIbVvr/sIlJZyAaT3GoudEYQRO2DX1L+9jya5t
 jiC8Bf+pvDee5D/Dqm4WWT9rtZnYaGrjHFEmWehcSRRr9IU=
X-Google-Smtp-Source: AGHT+IHWGz99pPT2rnEkfzSAs9E6OAsgp5nMUbmYy+75KwwZKai+VDgFjDE7D1Xbbq6j6jDUNURG0g==
X-Received: by 2002:a05:6a20:1f99:b0:17d:1337:cfc5 with SMTP id
 dm25-20020a056a201f9900b0017d1337cfc5mr15069390pzb.29.1698970019485; 
 Thu, 02 Nov 2023 17:06:59 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa785ce000000b006b65b0f903csm272525pfn.192.2023.11.02.17.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 17:06:58 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 18:06:49 -0600
Message-ID: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698970019; x=1699574819;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YtsFX9C1eZFo45AF4wNAPAcjN+vSReQ0p96STdkR8AM=;
 b=YYftzDrFWoJ3YZQ64cxmF+sBCOdve5MnnIFA+l/wsKOgRHP/If5qVMcD5+W6RDox7W
 BeSeX/1hm1JeZUwFf3X8zMbfHzXKRXLhK2UwDyltAsNxdxtXkus9J9HzZucWRsJA5emO
 u5JWeQMOSqmDbewT8tAXX47Vxh23mDNCaCDqw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YYftzDrF
Subject: [Buildroot] [PATCH] Config.in: Introduce BR2_HOST_GCC_AT_LEAST_11
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NodeJS 20 requires gcc >= 10.1. Unfortuantly, the only host gcc that has a
decimal place is 4.9, and every other HOST_GCC_AT_LEAST is an even release,
we round up to 11.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in | 10 ++++++++++
 Makefile  |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 556b6c2575..7dd49567f6 100644
--- a/Config.in
+++ b/Config.in
@@ -55,6 +55,16 @@ config BR2_HOST_GCC_AT_LEAST_9
 	default y if BR2_HOST_GCC_VERSION = "9"
 	select BR2_HOST_GCC_AT_LEAST_8
 
+config BR2_HOST_GCC_AT_LEAST_10
+	bool
+	default y if BR2_HOST_GCC_VERSION = "10"
+	select BR2_HOST_GCC_AT_LEAST_9
+
+config BR2_HOST_GCC_AT_LEAST_11
+	bool
+	default y if BR2_HOST_GCC_VERSION = "11"
+	select BR2_HOST_GCC_AT_LEAST_10
+
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
diff --git a/Makefile b/Makefile
index 3e85d5ef09..37deb35912 100644
--- a/Makefile
+++ b/Makefile
@@ -353,7 +353,7 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 
 # When adding a new host gcc version in Config.in,
 # update the HOSTCC_MAX_VERSION variable:
-HOSTCC_MAX_VERSION := 9
+HOSTCC_MAX_VERSION := 11
 
 HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
 	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
