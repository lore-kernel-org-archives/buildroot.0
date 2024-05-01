Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5878BC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 09:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC82760762;
	Wed,  1 May 2024 09:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EV5DqBPStO8x; Wed,  1 May 2024 09:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E3A60A6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E3A60A6B;
	Wed,  1 May 2024 09:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3004B1BF977
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CC5F818E8
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duSfoHKwisc3 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 09:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B8BA817A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8BA817A1
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B8BA817A1
 for <buildroot@buildroot.org>; Wed,  1 May 2024 09:38:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51ee5cf99e5so4921e87.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 02:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714556306; x=1715161106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Buy1N7Gb44X4O+FVQz4lajOMyhb0CInYAVLjg/TXjc=;
 b=gxqpV3JWSwtranzVN022HmDXfInE6pbXfzTOM8S3x8CrK6LlhbXiB84ujFGQd87NQs
 jaUsW/2M8dkKaqq2pM0q8yRnva1VLVPRIj8vGbFxBFdmzcn/t3cfJ1csbSwKp+lLJEuE
 36ugyzeg07jkCt8ruAy1NnK6gN3fTPmxFMWG39xuWAGMLVeiUx4rLa2aQGJVHUBphsv9
 LapKiaXaYpGnpBE7quH0QGOfPgiOR0AtK0Fs8hflUOb6awtxPb4wRq2dy8ANO+fUvmin
 m4KVBQXi8B1+b3boeg9gTuFeGvAy4MC5rfLO84zp6khMSAlWpJUFKoSkG4K8Z+lS2c8Z
 fwoQ==
X-Gm-Message-State: AOJu0YxW7+MALuPMyyBPjRJlojvFX/pdCK0mYr/PKUwQ9UKXc7UfdyjC
 62VN1E6jBGBZimDbPaUZWkk1hIS7DvFaubC1zynWCe3IfeYZrw6tQqipmr9d
X-Google-Smtp-Source: AGHT+IFsNJVFkD4kTHrDC4GTnwSkPhT1AiaJ6FZfrZu3GItDOqHdYCEg6a0l/LXnfwzXYWNQlbYPpw==
X-Received: by 2002:a19:ca44:0:b0:513:ec32:aa89 with SMTP id
 h4-20020a19ca44000000b00513ec32aa89mr1164246lfj.2.1714556306333; 
 Wed, 01 May 2024 02:38:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 z4-20020ac24184000000b0051589cc26afsm4790500lfh.72.2024.05.01.02.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 02:38:25 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 12:37:25 +0300
Message-ID: <20240501093725.325194-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714556306; x=1715161106; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Buy1N7Gb44X4O+FVQz4lajOMyhb0CInYAVLjg/TXjc=;
 b=UazTgI2hYpAc+qigx7dVtpjJeqPLxirWCJGcCnV0V5Jvzy0/Rb9y1yO4LNFKbFamdm
 cvd3E7xk3i5SY4Wq/LzRK8lhVwg0TbFgZG1eN88V7TvPVb/wbIjRk2yWwWpFEhnn0G6U
 FktNuZs/5XbroMqcc8gLZZpM9n1QJZII1eUO+u24IbE6zRs451x4ZeI4+iOmkCgmX/Tg
 Ja3HEqj4VIWLG07nMpPJrHY9ClIpduiLllVxpd5O2vOgVIOEJksgMc3Ko1TWs6Cqijyf
 tSzzPRWTf5La/Tfsd3bQaAdKZgXvFGkNsM5jeaE+knYV/QfLIQRFB2d5Y1YvRPKFtAS4
 FZaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UazTgI2h
Subject: [Buildroot] [PATCH v2 1/3] package/uclibc: Bump to 1.0.48.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 1.0.48 release uClibc-ng has provided the fix
for SPARC related to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 package/uclibc/uclibc.hash | 6 +++---
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index a10ceab54c..7097bbf99a 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
-sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.48.tar.xz.sha256
+sha256  3bf5fc6cc5cbc454b6c478424755c6f71e7c15578a2c966f02606aa5c5596e21  uClibc-ng-1.0.48.tar.xz
 # Locally calculated
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a7b18133ff..9593e18d45 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.47
+UCLIBC_VERSION = 1.0.48
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
