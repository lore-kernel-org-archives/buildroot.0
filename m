Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C00C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9F860834;
	Fri, 12 Apr 2024 13:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez1dW-d4r-o3; Fri, 12 Apr 2024 13:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE5BF60859
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE5BF60859;
	Fri, 12 Apr 2024 13:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE6CB1BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1C4240434
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aAE_dyRWK-M for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EE3D401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE3D401D5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EE3D401D5
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41550858cabso6762785e9.2
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928460; x=1713533260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zR/3BoWJ/B5etW1tCI0GFmfYtBkoqPOnBmQI2pKCSE=;
 b=lp6J4zTjxPOER3n7i2o4Rjz98p75c+GBmnngFwPypu6VGCjmdiCiQp0GxI8b+vKKPP
 FmkDsoPGBArOYcwaHjyeQNKKFAXqIp5s1fWlJLtB1usA6X42B2RJNtK95P+w4wxBicmX
 PxKU2RoMW4d4UntxbZrzJZLGgJQ6GwqBshyrxa5untTiWLR6Kah2bsAhDJSgqz0ZeHPU
 UPYmAfZ5kSWNfM2gZK0x9Jsg4zSqNr0hTUEVHbKzsUgJGxl7pfW8rqvsDuG4S2Opzf2c
 qaoyRlnd352apfJlbcqhlPBeWBARWnTEz9x29/sVSIWOfYvvznWWMP9aB/6GMBgs9O7c
 ugMQ==
X-Gm-Message-State: AOJu0YzjGhgar9poEHlqcL1c4ykRqIug7MlsOpe9P4uwisBxQ9pAiOnH
 2C3stQ4zbA1Wq/qbUNRJzKVdknO/gfUyPBC+kOc6aOGMuHljz5hDCp9Q1Ipw0b8x0Ev8F8Sqmyp
 XN8c=
X-Google-Smtp-Source: AGHT+IG70wTJw0cldbrAPPmj60u22CbO8x+jwPUlfh9vP7oGFjWFbbTnyWHYW09nACyqEBAcYR/fzw==
X-Received: by 2002:a05:6000:12c6:b0:346:c7ed:22de with SMTP id
 l6-20020a05600012c600b00346c7ed22demr1632900wrx.14.1712928460172; 
 Fri, 12 Apr 2024 06:27:40 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:39 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:55 +0200
Message-ID: <20240412132659.1168317-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412132659.1168317-1-thomas.perale@mind.be>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928460; x=1713533260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3zR/3BoWJ/B5etW1tCI0GFmfYtBkoqPOnBmQI2pKCSE=;
 b=O3w6LsITWsEEvEPa/2inUjVW6jFHcmLp44hfMN3dWfp5IaAKRShh+Xx15qhWGYqrqo
 z/kH94Qy0lPDzVWZE/hpkXHt9EpbP5SnWskLVPBp/BTXvZvYQ85krflU2OxsNS0d/Za8
 aCNUanLf82QWUdZ2XgTDS+i0T1BfAeng60sH00vXHXtcu32Uv/vFu06HW08xuN4Kg+Wx
 HaQUty69eX3wc263gkpVx1pcggpxkjTUfj+s9u6i232Bss/bfQ9ILgx6xUNSEFYMv0ur
 GEWaJzo2rBrwrptFFPyZpzEEN+Sf+zpEVWqukncfJ95DAkFqdssZWwn3pGoYh81a5WqZ
 4L+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=O3w6LsIT
Subject: [Buildroot] [PATCH 3/6] package/go: make host package a virtual
 package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Turns host-go into a virtual package, which has two providers:

 - host-go-src, which builds host-go from source based on the same logic
   that was previously used in package/go/go/go.mk, now moved to
   package/go/go-src/go-src.mk to remove any ambiguity on the role of
   the package.

 - host-go-bin, which will be introduced in the next commit and installs
   a pre-built Go compiler.

The usage of a virtual package enables support for pre-built Go
compiler, which reduces the build time for of host-go.
A similar solution is proposed for host-rust.

