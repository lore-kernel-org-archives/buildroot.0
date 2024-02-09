Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFC8C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 14:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38EA42275;
	Fri,  9 Feb 2024 14:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmvYXywzS01Q; Fri,  9 Feb 2024 14:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FAC423E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FAC423E2;
	Fri,  9 Feb 2024 14:24:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C29F61BF3FB
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 14:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACBB08518A
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 14:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJEbh9zgfJwD for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 14:24:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E80285187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E80285187
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E80285187
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 14:24:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5116930e92cso1565964e87.0
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 06:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707488643; x=1708093443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4HJgiuxJ79KGGETOTXzoWViOPp6TzaT1wNBoCN3Fo0=;
 b=r/O2AfH8zuGUXRLFJEWQOwgWlMudSG+6SzgvXfB51Iky7PF6Wu3uPOmgCrowTkb4qv
 FAV2Lxkgt/2g7SFKdQ0kXaegpZRbdfmsklugGI93KNuft8OvI/qJ+IBNfAbypCP5hQOf
 eMmJRCc+3geoLbtgdpSSNJxxaQ/1sPaoj1qqUzo5UipZgp3T6BMkWFY+Gy4dRVXZ38vY
 LQB+RGSfUxDA/MjtbuE54IRO1Aa9Bg/x+LttPaeR8SI6U9qGGiTdPhZpgtL7yOb+JKHA
 mrXE+995sUY8IOs875Vs7RcPrYxXsrx/5z0XyfxbDqdyN/kcthoJLkP4sUmV9xcyuC4m
 aYQg==
X-Gm-Message-State: AOJu0YwZJSRlBDXmqWD2MrC2K4GtkZCVEFq9ItFKVyUkF/v5lgrjPWh9
 uYgji+/eRVhAO2mO61sAC8JfkmarBxyraXTKpJEmgfezXiV9Hj6htIKRyfJeYhI=
X-Google-Smtp-Source: AGHT+IFeB/jAOgXPFqaBHq5xak0h5tpMH64x/Ug5829nTp/e52rfOPPEM0iIGvETrPQyCaczsNUIPw==
X-Received: by 2002:a19:2d09:0:b0:511:6bfb:3f04 with SMTP id
 k9-20020a192d09000000b005116bfb3f04mr1404492lfj.5.1707488642846; 
 Fri, 09 Feb 2024 06:24:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVNWZM0dF/JRsPuqoRxt9dTuoImfV1ikvwoRfh4XYlgi+L2pPvbZOqc/0JkuaBj629/P87K0ujyZnQky2GPS/t7ZnM+UsZARW40ziklDT1l4ddTdPnaz8U/5tovNzHt3/AT+k4IF7fRZD5KTzgyNwBENIp229ANxeCRx7adYjpdrz+mCG64QmsyvpIkb2qXTpt8HiA=
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a19f60f000000b0051176e7ee0bsm232821lfe.199.2024.02.09.06.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 06:24:02 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 15:23:26 +0100
Message-ID: <20240209142326.2570138-2-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
References: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707488643; x=1708093443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4HJgiuxJ79KGGETOTXzoWViOPp6TzaT1wNBoCN3Fo0=;
 b=XYH2kG3x1J8uF+/aoeHCapRJurMbjiB3s1Aeng88dXe8+j7MKyjXLMI60IG8at1lEO
 Jhs1bZm2v74gbicEwNgsssKPTeALWlWJ2C9rjld4aP2cCEKWqXD8S5E2+lbm+tCfJbf+
 jP2yN/TqQzvhIVUY0IUn7XWc+v0x9f4kbjR6japPJsjoEYYTqI6uXYP9v2Vpqpezvu9s
 8GTL1hGJI0M6UNxGn6AZQSMTAoHT/DI6xnpEDPa1CMkHHbw+cw1OlvlIP18iTPJTXTRA
 zA3LQVK0C/S7f4+897ba4bzqPshP2HLtaZMNFtBUthQb+JO1CdTAC1uaWm5OtFBg3uxh
 nr7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XYH2kG3x
Subject: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde submodule
 version
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 sebastian.weyer@smile.fr,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build failed because assimp was missing.

Use git instead of downloading the tar-ball so that
we also fetch the associated assimp src submodule.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt5/qt53d/qt53d.hash | 2 +-
 package/qt5/qt53d/qt53d.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 0f63aab72a..81de91558e 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
+sha256  bab48eab35184144fc8789d2958a983a60bfc8dfa242cb65966a3d129fddaea7  qt53d-e1b1a0d2970fd384bd52c734a72536d8452ad070-br1.tar.gz
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 4b748a4972..8fcfb72fec 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-QT53D_VERSION = 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
-QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
-QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
+QT53D_VERSION = e1b1a0d2970fd384bd52c734a72536d8452ad070
+QT53D_SITE = $(QT5_SITE)/qt3d
+QT53D_SITE_METHOD = git
+QT53D_GIT_SUBMODULES = YES
 QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
