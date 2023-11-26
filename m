Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5619C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 01:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A814031D;
	Sun, 26 Nov 2023 01:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A814031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GW-KP1L-zsfM; Sun, 26 Nov 2023 01:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA87F400EF;
	Sun, 26 Nov 2023 01:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA87F400EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 578201BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3128860A70
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3128860A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjKg0lUM2xee for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 01:19:44 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1D91606BF
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 01:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D91606BF
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7b389399dfdso38664739f.2
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 17:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700961582; x=1701566382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5MVL/a9UyqPRwbAwW1a1BOVEhte/bhr0A01sncPrgg=;
 b=q6S14h5lU3I30M7kMjvs6dM/niiqk6GUmRGxURZzEHS/GqcMkA4cXkq7cR99wDTOAa
 NVJmhwvzf2FUzzEFbfPEjQjmdjBvr3hSXpc7a46AbV9LI4+7byMGvAhnh8GzBkwOKBxy
 BRKCnoejVlryJJ5GI97ai2GrFmrlKY8NnWOJaVz3qVKD4O/mv7vobG2fOmHvpetVbXPw
 b/B1kuXkQtUQNKrL25xgr5V77gTCCAnz0rQcmTuasiLiVd/LTHyFsZxKGf9peYoh0wR7
 IsALv6f0HVNnyMD7YtfWp8bwXNuYBg9+66aDFEJK7un0dO69LmRICnbJCsTfutufl527
 dtEQ==
X-Gm-Message-State: AOJu0YwCycVY1AiLJKgDm53VsSWkkYbupuCbHWSEXrx4DaNpJVRmS6EH
 4k8vW5hzk9KbJh0lKshAa55jTw3yLKk=
X-Google-Smtp-Source: AGHT+IFdermW0twG7N7b48+ngVAwHssIXKudhR0fzzTvvIp1sLQ+yUMAUBqvGLe3T8SvYXSZhMXpkQ==
X-Received: by 2002:a6b:3e84:0:b0:7b3:95d6:62df with SMTP id
 l126-20020a6b3e84000000b007b395d662dfmr2064410ioa.21.1700961582388; 
 Sat, 25 Nov 2023 17:19:42 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056638358600b0046674d6318fsm1585075jal.17.2023.11.25.17.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 17:19:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 18:19:32 -0700
Message-Id: <20231126011932.1380631-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126011932.1380631-1-james.hilliard1@gmail.com>
References: <20231126011932.1380631-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700961582; x=1701566382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5MVL/a9UyqPRwbAwW1a1BOVEhte/bhr0A01sncPrgg=;
 b=Z43UaG/P3ZnibAdrFaCBXt3k891w91lgwpnt2OH3AXQXoBOLV1XeVsrfsdYU8GNEIy
 dwak4v36tmV07Rra08BPb4stGn7b0O2a8L21MuygSXGtnu0jABNZOba8tW43vgBUxRc8
 DBh4LkQcPrHFUt8RLErjgjftZv7M6bC1nxhoqbxFRGAOneDzQJJkZrtLc1BVA5THJGiW
 X4ksXfAQjTlBdf7+f3Y+QXO238PWftprQaka6McwH7O1TmMP57fMNc9RdM8luooUlQWN
 YdW96eLnyFbqM7QLc4UhuCL95SqTSF+dJoT//DLK4wbYndDGCfnuWAKGMYTE1DzgOKJ8
 0HCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z43UaG/P
Subject: [Buildroot] [PATCH v5 5/5] package/pkg-python.mk: migrate
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v4 -> v5:
  - rebase on next
Changes v1 -> v3:
  - rebase on master
  - combine setuptools-rust and maturin env variables
  - drop patch which is now upstream
---
 package/pkg-python.mk                      | 124 ++++++++++-----------
 package/python-evdev/python-evdev.mk       |   4 +-
 package/python-lxml/python-lxml.mk         |   8 +-
 package/python-m2crypto/python-m2crypto.mk |   4 +-
 package/python-pillow/python-pillow.mk     |  35 +++---
 package/python-psycopg2/python-psycopg2.mk |   5 +-
 package/python-pyzmq/python-pyzmq.mk       |   4 +-
 package/python-uvloop/python-uvloop.mk     |   6 +-
 8 files changed, 91 insertions(+), 99 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index bda79116c8..ab57b59ff7 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -86,15 +86,58 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_CMD = \
 	setup.py install \
 	--prefix=$(HOST_DIR)
 
