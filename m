Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5ABC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 02:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87BC740382;
	Wed,  7 Feb 2024 02:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CC2d-XG2VvOT; Wed,  7 Feb 2024 02:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83EED4044C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83EED4044C;
	Wed,  7 Feb 2024 02:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB4D91BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8ED86131F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fjyN6INDUfc for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 02:22:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11F1261319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F1261319
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11F1261319
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 02:22:48 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so118212b3a.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 18:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707272568; x=1707877368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kYOlzfcOrbyCN7yBRqAuG5I70I1+27PShBHk6eQaM7A=;
 b=IeTK1ETd/YnY76uDEzfMdcgELpt1vf5FQu30DgjONdHkHQifByIMPWH13A1W5789e3
 XalV5QVkjDY7TLiupVWiKCp0Ny8RTPjh12J4DDyFTwCf48nH/n44nYqpN4h9BjEAENsV
 BBY3+FlTiU8Dw1xYzdGOEbxsgBhLXWQMPSurPeARyqcbBGTZxHDtUl8vsPzyjlULTBIx
 yKLHo3Sx1aEwCLvdjCVGauqLNCMeo0ISGZn4hEJZzL0Wze1AkgjBhy9tVuQ8iNh0FKqG
 Ic82WJulmLYSmTXb1goll7rFb9zu1gKD295/OIdXITRG4MYPAMNw/L9s3COfwLqKZq4m
 rPIw==
X-Gm-Message-State: AOJu0YzcdvMxsZ5gnaseoo8ZxTkfQgqLLcAWytqGVJbMiebJ3q9XpvXR
 2jIjmA4zaix9WkNajsGNdE9tYcwVmBKRbZQd6sRzxBTkCvzD+QQoRygQdxdUonkXHO7vuG3+6M7
 N
X-Google-Smtp-Source: AGHT+IE31MA3PFTj+Wvem3npZIVipm0JycK60g2FhK8M3q54zDhjLjn7UX8fe1Gcg3vspCoZyqi2FA==
X-Received: by 2002:a05:6a21:1693:b0:19e:3654:7d18 with SMTP id
 np19-20020a056a21169300b0019e36547d18mr3205190pzb.10.1707272567976; 
 Tue, 06 Feb 2024 18:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXp3Q4fJTftx2rkysKmSmxKvdx/2KGAgZGeWsOB8VhNtgEApCsdkanm60RoXjh+IRWAB2vX59j1xYVfQGlV9YubNX/UcRGNULlRs8QAvpL4vaHD90gtUBFH/0lt21v1xpSYMy8WH4Ww6HpPaIElwrOEpfITHqLlFitO6/BvmujziBJLewrusq9AFp2IrpdhlOhKWw==
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 fa17-20020a056a002d1100b006d98ae070c3sm198631pfb.135.2024.02.06.18.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:22:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:22:45 -0800
Message-ID: <20240207022245.2560726-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707272568; x=1707877368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYOlzfcOrbyCN7yBRqAuG5I70I1+27PShBHk6eQaM7A=;
 b=XoWQh17nP60vXeMh513Pzp9BaViIbKR4Fmo5/we8DFJrTMCUUy8flJnH+K1B/K5sgi
 L13cmFadSFjDki8drp57CpXvwQo9b9FRFc00o4CqB4DBEMKm6+zV59Y0i2D+fg9dlw5x
 ldcpcP4BFaE+BXjjh6d3KuMgq2CCi8Gn5uKVA+Gl9GTU+nMAInGYx8z8rVto/Scpfbyc
 ArmGbKa4EGTizz6s3hr+32rcM5Iiy7dVoWF7P2D6Ps/FS2YAcuCVSk92b+wo5scRBJcq
 fCMLv05bsRbpjDNtfVTdIwST1RUdOH4ke2wpgIcCaLS9OYq9KHl8x3PomeOciRg2BTlH
 dtXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=XoWQh17n
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 v2.24.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.24.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index afccafd994..92f7b227d3 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a1109124e7dfef736ad3db0457d807eb41a0068211bd13e52051252cab28dda  docker-compose-2.23.0.tar.gz
+sha256  ed132bcc226261a595469f5ca6d4ea20b02965867216b56d4e7a5962efb46570  docker-compose-2.24.5.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 54557b9841..947f09d0b3 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.23.0
+DOCKER_COMPOSE_VERSION = 2.24.5
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
