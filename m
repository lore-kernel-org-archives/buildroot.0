Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F0C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 21:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA78940342;
	Tue, 16 Jan 2024 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA78940342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0Pppt582SO3; Tue, 16 Jan 2024 21:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740A441A47;
	Tue, 16 Jan 2024 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740A441A47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A6B31BF3D7
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 21:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49CC881E31
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 21:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CC881E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Q8GOc0h2TxW for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 21:44:34 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3127A81E2C
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 21:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3127A81E2C
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so116415885e9.0
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 13:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705441472; x=1706046272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y3bUvwg1PGcq80ez3+HXrK909i/mfOM6A9/t0paEyVs=;
 b=guZGbt4Rchfdw4GJJe/lvk550HW/1TqYmq3muzAk0c4u+3ZDnbXLce5De4DiKDWa9Q
 t8LThpI9YlWTMUQfG0aEB8wFrNlPoXp0j8mh+47bvTHM9J6XjtvOxspfEoLYIgB4KGd+
 stZfc2xfFDb/NS5sO/x7kHKAy8tquctNJnlIXVTOjMm5MWQRzVoxvrVOv5UNd6Up/6PU
 GUQCgA/m5xWH96imiVhzxKHZildEUbFAGopRtnBDA0iBVddHE38U4op9o92sLncjw7PS
 V8fEfCMXyqNhjpvouWoHx35Y48ooMWn7H2L5s6vPXMSmqx/3lRrk+OZr7bdmefeudqrI
 bkpw==
X-Gm-Message-State: AOJu0YxSrpAbnAApz7A7bUh3cKqb0+bKyvo+CqjFxgRpzRSVYDZhq+yu
 KxTDwtM2e+tkx1N3awgLy11ZzyCtNjY=
X-Google-Smtp-Source: AGHT+IGvAJGDcye6Cys0p3s+CO0FTJyIPrnyRzoZyqUFzfdnu03s21LchE/Hli+PA36LeAc1YipoDw==
X-Received: by 2002:adf:f2cf:0:b0:337:3bc2:d75b with SMTP id
 d15-20020adff2cf000000b003373bc2d75bmr2800333wrp.206.1705441471613; 
 Tue, 16 Jan 2024 13:44:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i18-20020adfb652000000b00337bd545d7bsm103845wre.21.2024.01.16.13.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 13:44:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 22:44:27 +0100
Message-ID: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705441472; x=1706046272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y3bUvwg1PGcq80ez3+HXrK909i/mfOM6A9/t0paEyVs=;
 b=VUPvd+um/DLzQGTOA+6zRt/WgS12EYTQtW6wVnr393Y1+ACDLBfUL+ditkeJBAwcgL
 iwtDD+zuJZTRsl5cBPj9vPNnpHBxAENgBXUqKkUjcAVIDsNT1I3KK1ipoHPpgWNOE3jA
 Zw56botOyZ1WyFzkN43XgM+IZ+kr2OtocE2szLJBadzdsIPukY7NEpMYaQ/R7QorPnSM
 Y5CWgmRp3qqV1fYoJfN2JDJhigkaMmSJzDVlaBQG35YK+9kYJMuXyt0SZd1O05ZsN17v
 SfwVPQITa1FkLmkKT0M0YMWgxXW/cUPYF5SOa4ovpjiqnlyaoFtPvZIqYaIcHJgq1C/n
 4MWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VUPvd+um
Subject: [Buildroot] [PATCH 1/1] package/libtracefs: needs threads
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libtracefs needs threads resulting in the following build failure since
its addition in commit b1dbd3f679e6660325472e3fdca72127d74e6929:

In file included from /home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
                 from ../src/tracefs-instance.c:10:
/home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
  218 | #   warning requested reentrant code, but thread support was disabled
      |     ^~~~~~~
../src/tracefs-instance.c:20:10: fatal error: pthread.h: No such file or directory
   20 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e0a8dd0781a1d1824a4cb78f47dcff4055083959

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtracefs/Config.in  | 5 +++--
 package/linux-tools/Config.in | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
index bb0777b16c..a46bbe0bb1 100644
--- a/package/libtracefs/Config.in
+++ b/package/libtracefs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBTRACEFS
 	bool "libtracefs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libtraceevent
 	select BR2_PACKAGE_LIBTRACEEVENT
 	help
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBTRACEFS
 
 	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
 
-comment "libtracefs needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libtracefs needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ce744663f1..fb158f84d4 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -104,6 +104,7 @@ endif
 
 config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	bool "rtla"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtracefs
 	depends on !BR2_STATIC_LIBS # libtracefs
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_LIBTRACEFS
@@ -124,8 +125,8 @@ config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	  not available in Buildroot, so only rtla in kernels 5.19
 	  onwards is actually supported in Buildroot.
 
-comment "rtla needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "rtla needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
