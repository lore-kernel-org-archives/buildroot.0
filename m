Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A327E7C4C2
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 14:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FA66141F;
	Wed,  4 Oct 2023 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FA66141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Or2c0o9OugSg; Wed,  4 Oct 2023 14:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F616144A;
	Wed,  4 Oct 2023 14:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F616144A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEAC81BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D42A041F8E
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42A041F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScvnXrFaMA4w for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 14:23:24 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0A6F41ED7
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 14:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A6F41ED7
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ae75ece209so410052166b.3
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 07:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696429401; x=1697034201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZcC7nIlIuy5yp6RRQOU46wRgqrmeC85w75pUj7J1qKw=;
 b=dGhtLvY7mNQ59N5pCXK2Lz8J9iUVPF9/1TSV/CfTTdYYniT7FZtaMQ/b6Syr3RrF25
 nVYofUCBx5xr3NtrcEb2f7wJHxsxscBsSANQjUOmhL6zIRYf+g14Ok2wSQTba4TZ/wOv
 jZwGDaysgSgGACVAuz41ydRCxpN29nVeubTD8i7RizEFnrn0xD9SRZ2fYwOKrQPh++C5
 TBBtWYbeI/ftYiMEOltkVvXZoNTD0acIEVmG2BFMcRI9Y38hT5f7/NM1BK/qWlFSYtmc
 SA8HzasJ79ktxoj/wxECIKLjbmaspIokZ+UMjnJompZODG4VYOs2yxvad0Wvv8JytYT5
 eoHw==
X-Gm-Message-State: AOJu0YzWBiT8ySZvmzm+sCsUKY6uYki9CvGzn6fP0KtX5y9yWGDerbK/
 ssyw2f8m+HWQiNgQqP3EwnCq6LYRGd4OcnYmxyTibg==
X-Google-Smtp-Source: AGHT+IH/6iRMikWazcp+KobpBp/wTPWt+ZhNJ069865hxlVR5a1sGJFmq6vkLrtIMP65pJ37zXY1jA==
X-Received: by 2002:a17:906:3d22:b0:9a1:c44d:7056 with SMTP id
 l2-20020a1709063d2200b009a1c44d7056mr2184832ejf.26.1696429401517; 
 Wed, 04 Oct 2023 07:23:21 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 dv7-20020a170906b80700b009a5f7fb51dcsm2851805ejb.42.2023.10.04.07.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 07:23:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 16:22:59 +0200
Message-ID: <20231004142303.203520-4-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004142303.203520-1-thomas.perale@essensium.com>
References: <20231004142303.203520-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696429401; x=1697034201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZcC7nIlIuy5yp6RRQOU46wRgqrmeC85w75pUj7J1qKw=;
 b=gGJYS2l6IpYEmi7HccVWqX5GiiAbprK0QjOBnpB+9+S4IxsAMbltnhlk40dp14sXIR
 ay7N7SAsR6OE6PYDWU7G5zO94oVwuDWs2POn1NH3yYfWODWdbAvz9GzEWi/Iqw6yY08G
 4vdOBGe2GIxwV/iJPjOg8/TuK7hC0kiizlI7zPo+wGk38uiyXXaPGXDkjV3TrADAc8b0
 rlwgOpVQa8zwGCIYyH2ZAYkrakhnP1xSJqxdhOrPE090ioXtZSDxR6PUR6N229iLarAN
 7X3jlWfYYgXqRGt7Qq4Qo2Eh5HTndmvIOCdALZts3i7Q4gNIHMycn/9AoHYdZBDKLPUr
 R6CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=gGJYS2l6
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

Turn host-go into a virtual package, which has two providers:

 - host-go-src, which build host-go from source based on the same logic
   that was previously used in package/go/go/go.mk, now moved in
   package/go/go-src/go-src.mk to remove any ambiguity on the role of
   the package.

 - host-go-bin, which will be introduced in the next commit and installs
   a pre-built Go compiler.

The usage of a virtual package enables the support for pre-built Go
compiler which reduce the build time for of host-go.
A similar solution is proposed for host-rust.

By default, host-go is built from sources to keep the same behaviour as
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
index becaf6a9fc..ca4b2a8afb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -514,7 +514,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch Upstream
-package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch Upstream
+package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch Upstream
 package/gob2/0001-dont-include-from-prefix.patch Upstream
 package/gobject-introspection/0001-disable-tests.patch Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch Upstream
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 277d75e2b6..742d484420 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -32,5 +32,37 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
 
+config BR2_PACKAGE_HOST_GO
+	bool "host go compiler"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
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
index 8e3780eb29..07809ecb3e 100644
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
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
+HOST_GO_SRC_PROVIDES = host-go
+HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage2
 
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
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
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
index 21051a2050..42ea218e6c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -129,4 +129,6 @@ define GO_BINARIES_INSTALL
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
+$(eval $(host-virtual-package))
+
 include $(sort $(wildcard package/go/*/*.mk))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
