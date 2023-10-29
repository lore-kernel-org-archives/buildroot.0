Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D29C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 23:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C6E84F5E;
	Sun, 29 Oct 2023 23:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C6E84F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXCV1Vv4_Bmc; Sun, 29 Oct 2023 23:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B66C0852C0;
	Sun, 29 Oct 2023 23:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B66C0852C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAF9E1BF3EE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B518201B
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B518201B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEB_dcElpU4n for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 23:40:15 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32DAA82015
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 23:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32DAA82015
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35748b32d73so15654895ab.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 16:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698622814; x=1699227614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHF0kraCtLVqa7h3agg76Iy8jXA/GOfry+udbV5bQ1A=;
 b=YCy5/JPJkp9n6Y/tzFhDBFqGNtPwEDSlpUEoB9+7Y8RCzBQn0YMrvrx7skRWjRYSQK
 4NQheGZ+vJgn+0T0m1L3vIMyEBfSMc9MsWH7bVO1U57FVkD1mZlaEuoUrGSIwscjT6u1
 b1ke5vTA0DD0B2+KaujGFv2IwPORHxFfseyRzc24TMPJRvhK11hP7st3g4zhcTOw4EDz
 dKZ20PfLP8fU31aJrTXoYiz/Vlod+oaQhU8082fwWvJzS0dd2r5LHDPtiPz9132nWq/W
 INBP5PScaESykRZbco0o3dNc1KgCjWafd78VPC7rgXQkAS/FZUNiPUcjawXScOa2sno3
 uPTA==
X-Gm-Message-State: AOJu0Yx33POVl2nDLNxBu3zJf2Ufpa9PEA6TQ8g43LrhUAd0YtneNN2q
 JaoW6NInqN9jaoQsELal7FPyr5vm6PA=
X-Google-Smtp-Source: AGHT+IHBuZNQHspU7hfn51lSYnmY92rakcqyy/CvLmhZ6bppaL7OnZvKnnc3CqXMD0mCj9b0jwkUFg==
X-Received: by 2002:a05:6e02:1526:b0:357:f72d:ad1d with SMTP id
 i6-20020a056e02152600b00357f72dad1dmr10814679ilu.30.1698622813833; 
 Sun, 29 Oct 2023 16:40:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 j16-20020a056e02015000b00357e53527afsm2012478ilr.61.2023.10.29.16.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 16:40:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 17:40:03 -0600
Message-Id: <20231029234003.2606006-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029234003.2606006-1-james.hilliard1@gmail.com>
References: <20231029234003.2606006-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698622814; x=1699227614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHF0kraCtLVqa7h3agg76Iy8jXA/GOfry+udbV5bQ1A=;
 b=noFl7UDSGkL5UFIQrMUsCbSVkA/oDye6oegcVVR7nH00w4I5EvPVwb0klVoUOi5DRM
 +EI7F7nBjWcYUQfgOaGJEN7pUIZpnp+4RvATd1vW3P66k1csbC6lKqeGQUH3zRg/mZ4c
 /XIwhJmksLNdfP1hAuq6cH/vJT3Md22aJaFY3zfDNk9X1uPs3pn1YLXOYq+TkcZsHAfE
 bt12qeYxw9+DXUuLGL5IF2FAUYaKiflYG3DudobKM9ugp8pkgUU8ulrlS0VkS8SAHmeY
 MfCcsJ8j1PsAzC9IjCbIyFrgmVJbiOEAR0m7pPW9dYv+bzDYLJsWIpiIZrr1xBz5GVCJ
 iBeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=noFl7UDS
Subject: [Buildroot] [PATCH v4 4/4] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that setuptools and its dependencies are using pep517 we can
migrate the setuptools infrastructure itself to use the pep517
build frontend.

As part of this we need to migrate the all python packages using
_BUILD_OPTS to the new config settings format used by the pep517
build frontend.

As maturin and setuptools-rust are now both pep517 based we can
combine the PYO3 env variables.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v3:
  - rebase on master
  - combine setuptools-rust and maturin env variables
  - drop patch which is now upstream
---
 package/pkg-python.mk                      | 83 +++-------------------
 package/python-evdev/python-evdev.mk       |  4 +-
 package/python-lxml/python-lxml.mk         |  8 +--
 package/python-m2crypto/python-m2crypto.mk |  4 +-
 package/python-pillow/python-pillow.mk     | 35 +++++----
 package/python-psycopg2/python-psycopg2.mk |  5 +-
 package/python-pyzmq/python-pyzmq.mk       |  4 +-
 package/python-uvloop/python-uvloop.mk     |  6 +-
 8 files changed, 46 insertions(+), 103 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 28ee4cb85f..21c70df863 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -79,48 +79,6 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
 
-# Target setuptools-based packages
-PKG_PYTHON_SETUPTOOLS_ENV = \
-	$(PKG_PYTHON_ENV)
-
-PKG_PYTHON_SETUPTOOLS_CMD = \
-	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
-
-PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
-	--executable=/usr/bin/python \
-	--single-version-externally-managed
-
-PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
-	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-	--root=$(TARGET_DIR)
-
-PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
-	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-	--root=$(STAGING_DIR)
-
-# Host setuptools-based packages
-HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
-
-HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
-	--prefix=$(HOST_DIR) \
-	--root=/ \
-	--single-version-externally-managed
-
-# Target setuptools-rust-based packages
-PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
-	$(PKG_PYTHON_SETUPTOOLS_ENV) \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-
-# Host setuptools-rust-based packages
-HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
-	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
-	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -158,14 +116,14 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
-# Target maturin packages
-PKG_PYTHON_MATURIN_ENV = \
+# Target pyo3 packages
+PKG_PYTHON_PYO3_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
 	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 