-# Target setuptools-based packages
-PKG_PYTHON_SETUPTOOLS_ENV = \
+# Target pep517-based packages
+PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
 
-PKG_PYTHON_SETUPTOOLS_CMD = \
-	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
+PKG_PYTHON_PEP517_BUILD_CMD = \
+	-m build -n -w
+
+PKG_PYTHON_PEP517_INSTALL_OPTS = \
+	--interpreter=/usr/bin/python \
+	--script-kind=posix
+
+PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
+	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(TARGET_DIR)/usr/bin \
+	--data=$(TARGET_DIR)/usr
+
+PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
+	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(STAGING_DIR)/usr/bin \
+	--data=$(STAGING_DIR)/usr
+
+# Host pep517-based packages
+HOST_PKG_PYTHON_PEP517_ENV = \
+	$(HOST_PKG_PYTHON_ENV)
+
+HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
+	-m build -n -w
+
+HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
+	--interpreter=$(HOST_DIR)/bin/python \
+	--script-kind=posix \
+	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
+
+# Target setuptools-based packages
+PKG_PYTHON_SETUPTOOLS_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
 
 PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) build
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
@@ -103,30 +146,20 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--single-version-externally-managed
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) \
-	install --no-compile \
-	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-	--root=$(TARGET_DIR)
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) \
-	install \
-	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-	--root=$(STAGING_DIR)
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
+	$(HOST_PKG_PYTHON_PEP517_ENV)
 
 HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) build
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) \
-	install \
-	--prefix=$(HOST_DIR) \
-	--root=/ \
-	--single-version-externally-managed
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
 # Target setuptools-rust-based packages
 PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
@@ -155,52 +188,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD)
 
-# Target pep517-based packages
-PKG_PYTHON_PEP517_ENV = \
-	$(PKG_PYTHON_ENV)
-
-PKG_PYTHON_PEP517_BUILD_CMD = \
-	-m build -n -w
-
-PKG_PYTHON_PEP517_INSTALL_OPTS = \
-	--interpreter=/usr/bin/python \
-	--script-kind=posix
-
-PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
-	$(TOPDIR)/support/scripts/pyinstaller.py \
-	dist/* \
-	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
-	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(TARGET_DIR)/usr/bin \
-	--data=$(TARGET_DIR)/usr
-
-PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
-	$(TOPDIR)/support/scripts/pyinstaller.py \
-	dist/* \
-	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
-	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(STAGING_DIR)/usr/bin \
-	--data=$(STAGING_DIR)/usr
-
-# Host pep517-based packages
-HOST_PKG_PYTHON_PEP517_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
-
-HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
-	-m build -n -w
-
-HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
-	$(TOPDIR)/support/scripts/pyinstaller.py \
-	dist/* \
-	--interpreter=$(HOST_DIR)/bin/python \
-	--script-kind=posix \
-	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(HOST_DIR)/bin \
-	--data=$(HOST_DIR)
-
 # Target flit packages
 PKG_PYTHON_FLIT_ENV = \
 	$(PKG_PYTHON_PEP517_ENV)
@@ -330,13 +317,14 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
+ifneq ($$(filter flit maturin pep517 setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
+$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-setuptools
 ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
 $(2)_DEPENDENCIES += host-python-setuptools-rust
 endif
-else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
-$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
+endif
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
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
index 69a0c28df5..6c07f42d06 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -13,6 +13,8 @@ PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
 PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
 PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
+PYTHON_M2CRYPTO_BUILD_OPTS = \
+	-C--build-option=build_ext \
+	-C--build-option=--openssl=$(STAGING_DIR)/usr
 
 $(eval $(python-package))
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index bc94062da8..e2077654d2 100644
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
index 0149b8d185..1b33b7505d 100644
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
index 285884a2bb..70508fb6de 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -10,8 +10,10 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/9c/16/728cc5dde368e
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
