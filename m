Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D38C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 12:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7281A80E5E;
	Wed,  4 Jun 2025 12:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duR4Brpe4hHR; Wed,  4 Jun 2025 12:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2212F80500
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2212F80500;
	Wed,  4 Jun 2025 12:32:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 478CADA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3955E40E90
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Igi3aUrDyz3 for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 12:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 172F741B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172F741B9A
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 172F741B9A
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:32:49 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad88105874aso1064339966b.1
 for <buildroot@buildroot.org>; Wed, 04 Jun 2025 05:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749040368; x=1749645168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJ0DjFTBjb9oWxlclGezgrs2OzGDZc6mJz+5z4iwmqU=;
 b=sRTIN59nAy52D8yYR2DaEApmeQ0d8IpNwIZ5QioRALJRC5cyOB5wn8YqGESwD0g/WB
 VacbK+yl4Y9fGRrIWiLEEKG/UnOm14aqUR7qlh9M+R/I2klo6jSAMkp67X10YrJ2Ngre
 pFgO0PYhEIYNc1SVxWa6C620abFmv4sWti9O1RA830boexPe6BmnVdbanLdxQvLqaQeo
 JNX+8eDOod2+SPmlueqZq3Am2Uy9WjKjXoIAg9e70ELPtkZgLtabRnyBPpV//TKGskDx
 YhmHjM9rLQWMrdTryHM6nQLvHnHSLDtG4CRddyddZKghnGcyxAej00z/T5Px9c08ciPp
 6vzQ==
X-Gm-Message-State: AOJu0YySqR27/D/p7kSrE8MvgPlnMqz8GDS9k15+hBBMUhljuT0vIBJl
 qWOd3s7lUWTJJCJUSNI4gMP3YRgycyGe6OC8aElBcmniU6Ur6kCxeHgBEHSlu2hJlziroEQFHX1
 o3hkR
X-Gm-Gg: ASbGncthvYv4sid6ZDyYWs/FpADXfOBOALO6p3Ncgy+ybS08uLC/OuucnBCloOwo1UQ
 OmeLMcu2UgoWc03PAOr65ZJdWIggHSileGZqiElfIFQ518UD4rSI7RJrFjc08tbcCI/Cwo9nQOw
 7epoYe6PFVEB07kPjZNqLMmPsaOPUhwQP9mKH3ojIyCq1359zakwWrJjjCqNiIHZvXxplCejW7I
 AlV8qe5eb4k5oFAvh11rQKEoHN4Q20MNIAP6yO2eaENZ7tOGL591f/7MwZrsnfDkyHbzKY8YrVc
 XLbkYNWcgcrltoCzft2wQIx5eaFCwQ8O+0eyVgHuBqbHrAyQDcQ3FJwZ2udhLvaL0ldElorvm/j
 V/PavxK2mfWc36j8=
X-Google-Smtp-Source: AGHT+IGSeO/Cq8cJzrNdIbgdMuGyL6ahrXGB7hn7Pak4Iu1ipGIjybx9uM8nbuFUIkTBJCS14uuoPA==
X-Received: by 2002:a17:907:c0e:b0:ad2:2569:696d with SMTP id
 a640c23a62f3a-addf8ceb550mr240164166b.15.1749040367771; 
 Wed, 04 Jun 2025 05:32:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7fed8bsm1097095666b.28.2025.06.04.05.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 05:32:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed,  4 Jun 2025 14:32:41 +0200
Message-ID: <20250604123243.420711-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604123243.420711-1-dario.binacchi@amarulasolutions.com>
References: <20250604123243.420711-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749040368; x=1749645168;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJ0DjFTBjb9oWxlclGezgrs2OzGDZc6mJz+5z4iwmqU=;
 b=hofg8HSSZ7Qcow5k0d6fAvpiVL43Pud4UxEcco2FwmgDX4JVeun03mD4psxmMZR31q
 UsirABmZdaI/jSCFT2B9Vju7mOD7XFWhvwsDETCKjSaMPxrmeESk9iXeSUCVkQKGAijJ
 hgCvldg7jBEPx/rZZFxImjk21VIRvAD1Vu6T4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hofg8HSS
Subject: [Buildroot] [PATCH v3 2/2] package/canopenterm: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CANopenTerm is an open-source tool for developing, testing, and
analyzing CANopen CC networks and devices. It provides a technical,
no-nonsense solution for professionals working with CAN CC-based
networks. Additionally, it supports SAE J1939 and OBD-II protocols,
making it versatile for various applications.

Version v1.0.10 was chosen because it is the last one requiring SDL2.
Indeed version v1.0.11 depends on SDL3.

