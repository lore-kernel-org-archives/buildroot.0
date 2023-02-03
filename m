Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23597C61DA4
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 03:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B11C61211;
	Fri,  3 Feb 2023 03:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B11C61211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIFfMNGaa66S; Fri,  3 Feb 2023 03:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935F86101F;
	Fri,  3 Feb 2023 03:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 935F86101F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 284731BF955
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0288541058
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0288541058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVM4LmDEsyNC for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 03:44:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7B8C40111
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7B8C40111
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 03:44:54 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id h9so4012284plf.9
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 19:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/p1aU3Z1P5qgCOQDDUSpDpKL9yCS2oJx3WFCU2TyCK4=;
 b=FI+zQyvoDYyNuPC9G7OIc/5+DkxFvSNte+ryQOlW4OiFz3/Ab3p//5VMSNKOJg8zDp
 bpDxzNltbhpefJvTwZyB5jIdg4d8aZ8SdyG8eI7qBM5chmVPgq9dBsvy8ZcNNxlIHgh1
 LNa+YyVgRXnYtemSuqaBdijL6csC3aQqSOuHx6KHwmbPWKj/IGPxF0M9IB70uhasPEsI
 wKR16S2IhepOnMzbgrNUUPc+2iU76EsrrNElp+EpjseDtA3dzK+zcoTdBWW8GQJ7Wx3P
 4LLy6LcclF1+wBo5ufmopTHXNvcgTCQ/tGVSFF6kPbn/4RsZk0x7LU6X4U/gXJEUoRJk
 RuqQ==
X-Gm-Message-State: AO0yUKVQLP6aq8UG+9DkQilR0aUxjRQr5qgKweS1CE4euslJ8FOaajIv
 TW5fjNi4/F3zWWt0kLP1zZbWNqoLcU4bqw==
X-Google-Smtp-Source: AK7set9ImCnVpcyyVFFuUZtfLLY98D27+xs1GrphvPM8UTZb0TLw+wJJTAy6dxQJY27qRiXeE4j5CA==
X-Received: by 2002:a17:90b:4d08:b0:229:932:a0f3 with SMTP id
 mw8-20020a17090b4d0800b002290932a0f3mr8612954pjb.27.1675395893924; 
 Thu, 02 Feb 2023 19:44:53 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b00229d7f2abd4sm582529pjq.54.2023.02.02.19.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 19:44:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 19:44:42 -0800
Message-Id: <20230203034443.326513-3-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203034443.326513-1-christian@paral.in>
References: <20230203034443.326513-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/docker-proxy: drop package
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
index 208688cc43..68855dc926 100644
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
