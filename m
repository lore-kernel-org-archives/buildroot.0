Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A874AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C5C81A24;
	Fri,  7 Jan 2022 19:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-OBSpaWn-EU; Fri,  7 Jan 2022 19:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72FF9819F5;
	Fri,  7 Jan 2022 19:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAD8B1BF32A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7A5D60AAE
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00vYd1gxNVGM for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:57:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D99B260AAA
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:57:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v6so13017361wra.8
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 11:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xl8KDlls/Zm1P8Fel6GTf/DXTvx5F5M4bJY/lGMui6M=;
 b=kiK4tR9C6CpKMI8QLVmauYRCeOv3pCxh4E9/fStVcPKgWAKQspo+g9ws0MEdVEvT6P
 Fgfu5Z7QQNP6Po1XUJZIJkCU20s8scXpZg2M4+2LJjzokl/K3TanjNDB9tjPpRzx9btb
 r+8sLcL0ZJYj6JGWWWQXr6kJnmeeT9m6mMRFGot+I1Ugw1k4Ppj6fjJDH2ObktwlY7Us
 AIF+LB5XOcGMHp1IAn5Hj6BtG4annQOdNIiOPUCKmYDBjOwjmdXBGhdbXQ8G4K6beILX
 h07HPkCjChlJg4od9m0fRSIbS0AgiNgkS/C61ZCZbLY/27jR4PVHynWpNUI6HlMPLaUH
 BNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xl8KDlls/Zm1P8Fel6GTf/DXTvx5F5M4bJY/lGMui6M=;
 b=etHLpVSwbLaUb9IydKNaqum4JeNpndV3ov3xpHQCHWLUQMGkaItjojMbRc7RKfyw0+
 HxPcsY4o0wns0mVDNT/IwABo11lK2j56msZUgeVxGur/kkreWOeCOLmZMIwDleQ+ZA4y
 jRCTiRbKLTOgZ6A5vG0q+0t1HtEn91Kx4Km7gkCPgrGeB1mA2l7wkWJGNWXtPDR4p1Ry
 GYyl9rEK1T0atrwIvNpelarCcn41VoJ8El4n7T60wNTKv/KNTAzaTVnOrYZeMYzAkHnv
 UFGzI6dRUu/Nsh1XdZXadbf8P00r9Mcya2UtXBWFs/boDXIkjD3xb732vlaeYx8rgFiG
 3xNQ==
X-Gm-Message-State: AOAM530BnKR7pFa1ZCVn70IRW+gJm/mdvzLa1u1RE/ENu99tBhWr+JWq
 MzP3dByzYmFDQUOwBodcPZhlbbVMMwE=
X-Google-Smtp-Source: ABdhPJw9bYHS9Gr0w/lWOP3Zqz7poYr6+4yGSlNER4I2xcQ9vIb1P4GhPrTsb9r4Qpo0PC3XV0yRJA==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr54174034wrs.633.1641585468019; 
 Fri, 07 Jan 2022 11:57:48 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id c11sm10393775wmq.48.2022.01.07.11.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:57:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 20:56:05 +0100
Message-Id: <20220107195605.1411244-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: bump to version 2.0.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RISC-V is supported since
https://github.com/zlib-ng/zlib-ng/commit/81f1c8a41bd1427707f402450de8820816760fca

https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.6
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.5
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.4
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.3
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.2
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.1
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 package/zlib/Config.in       | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index 3e1dba35ba..a799cfe253 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  379723c0c954679a50d1d7df43084e2194dc51ecbc9987c889cb129d1f6734bc  zlib-ng-1.9.9-b1.tar.gz
+sha256  8258b75a72303b661a238047cb348203d88d9dddf85d480ed885f375916fcab6  zlib-ng-2.0.6.tar.gz
 sha256  d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index c56fa72d6f..fb497b8c11 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 1.9.9-b1
+ZLIB_NG_VERSION = 2.0.6
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 550c2efa93..d6d94889a7 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_i386
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
 	default y if BR2_s390x
 	default y if BR2_x86_64
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
