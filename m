Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B683C07548
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 10:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF23A42153;
	Wed, 15 Nov 2023 10:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF23A42153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nit297nj6xCr; Wed, 15 Nov 2023 10:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C7442098;
	Wed, 15 Nov 2023 10:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C7442098
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4251BF307
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ECEF60701
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ECEF60701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pALeQbO_XHOm for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 10:02:53 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0630A6062F
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 10:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0630A6062F
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f87b1c725so4566785f8f.3
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 02:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700042571; x=1700647371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zHitaU77fEnkMjfADwY6kADrcuTNuToTu5PUvwq5nX8=;
 b=jTkUuxP9tQOXXzHYHLcjtQGa3WIgEwGHsOYspCB1n+tVW+j9zgDytEXy67F/r85n6i
 KcdKwbmlnVlSoSTK/30CYhxHsX6UUl1N0+QcYmIqjEYeXr2zHqwJbDLAsAdNLcE3WlIS
 zRN/lb05PksaqSEXwIBnfwimAQTW/Ok4VCeXAAYXHz42XCuQF3cYnOsUKz9M/mqjzXMy
 btGSICuEbOyNHltc43pWbRtpXfMHdNCrCcH2Q5vXGUEo++n8kfj320GgCd0Rif7VIhPC
 gbrbROw/RyiwKTinaHe8olK+5+s/VHQdDGg4svl+NplWYmZKtJWNMQnxsuKErpyCsPZt
 lGjQ==
X-Gm-Message-State: AOJu0YyExhQrXSlW39SrJxOptpyMcnEkD9OxLTCJoUKJFSlu6WCq1kED
 aWm5gO12rwvlziBwQPDVyUI=
X-Google-Smtp-Source: AGHT+IEfVM5lqHN6QbTdrFnXzq9ePDvGBxpa1LV9xFRt7h14snkPSjCi61AyIBEVXSJB7jTcu62hVA==
X-Received: by 2002:adf:f20d:0:b0:32f:914e:427f with SMTP id
 p13-20020adff20d000000b0032f914e427fmr7551984wro.16.1700042571071; 
 Wed, 15 Nov 2023 02:02:51 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600011d000b0033134ab9691sm10027058wrx.57.2023.11.15.02.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 02:02:50 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Wed, 15 Nov 2023 11:02:17 +0100
Message-ID: <20231115100222.29685-2-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115100222.29685-1-bstruempfel@ultratronik.de>
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700042571; x=1700647371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHitaU77fEnkMjfADwY6kADrcuTNuToTu5PUvwq5nX8=;
 b=Eg+4W1hMxm8iDc55Y6xbQB/AOWMwctOfVQZdBtltPJR9RkMaR9/6NNlH0bePgYVuEQ
 VOnUHOsdg+mPmzi0yV1ed6/fBKVurN6zkAl1q7OEmS5fyfh8GJr+eiddob4t9LzctPkq
 swBZefVr5hkuCvzT0ygtqqnkefTszsBNKIbcVs8Wp/T3R7cZDP94WJgm+522L2GWNIUB
 dSwCF8pyQd65BRaStZMIFz06XeNYUfGlr51ZuWkuXHDMu+KdiyeCiziEG2/DswcUlwG6
 NLbYzpHMYirBXMbnu00U2fMOOTKIKboZR8wNosDtxyi7S/1EmGkWUFIQF7llvgbhEPi9
 EU5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Eg+4W1hM
Subject: [Buildroot] [PATCH 1/2] package/libgpiod2: new package
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Boerge Struempfel <boerge.struempfel@gmail.com>

Due to a significant api change as well as more recent kernel version
requirements, we introduce a separate package for version 2.0 and higher. The new
package is incompatible to libgpiod 1.x. This allows for iteratively
updating all dependent packages without breaking anything as a result.

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
---
 package/Config.in                |  1 +
 package/libgpiod2/Config.in      | 24 +++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  4 +++
 package/libgpiod2/libgpiod2.mk   | 44 ++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..33d4ef3baa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1718,6 +1718,7 @@ menu "Hardware handling"
 	source "package/libftdi1/Config.in"
 	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
+	source "package/libgpiod2/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
new file mode 100644
index 0000000000..289bcdd373
--- /dev/null
+++ b/package/libgpiod2/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_LIBGPIOD2
+	bool "libgpiod2"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on !BR2_PACKAGE_LIBGPIOD
+	help
+	  This is a C library that abstracts the GPIO character
+	  device operations on linux.
+
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
+
+if BR2_PACKAGE_LIBGPIOD2
+
+config BR2_PACKAGE_LIBGPIOD2_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing GPIOs.
+
+endif
+
+comment "libgpiod2 needs kernel headers >= 5.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+
+comment "consider switching to libgpiod2"
+	depends on BR2_PACKAGE_LIBGPIOD
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
new file mode 100644
index 0000000000..d257ccaf7d
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.hash
@@ -0,0 +1,4 @@
+# From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
+sha256  c3c923dc63b7b1b02639c9179c81e3d9febf0887bbaa59775990229cdbedb88b  libgpiod-2.0.2.tar.xz
+# Hash for license file
+sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
new file mode 100644
index 0000000000..a7d4759092
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# libgpiod2
+#
+################################################################################
+
+# Be careful when bumping versions.
+# Dependency on kernel header versions may change.
+LIBGPIOD2_VERSION = 2.0.2
+LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
+LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
+LIBGPIOD2_LICENSE = LGPL-2.1+
+LIBGPIOD2_LICENSE_FILES = COPYING
+LIBGPIOD2_INSTALL_STAGING = YES
+LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
+# We're patching configure.ac
+LIBGPIOD2_AUTORECONF = YES
+LIBGPIOD2_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+LIBGPIOD2_CONF_OPTS = --disable-tests --disable-examples
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
+LIBGPIOD2_CONF_OPTS += --enable-tools
+else
+LIBGPIOD2_CONF_OPTS += --disable-tools
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-python
+LIBGPIOD2_DEPENDENCIES += python3
+LIBGPIOD2_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python3 \
+	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-python
+endif
+
+$(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
