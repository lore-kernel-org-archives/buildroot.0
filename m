Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F338FC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCBB381767;
	Mon, 15 Apr 2024 16:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FqDQj5RWBC7; Mon, 15 Apr 2024 16:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8010B817ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8010B817ED;
	Mon, 15 Apr 2024 16:23:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B39B1BF95D
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15522404A6
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rf1DmO2QaPYV for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:23:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A3A9400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3A9400FE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A3A9400FE
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:22:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41879f47aa5so5522775e9.3
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 09:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713198177; x=1713802977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqHXx3w49YSp0Rn2pJJUWQ20RPjld12M1lXnbAtm4ZU=;
 b=dWwVVMnz96dPoXkoA4atNCGivmAYhib6+fc4mC0EBpAyVVbH5j27wVOLInG1RLhqcd
 aKoM3zuEyp4LaB0C/ii7b8GcELQmE8GmCMOEn3Ct4KOw2VudzDpGRUDc9IBIXZd/XG6o
 AoS/zdiWgswxmgxziFQXh9r4sZM3CWVfOv5oZdE1RiesNdHLV0yMpoQa7mZhwbOeRtEL
 pvIr5JiN+hOkXx8wpPk6oDWK1sdrGjDcuhqoHoymFSDQXFvPXq7rCgv3KHBdbXSvr7Bg
 6YN49/0lvEl6xUp+1AV7dxZOoTATgsLEDD6clg+een52O4X0FZ/yOsqB9mnr8jBJEyI4
 937w==
X-Gm-Message-State: AOJu0YxD5pX8iYfGxcSr7QgG/WikypTSoJnuGTScUlDSu/iidZUQy8cJ
 QDP2IUuX/0/9nSrUb5Vm3UAr0HXwDCmJVaklHhILVjwHQoYlXFrb7I4nCDV8RbLiSNlOWC8YIhN
 VAlE=
X-Google-Smtp-Source: AGHT+IH1qmdXQH8FYMnhYwj6t+yiYYPPg3/WG6O0Os1kRcbwzrw6klGVmlcFCBP/X285OXUBttoHdA==
X-Received: by 2002:a05:600c:3d9b:b0:418:7c58:d592 with SMTP id
 bi27-20020a05600c3d9b00b004187c58d592mr1064572wmb.28.1713198177258; 
 Mon, 15 Apr 2024 09:22:57 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00418631f91c1sm4302938wmb.28.2024.04.15.09.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:22:56 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:22:25 +0200
Message-ID: <20240415162229.1357491-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415162229.1357491-1-thomas.perale@mind.be>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713198177; x=1713802977; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqHXx3w49YSp0Rn2pJJUWQ20RPjld12M1lXnbAtm4ZU=;
 b=PhiDR1H5RPZApmPeplxP42f/EIOo6PyicK1QwHmoupG9k325QSomrQR0zSD515PU0v
 wPhNv3hFvMz2AMS3uATHJnlockK5L4qwc/yb6EChuULx2m+XgBY0++O2V52bRfMT+BGu
 G9b3RlIvEpYF7YT9MsOANan9WKDNmotnVXuK9uoTUCUFrKbGuLOJFVjxbms+BJIHyr0T
 J0MDh5fCApomyMEOpjkwvSyYXOHc+CXcAA/Kwi3028ZhLoBs6GmyriRLCMJlLmXH9pcv
 +exnzE1pKRSvzKNL152Tznf+2XKBIt2gD2UVbjVDn8GhJlb+/SbNKZecni+C8J/mdpSg
 iQZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=PhiDR1H5
Subject: [Buildroot] [PATCH v2 4/6] package/go: make host package a virtual
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Turns host-go into a virtual package, with a single providers:

 - host-go-src, which builds host-go from source based on the same logic
   that was previously used in package/go/go/go.mk, now moved to
   package/go/go-src/go-src.mk to remove any ambiguity on the role of
   the package.

In later commits, we'll add host-go-bin a prebuilt binary host go compiler
as another provider.

A similar solution is proposed for host-rust.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                           |  2 +-
 package/go/Config.in.host                     | 24 +++++++++++++++++
 ...explicit-option-for-crosscompilation.patch |  0
 ...ldvcs-false-when-building-go-bootstr.patch |  0
 package/go/{go/go.hash => go-src/go-src.hash} |  0
 package/go/{go/go.mk => go-src/go-src.mk}     | 27 ++++++++++---------
 package/go/go.mk                              |  2 ++
 7 files changed, 41 insertions(+), 14 deletions(-)
 rename package/go/{go => go-src}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
 rename package/go/{go => go-src}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
 rename package/go/{go/go.hash => go-src/go-src.hash} (100%)
 rename package/go/{go/go.mk => go-src/go-src.mk} (66%)

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
index e1833d0905..483393f8e4 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -37,6 +37,30 @@ config BR2_PACKAGE_HOST_GO
 	bool
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS

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
similarity index 66%
rename from package/go/go/go.mk
rename to package/go/go-src/go-src.mk
index c3c40922f4..1e061e20bc 100644
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
@@ -39,14 +40,14 @@ HOST_GO_MAKE_ENV = \
 	CC=$(HOSTCC_NOCCACHE) \
 	CXX=$(HOSTCXX_NOCCACHE) \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
-	$(HOST_GO_CROSS_ENV)
+	$(HOST_GO_SRC_CROSS_ENV)

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
