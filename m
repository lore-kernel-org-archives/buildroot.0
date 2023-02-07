Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18AEC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 04:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B1BA417A0;
	Tue,  7 Feb 2023 04:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1BA417A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bL53nHaMvMZq; Tue,  7 Feb 2023 04:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0A3417A5;
	Tue,  7 Feb 2023 04:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D0A3417A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 972F11BF2C8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E02960DF4
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E02960DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVjz3x_o-1ai for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 04:30:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D9DE60E03
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D9DE60E03
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 04:30:16 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 v18-20020a17090ae99200b00230f079dcd9so207093pjy.1
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 20:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghgxVXiGZIz6PFUPejdw6g/1DkI63GU1E0USDaKpPA4=;
 b=DSOTlFN3OWO3pz/o1k/Ik95AuPCU/UDrSbUrtkfjLYC0vSy3vmIThlgCZTah4JrkXU
 ctO7ANFrE86bARIh4K0P6GmqvtataGhs56J4LAWdjhmP65yqGV0BoBHL/LFbucFSRtp8
 LzIYVaUsGGlw7f2YnRUkdFpQ4JL6FwPqS3rdI9tXuaj6VbAbIoTyfkvl6UX8CZXRbc3E
 mIOL2zkwubh4PM4Fen75mtp1uvEPTxMSxB/tHI9/f95iTnYs8HbmL+iRa4OWUGEtH8cg
 W6GJCt/7BKXeVlGX+IkTMCLvve3etEinkjUHwSXyADL+Rgpl3Vhk3Eb4pnwiRCgwAZMW
 K0rw==
X-Gm-Message-State: AO0yUKVbOn7T5zNwQAUdgkIX5QRugT5+pQW/xzEBjbWdqSE346ocICmh
 ueo/80c1SJAL5ESNgHCpNMdc6CA62kiUgg==
X-Google-Smtp-Source: AK7set83Lwfw/f2wWB/FLcqbqlr7HaU81BYPYKbFk/3PVyJ/MkM7oQQOgG0+YKfkoX1LlVK4o2SkXw==
X-Received: by 2002:a17:902:e1d4:b0:199:1458:6c61 with SMTP id
 t20-20020a170902e1d400b0019914586c61mr1339989pla.13.1675744215630; 
 Mon, 06 Feb 2023 20:30:15 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b001967580f60fsm7695484pli.260.2023.02.06.20.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 20:30:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 20:30:09 -0800
Message-Id: <20230207043010.85696-2-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207043010.85696-1-christian@paral.in>
References: <20230207043010.85696-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] package/docker-proxy: drop package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Tian Yuanhao <tianyuanhao3@163.com>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The docker-proxy binary (libnetwork) has been merged into the docker-engine
source (moby). Drop the docker-proxy package and add cmd/docker-proxy as a build
target of docker-engine instead.

https://github.com/moby/libnetwork/commit/563fe8e248f3afac75a270f693f38bdc3eea7bf3

Signed-off-by: Christian Stewart <christian@paral.in>
---
 Config.in.legacy                       |  8 ++++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/docker-engine/Config.in        |  1 -
 package/docker-engine/docker-engine.mk |  2 +-
 package/docker-proxy/Config.in         | 19 -------------------
 package/docker-proxy/docker-proxy.hash |  3 ---
 package/docker-proxy/docker-proxy.mk   | 21 ---------------------
 8 files changed, 9 insertions(+), 47 deletions(-)
 delete mode 100644 package/docker-proxy/Config.in
 delete mode 100644 package/docker-proxy/docker-proxy.hash
 delete mode 100644 package/docker-proxy/docker-proxy.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 61686fdd11..c9d5c635cd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_DOCKER_PROXY
+	bool "docker-proxy removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DOCKER_ENGINE
+	help
+	  docker-proxy has been dropped by upstream since version
+	  563fe8. it has been merged into docker-engine (moby).
+
 config BR2_TARGET_GUMMIBOOT
 	bool "gummiboot removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f8acf8776c..2559b8c227 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -545,7 +545,6 @@ F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-compose/
 F:	package/docker-engine/
-F:	package/docker-proxy/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
diff --git a/package/Config.in b/package/Config.in
index b6211f1102..45c803ea6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2619,7 +2619,6 @@ menu "System tools"
 	source "package/docker-cli/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-engine/Config.in"
-	source "package/docker-proxy/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1f0efb8fcc..b5a356eab9 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_USE_MMU # containerd
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
-	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	help
 	  Docker is a platform to build, ship,
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 229e199aa2..d769e367fa 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -24,7 +24,7 @@ DOCKER_ENGINE_LDFLAGS = \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.Version="$(DOCKER_ENGINE_VERSION)"
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
-DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
+DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
deleted file mode 100644
index 7e40536537..0000000000
--- a/package/docker-proxy/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_DOCKER_PROXY
-	bool "docker-proxy"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Libnetwork is a Container Network Model that provides a
-	  consistent programming interface and the required network
-	  abstractions for applications.
-
-	  This package provides docker-proxy, a run-time dependency of
-	  Docker.
-
-	  https://github.com/docker/libnetwork
-
-comment "docker-proxy needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
deleted file mode 100644
index 63296f14c1..0000000000
--- a/package/docker-proxy/docker-proxy.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  05bf95637bae134d12d02bd7a7854cd0c768e6fccb662c2c64523f05b997b204  docker-proxy-f6ccccb1c082a432c2a5814aaedaca56af33d9ea.tar.gz
-sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
deleted file mode 100644
index fe7982e8f6..0000000000
--- a/package/docker-proxy/docker-proxy.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# docker-proxy
-#
-################################################################################
-
-DOCKER_PROXY_VERSION = f6ccccb1c082a432c2a5814aaedaca56af33d9ea
-DOCKER_PROXY_SITE = $(call github,moby,libnetwork,$(DOCKER_PROXY_VERSION))
-
-DOCKER_PROXY_LICENSE = Apache-2.0
-DOCKER_PROXY_LICENSE_FILES = LICENSE
-
-DOCKER_PROXY_DEPENDENCIES = host-pkgconf
-
-DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
-
-define DOCKER_PROXY_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/proxy $(TARGET_DIR)/usr/bin/docker-proxy
-endef
-
-$(eval $(golang-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
