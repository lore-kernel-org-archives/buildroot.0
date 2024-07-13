Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB63C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BC660EAB;
	Sat, 13 Jul 2024 09:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRycP36zy31K; Sat, 13 Jul 2024 09:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8453160FDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8453160FDD;
	Sat, 13 Jul 2024 09:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4080B1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 398CC418CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9i05Ls9WMIU for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7839641886
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7839641886
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7839641886
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so18833155e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863447; x=1721468247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hfeLk+NLNSP/H59DdcmMbBSjWfkTZ1shGGXeIgL8imc=;
 b=ImXlEKHCcoJZ5fODVKsJe5WvFpkBQClAaimU/WVaFIV7yD1dUjJbwZt8hYYMExX7BH
 QC6vmXMGhlscnGD4qf7IxxA99zT8kSeSqnvwOEAhY0WiV3DOTSE3KdmLIVrHKVL67drZ
 Mm3hyDrMAOetnOEDujzfyOV6CPd2tBbGSpSe6rTt5Zk0hp3DvqhZ5Sx9dJ3A/fcP0vyu
 4zjAE//INSQCkO+k+ju9ruMJiaLsNVi8F1ThVpN7qhLg5wy/rSX6kbIwE+XXgF/z4I3b
 MvoCj3L3Bo+SHhIOWcOSRzEQWSM0hXs/JURnjcPrYrDV+Ed9ilXwSUcCOP1YCra14cRl
 IbyA==
X-Gm-Message-State: AOJu0YwFHRAuws+O3gjUrhJfbe+Nc502WyFARpU/wo+2DVWuoTVrRYKE
 my/gVYTveYcdovuLMeAE6md6fEY9xmQONWt1Pp4mhmmKEiy7YI5PKu9C1ZDUFmUKkybnPv9+8a5
 v
X-Google-Smtp-Source: AGHT+IFNw7p1UYlVAmX26DRp2eDl5yEH5g/cq9Dn0kYdxLWiWCb2lu+Ukfq3g+G+g7Em1ETtFoYomA==
X-Received: by 2002:a05:600c:35c4:b0:427:9a8f:9717 with SMTP id
 5b1f17b1804b1-4279a8f9a60mr56921955e9.0.1720863446742; 
 Sat, 13 Jul 2024 02:37:26 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:36:56 +0200
Message-Id: <20240713093700.13981-4-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863447; x=1721468247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hfeLk+NLNSP/H59DdcmMbBSjWfkTZ1shGGXeIgL8imc=;
 b=PZ3OwitAgCbP+JCy4nfqc1oSys8K9ddQnGZqjOLlD0MbVAjR5T3RRGim6Yhh4/wZlC
 zargtYAUVLWJzNLgoNrQ+bRe3B07Qxtrgw2UVpNdch6TtbFZUaPV4y/uaAtQuM4q6YSK
 hANBiNz5SHMpO0GNFqaS+eAFyFc14PmF5JDTY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=PZ3OwitA
Subject: [Buildroot] [PATCH 3/7] package/opencl-headers: new package
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

From: Sebastian Weyer <sebastian.weyer@smile.fr>

These headers provide the C language API headers. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader [1].

Adding opencl-icd-loader is impossible because mesa OpenCl-header
verison is too old. Indeed, mesa CL headers are not updated often and
not include the last OpenCL specification releases [2][3].

Mesa allow the use of external OpenCL-headers in some cases [4].
The CL headers installed by mesa regroups the opencl api headers [5] and
the opencl api C++ bindings [6]. They are fetched from the official
repositories manualy by mesa maintainers [7]. Those headers must be
backward compatible [8]. Thus it is possible to use them instead of mesa
CL headers to support newer version of OpenCL.

A new patch have been added to prevent the installation of OpenCL
headers by Mesa3d.

Dependencies on OpenCL-headers package have been added when an
implementation of OpenCL is selected.

[1]: https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies
[2]: https://github.com/KhronosGroup/OpenCL-ICD-Loader/releases
[3]: https://gitlab.freedesktop.org/mesa/mesa/-/commits/main/include/CL
[4]: https://gitlab.freedesktop.org/mesa/mesa/-/blob/24.0/include/meson.build#L133
[5]: https://github.com/KhronosGroup/OpenCL-Headers
[6]: https://github.com/KhronosGroup/OpenCL-CLHPP
[7]: https://gitlab.freedesktop.org/mesa/mesa/-/blob/24.0/bin/khronos-update.py
[8]: https://registry.khronos.org/OpenCL/specs/3.0-unified/html/OpenCL_API.html#_version_numbers

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/Config.in                             |  1 +
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...emove-the-installation-of-CL-headers.patch | 71 +++++++++++++++++++
 package/opencl-headers/Config.in              |  7 ++
 package/opencl-headers/opencl-headers.hash    |  3 +
 package/opencl-headers/opencl-headers.mk      | 22 ++++++
 6 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 package/mesa3d/0008-include-remove-the-installation-of-CL-headers.patch
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk

