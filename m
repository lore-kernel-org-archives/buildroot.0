Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63829C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2272B80F6D;
	Mon, 19 Aug 2024 20:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usYirL3l8ggr; Mon, 19 Aug 2024 20:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D39810CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D39810CC;
	Mon, 19 Aug 2024 20:33:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC181BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B012605AA
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWzXSCgmKWPS for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C59F60839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C59F60839
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C59F60839
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:33:45 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7106cf5771bso3848332b3a.2
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 13:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724099624; x=1724704424;
 h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=73rHZtZcYimAF/1oDbMZlfbcfOpJHwXr5eWgo/MKa3o=;
 b=rzfg8CFCE8rmhzelyMl/6vW7nDi+qzJb9BEU62zGLpmryxxJl4x9lFbbYinOsHT4Ft
 X2EmE75AYvEZu13iiSSlpI0+Hh7xzeP2TQfMCjCADv2OghVLTbyNFnscRoeGj3XCE1uW
 NsQ4TWGB3lmOUW97hPv6i9blTv4IyqNTiq+O5IWjQjnr5tD/q2y2k1nfdV9z+dQdrt9n
 OJajju6VuM966oHYsOmL0c6/FMJqCuiPF872o/V0UXi3qPTRLnvplTK+o2PlGVYKnaRt
 sBKUz1TI1vPDiik822nsjUHx+g3m6JgeXqJ1PumKaV7OUmv/P3U49e1VddLD84i4ASKr
 d0lg==
X-Gm-Message-State: AOJu0YxqoA4UhUfHVU6nfQxm9jJv9IFrb/ClsMz5KduhDyVqYyw0qVP+
 cPqtpZtbTtSqZ+XSbAKsigttAaX9+6jkf5IMzLcsJi5dSXG6TaRjMbPLC69hLJyiyTTt42D7E4x
 Oru54dUSbFLuQ9iKAP0OCkylChBxQvRIpgOgxGQPlSVjf2vjc7O5/PQ==
X-Google-Smtp-Source: AGHT+IE6GIe5i4216tuZ6Kq7X33HylOd+B8nPjfwEBMoh7gR29yI/zK+6q00zuV25192ihhs50o3mZaRcgtxjtuKPPk=
X-Received: by 2002:a05:6300:4043:b0:1c6:fb2a:4696 with SMTP id
 adf61e73a8af0-1c904f98efamr10717595637.19.1724099623926; Mon, 19 Aug 2024
 13:33:43 -0700 (PDT)
Received: from 432080191184 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Aug 2024 13:33:43 -0700
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:33:43 -0700
Message-ID: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1724099624; x=1724704424; darn=buildroot.org;
 h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=73rHZtZcYimAF/1oDbMZlfbcfOpJHwXr5eWgo/MKa3o=;
 b=ABwb501oiBMrUlPqfd4Qi6zMfgdqm8ooGflLQQBCXuM4ikZzgdN9WXpka+gb15M2pI
 ZX7vZpRC8hwiZ8wPN3EUORD0zfFh2puHpPvjqj8asiivhN8QBMyPzMiwCsTgjEhW6GSQ
 YkO/AwC62QWIkbGobzCa+4JHFY3EHH+A3FCORpUrSWp74xSEpPB+iuX6+G7p1NS+OC7Q
 +QOH9q0PfSc4O2+vNgL+SSds0fx/u8zm4b7sDtO8ir6VnBlJnuWQwGE/TsWRMQnwmW4D
 R6qsPLOwKSvAVWjFwCyjCK/OAXdOnB/j5WbbeC3+oE7/vNAZgvyXOygEC4RWfzLhafly
 dwkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ABwb501o
