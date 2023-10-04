Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D658E7C4C4
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 14:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BE461424;
	Wed,  4 Oct 2023 14:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7BE461424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UffdbICR0ysC; Wed,  4 Oct 2023 14:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9506561427;
	Wed,  4 Oct 2023 14:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9506561427
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886751BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F9C960B1C
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F9C960B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAF7ErFi5pMu for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 14:23:23 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB9F860B33
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 14:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB9F860B33
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so1086651a12.3
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 07:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696429401; x=1697034201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNv8kYmhAuMX3kHqzWLMdBbziQqYGvzBiZJf/suay1M=;
 b=toXTRbkcrQ3oM7NLWoeHxgHYB88YJMfMkn4jqd/BrfIyJB575jea+DL21XaqQoFIKy
 2VhMhi4y5xjwK2KVu4bcyVJQlQ/xnuTbiVU6kzTu2ho2vSmzOZ8jBJ3muG7SGay/qg1T
 4OjrJuw3Vicqdvy56nOaad6fOpg+tOpfy88NOQ5Wl6n+w2PJfuokV/7n3/Z66jEVoXlR
 SirHBgp19PgNOmGkWmHTsKBB4QD8XQbGIkbAcZE38AFlWKILQufiHnMGZXSA+vvzz0PX
 mTcYGmMnwVtQvvM8WRDZnfBmPnDMcqD1Q34EinQppuOwzLU3Z33N6kgd6fRgiTPAXcVd
 d+Qw==
X-Gm-Message-State: AOJu0YwUczAUjPRk8O69GGOZK2kYAM/KSwGzEFNpjsoI99jV5vusYd87
 2jDfjtn9jiWLOwzIyUbYj/iKaknHPpaLbsVS2hhOFg==
X-Google-Smtp-Source: AGHT+IFYnOWaDjFzWG9pqOsI2FOKI5hOZbbMNRjU2VRoi4kVRF5SlmBf7VwkErBHypfoEkdEy6/PRA==
X-Received: by 2002:a17:906:5a66:b0:9ae:5120:5141 with SMTP id
 my38-20020a1709065a6600b009ae51205141mr2198254ejc.37.1696429400677; 
 Wed, 04 Oct 2023 07:23:20 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 dv7-20020a170906b80700b009a5f7fb51dcsm2851805ejb.42.2023.10.04.07.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 07:23:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 16:22:58 +0200
Message-ID: <20231004142303.203520-3-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004142303.203520-1-thomas.perale@essensium.com>
References: <20231004142303.203520-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696429401; x=1697034201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNv8kYmhAuMX3kHqzWLMdBbziQqYGvzBiZJf/suay1M=;
 b=SjRRo9XuPZl7psgWzDEYJImsXAw3Ed9n9xSZynBKqTJJ1G5itM94WJV3IGW/pqfjy2
 f0TqbrDITedPKZh/IgvCIHPJc7Zb224UijCMIz4JjnDsB64vi1pF/zBdplUQMknhGWhF
 e0YjmXitvyxnSVZXzjoR2dkoceU3Nu+s14uTph679dA1TVRntqbKSuzJNL89gks4I5kP
 wsg4b09Ocxq5G6AxtFh21R1eFNXB8BCTHDPzIkpHPq6Y+pdj4TyG4I7TPNJqPcGGCkDF
 em0eSI9qwcEwxenJNsFNeJklKZ9DIxMsjbrS3eyXGBn2275W7MWqyrV5Lj3mccGq2gzM
 5zwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=SjRRo9Xu
Subject: [Buildroot] [PATCH 2/6] package/go: new subdirectory for go variants
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <thomas.perale@mind.be>

Move every go compiler-related packages into a newly created
package/go/ subdirectory. All the common variables are kept in
package/go/go.mk and package/go/Config.in.host.

This subdirectory structure move the GO_VERSION variable in common in
the package/go/go.mk file. In the next commits host-go will be turned
into a virtual-package and the common GO_VERSION force the providers to
use the same Go compiler version.
Also, the subdirectory structure force the evaluation of the common
GO_VERSION before the providers access it.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                           |  2 +-
 DEVELOPERS                                    |  2 -
 package/Config.in.host                        |  2 -
 package/go/Config.in.host                     |  3 ++
 .../go-bootstrap-stage1/Config.in.host        |  0
 .../go-bootstrap-stage1.hash                  |  0
 .../go-bootstrap-stage1.mk                    |  0
 .../go-bootstrap-stage2/Config.in.host        |  0
 .../go-bootstrap-stage2.hash                  |  0
 .../go-bootstrap-stage2.mk                    |  0
 package/go/go.mk                              | 40 +-------------
 ...explicit-option-for-crosscompilation.patch |  0
 ...ldvcs-false-when-building-go-bootstr.patch |  0
 package/go/{ => go}/go.hash                   |  0
 package/go/go/go.mk                           | 53 +++++++++++++++++++
 15 files changed, 59 insertions(+), 43 deletions(-)
 rename package/{ => go}/go-bootstrap-stage1/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.hash (100%)
 rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.mk (100%)
 rename package/{ => go}/go-bootstrap-stage2/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.hash (100%)
 rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.mk (100%)
 rename package/go/{ => go}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
 rename package/go/{ => go}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
 rename package/go/{ => go}/go.hash (100%)
 create mode 100644 package/go/go/go.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 28de1745e4..becaf6a9fc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -514,7 +514,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch Upstream