diff --git a/package/Config.in b/package/Config.in
index f7b14c57b9..7351da5e84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1710,6 +1710,7 @@ menu "Graphics"
 	source "package/menu-cache/Config.in"
 	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
+	source "package/opencl-headers/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 33c60b285f..def93c3dd3 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -61,7 +61,7 @@ MESA3D_HEADERS_DIRS += GLES GLES2
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBOPENCL),y)
-MESA3D_HEADERS_DIRS += CL
+MESA3D_HEADERS_DEPENDENCIES += opencl-headers opencl-clhpp
 endif
 
 define MESA3D_HEADERS_BUILD_CMDS
diff --git a/package/mesa3d/0008-include-remove-the-installation-of-CL-headers.patch b/package/mesa3d/0008-include-remove-the-installation-of-CL-headers.patch
new file mode 100644
index 0000000000..c0cbce0d12
--- /dev/null
+++ b/package/mesa3d/0008-include-remove-the-installation-of-CL-headers.patch
@@ -0,0 +1,71 @@
+From 619f806413c60583ba5e3f88f6ef16a60d1958e4 Mon Sep 17 00:00:00 2001
+From: Antoine Coutant <antoine.coutant@smile.fr>
+Date: Wed, 28 Feb 2024 16:04:21 +0100
+Subject: [PATCH] include: remove the installation of CL headers
+
+The CL headers installed by mesa are old and
+does not support the last versions of OpenCL.
+
+In buildroot, instead of using mesa CL headers
+use official headers from Khronos. Moreover,
+the OpenCL headers are backward compatible.
+See:
+https://github.com/KhronosGroup/OpenCL-Headers#compatibility-notes
+
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+---
+ include/meson.build                       | 28 -----------------------
+ src/gallium/frontends/rusticl/meson.build |  1 -
+ 2 files changed, 29 deletions(-)
+
+diff --git a/include/meson.build b/include/meson.build
+index a955ac71073..18f5f2d259e 100644
+--- a/include/meson.build
++++ b/include/meson.build
+@@ -110,31 +110,3 @@ if with_gallium_st_nine
+   )
+ endif
+ 
+-opencl_headers = files(
+-  'CL/cl.h',
+-  'CL/cl.hpp',
+-  'CL/cl2.hpp',
+-  'CL/cl_d3d10.h',
+-  'CL/cl_d3d11.h',
+-  'CL/cl_dx9_media_sharing.h',
+-  'CL/cl_dx9_media_sharing_intel.h',
+-  'CL/cl_egl.h',
+-  'CL/cl_ext.h',
+-  'CL/cl_ext_intel.h',
+-  'CL/cl_gl.h',
+-  'CL/cl_gl_ext.h',
+-  'CL/cl_icd.h',
+-  'CL/cl_platform.h',
+-  'CL/cl_va_api_media_sharing_intel.h',
+-  'CL/cl_version.h',
+-  'CL/opencl.h',
+-  'CL/opencl.hpp',
+-)
+-# Only install the headers if we are building a stand alone implementation and
+-# not an ICD enabled implementation
+-if with_gallium_opencl and not with_opencl_icd
+-  install_headers(
+-    opencl_headers,
+-    subdir: 'CL'
+-  )
+-endif
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
+index eb87dad2659..e157377404c 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -162,7 +162,6 @@ cl_c_args = [
+ rusticl_opencl_bindings_rs = rust.bindgen(
+   input : [
+     'rusticl_opencl_bindings.h',
+-    opencl_headers,
+   ],
+   output : 'rusticl_opencl_bindings.rs',
+   include_directories : [
+-- 
+2.34.1
+
diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
new file mode 100644
index 0000000000..092d8a2a4d
--- /dev/null
+++ b/package/opencl-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPENCL_HEADERS
+	bool "opencl-headers"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	help
+	  C language headers for the OpenCL API
+
+	  https://github.com/KhronosGroup/OpenCL-Headers
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
new file mode 100644
index 0000000000..928bcfb30b
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  3c3dd236d35f4960028f4f58ce8d963fb63f3d50251d1e9854b76f1caab9a309  OpenCL-Headers-2024.05.08.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..fd047f2fad
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+OPENCL_HEADERS_VERSION = 2024.05.08
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/CL
+	$(INSTALL) -D -m 0644 $(@D)/CL/* \
+		$(STAGING_DIR)/usr/include/CL
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