Subject: [Buildroot] [PATCH v8 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
compiled Go version to use to build from source.

https://golang.org/doc/install/source#bootstrapFromSource

The process for "bootstrapping" the Go compiler in Buildroot is:

1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
2. Build go-bootstrap-stage1 (which is Go 1.4.x and written in C)
3. Build go-bootstrap-stage2 (which is Go 1.19.x and written in Go)
4. Build go-bootstrap-stage3 (which is Go 1.21.x and written in Go)
5. Build go-src (written in Go) using go-bootstrap-stage3.

go-bootstrap-stage1 does not work on 64-bit arm. The Go 1.4.x bootstrap compiler
is compatible with x86, x86_64, and arm (32 bit) only.

This patch adds a fallback to require a host Go compiler to build host-go-src
when BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS is not set.

Recent changes added go-src with the intent of adding go-bin later. This
commit changes go-src to depend on the host Go compiler to bootstrap
go-src on architectures that cannot build go-bootstrap-stage1 (such as arm64).

Signed-off-by: Christian Stewart <christian@aperture.us>

---

changes prior to inclusion in this series:

 - thanks Thomas for the review & suggestions
 - added NEEDS_HOST_GO boolean
 - added dependency checks to support/dependencies/dependencies.sh
 - removed unnecessary changes to go-bootstrap package
 - add dependency on toolchain if Cgo is enabled
 - updates for go1.20
 - updates for go-bootstrap-stage{1,2}

changes from v1 -> v2:

 - remove whitespace fix in bootstrap stage2

changes from v2 -> v3:

 - rebase

changes from v7 -> v8:

- rebase on go-src changes
- Discussion related to adding go-src and go-bin:
  - https://patchwork.ozlabs.org/project/buildroot/patch/20230711220849.1702358-4-christian@aperture.us/

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 Config.in                            |  4 ++++
 package/go/Config.in.host            |  3 +--
 package/go/go-src/go-src.mk          | 12 ++++++++----
 support/dependencies/dependencies.sh |  4 ++++
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index df43db7eff..bd7227a049 100644
--- a/Config.in
+++ b/Config.in
@@ -68,6 +68,10 @@ config BR2_HOST_GCC_AT_LEAST_11
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.

+# Hidden boolean selected if bootstrapping Go w/ GCC is not supported.
+config BR2_NEEDS_HOST_GO
+	bool
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: kodi)
 config BR2_NEEDS_HOST_JAVA
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 11ce6df369..e006dfc830 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,6 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -34,7 +33,6 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS

 # Go packages should select BR2_PACKAGE_HOST_GO
 config BR2_PACKAGE_HOST_GO
@@ -53,6 +51,7 @@ choice

 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
+	select BR2_NEEDS_HOST_GO if
!BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.

diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 0d1a9b3187..7e78f6e4d2 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -12,9 +12,7 @@ GO_SRC_LICENSE_FILES = LICENSE
 GO_SRC_CPE_ID_VENDOR = golang

 HOST_GO_SRC_PROVIDES = host-go
-HOST_GO_SRC_DEPENDENCIES = \
-	host-go-bootstrap-stage3 \
-	$(HOST_GO_DEPENDENCIES_CGO)
+HOST_GO_SRC_DEPENDENCIES = $(HOST_GO_DEPENDENCIES_CGO)

 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)

@@ -34,7 +32,6 @@ endif
 HOST_GO_SRC_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
@@ -44,6 +41,13 @@ HOST_GO_SRC_MAKE_ENV = \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 	$(HOST_GO_SRC_CROSS_ENV)

+# Use the Go compiler bootstrapped by Buildroot if available.
+# Otherwise, use the host Go compiler.
+ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS),y)
+HOST_GO_DEPENDENCIES += host-go-bootstrap-stage3
+HOST_GO_MAKE_ENV += GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT)
+endif
+
 define HOST_GO_SRC_BUILD_CMDS
 	cd $(@D)/src && \
 		$(HOST_GO_SRC_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
diff --git a/support/dependencies/dependencies.sh
b/support/dependencies/dependencies.sh
index 6d5fc36037..7b1c51b4f1 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -217,6 +217,10 @@ if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
 	fi
 fi

+if grep -q ^BR2_NEEDS_HOST_GO=y $BR2_CONFIG ; then
+	check_prog_host "go"
+fi
+
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	check_prog_host "java"
 	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
-- 
2.45.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
