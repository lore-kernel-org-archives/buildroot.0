Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A99C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724CE60711;
	Sat, 13 Jul 2024 09:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbjQ9IrwK8ls; Sat, 13 Jul 2024 09:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F138061389
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F138061389;
	Sat, 13 Jul 2024 09:37:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1401BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA21418CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9tsks0TkhWd for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D968C41885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D968C41885
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D968C41885
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266fd39527so20028175e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863447; x=1721468247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UJHwxpf7LX9p31p9y8wg51iFYplqSERuqN5b+dKH18=;
 b=uPIE9L/O6Rzp9XBklY6I5gdO9BxELH4BwF8NoVpG4eo7YWnHusa/CWI4PTPplUZMtj
 OYfqJWUisJT1XgTEPyxEsz0OMBq67SfhHt+BOnPvoDYtVfVVIm+OvHpzqAYSxkkeWfUd
 W9kdn3CkMb1acOHe+TmQP3UqVtg01yWr930hX3XcH9xLUs8saBnd9l3d+mzwFCe/Beoy
 a2iqAike+YUp1/IWMONyoyZLyp06jGi0zasXtCD0LwUbfKlm4OQ8HD1LY5M1Ad8v5Mcl
 hcDe3TBOGbWDhzb5hU5NKTNJ8F65Lqy0T9hhB6xkV5dtdPTbVzMyXYjQVj3a6bL+/ok2
 vdWA==
X-Gm-Message-State: AOJu0YwyDlNfLAfbMbbqO212Cbwnocgs5hwDwYFBCIMDNMMywI4saRDB
 8eHCb8UzKnpeIATZfoUwGKKHQmveBc16y+kkPNQuDjtToaENyG+ZihX4Bd73DtNCYuLPw6IKb/5
 P
X-Google-Smtp-Source: AGHT+IFtUckpM0KzELyYBjRpvRfkrTC60wo5nkpx99Qu3HguZrvuSspLfcXLAeALOqRf1qy39enHwg==
X-Received: by 2002:a7b:c4d9:0:b0:426:5c34:b19b with SMTP id
 5b1f17b1804b1-426707d79dfmr81230715e9.20.1720863447357; 
 Sat, 13 Jul 2024 02:37:27 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:36:57 +0200
Message-Id: <20240713093700.13981-5-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863447; x=1721468247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UJHwxpf7LX9p31p9y8wg51iFYplqSERuqN5b+dKH18=;
 b=Lr7jM+moG6ptLC8W6BbmynGqJI5Epfs3RY3seak9SFFEvkaojySI4vFJCtwV4hdQ95
 FU4bwRe9VrRbXj/7JVfvn6TvcGvaZrKdw9p9+uaGEleoc85WjssER8QYmbO+aZ86lQ1w
 EH+Yb+H0AVi/Wyzq9Y0XORcqDMxTJomCLrWvU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Lr7jM+mo
Subject: [Buildroot] [PATCH 4/7] package/opencl-icd-loader: new package
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
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this package it is possible to have multiple implementations of
OpenCL at the same time. This package provides a libOpenCL.so file that
captures the OpenCL API calls and forwards them to the correct
implementation of OpenCL. OpenCL implementations can be manually
registered by creating a file containing its full file path in
/etc/OpenCL/vendors/<implementation>.icd[1]

When this package is selected, Clover must be built in icd mode so
it does not override libOpenCL.so installed by this package.

This package and OpenCL-Headers package releases are made at
simultaneously to match OpenCL specifcation releases [2][3].
This is the reason why this package depends on OpenCL-Headers
and not mesa3d CL headers as nothing guarantees that they
supports last version of OpenCL specification.

[1]: https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds
[2]: https://github.com/KhronosGroup/OpenCL-Headers/releases
[3]: https://github.com/KhronosGroup/OpenCL-ICD-Loader/releases

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/Config.in                             |  1 +
 package/mesa3d/mesa3d.mk                      | 11 +++++++---
 package/opencl-headers/opencl-headers.mk      |  1 +
 package/opencl-icd-loader/Config.in           | 12 +++++++++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 +++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 20 +++++++++++++++++++
 6 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk

diff --git a/package/Config.in b/package/Config.in
index 7351da5e84..b3adfc4db3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1711,6 +1711,7 @@ menu "Graphics"
 	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencl-headers/Config.in"
+	source "package/opencl-icd-loader/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce460c4475..2cb8f3a2c8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -50,12 +50,17 @@ else
 MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
-# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
-# libMesaOpenCL and CL headers are installed
 ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
 MESA3D_PROVIDES += libopencl
-MESA3D_DEPENDENCIES += clang libclc
+MESA3D_DEPENDENCIES += clang libclc opencl-headers
+ifeq ($(BR2_PACKAGE_OPENCL_ICD_LOADER),y)
+MESA3D_CONF_OPTS += -Dgallium-opencl=icd
+MESA3D_DEPENDENCIES +=  opencl-icd-loader
+else
+# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
+# libMesaOpenCL and CL headers are installed
 MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
+endif
 else
 MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
 endif
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
index fd047f2fad..a32ef1b863 100644
--- a/package/opencl-headers/opencl-headers.mk
+++ b/package/opencl-headers/opencl-headers.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update opencl-icd-loader
 OPENCL_HEADERS_VERSION = 2024.05.08
 OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
 OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
new file mode 100644
index 0000000000..405dc5401a
--- /dev/null
+++ b/package/opencl-icd-loader/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OPENCL_ICD_LOADER
+	bool "OpenCL-ICD-Loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	select BR2_PACKAGE_OPENCL_HEADERS
+	help
+	  OpenCL defines an Installable Client Driver (ICD) mechanism to
+	  allow developers to build applications against an Installable
+	  Client Driver loader (ICD loader) rather than linking their
+	  applications against a specific OpenCL implementation.
+
+	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
new file mode 100644
index 0000000000..1c894f1293
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -0,0 +1,3 @@
+# locally generated
+sha256  af8df96f1e1030329e8d4892ba3aa761b923838d4c689ef52d97822ab0bd8917  OpenCL-ICD-Loader-2023.12.14.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
new file mode 100644
index 0000000000..d4fd6cd754
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# opencl-icd-loader
+#
+################################################################################
+
+# When updating the version, please also update opencl-headers
+OPENCL_ICD_LOADER_VERSION = 2023.12.14
+OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
+OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
+OPENCL_ICD_LOADER_LICENSE = Apache-2.0
+OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
+OPENCL_ICD_LOADER_INSTALL_STAGING = YES
+
+OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
+
+OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
