Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5967EEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 18:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30EA418B4;
	Mon, 26 Jun 2023 18:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30EA418B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8yn53BG3EoB; Mon, 26 Jun 2023 18:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D8F441B6C;
	Mon, 26 Jun 2023 18:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8F441B6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA6BF1BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41B72418A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B72418A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eu6dPaWmvW7X for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 18:15:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F4211409DB
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F4211409DB
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 18:15:40 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-34570ed4cb8so11068995ab.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803340; x=1690395340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3yedHY9KYnFz98vvoL/p5ciznXK71eylyW1g4gOt/4=;
 b=RpYhCl+oo/LLVHu3gGLLl+4PXIJbSDL2UMnBOG1rVif2Fdsue8iIGMxnb380a8jtnz
 6lHDILs4I9p2+yBwFIg8Z1zhAfkmMbjUXrfc7BQxI618GPXDSVAUQQO+FkPve4e6K3In
 Q4nYF9tqEgWx4QtGg6OE50XziZuC9jWaBfcj6KTvPtDAFa97/IBl+yGyfJvs/fZRIGRA
 v/ukEktK1GDjB8BG/wGHEYopabiBvftxat195tp79QKQLIirZP8gM0I8/bq3qc9isAU7
 bdONeQz/bdYtE0ybEB4ZXxc0iUfRjqi0SMF7L0BXFttErVKDWTrXp6y5BtYoxNXxE4ub
 uZJA==
X-Gm-Message-State: AC+VfDzrgFw07qZVv2NPrEjX9TiH8z8wa8++XD+OeG/Aiu5NzB1O2Oem
 RTsNPx4z3LdmZFd8s0A1YROQpXat2/4=
X-Google-Smtp-Source: ACHHUZ68+OMDmmsPwUGEi+9SYvWMX4tuj4RSBMw0Dhxa50KGp3auvCynVlE0L2YiJyAl++s05vsVIQ==
X-Received: by 2002:a92:c00d:0:b0:342:1933:f1f4 with SMTP id
 q13-20020a92c00d000000b003421933f1f4mr22484225ild.7.1687803339844; 
 Mon, 26 Jun 2023 11:15:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 z24-20020a029f18000000b004269bbd4586sm1867653jal.77.2023.06.26.11.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 11:15:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 12:15:31 -0600
Message-Id: <20230626181531.2312002-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626181531.2312002-1-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687803340; x=1690395340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3yedHY9KYnFz98vvoL/p5ciznXK71eylyW1g4gOt/4=;
 b=WeYywjyu3eGiUOodd697OEJ+6buXuTZ88mtGIT/s/Mi+HjKmQXLvyLKzqCFVTnCB4Q
 sIfa7RZwCJTW6Iol1WtifLB5fHNsXqO4U/OkGIcJdLYVnI6uJ3XUcFxU0VBPLoesEB1v
 4WuqX1kQ94qiatQ15a722/f968LsevgFQfsH5WHENoSJy5at1vO1PPnPfn23PH52LUqu
 FHzj7mUke94Hl+aUKazBu8tF2y9tYpxfNy1fx/61LoEL9h+CNhnyad3P4dp+fnrh4LU7
 54ZhwMD9yvac8DS9KBhDLa+7gH9+Ds3gk7g7/t+5SOek2ujCzEMTCGPsmFtMyoUkWQm+
 PM8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WeYywjyu
Subject: [Buildroot] [PATCH 5/5] package/pkg-python.mk: migrate setuptools
 to pep517
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
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

We also need to add a patch fixing a bug in python-pypa-build which
was preventing the config settings from being passed to some of the
pep517 build hooks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk                         | 21 +++-------
 package/python-evdev/python-evdev.mk          |  4 +-
 package/python-lxml/python-lxml.mk            |  8 ++--
 package/python-m2crypto/python-m2crypto.mk    |  4 +-
 package/python-pillow/python-pillow.mk        | 35 +++++++++--------
 package/python-psycopg2/python-psycopg2.mk    |  5 ++-
 ...ig_settings-are-passed-to-get_requir.patch | 38 +++++++++++++++++++
 package/python-pyzmq/python-pyzmq.mk          |  4 +-
 package/python-uvloop/python-uvloop.mk        |  6 ++-
 9 files changed, 78 insertions(+), 47 deletions(-)
 create mode 100644 package/python-pypa-build/0001-main-ensure-config_settings-are-passed-to-get_requir.patch

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 85374ae8bb..a1aed89284 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -183,19 +183,7 @@ $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
-# Setuptools
-else ifeq ($$($(2)_SETUP_TYPE),setuptools)
-ifeq ($(4),target)
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
-$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
-$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
-endif
-else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+else ifneq ($$(filter flit pep517 setuptools,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
@@ -232,13 +220,14 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-ifeq ($$($(2)_SETUP_TYPE),setuptools)
-$(2)_DEPENDENCIES += host-python-setuptools
-else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+ifneq ($$(filter flit pep517 setuptools,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
+ifeq ($$($(2)_SETUP_TYPE),setuptools)
+$(2)_DEPENDENCIES += host-python-setuptools
+endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 # Don't add dependency on host-python-installer for
 # host-python-installer itself, and its dependencies.
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
index 657622a962..4017257974 100644
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
index b69d329cde..0d79424666 100644
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
diff --git a/package/python-pypa-build/0001-main-ensure-config_settings-are-passed-to-get_requir.patch b/package/python-pypa-build/0001-main-ensure-config_settings-are-passed-to-get_requir.patch
new file mode 100644
index 0000000000..23d1f37061
--- /dev/null
+++ b/package/python-pypa-build/0001-main-ensure-config_settings-are-passed-to-get_requir.patch
@@ -0,0 +1,38 @@
+From 44632c4f0758cbe8281581713c55538d44a4e7d4 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 25 Jun 2023 23:08:55 -0600
+Subject: [PATCH] main: ensure config_settings are passed to
+ get_requires_for_build
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/pypa/build/pull/627]
+---
+ src/build/__main__.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/build/__main__.py b/src/build/__main__.py
+index 743c28a..8d2c609 100644
+--- a/src/build/__main__.py
++++ b/src/build/__main__.py
+@@ -113,7 +113,7 @@ def _build_in_isolated_env(
+         # first install the build dependencies
+         env.install(builder.build_system_requires)
+         # then get the extra required dependencies from the backend (which was installed in the call above :P)
+-        env.install(builder.get_requires_for_build(distribution))
++        env.install(builder.get_requires_for_build(distribution, config_settings or {}))
+         return builder.build(distribution, outdir, config_settings or {})
+ 
+ 
+@@ -127,7 +127,7 @@ def _build_in_current_env(
+     builder = _ProjectBuilder(srcdir)
+ 
+     if not skip_dependency_check:
+-        missing = builder.check_dependencies(distribution)
++        missing = builder.check_dependencies(distribution, config_settings or {})
+         if missing:
+             dependencies = ''.join('\n\t' + dep for deps in missing for dep in (deps[0], _format_dep_chain(deps[1:])) if dep)
+             _cprint()
+-- 
+2.34.1
+
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
