Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D64C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 11:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770B960F4A;
	Wed,  2 Aug 2023 11:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 770B960F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26AhBLg1W1l5; Wed,  2 Aug 2023 11:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D9161159;
	Wed,  2 Aug 2023 11:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D9161159
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 890251BF3BB
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA5261159
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA5261159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJ1vVz5ryGxC for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 11:15:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F67160B27
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 11:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F67160B27
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so6742267f8f.2
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 04:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690974909; x=1691579709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9BjhjU5VRQ+XgiWWuaxQse6lgXl272+9wHGm5CkxmY=;
 b=Pn6ck6nCWy96zBVzvYDwW6WVsTqQJyhVA54B+qP6b7atNbZQKNSPoqzAzxZyBXCqbT
 //QaaQzgjt0+YnsQmhhfA7ZMecBR9jqe11LtgqOT3fyzmzBZfXv3OWetmY3tRVX2X7p4
 rvH/w/MpcMRHeKKjfULVTnhi8/RyQHbH2pqKEn28ycWJK/8Ly4/Lmf3gIs/KEqyAvIan
 An+O0JIp0vwALdg2rXPKtVYYdFXxf1J5Hhfb0QmsQkwD6TESjYzzuUrJS58Yt8cxUPYl
 LAsp+cSp80D+7Gg8Mm3T35f4KntbpKCcLOu6vYX8Pwh06ON8Hatzr/YuA+MHpaSJR8tE
 2oyw==
X-Gm-Message-State: ABy/qLaAp/tyUkEtC3f61CHAJqDpchdE34DVHK6K2ceaYxWIUEbsh/oR
 WdnUVXbXL6cSlBlCKscUgD1OGWKp7IsDGZEfJT4=
X-Google-Smtp-Source: APBJJlF4x6B6nsPqd1/pGjm58ZGDwVGBwd4NcSUlYT0oJI0DxiaW6QtKGiK/67HrtTXtu4zW0P5VQQ==
X-Received: by 2002:a5d:460f:0:b0:315:9993:1caa with SMTP id
 t15-20020a5d460f000000b0031599931caamr2362172wrq.12.1690974908891; 
 Wed, 02 Aug 2023 04:15:08 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000104400b003143b14848dsm18653128wrx.102.2023.08.02.04.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 04:15:08 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 13:14:44 +0200
Message-Id: <20230802111447.41714-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516082155.22014-1-thomas@devoogdt.com>
References: <20230516082155.22014-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/4] pkg-cmake: add option to select the
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Cmake supports multiple generators. Ninja is a small build system with a
focus on speed. It is mainly used with the meson build system, but also
cmake has very good support for it. This adds optional support for the
Ninja build system.

Usage:
<package>_CMAKE_NINJA = YES

E.g. Commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213 can now be replaced by:
WEBKITGTK_CMAKE_NINJA = YES

Packages that are selecting Ninja (or overtime another generator),
should also use the _BUILD_{ENV,OPTS} variables iso the _MAKE variables.

No _INSTALL{,_STAGING,_TARGET}_OPTS used so far, so reuse as cmake install opts:

    $ grep '_INSTALL_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
    $ grep '_INSTALL_STAGING_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
    $ grep '_INSTALL_TARGET_OPTS' $(grep -rl "cmake-package" package/*/*.mk)

The _MAKE_{ENV,OPTS} are copied to _BUILD_{ENV,OPTS}, involved packages:

    $ grep '_MAKE_ENV =' $(grep -rl "cmake-package" package/*/*.mk)

    package/netopeer2/netopeer2.mk:NETOPEER2_MAKE_ENV = \
    package/racehound/racehound.mk:RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)

    $ grep '_MAKE_OPTS =' $(grep -rl "cmake-package" package/*/*.mk)

    package/mariadb/mariadb.mk:HOST_MARIADB_MAKE_OPTS = import_executables
    package/zeek/zeek.mk:HOST_ZEEK_MAKE_OPTS = binpac bifcl

Only "musepack" seems to overwrite MAKE to enforce -j1, so replace it:

    $ grep '_MAKE =' $(grep -rl "cmake-package" package/*/*.mk)

    package/musepack/musepack.mk:MUSEPACK_MAKE = $(MAKE1)

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Reviewed-by: John Keeping <john@metanate.com>
---
v2:
 - made generator use more generic, other generators can now easily be added if required
v3:
 - add _GENERATOR_PROGRAM
 - add _GENERATOR_PARALLEL for make
 - dropped BUILD_OPTS
 - fix gdal.mk
v4:
 - restored _MAKE_ENV/_MAKE_OPTS for the Unix Makefiles case
 - always set -j$(PARALLEL_JOBS)
v5:
 - reword commit slightly
v6:
 - rebase
---
 package/musepack/musepack.mk |  2 +-
 package/pkg-cmake.mk         | 35 +++++++++++++++++++++++------------
 2 files changed, 24 insertions(+), 13 deletions(-)

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
 
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8c375779cb..36ab88d3a1 100644
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
 
 
@@ -65,6 +60,20 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+$(2)_DEPENDENCIES	+= host-ninja
+$(2)_GENERATOR		= "Ninja"
+$(2)_GENERATOR_PROGRAM	= $(HOST_DIR)/bin/ninja
+else
+$(2)_GENERATOR		= "Unix Makefiles"
+$(2)_GENERATOR_PROGRAM	= $(firstword $(BR2_MAKE))
+
+# Generator specific code (make) should be avoided,
+# but for now, copy them to the new variables.
+$(2)_BUILD_ENV		?= $$($(2)_MAKE_ENV)
+$(2)_BUILD_OPTS		?= -- $$($(2)_MAKE_OPTS)
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -88,7 +97,8 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +129,8 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -166,11 +177,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 endif
 endif
@@ -181,7 +192,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
 endef
 endif
 
@@ -191,7 +202,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -201,7 +212,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
