Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD12C61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 11:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122AF60FD7;
	Fri, 24 Feb 2023 11:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 122AF60FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JgyyvxQc_-4; Fri, 24 Feb 2023 11:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A33260FCF;
	Fri, 24 Feb 2023 11:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A33260FCF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8371BF36B
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25A1181FB5
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A1181FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5Zmd3Xtxd81 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 11:15:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3848381FA4
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3848381FA4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 11:15:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l25so13132352wrb.3
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 03:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SI3c+Rv7Wxnfjg/Q6+jMqKfApcy3fvIf/gUVJt7Pi2o=;
 b=KjK4qyhjQUarVeO9oOsgnWY/Lmr+AFAoXUk/LnXFdD15ZOcxPvVweqIiRyv2omJiD4
 n+henunaVZtAoV2lCLZPQhAvD+nc7dU9w4VvD9WEvr5njinat3GEIFjgbUVqO4SbkufS
 u4mQkAuoypAwEAT3bFx2N2MBIjck4UwgblQ+SpBtPTTuHeBgu/0Ry0psg0Ecz/QP4XYE
 9BHQctTIoCNKnfX84ZCw0Yf/r8JnmpJ+JKdn5k/E6Oz1S0oIvqES/ZoPf05Vdb8vZ/Jt
 Hjh/VPzmA34KQTN+k8/sfDD0DCwkn6QSGRsHmCni16vsuRtRtjLbsU3jc0EgR1uoSFDV
 CJhA==
X-Gm-Message-State: AO0yUKXMcCGIki9CYlHkwjBNJ76n5wR6pW/X2L6lb17pXUDdmYZZkmZt
 2DMpTfWPZTFLhyJOzzO5axGXpnN6CCa6XUi8
X-Google-Smtp-Source: AK7set8rlYEv6g3a74PpyuxCtOXt07+5hY4FMqLvbIEXkwp2nxYUuOQHKme8TS+wfAhRSjKfNsyNAw==
X-Received: by 2002:a5d:458b:0:b0:2c7:7b3:36c6 with SMTP id
 p11-20020a5d458b000000b002c707b336c6mr8976467wrq.52.1677237316950; 
 Fri, 24 Feb 2023 03:15:16 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm13537960wru.84.2023.02.24.03.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:15:16 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 12:15:07 +0100
Message-Id: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=SI3c+Rv7Wxnfjg/Q6+jMqKfApcy3fvIf/gUVJt7Pi2o=;
 b=JnkWtJbNiylvWWCEDM/1Dsjdfpw173iBbmuX+0/FrfijT9xnkwHHgkpYeSvSKtzGSV
 /GFUdxsxzBApLFSgLp0UZQR7pLTFdiIEDzQCebxP7B96ecx1QvboR3m1gk+H2ft93uk6
 DiBG400GZXeCvgmJqtFONmq/EGzCN5VT6ZT0dLiYrfnUZ0kBir8kjJQeQVN9j3jvrPjp
 PDHR7Shz7meCBKPTtvj/s/a8JnRoZ0nFb6/3iAbV8qgXM2MkSmgRxtJdhV8YNmWKM0dk
 T/YQKNCGlT5GiGMDY8vYgBqJs6UtmZmr6ImxOXaAnGBEegNy9+mghYPFyjpcPy6Bd37i
 A+3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JnkWtJbN
Subject: [Buildroot] [PATCH v1 1/3] pkg-cmake: add option to select the
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

E.g. Commit 
 16e5c92ff5fd2b44a1126bd7d7538c68ce838213, and
 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd 
can now be replaced by: WEBKITGTK_CMAKE_NINJA = YES

Packages that are selecting Ninja, should also use the NINJA_{ENV,OPTS} variables iso the MAKE variables.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/pkg-cmake.mk | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8c375779cb..4ce3e6bada 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -65,6 +65,13 @@ else
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
@@ -88,7 +95,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +126,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -165,45 +172,75 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 #
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+define $(2)_BUILD_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
+endef
+else
 define $(2)_BUILD_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
+endif
+else
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+define $(2)_BUILD_CMDS
+	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
+endef
 else
 define $(2)_BUILD_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 endif
+endif
 
 #
 # Host installation step. Only define it if not already defined by the
 # package .mk file.
 #
 ifndef $(2)_INSTALL_CMDS
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+define $(2)_INSTALL_CMDS
+	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
+endef
+else
 define $(2)_INSTALL_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
+endif
 
 #
 # Staging installation step. Only define it if not already defined by
 # the package .mk file.
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+define $(2)_INSTALL_STAGING_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR install
+endef
+else
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
+endif
 
 #
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
+endef
+else
 define $(2)_INSTALL_TARGET_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
+endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
