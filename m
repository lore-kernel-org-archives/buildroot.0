Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77026CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE86403AD;
	Tue, 19 Aug 2025 15:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owEASDX5KcF7; Tue, 19 Aug 2025 15:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45430403DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45430403DC;
	Tue, 19 Aug 2025 15:08:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C933E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A2AE60A70
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Xvrtn8veMD0 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B1B660A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1B660A6B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B1B660A6B
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b0b6ac4so28145755e9.2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616123; x=1756220923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hP+f+HnsHv8pPlpPCQFc+7lGZdbc2WtfVusVSuJgovo=;
 b=MTLMeAG4ANbggUCFaKBg3xm/dXeDGjiW4dFrosvAUiIqYIFmQ2ZWIyDokmSFUclsiI
 x5ZA/SgmcFJ3fPCV+TYizDIj0lR4vS5cG7Xy1b3fwOIIIc+qD1YVJUVZUqBuUU/eU5DE
 EHvhy46vXKxKdJdYFkXxBXgrUtzeG2Mq4jrHpzMXsWRbtJVDF9yPSnNQKeOUEt9dDNeZ
 pekwLSHIEpNlFNqiFBXuq6k7TKxDdHrLlGgx4ZIkEcp9rclFdKtkbuBO+yuhOiVzmFWJ
 HCcsco8X6i2bOBJ7YLHM6xvHLQWgRZBnt+ums1lrrjvsSLB+Rw2d4kMMnIuDtebUMoUQ
 95MA==
X-Gm-Message-State: AOJu0Yy9uGLZ8bPfAHf+1QevdfdDyhDj98xa80K8oi+hXW2Zyl0jBTUh
 rztcLWcbs59Vt7XKj2zw2Zg8XoOTHGoykAHu+l/o1Y1tm/dJV4nxGl58i1NbMw92
X-Gm-Gg: ASbGncsb9Lp8xw3wfFpiQ40/l1/YFswwE36QHKucCbb1FVsyZM+5YAd+HQCUa9Bg3UO
 x9bD9cuJmL4O+AAgC/378Zr/HN59fM3c18Jzo7M2huadfR7TgCiRItM7wMR4znvelMEE3fXuPVj
 KvNOjQv564+vBL+nXRgHM0H1dRiXOCKPf7wfCjHycvLUiD4uup9YMI97C6B6o3AXlLNYQdV35eI
 bM6O/SEhiXbAxydv9iZu7NCQVpB3B96jDxu05A1ItlV4QFKMIA3VklkvUAwH2G9p4FoFBXDVqYQ
 UrZzp31ILoJaTNuq+X2Ns5GefKOmUrUQdfqX/6Ar9N1B2ooe89PVtIZ2pfzePplvrj3LNJ/rbtp
 Ej6cqdsxJ3MIVB8ePbxH3P2jnAycIxInvkU+SiyvUyPxWTiZPPKjY7Dcp
X-Google-Smtp-Source: AGHT+IHtl7OwWxB/eUvxKdgQQIa/EM4x4jlyYeXNFVF+51p1CB3Pqsv4xvbG2WPf8OU6eP9nbaxfrg==
X-Received: by 2002:a05:600c:4e91:b0:458:7005:2ac3 with SMTP id
 5b1f17b1804b1-45b43dff1e0mr26139705e9.21.1755616122462; 
 Tue, 19 Aug 2025 08:08:42 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm216675995e9.0.2025.08.19.08.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 08:08:42 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 17:08:31 +0200
Message-Id: <20250819150834.1651775-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755616123; x=1756220923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hP+f+HnsHv8pPlpPCQFc+7lGZdbc2WtfVusVSuJgovo=;
 b=TLY+9yPUcSZngq4XtycvGUjOUdSkdO27xvnKqkDvuCoBjHvvR9K0m9aOMSxaV4HkdQ
 YrjznFEqF4cnXL1VAWMj235dC4alWsNrE6zRnFoQ/Mdb997Zp8dztBg5++QEr3yWSbFL
 N+JvG9ZXZXl8Jl6dsBXJFbSevJDr8ry4eQkappURkLvgxfJ/s8WqaMIaQxV/uI/el/HQ
 VYgBgZUegqhLvkGxtRk6e2D80LOdy+mxwUg5RgyE2iVpVBypYVrXaf21y5+Rqwem59Bg
 NSdR1iUA43D75ka/vK1TKwhVhN4g9snKkKah3A/De1YxPox88xi5b23p7awhJX//O0V5
 Hz3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TLY+9yPU
Subject: [Buildroot] [PATCH 2/5] package/libcupsfilters: new package
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
 package/libcupsfilters/Config.in           | 34 ++++++++
 package/libcupsfilters/libcupsfilters.hash |  3 +
 package/libcupsfilters/libcupsfilters.mk   | 93 ++++++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8f797d2c0..03576dce50 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -220,6 +220,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libcupsfilters
 F:	package/libdill/
 F:	package/libppd/
 F:	package/mender/
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
