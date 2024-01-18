Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9972C47422
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 22:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6935A6F641;
	Thu, 18 Jan 2024 22:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6935A6F641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5S_39PYWBDlF; Thu, 18 Jan 2024 22:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84C76F5DA;
	Thu, 18 Jan 2024 22:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84C76F5DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E67A81BF3F7
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7E746F5DA
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 22:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E746F5DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_cDx0_sgjhE for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 22:04:30 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F36A6F5CB
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 22:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F36A6F5CB
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e800461baso1383095e9.3
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 14:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705615467; x=1706220267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bQtdumYSqDKTMkY4Om4VvGgpDSHQsfDVVQXduEp0fII=;
 b=t/G1pqrc1LhueG6rrt9ZBa+UKF0cE+RWW7oZggbbZSib2NDKQemIgTT564BqDg4lIO
 k2D10fgcZlLBmKLB5hemvqq3r3znCwu8xqZTtfadXFpfdSqevUWphZDYl6smwRLkWLed
 wCWQH1vHMx2yd9z/KIobLL9A+Zpy9lMpF49pd93vcGQSVGgPx9sxIM69aS46sg1UEZFu
 IIhXs0MlQ8DkJrhz9Isl20pI6h2BoF0waO7fhpV0nUG7RQdiu6B1Bnc9RaPDDFsDLQAS
 CnZ2thoz8KQxisB7mABio5evwHG0d5NVNQwS7faSFUlXW7gqxDXFsbxNVTdlrujk3XIJ
 iUgg==
X-Gm-Message-State: AOJu0YxNCZuq+25NQikWKmCKoTqYU3dUgi+ShcruTXpOrE1CdOOe0cmO
 Ma24TnioKsCnHdvggPwSCMJSYlbo3mPQXx+bcDAxi1htG1VDrH4LV9XWbZ02
X-Google-Smtp-Source: AGHT+IHn8ubPSUnjAXFGlhgLu3KQfslGyapa4BvBhdpZJUvksunXKdho5BnlcV6QQcYNff6fPEhLPw==
X-Received: by 2002:a05:600c:350b:b0:40e:7596:9401 with SMTP id
 h11-20020a05600c350b00b0040e75969401mr473127wmq.301.1705615467352; 
 Thu, 18 Jan 2024 14:04:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c12-20020a056000104c00b00337c0f35497sm4969952wrx.79.2024.01.18.14.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 14:04:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 23:04:22 +0100
Message-ID: <20240118220422.167000-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705615467; x=1706220267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bQtdumYSqDKTMkY4Om4VvGgpDSHQsfDVVQXduEp0fII=;
 b=kPIopuOB4X4IRt1baw195byer/0cXJ5VZgpb1ZPZLVTQ4Whh5AEIYD0yMy+0yu2kv8
 WNl9q3Gvxo/t16Ri92Tpbn/YomWlyu+YlzY5+JtJzftcbb2+4lPxIqSIqpr20oWTciyO
 HNdotvZQn+LFAaNhozWNLO/3YNFS1W9G2cb2ND5HLtZmisTZCg7XYjMdiC6ZUIyVvBMP
 4GIgmuJ1wZs/WiGYzlSyaAkKZRSH7B7keKjcLnA0st4nVYHORJyKH4Dgipt3oQLhhi8T
 261kiWut0CFP670Ej5QSpIY65JKhmNreyfMCUcoRoQbz0PDOmqSa5Lh1zikuSn6fz0u2
 zDlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kPIopuOB
Subject: [Buildroot] [PATCH 1/1] package/re2: propagate libabseil-cpp
 dependencies
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
 Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fc7606010e4edde7a34c545fac0fe7f82d4a5e18 forgot to propagate
libabseil-cpp dependencies to re2

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webengine/Config.in | 7 +++++--
 package/re2/Config.in              | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index cfa5893f41..49c9d0e450 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,11 +10,12 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,6 +25,8 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
+	depends on !BR2_STATIC_LIBS # re2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
diff --git a/package/re2/Config.in b/package/re2/Config.in
index 0ac0041f6d..b79e711ad3 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libabseil-cpp
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
 	  RE2 is a fast, safe, thread-friendly alternative
@@ -12,7 +14,8 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
+comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
