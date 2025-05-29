Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BBEC5AD49
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 10:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A9261299;
	Thu, 29 May 2025 10:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R-LFVaywxbj; Thu, 29 May 2025 10:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493F8612AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493F8612AC;
	Thu, 29 May 2025 10:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11276127
 for <buildroot@buildroot.org>; Thu, 29 May 2025 10:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E577E41D97
 for <buildroot@buildroot.org>; Thu, 29 May 2025 10:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSz4X-BGtTX7 for <buildroot@buildroot.org>;
 Thu, 29 May 2025 10:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC98A40BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC98A40BFE
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC98A40BFE
 for <buildroot@buildroot.org>; Thu, 29 May 2025 10:31:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-602c4eae8d5so1525364a12.1
 for <buildroot@buildroot.org>; Thu, 29 May 2025 03:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748514693; x=1749119493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SsFXkm8Q6Wov6znOUVbytPNp1DebBy0u+oxhYFEgdQA=;
 b=eYEtf1qnfyy39xvTk9/ZH9Na+md4J67WSvbdjOy/czl0fGgXlQLC2UuA29fnIVEdh7
 V0/ZvPq+fVHrfBurmS1WhQj+11ackOFdJEjIiBZ94VVpcda/KkgYCGUbI63dRieN7S1W
 VuVSrK7jCELf8isMUhwG0DtmYUp10LB7cmnUx17Bq/Z7ep4qV7obq0428Ww0GfsdPWgY
 ZU0222aGy5NvkuAPC+N6YHcGbpS6cBGoUEvoVr58upGcdLVtpY0pNCxEdhxxzKk6xFvX
 bT45Y22klWE3RuX7BogDFSAD7Xc5MhaRJ/jvSAV8eGzYRLT25aUk+Kl0SDRvVgM3yJrV
 p6xA==
X-Gm-Message-State: AOJu0YwxDtUTywa/PoivbpP2boQkUz6VLTC4zu/h8B8nK4x2byu+jWJO
 Lo/69QvmJCifAzngr8WmerzqbTnE5iA+iW4rDeuJeYadP16QoJpPBCXXb2Txj3Aky25q3K/i9Qt
 B6l0i
X-Gm-Gg: ASbGncvK+Dc9gR042bRAl9KjH40d967dt+74+NSqocX1JQskQSBZ6tD162249e1BfBe
 MRgX1FjIRvYuBYtA5tjcO0aTvR/XRkrRRKwZ+f8hx5eYKNspc8R0X4v3VRWLrpmbZJxmL/MfyI0
 utU8CwzWsuCU35jvmTIE9OpLzeI6FvgVaHenV7E49fZLQYKUBBxa1Xw/P/Ti2oF33qS7EBGi2cI
 ao/+sdoKKilc9fjjZPY1MJFyrWeEMIltEiOdmKtEogah/I2YYfJHD2bagTCLOUJB68iCgO8m4e7
 El43VTK3J9AyHAXwh3kf4nevjCvL8dXfSzY1ZapnTpheIhZqGiNL50Ug8dF9tio1vCEJhn6dtZk
 XMEO2n4GN/y/5a6ipmEob1ugJRQo=
X-Google-Smtp-Source: AGHT+IF6WU2JnlpJFEq9/wLcfBGGMZUJpF34dL8OT3PK2gd+MLrHXG0AuxJN55zYNfsAodi9d8Uuzg==
X-Received: by 2002:a05:6402:50cb:b0:604:b87f:88b4 with SMTP id
 4fb4d7f45d1cf-60535a5c289mr2556426a12.2.1748514693324; 
 Thu, 29 May 2025 03:31:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6051d79ecc2sm2126105a12.72.2025.05.29.03.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 03:31:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 29 May 2025 12:31:29 +0200
Message-ID: <20250529103129.2349689-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529103129.2349689-1-dario.binacchi@amarulasolutions.com>
References: <20250529103129.2349689-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1748514693; x=1749119493;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsFXkm8Q6Wov6znOUVbytPNp1DebBy0u+oxhYFEgdQA=;
 b=cP36xNC6j0nBwh9OQ9vc/cQT6u9a3RhMwwkId3YeWggE/DyRqvXNKlMeqDpXOau2lb
 1/BXfNy2xX1TlvctVytGbA73Ae/xGsxOkRFwSWVhzTZGtba/2P9kPv5N4hcVNomoDfeS
 2mh6ZV/r1kBtdT6kpLJE9q8qEMFcDa+Y/bn38=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cP36xNC6
Subject: [Buildroot] [PATCH 2/2] package/canopenterm: new package
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
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...allation-when-BUILD_YOCTO-is-enabled.patch | 39 +++++++++++++++++++
 package/canopenterm/Config.in                 | 15 +++++++
 package/canopenterm/canopenterm.hash          |  3 ++
 package/canopenterm/canopenterm.mk            | 15 +++++++
 6 files changed, 74 insertions(+)
 create mode 100644 package/canopenterm/0001-Fix-exe-installation-when-BUILD_YOCTO-is-enabled.patch
 create mode 100644 package/canopenterm/Config.in
 create mode 100644 package/canopenterm/canopenterm.hash
 create mode 100644 package/canopenterm/canopenterm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 771c5cf31322..8d2ac722a78e 100644
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
index 000000000000..2a7a3be29ba5
--- /dev/null
+++ b/package/canopenterm/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CANOPENTERM
+	bool "canopenterm"
+	depends on BR2_PACKAGE_CJSON
+	depends on BR2_PACKAGE_INIH
+	depends on BR2_PACKAGE_LIBSOCKETCAN
+	depends on BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_POCKETPY
+	depends on BR2_PACKAGE_READLINE
+	depends on BR2_PACKAGE_SDL2
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
index 000000000000..115b032d57b0
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
+CANOPENTERM_CONF_OPTS = -DBUILD_YOCTO=ON -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_FIND_DEBUG_MODE=ON
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