-package/go/0001-build.go-explicit-option-for-crosscompilation.patch Upstream
+package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch Upstream
 package/gob2/0001-dont-include-from-prefix.patch Upstream
 package/gobject-introspection/0001-disable-tests.patch Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index 4681b2a21f..b9c7b4f1a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -586,8 +586,6 @@ F:	package/docker-engine/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
-F:	package/go-bootstrap-stage1/
-F:	package/go-bootstrap-stage2/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..3a8e613fa3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -44,8 +44,6 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
-	source "package/go-bootstrap-stage1/Config.in.host"
-	source "package/go-bootstrap-stage2/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index b87b862cec..277d75e2b6 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -31,3 +31,6 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+
+source "package/go/go-bootstrap-stage1/Config.in.host"
+source "package/go/go-bootstrap-stage2/Config.in.host"
diff --git a/package/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage1/Config.in.host
rename to package/go/go-bootstrap-stage1/Config.in.host
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.hash b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
similarity index 100%
rename from package/go-bootstrap-stage1/go-bootstrap-stage1.hash
rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
similarity index 100%
rename from package/go-bootstrap-stage1/go-bootstrap-stage1.mk
rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
diff --git a/package/go-bootstrap-stage2/Config.in.host b/package/go/go-bootstrap-stage2/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage2/Config.in.host
rename to package/go/go-bootstrap-stage2/Config.in.host
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
similarity index 100%
rename from package/go-bootstrap-stage2/go-bootstrap-stage2.hash
rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
similarity index 100%
rename from package/go-bootstrap-stage2/go-bootstrap-stage2.mk
rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
diff --git a/package/go/go.mk b/package/go/go.mk
index 6f080be5c0..21051a2050 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -5,14 +5,7 @@
 ################################################################################
 
 GO_VERSION = 1.21.1
-GO_SITE = https://storage.googleapis.com/golang
-GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-GO_LICENSE = BSD-3-Clause
-GO_LICENSE_FILES = LICENSE
-GO_CPE_ID_VENDOR = golang
-
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -96,15 +89,6 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 
-HOST_GO_CROSS_ENV = \
-	CC_FOR_TARGET="$(TARGET_CC)" \
-	CXX_FOR_TARGET="$(TARGET_CXX)" \
-	GOOS="linux" \
-	GOARCH=$(GO_GOARCH) \
-	$(if $(GO_GO386),GO386=$(GO_GO386)) \
-	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
-	GO_ASSUME_CROSSCOMPILING=1
-
 else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # host-go can still be used to build packages for the host. No need to set all
 # the arch stuff since we will not be cross-compiling.
@@ -123,27 +107,7 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
-HOST_GO_MAKE_ENV = \
-	GO111MODULE=off \
-	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
-	GOROOT_FINAL=$(HOST_GO_ROOT) \
-	GOROOT="$(@D)" \
-	GOBIN="$(@D)/bin" \
-	GOOS=linux \
-	CC=$(HOSTCC_NOCCACHE) \
-	CXX=$(HOSTCXX_NOCCACHE) \
-	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
-	$(HOST_GO_CROSS_ENV)
-
-define HOST_GO_BUILD_CMDS
-	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
-endef
-
-define HOST_GO_INSTALL_CMDS
+define GO_BINARIES_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
@@ -165,4 +129,4 @@ define HOST_GO_INSTALL_CMDS
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
-$(eval $(host-generic-package))
+include $(sort $(wildcard package/go/*/*.mk))
diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
similarity index 100%
rename from package/go/0001-build.go-explicit-option-for-crosscompilation.patch
rename to package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
diff --git a/package/go/go.hash b/package/go/go/go.hash
similarity index 100%
rename from package/go/go.hash
rename to package/go/go/go.hash
diff --git a/package/go/go/go.mk b/package/go/go/go.mk
new file mode 100644
index 0000000000..8e3780eb29
--- /dev/null
+++ b/package/go/go/go.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# go
+#
+################################################################################
+
+GO_SITE = https://storage.googleapis.com/golang
+GO_SOURCE = go$(GO_VERSION).src.tar.gz
+
+GO_LICENSE = BSD-3-Clause
+GO_LICENSE_FILES = LICENSE
+GO_CPE_ID_VENDOR = golang
+
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
+
+ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
+
+HOST_GO_CROSS_ENV = \
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOOS="linux" \
+	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
+	GO_ASSUME_CROSSCOMPILING=1
+
+endif
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+	$(HOST_GO_CROSS_ENV)
+
+define HOST_GO_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_INSTALL_CMDS
+	$(GO_BINARIES_INSTALL)
+endef
+
+$(eval $(host-generic-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
