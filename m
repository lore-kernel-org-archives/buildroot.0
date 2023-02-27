Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE58C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F061281E0A;
	Mon, 27 Feb 2023 10:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F061281E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpb-krowSSq5; Mon, 27 Feb 2023 10:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F54881E1B;
	Mon, 27 Feb 2023 10:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F54881E1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51E0E1BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37EC681959
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37EC681959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kjPNzLiG9kt for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:40:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9F15818C0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9F15818C0
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:40:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p26so3900682wmc.4
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vQwnMfE31WVpgJGUqZmABHRGaxKSNuFM658Nq9DFjsM=;
 b=aTGFEBnqDP6W4WJ/7u3VLGy0bL/PKLPiv+ffa/6YhzhHYbOqXQmWCiChh8wnXlYsFS
 PtznY6daY0JFgllanTm/YhW26CwSgnqXeSphLV6NdB9LiMFhG5kwZy7BZiHM7Hfn5ujw
 9Doh0WJCsTnuz3oFZTSYbaBIHSBirIsgzl5M8e9NV+z1tomAknfaNOFDfzKgTXzQCAgO
 R6U+TBuoXmzkyF49+q8YunAgv+SosLxYXgLFBRw5UiDfbnhUi+x1XWG8gEXBIeoT2hgT
 SY5JZphuEV5dNh1pLZZ1OQDZQB3IqKUgoH3b8jAQxkUlDwKwQ2z0PPf2xsC0V0NRTQdO
 2/AQ==
X-Gm-Message-State: AO0yUKUvihpJLnXJgVtcOnSJw1kHlZC2Km+8DVyf2uFTMGyvq8L30abY
 smXx++JEcwZelj91VUibyMQjn35n0nQaRZQ1
X-Google-Smtp-Source: AK7set+WpToddv1hFnn8jtmanI51YgueJEdb4p+PqEx0rC/duCuBu/nLsALtG/D2tKZlx1gIEv5Y8w==
X-Received: by 2002:a1c:4c07:0:b0:3eb:1432:a78c with SMTP id
 z7-20020a1c4c07000000b003eb1432a78cmr7898910wmf.37.1677494404512; 
 Mon, 27 Feb 2023 02:40:04 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b003e6dcd562a6sm8964937wmb.28.2023.02.27.02.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:40:04 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:39:54 +0100
Message-Id: <20230227103956.128236-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224111509.2434694-3-thomas.devoogdt@barco.com>
References: <20230224111509.2434694-3-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQwnMfE31WVpgJGUqZmABHRGaxKSNuFM658Nq9DFjsM=;
 b=OjJcpSZzvbpWr5wn7KVvae3aOQrH1UeMUDjn84F/K44u2Vj9XoqyOP5eres6cicdfb
 bVlOh3hLSoJf2KQrC+4gBeEgOIltAs581msJKCtcyLti0n4bsSFar+R/PzNSVRj9ji6k
 k1Rd+D+qjFiC2cxpS9zksA8lxqxiCTPTovWFH62rcwnB+QHrko7pHa0bjjbZzt6iYd3v
 8DRzcS+dq8Y7KxtoxpEjkTlOVjhqDyMRn1XjtoxMv7kpzR5qskDgHtZUHAvZswCb54Nh
 B+KcMHHyFVKfttA1wwkOReGOnGwTquo/dczRmG9JQCtFp9WfWD5X5L0+XJwLUknwcmGg
 nKJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OjJcpSZz
Subject: [Buildroot] [PATCH v2 1/3] pkg-cmake: add option to select the
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
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
v2: made generator use more generic, other generators can now easily be added if required
---
 package/musepack/musepack.mk   |  2 +-
 package/netopeer2/netopeer2.mk |  2 +-
 package/pkg-cmake.mk           | 26 ++++++++++++++------------
 package/racehound/racehound.mk |  2 +-
 4 files changed, 17 insertions(+), 15 deletions(-)

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
index 8c375779cb..205a93db5f 100644
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
 
 
@@ -65,6 +60,13 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+$(2)_DEPENDENCIES += host-ninja
+$(2)_GENERATOR			= "Ninja"
+else
+$(2)_GENERATOR			= "Unix Makefiles"
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -88,7 +90,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +121,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -166,11 +168,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$(BUILD_OPTS) $$($$(PKG)_BUILD_OPTS)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$(BUILD_OPTS) $$($$(PKG)_BUILD_OPTS)
 endef
 endif
 endif
@@ -181,7 +183,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
 endef
 endif
 
@@ -191,7 +193,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -201,7 +203,7 @@ endif
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
