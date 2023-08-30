Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBEFC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A139612B1;
	Wed, 30 Aug 2023 19:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A139612B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbn7e8ykq8Ku; Wed, 30 Aug 2023 19:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F0B3612BB;
	Wed, 30 Aug 2023 19:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F0B3612BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 417741BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 283CF402A8
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 283CF402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF4TAnTtnka4 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:55:02 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35A1440017
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A1440017
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c0db66af1bso222445ad.2
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425301; x=1694030101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YUP8QUXvQEKfX+4T8j14H7eUoT7jN6rC3pkWTSPQyI=;
 b=NcdORJb7cbnjSeIoB4XtKpdIwfmRGC+bzwKcz7XkEYRTuEHOUmGdDMlyD72S09N0zD
 KFe+fLQCZo9kpZxqAhJDVMM/0n2/OyPV+c8SXBF6jvLSQttBPMlBL0Dx/3Y2XP5b1Bxf
 apGDAgaUK2XbNtUwxH9SNny+shi+zh1Pc6nX+yhpSs0OZoYSZiWTS6CA+lS+mznMgW0O
 ih8bu7+eKco1Lnmx6ez91S1A/CYwElff121lwObEw0fedvVh5itViC1Mg+54tjm5vX26
 IlXMje6JHfIHCZj8OZxh3+ejn9uVTanWsFJdn5MIzYX8tX9o+nQvELm/XXHq5vrEY/6C
 Vxlg==
X-Gm-Message-State: AOJu0Yzfek40XGB0ksU7Hl7JLuGvqAj2ZWgXscvauSOcbSgRYfmRXhDr
 uNGf3Z8dxT/K6+7PWQfaYe64hhyPHyk=
X-Google-Smtp-Source: AGHT+IGSTqohibFAjO+lqeh2NwuEUrgN4+4S9KVOIOCS1uEN6oPVIIJYJ6TqG6Wfi2nuw92C8VOWjA==
X-Received: by 2002:a17:902:da85:b0:1b9:e8e4:620e with SMTP id
 j5-20020a170902da8500b001b9e8e4620emr3541263plx.47.1693425301113; 
 Wed, 30 Aug 2023 12:55:01 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:55:00 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:46 -0600
Message-ID: <20230830195446.3958486-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830195446.3958486-1-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425301; x=1694030101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YUP8QUXvQEKfX+4T8j14H7eUoT7jN6rC3pkWTSPQyI=;
 b=GvRMhc2MP/BzGUjQTqyBb/FUf+r/4Ss9RobeCqic/pjuu9RiEryM2XY3OTHzHLkSt8
 /K35jQcx0woEx/IZ2PeWHHwdlHPPfJsYj3xIhLsz3P/UdAt3WdiGw5rmc1UDADCI6N1Y
 VfwpvkJJlKQKm1Ck5oo3grZ6rUaJdiRT2r+as4s51/jS8sMSSoNrJp2zFZjXpVZbJxoH
 a13MeG/9omWRKYxPEP/I7d09QIlQ2w/QfGewQD5xBre160e5xrkC1xWMgjgu+bxVCsz3
 gHWZauzL/dAvJplQFaWYSXhm5ZgKa3b9bk/5CDTpEhcPP9t4WHFWJE9dYob9J3QJDn0o
 vyFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GvRMhc2M
Subject: [Buildroot] [PATCH vnext 7/7] package/qt6base: add vulkan option
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/qt6/qt6base/Config.in  | 10 ++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index f9fb2a2ad0..98a7520486 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -43,6 +43,16 @@ config BR2_PACKAGE_QT6BASE_GUI
 
 if BR2_PACKAGE_QT6BASE_GUI
 
+config BR2_PACKAGE_QT6BASE_VULKAN
+	bool "Vulkan support"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  This option enables Vulkan support.
+
 config BR2_PACKAGE_QT6BASE_LINUXFB
 	bool "linuxfb support"
 
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4a01bb17b2..c32089f551 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -127,6 +127,13 @@ QT6BASE_CONF_OPTS += \
 	-DFEATURE_vulkan=OFF
 QT6BASE_DEPENDENCIES += freetype
 
+ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
+QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
+else
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
 else
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
