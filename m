Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AB4C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 09:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2794040909;
	Tue,  1 Nov 2022 09:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2794040909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38oruVPs_D_0; Tue,  1 Nov 2022 09:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BCF408F6;
	Tue,  1 Nov 2022 09:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BCF408F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C40D1BF873
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 09:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278A340332
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 09:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 278A340332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3w-sLqvXM3CC for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 09:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7285400B8
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7285400B8
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 09:30:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bk15so19271368wrb.13
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 02:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pdTNuzHnNqLFi2ltaN4MOTJI54GUFxYac9cPUXwyPsE=;
 b=NAkZOmBGq1EGhFK7W5QnRIyvbetpujUEfNFdPcrIjW3nERyB+G6MwK/en91YKgDrlY
 mZBRFrPKdzxTQMrqPBZzCo/WnRS6dlHaoxI8w6aTWh1p+WqQ9JDF9SFSkwel5UX3MeVs
 9A2OVFHIjkfsnNAzRMOnaCcc/jC/qRfesxaygd4HVaqPlsg+YLC9n+6Xw8G009D3JdPD
 bN0cMwhyHtUePlDbEkWa6PzswYFUvVUlOGz+/jjgMaFaqpJ2hpao7ux1USqIcagsY7Bi
 mplGDhoZlzQl2YCeHXoqFKJ59nIBjXijAuHEdvcEQeo3OQpCqSuXXdxvoJhLBr17WtBO
 eNPA==
X-Gm-Message-State: ACrzQf0e/3BMyE+PQPli6F7IBSKaOZLDpUvEIxW3hyCtzq2iDx6wFXqX
 pgmF3RLk9VNqr0MFQyzp3BBBrPvwOLuzzeRI
X-Google-Smtp-Source: AMsMyM6A/1Z+Xo9yQmCmqXr3VclCpA8VBlb4LtpTi8DTrWga/pXR/46LTucO15eyfUJy/0n6H+Fx3A==
X-Received: by 2002:a5d:4846:0:b0:236:64b1:50fe with SMTP id
 n6-20020a5d4846000000b0023664b150femr11103746wrs.672.1667295015309; 
 Tue, 01 Nov 2022 02:30:15 -0700 (PDT)
Received: from TIM-LAPTOP.localdomain ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 x11-20020adff0cb000000b0023660f6cecfsm9660109wro.80.2022.11.01.02.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 02:30:14 -0700 (PDT)
From: Tim Gover <tim.gover@raspberrypi.com>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 09:30:07 +0000
Message-Id: <20221101093007.28341-1-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pdTNuzHnNqLFi2ltaN4MOTJI54GUFxYac9cPUXwyPsE=;
 b=Gs6R1MpgcnbVErYhjbW4V1q1Bkti6cE486Fef1YokUAAg8UbmkDh9AdM+rYEAUJwCA
 zxP/fmTmst3php2Fq+s1t1m+kpkzK8BHhLrTPVfhLibyxAFS6O30RWZ/pk0F14oe9ErR
 79SpNBEysbe5uxU4nyhrErBzY/gtc8U3qvE08jAccAGL5k6iTi6+0N+6EB/8Pyoihbx2
 em6ScuuS+5W82/pkKHKHU6N3iZ0ZwzBki7wW7zMbhtCgHxRXL6N781E7r0Csy8nffKem
 emd0mp0A7ijDSvZgdW9cyOxb9AIeUaYAMVyY43D4SFmd9dG5cMAWPtOZkqwkuWRiHz5p
 4hJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=Gs6R1Mpg
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable aarch64 support for rpi-userland to provide
vcmailbox and vcgencmd in 64bit builds. The are useful
for programming OTP and system debug.

The ARM64=ON parameter restricts the make targets
to only include those supported on 64-bit i.e. it
excludes the legacy Broadcom EGL drivers.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
---
 package/rpi-userland/Config.in       | 14 +++++++-------
 package/rpi-userland/rpi-userland.mk |  6 ++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..cfb472808b 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
-	select BR2_PACKAGE_HAS_LIBOPENMAX
+	select BR2_PACKAGE_HAS_LIBEGL if BR2_arm
+	select BR2_PACKAGE_HAS_LIBGLES if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENVG if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENMAX if BR2_arm
 	help
 	  Raspberry Pi Userland contains the necessary library to use
 	  the VideoCore driver.
@@ -18,7 +18,7 @@ config BR2_PACKAGE_RPI_USERLAND
 
 	  https://github.com/raspberrypi/userland/
 
-if BR2_PACKAGE_RPI_USERLAND
+if BR2_PACKAGE_RPI_USERLAND && BR2_arm
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "rpi-userland"
@@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_arch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1204196e19..42c7e8190f 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -11,12 +11,18 @@ RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
+ifeq ($(BR2_arm),y)
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+endif
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 RPI_USERLAND_DEPENDENCIES += libexecinfo
 endif
 
+ifeq ($(BR2_aarch64),y)
+RPI_USERLAND_CONF_OPTS += -DARM64=ON
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
 
 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
