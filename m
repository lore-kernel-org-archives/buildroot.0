Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E24C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB452611EA;
	Sun, 24 Jul 2022 23:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB452611EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5Lk2K7f0TWB; Sun, 24 Jul 2022 23:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD19611E4;
	Sun, 24 Jul 2022 23:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD19611E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DED0F1BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C8B40242
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C8B40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJ1B5mDQ25FC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:37:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E20400CC
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0E20400CC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:37:56 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id bf13so8850466pgb.11
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZltBg9U9sGwtc20+Agrke1DdPvIgohd/Jjl43DJywc=;
 b=STSM/qkrvg6cwGWpQ4HCPx3KhqRpc3+vMO6radsKFu633RBPcOkvqEr9NjPZIWrtqa
 TXmMUKyrrq9LdwzQST16+pEyFYAo+TtmlAHGxsldrzMZUKOuHfs1euoRlN0Kvaj4hF6n
 J71o/TEmxe6pUxEQeC8aVdhsGNr6zsKYVZDTV3eHszWt0NbdCUiAq1/DhEnedXTRW61G
 aPK6Mf55N0IorRUWddqxDO+zuy6Ez8xKEXbDP/O9tn751Ivq2e57bjZIOUddYggNuodX
 dujGYmSQAzv2ahHWRX11APvNjiuWvYquRmOaMBK2V/BIxVxPWx5iTe+zvPeI+ZLiyfpd
 N8sw==
X-Gm-Message-State: AJIora/fkypk3BBv0u2A4ByoIeJwnqvyGAhbl2FOm+AZgIMoBeefHhKu
 joLa8B0WzkgdeNYufrslio0R3EVPfX4KCw==
X-Google-Smtp-Source: AGRyM1tsmezji0eo9KvtAWiIGJYcwNRQRo4dP7SV2wDa+r8y7UQdhi7Uswjse68SSA8t2ZiltKxjaw==
X-Received: by 2002:a63:5456:0:b0:419:fdbe:11af with SMTP id
 e22-20020a635456000000b00419fdbe11afmr8810480pgm.151.1658705875608; 
 Sun, 24 Jul 2022 16:37:55 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c10d00b0016bfe9ab1f3sm7742996pli.36.2022.07.24.16.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:37:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:37:52 -0700
Message-Id: <20220724233752.674437-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/go: use host compiler when
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
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
2. Build go-bootstrap (which is Go 1.4.x and written in C)
3. Build go 1.16.x (written in Go) using go-bootstrap.

The problem is that step 2 - build go-bootstrap - does not work on 64-bit arm.
The Go compiler from 1.4.x is compatible with x86, x86_64, and arm (32 bit).

This patch instead uses the host Go compiler to bootstrap host-go when
BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS is not set. This is similar to how
the host GCC is used to bootstrap the Buildroot toolchain.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - thanks Thomas for the review & suggestions
 - added NEEDS_HOST_GO boolean
 - added dependency checks to support/dependencies/dependencies.sh
 - removed unnecessary changes to go-bootstrap package

Signed-off-by: Christian Stewart <christian@paral.in>
---
 Config.in                            | 4 ++++
 package/go-bootstrap/Config.in.host  | 3 +--
 package/go/Config.in.host            | 5 +++--
 package/go/go.mk                     | 9 +++++++--
 support/dependencies/dependencies.sh | 4 ++++
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index af9052d32b..bd2197c9d5 100644
--- a/Config.in
+++ b/Config.in
@@ -58,6 +58,10 @@ config BR2_HOST_GCC_AT_LEAST_9
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
+# Hidden boolean selected if bootstrapping Go w/ GCC is not supported.
+config BR2_NEEDS_HOST_GO
+	bool
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: kodi)
 config BR2_NEEDS_HOST_JAVA
diff --git a/package/go-bootstrap/Config.in.host b/package/go-bootstrap/Config.in.host
index fab80d24b4..61debedd49 100644
--- a/package/go-bootstrap/Config.in.host
+++ b/package/go-bootstrap/Config.in.host
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	bool
-	# See src/cmd/dist/unix.c for the list of support
-	# architectures
+	# See src/cmd/dist/unix.c for the list of supported architectures.
 	default y if BR2_HOSTARCH = "x86"
 	default y if BR2_HOSTARCH = "x86_64"
 	default y if BR2_HOSTARCH = "arm"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index ded02d3b3a..e1edf820ae 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,8 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	# See src/go/build/syslist.go for a list of supported architectures
+	# See https://go.dev/doc/install/source#environment
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
@@ -28,4 +29,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	select BR2_NEEDS_HOST_GO if !BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
diff --git a/package/go/go.mk b/package/go/go.mk
index 172bf16b6f..c1feaabe82 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,7 +12,6 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -125,7 +124,6 @@ HOST_GO_HOST_ENV = \
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
@@ -135,6 +133,13 @@ HOST_GO_MAKE_ENV = \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 	$(HOST_GO_CROSS_ENV)
 
+# Use the Go compiler bootstrapped by Buildroot if available.
+# Otherwise, use the host Go compiler.
+ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS),y)
+HOST_GO_DEPENDENCIES += host-go-bootstrap
+HOST_GO_MAKE_ENV +=	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT)
+endif
+
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && \
 		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c604a9efcc..18961413cc 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -210,6 +210,10 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
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
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
