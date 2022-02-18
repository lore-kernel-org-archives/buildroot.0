Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076B1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 09:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA8340613;
	Fri, 18 Feb 2022 09:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilWA8C2C5Fzi; Fri, 18 Feb 2022 09:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52CCB40605;
	Fri, 18 Feb 2022 09:05:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16D661BF2F6
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 09:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04C9D611A5
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 09:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIKevJFZUCgU for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 09:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFB4F611A3
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 09:05:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d27so13388762wrb.5
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 01:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fGppZBkisYEviKXTGpIBTDkFm2GLA1q3VWkmoU6FdUA=;
 b=KN2IR248ahfGoqkqCqu/LEq2scHT7qydONwWSy/IwzoeglmtbH34GSK7sswKn/+hNX
 yd69hMOpS5PE942EVMkadFkKhUnyVz/Gdg5b5lDdLHXNlOHY7lSiAhq0N5fK8GXEe22F
 1PATJVZtI8ijftnQNF1h28mw5UuHtLoCp2cE5BEvOKNhTBFKSm/HBSEERZRobQt0XoQR
 VD8lSZmBijcRFmO3GxEDoynyjmEfoduC5fwy3y5sB58Q3fOGcqXh5euy5P+e/3Dvv/eD
 Zi1P03nDUqgbDXNky5S3fSTnYjG9R2xK66YPgHDzTI0rowX451+e4PL00TEXzqKGoHy3
 kRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fGppZBkisYEviKXTGpIBTDkFm2GLA1q3VWkmoU6FdUA=;
 b=7lbU6i5ItZjBgDtEOeZBDIp66a8+mF7ufytiisUClkzwdy7gUXaIHxUpG7IP1BGA/9
 +AzxYWPdaOyX8YSctztDmIi4RBlTA2nsH5fD4NRmv5nTBIKccZiL7+5AFWadQCBQ1DaW
 nSdyjE627uHf93V+pJZEDAv3Do9T36OsbX+25iMOUQHx9861T2dmvcztyHyuH1TH9OkD
 mxeCAOYh+HRyCRlTgsAbfj72rYtHyutOJMVGBxoUHRXMxInC7Z1eeEZmDufRkJuXarRc
 r/S+Z5vMdmUCyIweRrDKNW78EpPmynA7X371ZJo3dOIneJVG/D8Xtpn2AcxmkNNdXh1s
 jHUA==
X-Gm-Message-State: AOAM531vh6owDlEvNZDKkJ0RQbWkfhPqeio3H8SgO5CRRA8nrhXYABLn
 HciPSV5SZHZg5cOC5yJynV+iehxZkAo=
X-Google-Smtp-Source: ABdhPJyUPEG1x4vz/oTZ53rWyTsIVRSHy9DrMGVOe0h6nFbjoVXECZABB2J+GdE4qBai8MZrbqe7cQ==
X-Received: by 2002:a5d:59af:0:b0:1e4:a027:ce3b with SMTP id
 p15-20020a5d59af000000b001e4a027ce3bmr5046236wrr.318.1645175150750; 
 Fri, 18 Feb 2022 01:05:50 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l12sm3568514wmd.44.2022.02.18.01.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 01:05:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 10:05:33 +0100
Message-Id: <20220218090533.645612-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pulseview: fix build with glibmm
 2.68
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.org/results/ebb73892fd7471de4f0c109554dfdc65b93d3dcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../pulseview/0003-Support-glibmm-2.68.patch  | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 package/pulseview/0003-Support-glibmm-2.68.patch

diff --git a/package/pulseview/0003-Support-glibmm-2.68.patch b/package/pulseview/0003-Support-glibmm-2.68.patch
new file mode 100644
index 0000000000..00e4e696d9
--- /dev/null
+++ b/package/pulseview/0003-Support-glibmm-2.68.patch
@@ -0,0 +1,89 @@
+From a97d5a060a534a3c658578e7f14ab43556db93ca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 30 Dec 2021 16:19:46 +0100
+Subject: [PATCH] Support glibmm 2.68
+
+Support glibmm 2.68 which has been released one year ago and is the
+first stable release in the glibmm-2.68 ABI series:
+https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS
+
+C++17 support is mandatory with glibmm 2.68
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ CMakeLists.txt | 23 +++++++++++++++++++----
+ INSTALL        |  2 +-
+ 2 files changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7791b1b1..58a9cf92 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -75,7 +75,14 @@ add_subdirectory(manual)
+ #-------------------------------------------------------------------------------
+ 
+ list(APPEND PKGDEPS glib-2.0>=2.28.0)
+-list(APPEND PKGDEPS glibmm-2.4>=2.28.0)
++
++set(LIBSR_GLIBMM "glibmm-2.4>=2.28.0")
++find_package(PkgConfig)
++pkg_check_modules(LIBSRGLIBMM24 ${LIBSR_GLIBMM})
++if(NOT LIBSRGLIBMM24_FOUND)
++	set(LIBSR_GLIBMM "glibmm-2.68>=2.68.0")
++endif()
++list(APPEND PKGDEPS ${LIBSR_GLIBMM})
+ 
+ if(ENABLE_FLOW)
+ 	list(APPEND PKGDEPS gstreamermm-1.0>=1.8.0)
+@@ -93,7 +100,6 @@ if(ANDROID)
+ 	list(APPEND PKGDEPS libsigrokandroidutils>=0.1.0)
+ endif()
+ 
+-find_package(PkgConfig)
+ pkg_check_modules(LIBSRCXX ${LIBSR_CXX_BINDING})
+ if(NOT LIBSRCXX_FOUND OR NOT LIBSRCXX_VERSION)
+ 	message(FATAL_ERROR "libsigrok C++ bindings missing, check libsigrok's 'configure' output (missing dependencies?)")
+@@ -225,7 +231,11 @@ memaccess_check_unaligned_le(HAVE_UNALIGNED_LITTLE_ENDIAN_ACCESS)
+ set(PV_TITLE PulseView)
+ set(PV_VERSION_STRING "0.5.0")
+ 
+-set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
++if(LIBSRGLIBMM24_FOUND)
++	set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
++else()
++	set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.68_VERSION})
++endif()
+ 
+ include(GetGitRevisionDescription)
+ 
+@@ -486,7 +496,12 @@ qt5_add_resources(pulseview_RESOURCES_RCC ${CMAKE_BINARY_DIR}/translations.qrc)
+ add_definitions(-DQT_NO_KEYWORDS)
+ add_definitions(-D__STDC_LIMIT_MACROS)
+ add_definitions(-Wall -Wextra)
+-add_definitions(-std=c++11)
++if(LIBSRGLIBMM24_FOUND)
++	add_definitions(-std=c++11)
++else()
++	# glibmm-2.68 reuires c++17
++	add_definitions(-std=c++17)
++endif()
+ add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
+ if(WIN32)
+ 	add_definitions(-Wa,-mbig-obj -O3)
+diff --git a/INSTALL b/INSTALL
+index da89be8d..8003fcfb 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -14,7 +14,7 @@ Requirements
+  - pkg-config >= 0.22
+  - cmake >= 2.8.12
+  - libglib >= 2.28.0
+- - glibmm-2.4 (>= 2.28.0)
++ - glibmm-2.4 (>= 2.28.0) or glibmm-2.68 (>= 2.68.0)
+  - Qt5 (>= 5.3), including the following components:
+     - Qt5Core, Qt5Gui, Qt5Widgets, Qt5Svg, Qt5LinguistTools
+     - Qt translation package (optional; needed at runtime, not build time)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
