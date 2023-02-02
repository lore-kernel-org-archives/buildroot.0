Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D49C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 10:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A817F812E5;
	Thu,  2 Feb 2023 10:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A817F812E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbHszwGzH2sA; Thu,  2 Feb 2023 10:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD00B8125B;
	Thu,  2 Feb 2023 10:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD00B8125B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3291BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 10:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD0A60AFF
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 10:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD0A60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXWp7p8T3SQT for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 10:55:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D424606ED
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D424606ED
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 10:55:58 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id cr11so901626pfb.1
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 02:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4j00AePncG2//dwJxy6j314TcwkDa41PCQzwZ54lFYE=;
 b=Dxv06A9UaIGR/Zmm4YxjLT9dLfmqRnbRKFZTOFjhInHGVsWpTbzVAWB+UWKXdlqM/J
 BqbSAM+xS4tVLBcCjnTa+cDDK8fB8mV2t0Ez17BUUglprostvgJLqD+dgpp6pnaCf2um
 SULezvwEhRi+xygHARa7rfXFO/n0bQ15nIf2ZLUWA7b7lEHDVyvbnt5SnTtVXMidmmsg
 kcsOUxN3FFK/5MOuOdICUcpgr9wwiwJNPWg0HsDQk4TEiikhxQ8kfIEcKKJFBfy9K+kt
 hOT03ysCxhUvh/QS6Dk2Hr61Fqr3DEqcHOSJvQfvMopUqLyuYTdKhrMPGtfeXJ6VfHPo
 pQUQ==
X-Gm-Message-State: AO0yUKXYjoITKo9/3hC/d7yvYz9eK/t7eu3gSZze+7zWRPg1A9G5BnPM
 RdNOO0V/mCTGv5nBmv4ppyxaDeNmbtOx6g==
X-Google-Smtp-Source: AK7set9A8cIcmEEEvgzcsGXwDjrczV2tnaj0hUiNpO7X4oqDUMEBRI7WZp9A3YUSvpk1Hcw265MQWQ==
X-Received: by 2002:a05:6a00:330d:b0:587:8d47:acdd with SMTP id
 cq13-20020a056a00330d00b005878d47acddmr5534142pfb.34.1675335357334; 
 Thu, 02 Feb 2023 02:55:57 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 h18-20020a056a00219200b0059416691b64sm3513218pfi.19.2023.02.02.02.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:55:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 02:55:44 -0800
Message-Id: <20230202105544.315452-3-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202105544.315452-1-christian@paral.in>
References: <20230202105544.315452-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 3/3] package/go: use host compiler when
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
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
3. Build go 1.20 (written in Go) using go-bootstrap-stage2.

go-bootstrap-stage1 does not work on 64-bit arm. The Go 1.4.x bootstrap compiler
is compatible with x86, x86_64, and arm (32 bit) only.

This patch adds a fallback to require a host Go compiler to build host-go when
BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS is not set.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - thanks Thomas for the review & suggestions
 - added NEEDS_HOST_GO boolean
 - added dependency checks to support/dependencies/dependencies.sh
 - removed unnecessary changes to go-bootstrap package

v2 -> v3:

 - add dependency on toolchain if Cgo is enabled

v3 -> v4:

 - updates for go1.20
 - updates for go-bootstrap-stage{1,2}

Signed-off-by: Christian Stewart <christian@paral.in>
---
 Config.in                                          |  4 ++++
 package/go-bootstrap-stage2/go-bootstrap-stage2.mk |  2 +-
 package/go/Config.in.host                          |  2 +-
 package/go/go.mk                                   | 14 ++++++++++++--
 support/dependencies/dependencies.sh               |  4 ++++
 5 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 86699f58c6..c53757f671 100644
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
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
index da2e1f4f46..421342ee02 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -13,7 +13,7 @@ GO_BOOTSTRAP_STAGE2_LICENSE_FILES = LICENSE
 
 # Use go-bootstrap-stage1 to bootstrap.
 HOST_GO_BOOTSTRAP_STAGE2_DEPENDENCIES = host-go-bootstrap-stage1
-HOST_GO_BOOTSTRAP_STAGE2_MAKE_ENV +=	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_BOOTSTRAP_ROOT)
+HOST_GO_BOOTSTRAP_STAGE2_MAKE_ENV += GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_BOOTSTRAP_ROOT)
 
 HOST_GO_BOOTSTRAP_STAGE2_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE2_VERSION)
 
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index b87b862cec..7f049ff1ae 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -30,4 +30,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	select BR2_NEEDS_HOST_GO if !BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
diff --git a/package/go/go.mk b/package/go/go.mk
index 18d3a80212..9dcc9321f9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,7 +12,6 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -109,6 +108,11 @@ else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 HOST_GO_CGO_ENABLED = 1
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 
+ifeq ($(HOST_GO_CGO_ENABLED),1)
+# For cgo support the toolchain needs to be available.
+HOST_GO_DEPENDENCIES += toolchain
+endif
+
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
@@ -126,7 +130,6 @@ HOST_GO_HOST_ENV = \
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
@@ -136,6 +139,13 @@ HOST_GO_MAKE_ENV = \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 	$(HOST_GO_CROSS_ENV)
 
+# Use the Go compiler bootstrapped by Buildroot if available.
+# Otherwise, use the host Go compiler.
+ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS),y)
+HOST_GO_DEPENDENCIES += host-go-bootstrap-stage2
+HOST_GO_MAKE_ENV += GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT)
+endif
+
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && \
 		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 4b5012b807..89a8f6adc0 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -207,6 +207,10 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
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
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
