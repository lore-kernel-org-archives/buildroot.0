Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95337C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B364186F;
	Thu,  8 Dec 2022 21:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B364186F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXS_QTazSaoS; Thu,  8 Dec 2022 21:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32E14192C;
	Thu,  8 Dec 2022 21:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32E14192C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3445B1BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C1F560AD6
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C1F560AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6XcNyaym2DW for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:42:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1405760AA4
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1405760AA4
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:42:42 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id js9so1815389pjb.2
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5R71HlgdZsgO67Lw/t1JV6vrbxbhpHr67WKdLsZfV3Y=;
 b=rV3Bl+CD54k4nH5s4EF7FMF4wIe/QqBP9VdC2JpWflI6R2cidDkAe9RAcE5jTpDAmt
 YgEgnptgSHGePn2eZK8b9nXU4T0NhvvIaymnjuN8uVfWqgArylaqaWUEzsd5sWiSF2wm
 A4uKIQUKHjedU/jzARb6Zr10CQLvywkIL20AcYBk178Ob2LJN8jxEO6/Yv4xQ1How91S
 eYzfu5bYtKha0bk8BT1lhkTymkAkBWf8LQqiQC5/Tyspq4WpZLmVRIk9Hz3JCIzvOOCg
 WxUTkU60gFQ30G3bmlot8/ZEIibx8dzXApSosBdshIQQlEc9h6Nh0jPXEZvLGkWiBSl3
 w8OQ==
X-Gm-Message-State: ANoB5pmdCXLE4m5TuvsSaKBHwQ8RMQX4qp+wt6whN1lGmshX7q071CHS
 joh/rzHAMKKaE5h4trYvTCh/brb2VpM=
X-Google-Smtp-Source: AA0mqf58dxWUdCij+Y2rMyT4jzAmOZ5P1jxLOPz4ERYw7/gHZ71b1SYEHAvZUEal59SdVSiImkrCLw==
X-Received: by 2002:a17:90a:9406:b0:219:cb43:60b with SMTP id
 r6-20020a17090a940600b00219cb43060bmr3350397pjo.36.1670535762079; 
 Thu, 08 Dec 2022 13:42:42 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 js3-20020a17090b148300b0020a11217682sm107884pjb.27.2022.12.08.13.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:42:41 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:42:38 -0800
Message-Id: <20221208214238.4151960-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/docker-proxy: drop package
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
Cc: Christian Stewart <christian@paral.in>,
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
index 522102a0c0..028f9d9cea 100644
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
 config BR2_PACKAGE_USBREDIR_SERVER
 	bool "usbredirserver removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 20677ef8ce..c0c64a8df8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -543,7 +543,6 @@ F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-compose/
 F:	package/docker-engine/
-F:	package/docker-proxy/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
diff --git a/package/Config.in b/package/Config.in
index f4a423c7a6..1460f43945 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2598,7 +2598,6 @@ menu "System tools"
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
index dc45baf055..298bf05b1f 100644
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
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
