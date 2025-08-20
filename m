Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C26ECA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C9A40D1D;
	Wed, 20 Aug 2025 16:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_-U2swssCew; Wed, 20 Aug 2025 16:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A2B40D94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A2B40D94;
	Wed, 20 Aug 2025 16:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06023DE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0369140B6D
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EI6fPdCul5S for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3AA440704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3AA440704
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3AA440704
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45b4a25ccceso327595e9.3
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 09:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755707967; x=1756312767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WzUMIDsee4pfNQ88DhjAoOKJiYiy7E0XniZXWugnKqo=;
 b=eFiV/a0PIZO5eVvWRd4fYzGpeLNQm5xBYo/T5OWBRm64nOKzhs/Kd0WoIJwlUlM1R5
 E6E4m8OBjlij4oADwgdqx2WoP0IbaNWT32eLLHft/8DAahpnfV6jlj1DORrALAFpu9FQ
 oLME4K/0TOxEQbvtTXBJt0V+TMjSC0hPyao3gl1ATCq2OOUzk9VEY+nPsIFVzcsXCCWY
 GR74qzxpgFUnSe10Ztjb3NOaLm8mimKMW8cgbRLTQ+mXcB/aui7fjkzyqxr7/Jrc5ZqB
 RXK83IBXcRbcG3rJ6fS1W/EvjtKd/loiilxiRtiVT+E1h7uKdt2nJGB6OIs+34TlxuBJ
 q4qA==
X-Gm-Message-State: AOJu0Yy6d5RFNFHgYQnfE2lnIt7FCB92rSKMgMVmGgPOf+AUFxDPiNba
 42hwNqwApECjdaYaJGrhrUKRWnz3eLIKda8w0DGIdS6iM4OceKJg9lR+KWFgXcGg
X-Gm-Gg: ASbGncsqMiXmhgz8AivP82r+TEtE4a7XPjpPR9+clSwZkaTMlhBYAetETP7TtsZ3s/E
 eRJkyVyu47OGjLVjlQED1A+NucA+1xVCd5LHI2y8Yeyzy+kcCbyicrOGIwvfEXnsDPFmxeDLETA
 9je8DSpfJqohdNiaUWgUT1DtojJ9X44zBddiifUEKshsj72NA1xkzmA8iH4ImaeWeIaQLCwTYDA
 W59i05sBfCytp/3thCB3ltI7p62utZC2j4KvzCF9IVbm5PqB2bx0bzJwMA2RSjx7uPcBfuC/3Gm
 ecqd7hKmK8XaqdSd99y2sbmOx2c+xE9fdK2DJeQm0DnF6/ZfJemv9m3ny6KMBUvwilBsBSbaki7
 JHStdwRWQiWgHD2S7bspfZB8kRXxinwVLxgZR3DnFvZUCyw==
X-Google-Smtp-Source: AGHT+IFscBUqw000cTHw8JaiDbPrG3+l/nEUCI7JoYx6NFk1PIomLNvrxYLsCNPc8sziob+nD/DQrw==
X-Received: by 2002:a05:600c:4f0c:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-45b4798a7bdmr31100845e9.7.1755707966457; 
 Wed, 20 Aug 2025 09:39:26 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c6d857sm37412195e9.26.2025.08.20.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:39:26 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 18:39:19 +0200
Message-Id: <20250820163921.1968030-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755707967; x=1756312767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WzUMIDsee4pfNQ88DhjAoOKJiYiy7E0XniZXWugnKqo=;
 b=KKmg8p/mxJ9WRGgybFJbKXNWo64e7IxyxQUDXcEibKTZE2dLE/Zs2c/JWn6ZeHomj/
 qiJcfhIX/IMpMbbZ7huvP1AQvcjDxdIhF7s1gNkck4KbHPrg2DgCLAujigpsnDk8YoVX
 FGhA4E6CGZkO5bl191S0UmioaKa23P/yBBGRABmV2HurAwB4GZ72m9+FSbh9HdNAZSDE
 JnWDqVl4X2jpx/xpchEggtNGQu+d3D42hNW4pOzsJ5Sfd0qlE9CbA8LvqQj8j5pFbSXP
 7qI5rGm1REPvEFPwL4ehcFNQR3Vm9BRU6yjgyFsq8eBmfMT/kbJDz055k9AFPi36J1jm
 P9ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KKmg8p/m