-# Host maturin packages
-HOST_PKG_PYTHON_MATURIN_ENV = \
+# Host pyo3 packages
+HOST_PKG_PYTHON_PYO3_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV) \
 	$(HOST_PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
@@ -207,30 +165,10 @@ $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
-# Setuptools
-else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
-ifeq ($(4),target)
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
-else
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-endif
-$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
-$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
-else
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
-else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-endif
-$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
-$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
-endif
-else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
+else ifneq ($$(filter flit maturin pep517 setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_BASE_ENV = $$(PKG_PYTHON_MATURIN_ENV)
+ifneq ($$(filter maturin setuptools-rust,$$($(2)_SETUP_TYPE)),)
+$(2)_BASE_ENV = $$(PKG_PYTHON_PYO3_ENV)
 else
 $(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
 endif
@@ -238,8 +176,8 @@ $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_MATURIN_ENV)
+ifneq ($$(filter maturin setuptools-rust,$$($(2)_SETUP_TYPE)),)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PYO3_ENV)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 endif
@@ -299,7 +237,8 @@ $(2)_DEPENDENCIES += host-python-setuptools
 ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
 $(2)_DEPENDENCIES += host-python-setuptools-rust
 endif
-else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
+endif
+ifneq ($$(filter flit maturin pep517 setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 5cf62b5160..b509b43e8a 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -12,7 +12,7 @@ PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
 
 PYTHON_EVDEV_BUILD_OPTS = \
-	build_ecodes \
-	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
+	-C--build-option=build_ecodes \
+	-C--build-option=--evdev-headers=$(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
 
 $(eval $(python-package))
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 3ef3aabdbc..4454f5aa0c 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -28,11 +28,11 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 # python-lxml needs these scripts in order to properly detect libxml2 and
 # libxslt compiler and linker flags
 PYTHON_LXML_BUILD_OPTS = \
-	--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
-	--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+	-C--build-option=--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	-C--build-option=--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
 HOST_PYTHON_LXML_BUILD_OPTS = \
-	--xslt-config=$(HOST_DIR)/bin/xslt-config \
-	--xml2-config=$(HOST_DIR)/bin/xml2-config
+	-C--build-option=--xslt-config=$(HOST_DIR)/bin/xslt-config \
+	-C--build-option=--xml2-config=$(HOST_DIR)/bin/xml2-config
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 3c28fa3b0d..d95361e689 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -13,7 +13,9 @@ PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
 PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
 PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
+PYTHON_M2CRYPTO_BUILD_OPTS = \
+	-C--build-option=build_ext \
+	-C--build-option=--openssl=$(STAGING_DIR)/usr
 
 # 0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
 PYTHON_M2CRYPTO_IGNORE_CVES += CVE-2020-25657
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index d9f6fba861..f37218b7c4 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -14,61 +14,60 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
 PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
-PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS)
+PYTHON_PILLOW_BUILD_OPTS = -C--build-option=build_ext -C--build-option=--disable-platform-guessing
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
-PYTHON_PILLOW_BUILD_OPTS += --enable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-freetype
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += jpeg
-PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 PYTHON_PILLOW_DEPENDENCIES += lcms2
-PYTHON_PILLOW_BUILD_OPTS += --enable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-lcms
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-lcms
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 PYTHON_PILLOW_DEPENDENCIES += libxcb
-PYTHON_PILLOW_BUILD_OPTS += --enable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-xcb
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
-PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg2000
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg2000
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PYTHON_PILLOW_DEPENDENCIES += tiff
-PYTHON_PILLOW_BUILD_OPTS += --enable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-tiff
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_WEBP),y)
 PYTHON_PILLOW_DEPENDENCIES += webp
-PYTHON_PILLOW_BUILD_OPTS += --enable-webp
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webp
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-PYTHON_PILLOW_BUILD_OPTS += --enable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webpmux
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webpmux
 endif
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webp -C--build-option=--disable-webpmux
 endif
 
 $(eval $(python-package))
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index fa23c2814f..6eea825b1c 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -13,7 +13,8 @@ PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
 PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
 # Force psycopg2 to use the Buildroot provided postgresql version
 # instead of the one from the host machine
-PYTHON_PSYCOPG2_BUILD_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
-PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
+PYTHON_PSYCOPG2_BUILD_OPTS = \
+	-C--build-option=build_ext \
+	-C--build-option=--pg-config=$(STAGING_DIR)/usr/bin/pg_config
 
 $(eval $(python-package))
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 5792957eaf..1b7bceae5e 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -12,7 +12,7 @@ PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
 PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
-PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
+PYTHON_PYZMQ_BUILD_OPTS = -C--build-option=--zmq=$(STAGING_DIR)/usr
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
 define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
@@ -23,7 +23,7 @@ endef
 PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
-PYTHON_PYZMQ_BUILD_OPTS += --enable-drafts
+PYTHON_PYZMQ_BUILD_OPTS += -C--build-option=--enable-drafts
 endif
 
 $(eval $(python-package))
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 147062cf7b..b072f37313 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -10,8 +10,10 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ba/86/6dda1760481ab
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
-PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
 PYTHON_UVLOOP_DEPENDENCIES = libuv
+PYTHON_UVLOOP_BUILD_OPTS = \
+	-C--build-option=build_ext \
+	-C--build-option=--inplace \
+	-C--build-option=--use-system-libuv
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
