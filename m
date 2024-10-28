Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C50CD5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2428F401FD;
	Mon, 28 Oct 2024 22:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEoZhJjdPI9x; Mon, 28 Oct 2024 22:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8866C403A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8866C403A7;
	Mon, 28 Oct 2024 22:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D9ABAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9049640015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mChxFo0F9hKX for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFE3540154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE3540154
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFE3540154
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:48 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83aad8586d3so205644039f.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730153448; x=1730758248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKrdAjU0sfR30kWorx9PwbDktgc6L7luefcMcjck88w=;
 b=UCENg3/aVo5+6Izf8rg+EBMqWyI95Dxu8nG1+QH1Zjwi2I1D5hBZwU2I9oVm9AO4Ly
 hTos69gDU8QFYinl8JW6SM8kAzwpTa+i8Wl3br/LXoQKHMDki1ko6VzdKTyWFQlqMqVT
 PktQTSUECkR0Tt4K5+gqcwOqmHmXOSRt8wecHCKd+k+XzakvhlTSPMNkH34JMQadX77G
 ayFbb8AZC+ELHfVVT6eLzsZ1VE/K6HyNP3pYUmkSO4tYNltV8p8lCSZNEY7TNU1Hasqe
 dG/flGYMO/cyQnR/ru6Ds8t3/2QWqEZrv4sPSYoqqQufm2rOZnuK95APbPYdFzr5VEdP
 q2/A==
X-Gm-Message-State: AOJu0YxuL6FdjAkYR40Usd301Nwt716utUc6OvUrLXWWfbNHAPY4QwwO
 2AHzVcRGjdjH+ulLBM+3Ycm/8nbXZZ/o9HlJSnDa3SJDyaia+ygeymRPMw==
X-Google-Smtp-Source: AGHT+IGFFjqPmlwC5+2C/4VRRbTLZj8qWY4A0o1ptTnSR8sKvwb/SsOdHyurxZFLruwxvHSzhqVVKA==
X-Received: by 2002:a05:6602:29d0:b0:83a:a746:68a6 with SMTP id
 ca18e2360f4ac-83b1c43e1a0mr1081634739f.5.1730153447500; 
 Mon, 28 Oct 2024 15:10:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137c978bsm168012039f.4.2024.10.28.15.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 15:10:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 28 Oct 2024 16:10:44 -0600
Message-Id: <20241028221045.3354144-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730153448; x=1730758248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tKrdAjU0sfR30kWorx9PwbDktgc6L7luefcMcjck88w=;
 b=HfDMkcO8RCS764GTOoehgCMLgn5FH1ohqGN6rOWaxBWH3OgNhJIA1T4TPp3GXEnME3
 HUo/n7uCd4pnN12mdvGudMzJ2xawmHCP/oavrl8BXy7HEzxzqbdqEjAVGEoeqe3FRacM
 FEFMifKijV8SklX69GplmwCGfbzDX/w0t0iZ5cCouERdVS2M+eROWVzjDDJeeyaq5WTo
 iyCFrVxq5xjW1zlSR7q95b34E+Kj7N4sgb02z8IRhcBFnOrKNg6vdQbt7BqrIFL1qTLS
 bjAQMIhOMOMvwRxK1EyUqb1GnSvCRGJ3P0V4uuK3xMWqdLzQsiSrhzPZXVjQjBMP51Du
 AUsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HfDMkcO8
Subject: [Buildroot] [PATCH 1/2] package/go/go-cf: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a fork of go needed for cloudflared to work properly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .checkpackageignore                           |   1 +
 ...explicit-option-for-crosscompilation.patch |   1 +
 ...ldvcs-false-when-building-go-bootstr.patch |   1 +
 package/go/go-cf/go-cf.hash                   |   3 +
 package/go/go-cf/go-cf.mk                     | 101 ++++++++++++++++++
 package/pkg-golang.mk                         |  13 ++-
 6 files changed, 117 insertions(+), 3 deletions(-)
 create mode 120000 package/go/go-cf/0001-build.go-explicit-option-for-crosscompilation.patch
 create mode 120000 package/go/go-cf/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
 create mode 100644 package/go/go-cf/go-cf.hash
 create mode 100644 package/go/go-cf/go-cf.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index babcb813b4..1213bd1ece 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -553,6 +553,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
