Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFEEC83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA3861257;
	Wed, 30 Aug 2023 19:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA3861257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54HpwPpbs2Pf; Wed, 30 Aug 2023 19:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BB3612A5;
	Wed, 30 Aug 2023 19:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BB3612A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4491BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05092402A8
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05092402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLFRYjdDrJUl for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:54:55 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD7F540017
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD7F540017
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c1e128135aso263685ad.3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425295; x=1694030095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nu3I5RHzzFgYmmza8kMP4ScsmnAiphK8AOZ40iHUDf8=;
 b=bRl1bwlPMlVFdpcYZZUSAvYjSwx+Dw7nn6TXe7zHR6A0IsiEN+CkrNJ3Ozc0lqeo2Z
 rx+C1a0koe/4txxpiJOOQNG3YdgfhQCtGMcqui+ICEn/4TjHhYu2PWaTutDRRWik/A0G
 UAadvtERNgGNP91Gt84shVHUYLPTNpFDrDABE572bNqmBn6WHPk6wequ/pxHT3530Cre
 7AcMD1+uW2VfuTYz+Q5CjtqzKbZx0SWBou9A1GRLguvd1EuMsNw2hs7hvGQqHz9DRQT3
 c18npGuZ1M8zrk9ngDi6N9WMiFGL0NKhHD7ZdFbbaKc3OJFB6o/AYNbJhK6a1Uiz00XZ
 6MRg==
X-Gm-Message-State: AOJu0YxE3I75qTuvBMhjHuHgQs6ga0RaLKGDgZWcdVtq9tFv57O05XaM
 XDp/1KJaXLQ5cWDQT7hKwSJXeeZ1+bc=
X-Google-Smtp-Source: AGHT+IEw79RggDzv+KWO/PdH/dwfmOKcnE8RdPTkxNib33J6fV2ZLMNzA9IZy5jaaiJffXs3KMfONA==
X-Received: by 2002:a17:903:11c5:b0:1c1:f1db:e86d with SMTP id
 q5-20020a17090311c500b001c1f1dbe86dmr3430442plh.7.1693425294690; 
 Wed, 30 Aug 2023 12:54:54 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:54:54 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:42 -0600
Message-ID: <20230830195446.3958486-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830195446.3958486-1-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425295; x=1694030095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nu3I5RHzzFgYmmza8kMP4ScsmnAiphK8AOZ40iHUDf8=;
 b=V2TXt29rsmBTYQJcwGCefbGZzwb3tAn7hzZHomNdMP2WJx+/hFYQNOQELszdWTzmWG
 10Q/N4D84lxjPpzwd0uZ6HK9rDCK7rWbla1mUyI/KSHpe5mAk8hl7xuQAPuZ+C2x0QGr
 VfTp215XopTM/QDLNbeLMrwUq1ybXArROoMb/BtLLuYkXC7VcGMSqgAl/0TS4MprZJja
 keLR6ZFKeLVjGBrz0+v+y6cfC+efNZwHfq5Jnvr8Ya7AiFabtVtTbnLtPrGVKuNWN0DV
 CT6dc+S4/ZqhaA4vsUiAvi0QhJkpb7tXUYJwH+jue4MdenFWfzgGmcEtjaPR7zCA+YF9
 QD6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=V2TXt29r
Subject: [Buildroot] [PATCH/next 3/7] package/vulkan-tools: new package
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

Use $(VULKAN_HEADERS_VERSION) for VULKAN_TOOLS_VERSION as the vulkan packages
need to all be the same version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/vulkan-tools/Config.in         | 17 ++++++++++
 package/vulkan-tools/vulkan-tools.hash |  3 ++
 package/vulkan-tools/vulkan-tools.mk   | 47 ++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/vulkan-tools/Config.in
 create mode 100644 package/vulkan-tools/vulkan-tools.hash
 create mode 100644 package/vulkan-tools/vulkan-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e83b7c1b2b..3c2187afac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,7 @@
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
 F:	package/vulkan-loader/
+F:	package/vulkan-tools/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index 51c2ee2b3e..5fa34b1f0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ comment "Graphic libraries"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
+	source "package/vulkan-tools/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
new file mode 100644
index 0000000000..54fa539dab
--- /dev/null
+++ b/package/vulkan-tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_VULKAN_TOOLS
+	bool "vulkan-tools"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vullan-loader
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+
+	help
+	  The Khronos official Vulkan Tools and Utilities.
+
+	  https://github.com/KhronosGroup/Vulkan-Tools
+
+comment "vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/vulkan-tools/vulkan-tools.hash b/package/vulkan-tools/vulkan-tools.hash
new file mode 100644
index 0000000000..24c0697784
--- /dev/null
+++ b/package/vulkan-tools/vulkan-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8c77d02694d0516ae2ba3f3718745647e87e788ef93faabb2e3674ff32608010  vulkan-tools-1.3.262.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
new file mode 100644
index 0000000000..68f7c1c04d
--- /dev/null
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# vulkan-tools
+#
+################################################################################
+
+VULKAN_TOOLS_VERSION = $(VULKAN_HEADERS_VERSION)
+VULKAN_TOOLS_SITE = $(call github,KhronosGroup,Vulkan-Tools,v$(VULKAN_TOOLS_VERSION))
+VULKAN_TOOLS_LICENSE = Apache-2.0
+VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt
+
+VULKAN_TOOLS_DEPENDENCIES = \
+	vulkan-headers \
+	vulkan-loader
+
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_CUBE=OFF \
+	-DBUILD_ICD=OFF \
+	-DBUILD_VULKANINFO=ON \
+	-DINSTALL_ICD=OFF
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+VULKAN_TOOLS_DEPENDENCIES += directfb
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+VULKAN_TOOLS_DEPENDENCIES += libxcb
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=ON \
+	-DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=OFF \
+	-DBUILD_WSI_XLIB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+VULKAN_TOOLS_DEPENDENCIES += wayland
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
