Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F8E7849A
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 12:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6000541E19;
	Mon,  2 Oct 2023 12:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6000541E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79V2vC2c1E9c; Mon,  2 Oct 2023 12:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2EE141E8E;
	Mon,  2 Oct 2023 12:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2EE141E8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1E41BF589
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A83F401D9
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A83F401D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bnAHhIB8GFX for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 12:48:12 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8402B41E19
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 12:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8402B41E19
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99357737980so2302810466b.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 05:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250890; x=1696855690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZcC7nIlIuy5yp6RRQOU46wRgqrmeC85w75pUj7J1qKw=;
 b=R9AhUDaF9I/Vr4pDtcRYtHlaAq40aNxzY+Y42Lw3WNrFlDo6C9/rPIbG5qr114LuzV
 kX3v6yr30mPybFc4V3KAb6GnXAH/mwsbuxh7gOfQB9Pcb3dVvsMqG4zp3EZ1p2Fx5m7o
 DiBhWlSRDXsJaxqsVQ/fYspFMUK5Q4TJPOzRXIHh3XwcSSMlFiS39D4pnhQmSj0O5qXq
 kApe5WrGn9prQSoxn843/6jBZ9dWOL4TE0VanB1OUzv9Vi0yx8KO6Kob34sImUNX8USo
 /8zNqdA+P6N5WCxTomtosWQOTVejWECt68i+fx/tYtbO2xhhtwgsD8T5zutK2yfcqwUK
 vu+w==
X-Gm-Message-State: AOJu0YwQyK31EyhmvElfJA9fthDMtSkgyTuunOUAXc/3i/S6a2jvc5Dn
 WXyxra0Pdo8UxWuugxTqd2dZPEm6ZQRE5duzFf+z7g==
X-Google-Smtp-Source: AGHT+IFERil5vaRuCYyxhSUdf8cRaLyoGlNPnNlQDFBEm1uQOlp4O717PLndNUOXz4WYTT8zrm8uDQ==
X-Received: by 2002:a17:907:1dcc:b0:9ae:406c:3425 with SMTP id
 og12-20020a1709071dcc00b009ae406c3425mr11214632ejc.0.1696250890404; 
 Mon, 02 Oct 2023 05:48:10 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0098951bb4dc3sm16688189ejb.184.2023.10.02.05.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:48:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 14:47:25 +0200
Message-ID: <20231002124736.179251-4-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002124736.179251-1-thomas.perale@essensium.com>
References: <20231002124736.179251-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696250890; x=1696855690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZcC7nIlIuy5yp6RRQOU46wRgqrmeC85w75pUj7J1qKw=;
 b=QrXXK6gPK3xiCKbWPCSsmyTpkM3aPAqlBQ3C/15cg7pSNpyHeBzTJlr1TQyGct9Gwk
 zDNrgqt7jnLFrYG/WubHPJ9n8ujo46xbLHGo/2Tvfeo40RBkDO4ZZWL6HSlIIauYvcZa
 JvoTc0CR5mmqW/qrSMiWp7Ls8I938MF9NQub3NikUdtoPHj2Gt1cTuQ+bwEAMKXSg2Cf
 XT8t/hOfJyaQJYeoYWCIEMnMgVBYFoGlUhAo9xVfNdZw8jj9RVnGoPTBB1+vu5nqOQQQ
 STtk4ucH8dn4IhIbtvz9qhlSMZh44GDw5/7UlmaaanmFnoXOA9Jgj4Jfmontr/H1unSI
 68AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=QrXXK6gP
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
