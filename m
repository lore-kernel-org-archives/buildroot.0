Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2330C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA475818DC;
	Sun,  1 Jun 2025 08:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuWtNE4CB2ic; Sun,  1 Jun 2025 08:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1BE81ED6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1BE81ED6;
	Sun,  1 Jun 2025 08:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8963E222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F71F40DB3
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0j6X7iuebfF for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72CEA40DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CEA40DC4
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72CEA40DC4
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:02:26 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-602346b1997so5641885a12.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748764944; x=1749369744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SsFXkm8Q6Wov6znOUVbytPNp1DebBy0u+oxhYFEgdQA=;
 b=A3oAFIhY8wuLmVujbSdY3NkhCkpWmp07LW3qxiGKUqH3L3gGHShD/cXeJRh3ynNhPY
 j3HOy/d/oTtcjVwM12jhyiLNTvSHkUh+Gwur+GR3MNgG+xddJNSCN9qO2wXc0JR9SHrI
 53LdTSwC6ewKVeuiwrmgOnszHswrVEMADKXUYEH/M+c9siQk1HdHTzyxuS6L7LDiciaw
 m/bZ/G3f6rDyCCGoo21u3eXmT8KT8zgy1TQdmeeC5QAnCJedz8d5NOPByvKCtVBaeBSQ
 pvlNXj9hYjh6fAesJNNarg6Ih0+0dDFfK/xpMEfe3KgV0ZMgvAHaoGvcxwDKMN39J0EB
 edWQ==
X-Gm-Message-State: AOJu0Yyfy3Dcbp06PX7kfhLNQzCn3nf3MvJufAXMWDSpKKLL3eII9oNR
 TVrdFk31g9y9ktHah58MepVvz0dxZYY/CsfVBNTsWt5KlhjpEBi+P4n3McrJCwfTymulT9THSV/
 q1yF7
X-Gm-Gg: ASbGncteQ3lGFQlS7crl1ebqSMzcKFGFcD+ALHbzGNjrTdxEdPOOVpzYlOn3XQJQ4eG
 EZ2PGiqlQD/yDInkBisN33KFGMfbinRWsOIAYITOBQuCiajhFMgADo/t41i5T2jhP15l3bGu7/Q
 CVGg0HFEus4xEYMUJwX0Qxhb5FwyxoKgcVTAH/S3szmkuNfUrpJmtlk+6bN/EiyXVHiiaPQrVYL
 qHaTmp9b9CHwYB8h9T2Z94CvvkW1jU9lwOtQHHWYSNHN8dVvMgcwpCxK4+b/vgJnWLlFsGpZjx0
 UfkR18JhKbPYwCbxyBjpaJWaN/0Atwq2nmFHlBbtZKmJ46KpAvlUfuQDjjIh0omRcxCXkBuZ0K0
 JRspzXpEFSz5z1GpsvUCfij8O1GEwctpm1cYJfpenDplYw5Z3zcbMhsuv1RPBb6ZiaRluumH5UG
 bDoCfZ3JwgAvdRF6b1j2DOIYw=
X-Google-Smtp-Source: AGHT+IH12PRcs0R+tCIJ0J/a76x21LUr/Fxr09ByWIjkY/SM88NxcC4ekcUw+SiqK/hDM6YeBpD8zw==
X-Received: by 2002:a17:907:2cc7:b0:ad9:6350:c1e2 with SMTP id
 a640c23a62f3a-adb36c114efmr781712966b.49.1748764944160; 
 Sun, 01 Jun 2025 01:02:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e2bf051sm610866766b.122.2025.06.01.01.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:02:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sun,  1 Jun 2025 10:02:17 +0200
Message-ID: <20250601080217.2514549-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250601080217.2514549-1-dario.binacchi@amarulasolutions.com>
References: <20250601080217.2514549-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1748764944; x=1749369744;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsFXkm8Q6Wov6znOUVbytPNp1DebBy0u+oxhYFEgdQA=;
 b=lrkCMN3/EEBzfGhfdQfb6j6or8goQofQTiLeAWyESF5kZxA7aLi1nwj3UONj7mWYsh
 yS7l/XfLdJna1eKzQXRhsfsVce3PZDGA3F4zyZ0bQ1nzuYZ7DXgMZ9hUiLojJ6RAQcM/
 sBm13w2UEXct+G9IyngdepCbKZuHXn0o2F3yo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lrkCMN3/
Subject: [Buildroot] [PATCH v2 2/2] package/canopenterm: new package
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