By default, host-go is built from sources to keep the same behavior as
the former version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                           |  2 +-
 package/go/Config.in.host                     | 32 +++++++++++++++++++
 ...explicit-option-for-crosscompilation.patch |  0
 ...ldvcs-false-when-building-go-bootstr.patch |  0
 package/go/{go/go.hash => go-src/go-src.hash} |  0
 package/go/{go/go.mk => go-src/go-src.mk}     | 25 ++++++++-------
 package/go/go.mk                              |  2 ++
 7 files changed, 48 insertions(+), 13 deletions(-)
 rename package/go/{go => go-src}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
 rename package/go/{go => go-src}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
 rename package/go/{go/go.hash => go-src/go-src.hash} (100%)
 rename package/go/{go/go.mk => go-src/go-src.mk} (68%)

diff --git a/.checkpackageignore b/.checkpackageignore
index b3eab26071..69681bfeaa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -465,7 +465,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
-package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
+package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7edf45850d..a213ee94bf 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -32,6 +32,38 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 
+config BR2_PACKAGE_HOST_GO
+	bool "host go compiler"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  Compiler for the Go language
+
+	  https://go.dev
+
+if BR2_PACKAGE_HOST_GO
+
+choice
+	prompt "Go compiler variant"
+	default BR2_PACKAGE_HOST_GO_SRC
+	help
+	  Select a Go compiler variant.
+
+	  Default to 'host-go-src'.
+
+config BR2_PACKAGE_HOST_GO_SRC
+	bool "host go (source)"
+	help
+	  This package will build the go compiler for the host.
+
+endchoice
+
+config BR2_PACKAGE_PROVIDES_HOST_GO
+	string
+	# Default to host-go-src
+	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
+
+endif
+
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
similarity index 100%
rename from package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
rename to package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
diff --git a/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
diff --git a/package/go/go/go.hash b/package/go/go-src/go-src.hash
similarity index 100%
rename from package/go/go/go.hash
rename to package/go/go-src/go-src.hash
diff --git a/package/go/go/go.mk b/package/go/go-src/go-src.mk
similarity index 68%
rename from package/go/go/go.mk
rename to package/go/go-src/go-src.mk
index c3c40922f4..9d73c7c692 100644
--- a/package/go/go/go.mk
+++ b/package/go/go-src/go-src.mk
@@ -1,21 +1,22 @@
 ################################################################################
 #
-# go
+# go-src
 #
 ################################################################################
 
-GO_SITE = https://storage.googleapis.com/golang
-GO_SOURCE = go$(GO_VERSION).src.tar.gz
+GO_SRC_SITE = https://storage.googleapis.com/golang
+GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
 
-GO_LICENSE = BSD-3-Clause
-GO_LICENSE_FILES = LICENSE
-GO_CPE_ID_VENDOR = golang
+GO_SRC_LICENSE = BSD-3-Clause
+GO_SRC_LICENSE_FILES = LICENSE
+GO_SRC_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
+HOST_GO_SRC_PROVIDES = host-go
+HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
-HOST_GO_CROSS_ENV = \
+HOST_GO_SRC_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
 	GOOS="linux" \
@@ -28,7 +29,7 @@ endif
 
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
-HOST_GO_MAKE_ENV = \
+HOST_GO_SRC_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
@@ -41,12 +42,12 @@ HOST_GO_MAKE_ENV = \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 	$(HOST_GO_CROSS_ENV)
 
-define HOST_GO_BUILD_CMDS
+define HOST_GO_SRC_BUILD_CMDS
 	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+		$(HOST_GO_SRC_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
 endef
 
-define HOST_GO_INSTALL_CMDS
+define HOST_GO_SRC_INSTALL_CMDS
 	$(GO_BINARIES_INSTALL)
 endef
 
diff --git a/package/go/go.mk b/package/go/go.mk
index 104a4a73fb..21cdb29f8f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -129,4 +129,6 @@ define GO_BINARIES_INSTALL
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
+$(eval $(host-virtual-package))
+
 include $(sort $(wildcard package/go/*/*.mk))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
