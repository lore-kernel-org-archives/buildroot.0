Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2510EC83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B01AC61284;
	Wed, 30 Aug 2023 19:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B01AC61284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_wT_VnrS6a4; Wed, 30 Aug 2023 19:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D826C6126D;
	Wed, 30 Aug 2023 19:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D826C6126D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70B551BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A1E361257
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1E361257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEDRLgnFvhmU for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:54:54 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D34C6124D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D34C6124D
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c1e3a4a06fso204245ad.3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425293; x=1694030093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tkynIWJ2ghZw2FZgS45/JG82lc2aZs+Zy45V88OrTh8=;
 b=hCEY4YgXI50GG2Ud3YUaPkhvMByLzKIryElhqjYB3rExpHBXLzvJHhTz9RJHjI+udj
 0sevmP0O0+i3IoVaQvhDQMfrb6sY+wPnQ+zbMEbSixaCTD5QRGuHaQMVWPfzpwycCLE5
 bvnEUFdT9EhJ+AEq/iG5sEucppcWZnnnH4mGmnszf4ODqJ3wpFfd5fT5ivB7ZtOIPbuh
 mxYcNe5+PwSToz3qwcXg+NDwpyzOzLYB3wiyyYDnY1lX49xzEzrERcPe7J2NMsigXCwn
 4Y6DWzxEu9bX85h4zMmsbSnzOXbaIIWxc+S/M5fPbh1t/25l9I8NLdrYKEekAwML4q33
 be2A==
X-Gm-Message-State: AOJu0YzwCBJs45SbGI2Zodj5z3TrmS6zWwcbua5jKrNmiiDP6wymtSPA
 PI8mApKpb7ptOZxQuHVG20XVHqTCDvc=
X-Google-Smtp-Source: AGHT+IEGs0+Vh8fZqwDd5DcKKMy8HbLAnJ3Ov1PsIn29cV05iDfuzb0MS6mMOZ6vjuRIPWIiGAWKZQ==
X-Received: by 2002:a17:902:e811:b0:1c1:db28:f253 with SMTP id
 u17-20020a170902e81100b001c1db28f253mr2829730plg.26.1693425293279; 
 Wed, 30 Aug 2023 12:54:53 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:54:52 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:41 -0600
Message-ID: <20230830195446.3958486-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830195446.3958486-1-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425293; x=1694030093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tkynIWJ2ghZw2FZgS45/JG82lc2aZs+Zy45V88OrTh8=;
 b=XeP4ds3QFFnzKU9fKwSpM8GxXwQGGGZvcFjClb3TnRVnDvNJypgHBAMGa5DQgJ5YHN
 cd6daLkoWH265oQS5QqX+Zp/5Aqjl5SaIxQws1PxWu8HrhUUVftChITdj9JgE+EX9b8Z
 0fIS/6HsR9po8ULI9crJQX7U5tfrCUuSIABJ4xQoef4ptWtjiq/4QDQUQrlXJUM5BoPe
 jXj2SNsPIwaagjJ1kux82n0X+AXzIWOkE1Y4M9EU8fqtpS/JjwwX74YFIkElXtaiUcAa
 4YrBs2PEd+vQYLBehK1ZITNCOpXNpnkRMssJbkaf9MDcnK9jm3Hl/5a+gpUK2wQLwo/d
 XOBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XeP4ds3Q
Subject: [Buildroot] [PATCH/next 2/7] package/vulkan-loader: new package
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

Use $(VULKAN_HEADERS_VERSION) for VULKAN_LOADER_VERSION as the vulkan packages
need to all be the same version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/vulkan-loader/Config.in          | 14 ++++++++
 package/vulkan-loader/vulkan-loader.hash |  3 ++
 package/vulkan-loader/vulkan-loader.mk   | 45 ++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/vulkan-loader/Config.in
 create mode 100644 package/vulkan-loader/vulkan-loader.hash
 create mode 100644 package/vulkan-loader/vulkan-loader.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 241de082eb..e83b7c1b2b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,6 +28,7 @@
 
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
+F:	package/vulkan-loader/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index 3d16ea37d1..51c2ee2b3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
+	source "package/vulkan-loader/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
new file mode 100644
index 0000000000..9c215dc9ce
--- /dev/null
+++ b/package/vulkan-loader/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_VULKAN_LOADER
+	bool "vulkan-loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_VULKAN_HEADERS
+	help
+	  The Khronos official Vulkan ICD desktop loader.
+
+	  https://github.com/KhronosGroup/Vulkan-Loader
+
+comment "vulkan-loader needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/vulkan-loader/vulkan-loader.hash b/package/vulkan-loader/vulkan-loader.hash
new file mode 100644
index 0000000000..e09ecda8a9
--- /dev/null
+++ b/package/vulkan-loader/vulkan-loader.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3bbaa5ee64058a89949eb777de66ce94bfe3141892514172cfc9451c756802d5  vulkan-loader-1.3.262.tar.gz
+sha256  43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  LICENSE.txt
diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
new file mode 100644
index 0000000000..d87e57ebd4
--- /dev/null
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# vulkan-loader
+#
+################################################################################
+
+VULKAN_LOADER_VERSION = $(VULKAN_HEADERS_VERSION)
+VULKAN_LOADER_SITE = $(call github,KhronosGroup,Vulkan-Loader,v$(VULKAN_LOADER_VERSION))
+VULKAN_LOADER_LICENSE = Apache-2.0
+VULKAN_LOADER_LICENSE_FILES = LICENSE.txt
++VULKAN_LOADER_INSTALL_STAGING = YES
+
+VULKAN_LOADER_DEPENDENCIES = host-pkgconf vulkan-headers
+
+VULKAN_LOADER_CONF_OPTS += \
+	-DASSEMBLER_WORKS=FALSE \
+	-DBUILD_WSI_SCREEN_QNX_SUPPORT=OFF \
+	-DLOADER_CODEGEN=OFF
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+VULKAN_LOADER_DEPENDENCIES += directfb
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+VULKAN_LOADER_DEPENDENCIES += libxcb
+VULKAN_LOADER_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=ON \
+	-DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=OFF \
+	-DBUILD_WSI_XLIB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+VULKAN_LOADER_DEPENDENCIES += wayland
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
