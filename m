Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED2C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC026600C4;
	Tue, 28 Feb 2023 15:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC026600C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frQi6W9hCXUh; Tue, 28 Feb 2023 15:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACAB6117B;
	Tue, 28 Feb 2023 15:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACAB6117B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21E3B1BF2AA
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF63F6117B
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF63F6117B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnqW1v-cKexi for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:55:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB6C600C4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFB6C600C4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:55:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so9891121wmb.3
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KQIjEfj/OX6xGgG5VW2r/qmQB4efNv6BMTjIKiOTtKo=;
 b=Uy3fFqIYU18KxXIyG4VJ53O8Y9iemUNZqLCPvRXyvXxxsgRMwPLgkmcKXVapUN4eeC
 oj+Wvcx9Xc7GSI+xWT2hoWneQb7GBPojKfdT1izMb+RY0jnCfdtla1/Dee7wMqRwh4+E
 fYt5dcsJB1NZKErEl80AJABd4D4kVcufPw2QyHj4xJKMb+lcEKtemJGbPOd2etzMzDoV
 TPINdDkI2Y3xKCNrP14Gu+RNUIj6T9OX+Rl6pkgNuslHqSkdL3VS319Fe0RcLyr458gD
 PZdF1EeYtqjgJFKXsBo/s+ko6w8cNC9ukdIPexpXUekGs1jZtWW3kB2FQpxiAaekmeD/
 uxXg==
X-Gm-Message-State: AO0yUKVVjp9IQW90lhk4rz8Z8b4+LHNHnchHVOhXpqsV6vKcSwv7M04C
 yYEmXsAg516TdUoeoEiS8vLs11/WzzEMKQ==
X-Google-Smtp-Source: AK7set9D/whl94mB8U69qrnIAf+pQ14NadMP3xSlHa0NeL3NyKC0qJ4p2A9uqCv770EHDWfQNcCTsw==
X-Received: by 2002:a05:600c:198f:b0:3ea:f6c4:5f3c with SMTP id
 t15-20020a05600c198f00b003eaf6c45f3cmr2345887wmq.7.1677599735420; 
 Tue, 28 Feb 2023 07:55:35 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm17478968wmq.47.2023.02.28.07.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:55:34 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:55:26 +0100
Message-Id: <20230228155528.2430203-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <Y/4etrPX5MZiUpdq@donbot>
References: <Y/4etrPX5MZiUpdq@donbot>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQIjEfj/OX6xGgG5VW2r/qmQB4efNv6BMTjIKiOTtKo=;
 b=N5HRp8sJBH3XcHHIwos65a97QxnVGyLVXnQ1O6Na/F9pYcCZl0LWpT0QsJr6zFKAYg
 9lRpLn56zv+CmtEOwBAZyg1hH+M96vSk195AP//v5skn8Bba4jq8WObHnoLsok0KgspF
 7H6rxP6ediErsWVHP7aJsdIWxx4lS5OQePnSUJiWw25N+kcaFsYzHH8Fm0OZKQaDfi5A
 aYPvD2NUaBHED69xOOSHdirFC9l38OxZr7JywLO8MSrKXKmFkvn1RPzSV0eeYVKwB+yK
 RQQm2z4+TklfhmHv63eFf9Om97B+0BirkGwMUCm6Mh5g7beGYf3RgLM2hhdSpnF2NA2k
 5UHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N5HRp8sJ
Subject: [Buildroot] [PATCH v3 1/3] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Samuel Martin <s.martin49@gmail.com>,
 John Keeping <john@metanate.com>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

E.g. Commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213 can now be replaced by:
WEBKITGTK_CMAKE_NINJA = YES

Packages that are selecting Ninja (or overtime another generator),
should also use the _BUILD_{ENV,OPTS} variables iso the _MAKE variables.

No _INSTALL{,_STAGING,_TARGET}_OPTS used so far:

    $ grep '_INSTALL_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
    $ grep '_INSTALL_STAGING_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
    $ grep '_INSTALL_TARGET_OPTS' $(grep -rl "cmake-package" package/*/*.mk)

The _MAKE_{ENV,OPTS} are translated to _BUILD_{ENV,OPTS}:

    $ grep '_MAKE_ENV =' $(grep -rl "cmake-package" package/*/*.mk)

