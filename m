Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35569C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 05:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71346414FE;
	Mon,  7 Jul 2025 05:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1mXduFljtt2; Mon,  7 Jul 2025 05:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8F94150E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F8F94150E;
	Mon,  7 Jul 2025 05:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D5515F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 05:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15688414FE
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 05:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hp1jwS5HXpQW for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 05:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9183414F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9183414F9
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9183414F9
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 05:58:29 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0d7b32322so405553266b.2
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 22:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751867907; x=1752472707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vYhJfXTUbn9Kex/QILs3Y4WVPHy/Yr52eEQZWf/Xtg0=;
 b=lmFuretD+wBfitAPDdlvcJWPQKxkMf+CbCNz1tp2HjLpgNFc5WjRaBHyVqPYZCnMwy
 OpKzJxvYA91mu0hXWA4wON+St5A12oUnu7uqDk32vuzf362N97iizGFxq/PvCyIDEFu/
 OMIos7c1+NgkO2pcaBkZw9BFiRyiudZkmNQnHgf5NFcqn1SKlFe+MN3eUceGuKO7Ejw7
 KERjJCU6Ws2YftLy3RFsNcb/sI7sLJZmrMkbiecQ7KbgHop7SZiwik8hSs48iulawzk9
 5l93nss45pRCies+HbCxo6rvjPd0Reojezeafv44HhA+FgGVehqRbMitboICYn6C+OUU
 9Avw==
X-Gm-Message-State: AOJu0YyLc8yg5ZEjmF7IdyknlxzjCXtjklwgrpYjooYxi34bZp3VGwbP
 gZEiFO5wPWNP1zjbjOZPkPDOMVtrSRSAFrOmd4TreGf+Z/802gnqR0qQDMB/N+bmAccN0QbMW7Z
 UWkYz
X-Gm-Gg: ASbGncvk8ANxHPTOVRVSbPojDpdaFn9FxXAr6VGuYddE5WUEjPF7lYZ+F6M8zqyCXFy
 AogpdwlZktUQFngW43wrsfhScxd+Nd4Fq85wMK6ZTc2zJ7HA92BeNAdtYsqIdKkwjDdFi4ordsS
 mW0VH3XAUCFCaKaUUBTdcPQ03vS0ae8joexLC+X0n3N5FJQ+fL25O5VHc6sYRFD/8yv6P9lCEOr
 /DwUiMfH3xoJsUtgGtRmu5zUyRcKLYJeiMnoNxqgxLDP0T1yvp2MNtTEHYpjcAAQ50AOy/hacMT
 e1/aAnnlR01ugg9K+7kBgd3W+2V7Y2wFoT781sF/+a0o583Z1rskciuv6lKmqZFBSSstkyErSC+
 tfnVlPkO/z7NrJXmnxtPv7uQgwNqSNfmCqrjEcsJu16oH0cXpJKcloI9i5psYPrnxEaGF4/siaO
 XqeiecrhW4Mo/FyvfNMxx2Sus=
X-Google-Smtp-Source: AGHT+IGzaylV6RmuJvYvaaO4FgNFhuWWtxv7n5hFM5O4LSexO1q7W/+IX1s9lBJJqlF3q8HZvj39xg==
X-Received: by 2002:a17:907:7b89:b0:adb:2a21:28b3 with SMTP id
 a640c23a62f3a-ae3fe626009mr1144490966b.54.1751867907380; 
 Sun, 06 Jul 2025 22:58:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e8109sm630413866b.21.2025.07.06.22.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 22:58:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon,  7 Jul 2025 07:58:24 +0200
Message-ID: <20250707055824.49575-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1751867907; x=1752472707;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vYhJfXTUbn9Kex/QILs3Y4WVPHy/Yr52eEQZWf/Xtg0=;
 b=VlQqBJTK/LUcBk/EoaHJdic2tC/uVWtyXi/HbSibXaRJcnha186Nc1jcfE+8uPh3F4
 gdKbdg5/6xXOZuWpqhp7jI65sGsugeELc+j6GlzxiGutIzH58JKyGqBKW6bpCFQlqWI2
 6yzUdu2662iC8gvnPPaeV0A3pQHWCCrD+P6cI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VlQqBJTK
Subject: [Buildroot] [PATCH v5] package/canopenterm: new package
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

Changes v4 -> v5:
 - Drop patch 1/2 "package/pocketpy: new package" from the series
   because already merged.
 - Change 'Upstream:' reference in the 0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch.
   The patch is now merged.
 - Use 'depends on BR2_PACKAGE_LUA' instead of select in Config.in

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
index 899a3003cad0..477d643cee01 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -808,6 +808,7 @@ F:	configs/stm32f769_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/canopenterm/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
diff --git a/package/Config.in b/package/Config.in
index 9a841082c676..b8030acd9774 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2469,6 +2469,7 @@ endif
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/canopenterm/Config.in"
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
diff --git a/package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch b/package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch
new file mode 100644
index 000000000000..53206745dd13
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
+Upstream: https://github.com/CANopenTerm/CANopenTerm/commit/fc150187a2e2ce777e757405eb1d67235fc68d75
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
index 000000000000..62dbecb37cd3
--- /dev/null
+++ b/package/canopenterm/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CANOPENTERM
+	bool "canopenterm"
+	depends on BR2_INSTALL_LIBSTDCPP # pocketpy
+	depends on BR2_PACKAGE_LUA
+	depends on !BR2_STATIC_LIBS # pocketpy and SDL2
+	select BR2_PACKAGE_CJSON
+	select BR2_PACKAGE_INIH
+	select BR2_PACKAGE_LIBSOCKETCAN
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
