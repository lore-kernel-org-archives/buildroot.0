Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DC2C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE1E81FC5;
	Thu,  2 Feb 2023 13:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE1E81FC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRekF4Cj9cJw; Thu,  2 Feb 2023 13:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78FA581FE9;
	Thu,  2 Feb 2023 13:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FA581FE9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D481E1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADB4B60B1C
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB4B60B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47JSr7V289cH for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D178560A7B
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D178560A7B
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:14:02 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id u5so1140797pfm.10
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9McSmodWvmFOI8+1OehqMujkYQZvmFuNOyeos4F1O8=;
 b=0xWy5eSjfnFBFkZ1+3zEu8R7M7t0NLKMwAYwBZsgsFTxQNEu+2KZs3oiyl297LB/5y
 FS0YDyzOQiX1RG5vJgLkKeQJPa/4HlhtiNfhi+1dNjB+j+Kx1Nkv6dZUNpcMJB10326F
 1ZsW+chNSlgZSKmGGUp3CRUbFyLRhL5ARibaZckXn2u5Z6zc03sf3RHULMQQWl1+mvrs
 wP85wf23EoxdrupKmYz3hsGfnm/KmALPd4cOozKQTMiBCYHEFSitBtjlCglL2O5nKJmm
 JZzJWsfMY9J4z6oQtP6/93n+zhprpgzQ4nYex/GuHUtX3etLmjy3IfrIlJTzmIYO0enk
 FD4Q==
X-Gm-Message-State: AO0yUKWs1tN+TSAjUHam2ZvCTjFPE7l1rgYJTAcqK/9DkW1RzscEpgPD
 Ir40k7yWAfGvVab9LeOM7wjT5xjp75AWGA==
X-Google-Smtp-Source: AK7set8C++KVyaAf/ysonwq9IT3n+o9GGIp+emPF+jhytUAa5Gjt9a2rbdL+V2Wu1cTfYaioVn6ZbQ==
X-Received: by 2002:a05:6a00:1392:b0:593:91e4:99e2 with SMTP id
 t18-20020a056a00139200b0059391e499e2mr7092160pfg.34.1675343641847; 
 Thu, 02 Feb 2023 05:14:01 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f132-20020a62388a000000b00593e5a45ce7sm6339999pfa.173.2023.02.02.05.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:14:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:13:53 -0800
Message-Id: <20230202131354.1193243-2-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202131354.1193243-1-christian@paral.in>
References: <20230202131354.1193243-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/3] package/docker-proxy: drop package
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
index 41c5fdefb3..75099f4404 100644
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
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "imx-gpu-viv X11 output has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e19087c577..7d4f9aa6fe 100644
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
index 83fddf316f..dc460ca852 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2615,7 +2615,6 @@ menu "System tools"
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
index 9c193a29a5..2ea2f0a45d 100644
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