> package/netopeer2/netopeer2.mk:NETOPEER2_MAKE_ENV = \
> package/racehound/racehound.mk:RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)

    $ grep '_MAKE_OPTS =' $(grep -rl "cmake-package" package/*/*.mk)

> package/mariadb/mariadb.mk:HOST_MARIADB_MAKE_OPTS = import_executables
> package/zeek/zeek.mk:HOST_ZEEK_MAKE_OPTS = binpac bifcl

Only "musepack" seems to overwrite MAKE to enforce -j1, so replace it:

    $ grep '_MAKE =' $(grep -rl "cmake-package" package/*/*.mk)

> package/musepack/musepack.mk:MUSEPACK_MAKE = $(MAKE1)

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2:
 - made generator use more generic, other generators can now easily be added if required
v3:
 - add _GENERATOR_PROGRAM
 - add _GENERATOR_PARALLEL for make
 - dropped BUILD_OPTS
 - fix gdal.mk
---
 package/gdal/gdal.mk           |  2 +-
 package/musepack/musepack.mk   |  2 +-
 package/netopeer2/netopeer2.mk |  2 +-
 package/pkg-cmake.mk           | 31 +++++++++++++++++++------------
 package/racehound/racehound.mk |  2 +-
 5 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index a3b11c53af..d8ce623283 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -19,7 +19,7 @@ GDAL_SUPPORTS_IN_SOURCE_BUILD = NO
 # autotools in gdal. We need to force 'make' to use the Makefile,
 # which is generated by CMake. GNUmakefile and autoconf are dropped in
 # 3.6 so this can be dropped in future version.
-GDAL_MAKE_OPTS += -f Makefile
+GDAL_BUILD_OPTS += -f Makefile
 
 # gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
 # but since by default mrf driver support is enabled, it also needs
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index fc66c684a5..d4dd08df36 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -9,7 +9,7 @@ MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
-MUSEPACK_MAKE = $(MAKE1)
+MUSEPACK_BUILD_OPTS = -j1
 MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
 MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
 
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 47fcd31acd..2ebb23eccd 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -24,7 +24,7 @@ NETOPEER2_CONF_OPTS = \
 # affected mutualy.
 NETOPEER2_SYSREPO_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))_netopeer2
 
-NETOPEER2_MAKE_ENV = \
+NETOPEER2_BUILD_ENV = \
 	SYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl \
 	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
 
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8c375779cb..5f5988beb8 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -51,11 +51,6 @@ endif
 
 define inner-cmake-package
 
-$(2)_MAKE			?= $$(MAKE)
-$(2)_INSTALL_OPTS		?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
-$(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
-
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
 
@@ -65,6 +60,16 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+$(2)_DEPENDENCIES += host-ninja
+$(2)_GENERATOR			= "Ninja"
+$(2)_GENERATOR_PROGRAM	= $(HOST_DIR)/bin/ninja
+else
+$(2)_GENERATOR			= "Unix Makefiles"
+$(2)_GENERATOR_PROGRAM	= $(firstword $(BR2_MAKE))
+$(2)_GENERATOR_PARALLEL	= -j$(PARALLEL_JOBS)
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -88,7 +93,8 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +125,8 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -166,11 +173,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$($$(PKG)_GENERATOR_PARALLEL) $$($$(PKG)_BUILD_OPTS)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$($$(PKG)_GENERATOR_PARALLEL) $$($$(PKG)_BUILD_OPTS)
 endef
 endif
 endif
@@ -181,7 +188,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
 endef
 endif
 
@@ -191,7 +198,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -201,7 +208,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
 endef
 endif
 
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 6499e166d8..f63bb233f6 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -22,6 +22,6 @@ RACEHOUND_CONF_OPTS += \
 	-DKBUILD_VERSION_STRING=$(LINUX_VERSION_PROBED)
 
 # cross compile environment for linux kernel module
-RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)
+RACEHOUND_BUILD_ENV = $(LINUX_MAKE_FLAGS)
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