+package/go/go-cf/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
diff --git a/package/go/go-cf/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go-cf/0001-build.go-explicit-option-for-crosscompilation.patch
new file mode 120000
index 0000000000..e77a438613
--- /dev/null
+++ b/package/go/go-cf/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -0,0 +1 @@
+../go-src/0001-build.go-explicit-option-for-crosscompilation.patch
\ No newline at end of file
diff --git a/package/go/go-cf/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-cf/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
new file mode 120000
index 0000000000..ee0c654f08
--- /dev/null
+++ b/package/go/go-cf/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
@@ -0,0 +1 @@
+../go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
\ No newline at end of file
diff --git a/package/go/go-cf/go-cf.hash b/package/go/go-cf/go-cf.hash
new file mode 100644
index 0000000000..78bf3eec5b
--- /dev/null
+++ b/package/go/go-cf/go-cf.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  da1bcdeb86767dab40bf4debd49615a32c795689ba2ac7f6f87d2f389691fdc1  go-cf-ec0a014545f180b0c74dfd687698657a9e86e310.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-cf/go-cf.mk b/package/go/go-cf/go-cf.mk
new file mode 100644
index 0000000000..ac686e4e29
--- /dev/null
+++ b/package/go/go-cf/go-cf.mk
@@ -0,0 +1,101 @@
+################################################################################
+#
+# go-cf
+#
+################################################################################
+
+GO_CF_VERSION = ec0a014545f180b0c74dfd687698657a9e86e310
+GO_CF_SITE = $(call github,cloudflare,go,$(GO_CF_VERSION))
+
+GO_CF_LICENSE = BSD-3-Clause
+GO_CF_LICENSE_FILES = LICENSE
+
+HOST_GO_CF_ROOT = $(HOST_DIR)/lib/go-cf
+
+# We pass an empty GOBIN, otherwise "go install: cannot install
+# cross-compiled binaries when GOBIN is set"
+HOST_GO_CF_COMMON_ENV = \
+	GO111MODULE=on \
+	GOFLAGS=-mod=vendor \
+	GOROOT="$(HOST_GO_CF_ROOT)" \
+	GOPATH="$(HOST_GO_GOPATH)" \
+	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
+	GOMODCACHE="$(HOST_GO_CF_ROOT)/pkg/mod" \
+	GOPROXY=off \
+	GOTOOLCHAIN=local \
+	PATH=$(BR_PATH) \
+	GOBIN= \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
+
+# For the convenience of target packages.
+HOST_GO_CF_TOOLDIR = $(HOST_GO_CF_ROOT)/pkg/tool/linux_$(GO_GOARCH)
+HOST_GO_CF_TARGET_ENV = \
+	$(HOST_GO_CF_COMMON_ENV) \
+	GOOS="linux" \
+	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
+	GOTOOLDIR="$(HOST_GO_CF_TOOLDIR)"
+
+HOST_GO_CF_DEPENDENCIES = host-go
+
+ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
+
+HOST_GO_CF_CROSS_ENV = \
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
+HOST_GO_CF_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_CF_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+	$(HOST_GO_CF_CROSS_ENV)
+
+define HOST_GO_CF_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_CF_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_CF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_CF_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_CF_ROOT)/bin/gofmt
+
+	mkdir -p $(HOST_DIR)/bin
+	ln -sf ../lib/go-cf/bin/go $(HOST_DIR)/bin/go-cf
+
+	cp -a $(@D)/lib $(HOST_GO_CF_ROOT)/
+
+	mkdir -p $(HOST_GO_CF_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(HOST_GO_CF_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_CF_ROOT)/pkg/
+
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
+	cp -a $(@D)/src $(HOST_GO_CF_ROOT)/
+
+	# Set file timestamps to prevent the Go compiler from rebuilding the stdlib
+	# when compiling other programs.
+	find $(HOST_GO_CF_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 8e27602d41..2d19c044ee 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -21,7 +21,6 @@
 #
 ################################################################################
 
-GO_BIN = $(HOST_DIR)/bin/go
 
 ################################################################################
 # inner-golang-package -- defines how the configuration, compilation and
@@ -40,6 +39,14 @@ GO_BIN = $(HOST_DIR)/bin/go
 
 define inner-golang-package
 
+ifndef $(2)_GO_BIN
+	ifdef $(3)_GO_BIN
+		$(2)_GO_BIN = $$($(3)_GO_BIN)
+	else
+		$(2)_GO_BIN ?= $$(HOST_DIR)/bin/go
+	endif
+endif
+
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-modcacherw \
@@ -124,7 +131,7 @@ define $(2)_BUILD_CMDS
 		cd $$(@D); \
 		$$(HOST_GO_TARGET_ENV) \
 			$$($(2)_GO_ENV) \
-			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
+			$$($(2)_GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
 			$$($(2)_GOMOD)/$$(d)
 	)
@@ -136,7 +143,7 @@ define $(2)_BUILD_CMDS
 		cd $$(@D); \
 		$$(HOST_GO_HOST_ENV) \
 			$$($(2)_GO_ENV) \
-			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
+			$$($(2)_GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
 			$$($(2)_GOMOD)/$$(d)
 	)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