Tested on STM32MP257F-EV1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v2 -> v3:
 - Replace depends on with select in Config.in
 - Add required depends on based on the depends on of the
   packages selected.
 - Drop CMAKE_VERBOSE_MAKEFILE annd CMAKE_FIND_DEBUG_MODE
   from canopenterm.mk

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...allation-when-BUILD_YOCTO-is-enabled.patch | 39 +++++++++++++++++++
 package/canopenterm/Config.in                 | 17 ++++++++
 package/canopenterm/canopenterm.hash          |  3 ++
 package/canopenterm/canopenterm.mk            | 15 +++++++
 6 files changed, 76 insertions(+)
 create mode 100644 package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch
 create mode 100644 package/canopenterm/Config.in
 create mode 100644 package/canopenterm/canopenterm.hash
 create mode 100644 package/canopenterm/canopenterm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 46d24afceb71..d3ef898f3244 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -809,6 +809,7 @@ F:	configs/stm32f769_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/canopenterm/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
diff --git a/package/Config.in b/package/Config.in
index 9aad65488a6c..413ac3ef8b3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2467,6 +2467,7 @@ endif
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/canopenterm/Config.in"
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
diff --git a/package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch b/package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch
new file mode 100644
index 000000000000..55d15afbbc95
--- /dev/null
+++ b/package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch
@@ -0,0 +1,39 @@
+From fc150187a2e2ce777e757405eb1d67235fc68d75 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Thu, 8 May 2025 15:24:38 +0200
+Subject: [PATCH] Fix exe installation when BUILD_YOCTO is enabled
+
+While building CanopenTerm in Buildroot, with the BUILD_YOCTO option
+enabled (yes, really :)), the following error is raised:
+
+CMake Error at output/build/canopenterm-1.0.10/cmake_install.cmake:114 (file):
+  file INSTALL cannot find
+  "buildroot/output/build/canopenterm-1.0.10/CANopenTerm":
+  No such file or directory.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/CANopenTerm/CANopenTerm/pull/95
+---
+ cmake/os_linux.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/os_linux.cmake b/cmake/os_linux.cmake
+index 7c1f8185b2a2..f149bd03fe92 100644
+--- a/cmake/os_linux.cmake
++++ b/cmake/os_linux.cmake
+@@ -104,10 +104,10 @@ if (BUILD_YOCTO)
+             DESTINATION /usr/share/CANopenTerm/scripts/utils
+             FILES_MATCHING PATTERN "*")
+ 
+-    install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/CANopenTerm
++    install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/export/CANopenTerm
+             DESTINATION /usr/bin)
+ 
+-    install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/codb2json
++    install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/export/codb2json
+             DESTINATION /usr/bin)
+ 
+     return()
+-- 
+2.43.0
+
diff --git a/package/canopenterm/Config.in b/package/canopenterm/Config.in
new file mode 100644
index 000000000000..04894db817b7
--- /dev/null
+++ b/package/canopenterm/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CANOPENTERM
+	bool "canopenterm"
+	depends on BR2_INSTALL_LIBSTDCPP # pocketpy
+	depends on !BR2_STATIC_LIBS # pocketpy and SDL2
+	select BR2_PACKAGE_CJSON
+	select BR2_PACKAGE_INIH
+	select BR2_PACKAGE_LIBSOCKETCAN
+	select BR2_PACKAGE_LUA
+	select BR2_PACKAGE_POCKETPY
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SDL2
+	help
+	  CANopenTerm is an open-source tool for developing,
+	  testing, and analyzing CANopen CC networks and
+	  devices.
+
+	  https://github.com/CANopenTerm/CANopenTerm
diff --git a/package/canopenterm/canopenterm.hash b/package/canopenterm/canopenterm.hash
new file mode 100644
index 000000000000..8c403e9bb6af
--- /dev/null
+++ b/package/canopenterm/canopenterm.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  9de6f472b749f08a5ea9a836604507cd56c71f818a4141a2b989423fbb7beb80  canopenterm-1.0.10.tar.gz
+sha256  cc555368040b92e77b14289b367ccbebf88344367188862680d40cc885636d3a  LICENSE.md
diff --git a/package/canopenterm/canopenterm.mk b/package/canopenterm/canopenterm.mk
new file mode 100644
index 000000000000..c3883ffef74d
--- /dev/null
+++ b/package/canopenterm/canopenterm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# canopenterm
+#
+################################################################################
+
+CANOPENTERM_VERSION = 1.0.10
+CANOPENTERM_SITE = $(call github,CANopenTerm,CANopenTerm,v$(CANOPENTERM_VERSION))
+CANOPENTERM_LICENSE = MIT
+CANOPENTERM_LICENSE_FILES = LICENSE.md
+CANOPENTERM_DEPENDENCIES = cjson inih libsocketcan lua pocketpy readline sdl2
+
+CANOPENTERM_CONF_OPTS = -DBUILD_YOCTO=ON
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
