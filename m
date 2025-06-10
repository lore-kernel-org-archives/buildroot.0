Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87CCC5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 11:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B424178B;
	Tue, 10 Jun 2025 11:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVKKHZOJgeRa; Tue, 10 Jun 2025 11:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 060E040981
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060E040981;
	Tue, 10 Jun 2025 11:55:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4744E1F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 11:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A1340A67
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 11:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDZJ8gmEevKW for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 11:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1ECB2406C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ECB2406C9
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ECB2406C9
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 11:55:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6069d764980so11651112a12.0
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 04:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749556507; x=1750161307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQkRbbn5RSNrieaxvzUr/H5CXDD9DrUemCQlvG6MMcc=;
 b=cOsVfKE1wZawZmLQG0vnGT6FSn0Z3xOWfMSRYiZJjooTzL3TbugdtnEDKicHsfk512
 i5C0GvQ/7q6PKNwoE3xasxkIoCZ9G8V482yTnwRGI1QX9QQDnGgYed5T+QtP4/CTPbkj
 jtiHIp3dChg5jwvNJHDeeca97ldnNpDr633RK3tN7mxzs6vgO6toH7121F24lw9jjgys
 Rii1qLJCMu6BcxH/A3mIJuqHh7fQVp8ZYG2NabXNx4KkyxOUp5RXy5CXPz8gGUPbXKeD
 Jp4tyBplXlCL74lu7euJONEvpvrM+Noq6sljBtXMD9GwnfKEbvJiO9znZnVJ9IJ14UOp
 hHwA==
X-Gm-Message-State: AOJu0YyYWc2bIMTqALhfp8NMi0gYQkzUQ9kkFyRhupcU6Wh0mQB9HQXx
 9kvuvb3uUFy1XXIldqVgG/u+gGAsshgfEgWeuF6ux2TW93jT/TdHnVgIPssUgmqHK+SB+MvEgf1
 M/oFE
X-Gm-Gg: ASbGnctwrpBJybJPfdYNp+qY/PcT4Tkw8YFLCR9dSySsw2sNYlZ1YpwxSyJfo5ePInR
 I6K+o8+CfPHzBfS47XmPlCLc2BE2Xf2YrtFwVJuwI0g+Rf+Q54FojTdxMHBq8NSBNxeQeGMNJfX
 G68H7z6fWh+p0N4aUiY/ct0HWP/ikWDQ2BqfL/mdxkqxddN7RUat9nPbeCl1vocz+Vik+zh+sBG
 hBIYxj2WwH8828odHdEgrkHikcZNiXt7fqwdWSVEdFdMMQFbcQH5LI+CNdqUZ55wemSgiLJ6yUB
 CIz0snOGR9pASA/UB9PrBu5NVYYlYlN2Oyu+p1IQ+FDcW36Mg3jCUCd2je65g3sxbci09CfIlDt
 N4bVqam0EYNe3eQwKI4iaGc2P8EI=
X-Google-Smtp-Source: AGHT+IHODyVexIYEzGXYhfKP3NVOSrbiTfqIr3+AU+Ur/DMaWimcOTKjHxz5LBHyU11py7rn6OdZmA==
X-Received: by 2002:a17:907:72ca:b0:ad5:6cfc:e519 with SMTP id
 a640c23a62f3a-ade7713eb05mr309771666b.11.1749556506824; 
 Tue, 10 Jun 2025 04:55:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc1c788sm718374266b.101.2025.06.10.04.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 04:55:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 10 Jun 2025 13:55:02 +0200
Message-ID: <20250610115502.2483804-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610115502.2483804-1-dario.binacchi@amarulasolutions.com>
References: <20250610115502.2483804-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749556507; x=1750161307;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQkRbbn5RSNrieaxvzUr/H5CXDD9DrUemCQlvG6MMcc=;
 b=SvmUyVrb6a8eaDK+4wMiwL9KkOJml61C10PzpHA4na3hcS7PHNOe0TbEDGEMjdeA9q
 YHAA1yz9SW4BcfSrogMB98dfGRP/yR3+xZPtQs3sH6VjzXz2zdsJcFAzuJYtqtxRoCC4
 /RZRw++u/5/etz2iUqASB0jYOcWdX+0pkpRSo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SvmUyVrb
Subject: [Buildroot] [PATCH v4 2/2] package/canopenterm: new package
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