Subject: [Buildroot] [PATCH 2/4 v2] package/libcupsfilters: new package
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

Newer versions of cups-filters split several parts of the main software
into external libraries. This is the main filters library.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/libcupsfilters/Config.in           | 34 ++++++++
 package/libcupsfilters/libcupsfilters.hash |  3 +
 package/libcupsfilters/libcupsfilters.mk   | 93 ++++++++++++++++++++++
 5 files changed, 132 insertions(+)
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 875406610e..bc8816c8aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -220,6 +220,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libcupsfilters
 F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..68a8f96e23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,6 +352,7 @@ comment "Graphic libraries"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libcupsfilters/Config.in"
 	source "package/libglvnd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
diff --git a/package/libcupsfilters/Config.in b/package/libcupsfilters/Config.in
new file mode 100644
index 0000000000..e664869a41
--- /dev/null
+++ b/package/libcupsfilters/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_LIBCUPSFILTERS
+	bool "libcupsfilters"
+	# needs fork()
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP # qpdf
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_PACKAGE_CUPS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_QPDF
+	help
+	  This project provides backends, filters, and other software
+	  that was once part of the core CUPS distribution but is no
+	  longer maintained by Apple Inc.
+	  This package provides the libcupsfilters library, which in
+	  its 2.x version contains all the code of the filters of the
+	  former cups-filters package as library functions,
+	  the so-called filter functions.
+
+	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/libcupsfilters
+
+comment "libcupsfilters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 5"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libcupsfilters/libcupsfilters.hash b/package/libcupsfilters/libcupsfilters.hash
new file mode 100644
index 0000000000..c1d2253229
--- /dev/null
+++ b/package/libcupsfilters/libcupsfilters.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  ff31778a438bf335ceed254ccc706d5cd0eee55f608fcf567d88699b15f4fa9e  libcupsfilters-2.1.1.tar.gz
+sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/libcupsfilters/libcupsfilters.mk b/package/libcupsfilters/libcupsfilters.mk
new file mode 100644
index 0000000000..9cf449ac8d
--- /dev/null
+++ b/package/libcupsfilters/libcupsfilters.mk
@@ -0,0 +1,93 @@
+################################################################################
+#
+# libcupsfilters
+#
+################################################################################
+
+LIBCUPSFILTERS_VERSION = 2.1.1
+LIBCUPSFILTERS_SITE = https://github.com/OpenPrinting/libcupsfilters/releases/download/$(LIBCUPSFILTERS_VERSION)
+LIBCUPSFILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
+LIBCUPSFILTERS_LICENSE_FILES = COPYING
+LIBCUPSFILTERS_CPE_ID_VENDOR = linuxfoundation
+LIBCUPSFILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
+LIBCUPSFILTERS_INSTALL_STAGING = YES
+
+LIBCUPSFILTERS_CONF_OPTS = \
+	--disable-mutool \
+	--disable-foomatic \
+	--disable-braille \
+	--enable-imagefilters \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-pdftops=pdftops \
+	--with-jpeg \
+	--with-test-font-path=/dev/null \
+	--without-rcdir
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-png
+LIBCUPSFILTERS_DEPENDENCIES += libpng
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-tiff
+LIBCUPSFILTERS_DEPENDENCIES += tiff
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-dbus
+LIBCUPSFILTERS_DEPENDENCIES += dbus
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
+LIBCUPSFILTERS_DEPENDENCIES += avahi
+LIBCUPSFILTERS_CONF_OPTS += --enable-avahi
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+LIBCUPSFILTERS_DEPENDENCIES += ghostscript
+LIBCUPSFILTERS_CONF_OPTS += --enable-ghostscript
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-ghostscript
+endif
+
+ifeq ($(BR2_PACKAGE_IJS),y)
+LIBCUPSFILTERS_DEPENDENCIES += ijs
+LIBCUPSFILTERS_CONF_OPTS += --enable-ijs
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-ijs
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+LIBCUPSFILTERS_DEPENDENCIES += poppler
+LIBCUPSFILTERS_CONF_OPTS += --enable-poppler
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-poppler
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-exif
+LIBCUPSFILTERS_DEPENDENCIES += libexif
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-exif
+endif
+
+define LIBCUPSFILTERS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
+		$(TARGET_DIR)/etc/init.d/S82cups-browsed
+endef
+
+define LIBCUPSFILTERS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 $(@D)/utils/cups-browsed.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/cups-browsed.service
+endef
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
