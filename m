Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C061C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 06:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB434157A;
	Mon, 13 Mar 2023 06:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB434157A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id my7d_zFhsWaO; Mon, 13 Mar 2023 06:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619FB415A6;
	Mon, 13 Mar 2023 06:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619FB415A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 253D61BF4DA
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F30EF8184F
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30EF8184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZHkRmJKwaj8 for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 06:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8125981846
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8125981846
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 06:55:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso7073844wmp.4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 23:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678690523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4sLcrdcConxS2N+5B0p6RNq2EAjSMGENUKsEr/E6Lgw=;
 b=O/sbfFNWzkUNqSEJr2WwtFqOdi1xmypRVpJrw786MMfonXxyswBgKs+26A+JUTKAxl
 oIarfPHoat6R5MFrAV+grh7fNhjkWf3IudUEd9U6rQ7dJQFsHledC6fzkMr1QvdSRXSd
 ruqmZMqekV5dD5T0/f/RTeATFav1jDqXZE3KFOWd/pvBErjVD3NzjnmPKhMSKUHIFUwi
 TN8eWkqClSU/9rbgKpqn8gtHWO4SylMXRJOzZgNN8pAgQL0WaNYNbnEQTsxSJiZv63U0
 hgXSV6q0Oh+qyrl6LZogcuwJWbJvwaT9XU1TQbcI0tIv9bndIyeYzsfs23619xBgfiCJ
 QLDQ==
X-Gm-Message-State: AO0yUKWEf6BHjRTXEjXOAu6KDwzWPyMbavbw9te8LXMr9PjQyKM7l84e
 OSfvklyEXtZBOeCv8CNgKxj9AK7T+TrCig==
X-Google-Smtp-Source: AK7set8NfDN2OfeDxBXINlTp8jb2rZHcJcEvQYK/Y5JUu/eBGkkCZlq1ObY0z1r4A59RT5OFy0BGHA==
X-Received: by 2002:a05:600c:350f:b0:3eb:3843:9f31 with SMTP id
 h15-20020a05600c350f00b003eb38439f31mr9886157wmq.10.1678690523248; 
 Sun, 12 Mar 2023 23:55:23 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b003daf6e3bc2fsm10737978wmo.1.2023.03.12.23.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 23:55:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 07:55:14 +0100
Message-Id: <20230313065516.2023267-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
References: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678690523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sLcrdcConxS2N+5B0p6RNq2EAjSMGENUKsEr/E6Lgw=;
 b=U/iMJpgzHb7o16bJOeQ4nsuq0JBgFJPk6eATBDpdfHhmUquuBM0NRKfdvMwLbqR9nU
 doQujxWbXtQriOd5jHe85TsUOHXfJAwUJQhOJURpwB3KWFknUhqodiF1Y1T7oYN2Zurm
 hs66V0GdTadEntF9sQP4LYcTRoFp6As3Iw6KNQcOpRu8D+XO4ffrNA9jxGDOo1PET9Kl
 8L+azXIQ2Dh47oKV0cKJOjtO4UtBVmDnDbfQivF7A7RYQCxsKX4Q/AKfSfKVxP3hoPjO
 0F+HaSAUQ0x/BjJwRTxY2nD6keB6WDB+3wYrqsA6iFiToMd2U94deay4UOUBnhHjrmQw
 ytkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U/iMJpgz
Subject: [Buildroot] [PATCH v4 1/3] pkg-cmake: add option to select the
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
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

The _MAKE_{ENV,OPTS} are copied to _BUILD_{ENV,OPTS}, usage:

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
v4:
 - restored _MAKE_ENV/_MAKE_OPTS for the Unix Makefiles case
 - always set -j$(PARALLEL_JOBS)
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
