Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04814C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 07:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 894CE61059;
	Wed, 15 Feb 2023 07:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894CE61059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSv9KtlQjUpU; Wed, 15 Feb 2023 07:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876BA60FE1;
	Wed, 15 Feb 2023 07:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876BA60FE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C89B91BF5A7
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 07:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A388D408F5
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 07:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A388D408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnDV7GNNHqK4 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 07:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B864540017
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B864540017
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 07:33:02 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so1141115pjp.0
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 23:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vreThrc9MeX+EkReQw2tyCUGLdZV+k9RjWa84k57YsY=;
 b=gvSVIr4esJGd0qn4myqJXx9rC5VSMalr57D5qnMwRkpLNGEXdckMKVh/SMEpRN5S+J
 a1TkDhOFYdAFmcizScGbQicbzDNxOziM87X4amhRaIFs0+I5d1PIbnHoqmlPYmp1piVo
 cBf4cw/7C8eZZgRMbUnB1fVGi6J+aOTZJMVfSUpO35Kx56TLEUJVy3SDik208tWGP6v1
 Im86fh5uR2EGtTcl3TIkmm1zvIscBkl8s/HlnXfvR4393dl/ix1z0PjAkbGaFtIlvkTJ
 tNTdEjEucSA0VZrnkwQKBEhwD+9SLoyNX3UCyJ6lQ+jmwbzlrgojtsCzQlGD4JhKyW+y
 o8tw==
X-Gm-Message-State: AO0yUKUI7eaipzmSD06Luskmgc1J49URAVCWhcQEQHF3d5cj8jhEA0rv
 44y/QpsO9uZLit+82bfVfYNiMuSj1hY=
X-Google-Smtp-Source: AK7set9x/04LdCnc9QDxmBfFMrJsUp78ImcZspN1DR4WHeRrl2XNRbEFQFbirdRvEYd+G+BssU7a4w==
X-Received: by 2002:a17:90b:38d1:b0:233:ce0d:9b30 with SMTP id
 nn17-20020a17090b38d100b00233ce0d9b30mr1689231pjb.42.1676446381773; 
 Tue, 14 Feb 2023 23:33:01 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 nm1-20020a17090b19c100b00233c727510csm762343pjb.40.2023.02.14.23.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 23:33:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 23:32:56 -0800
Message-Id: <20230215073256.186476-3-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215073256.186476-1-christian@paral.in>
References: <20230215073256.186476-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] package/go: use host compiler when
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Signed-off-by: Christian Stewart <christian@paral.in>
---
 Config.in                            |  4 ++++
 package/go/Config.in.host            |  2 +-
 package/go/go.mk                     | 14 ++++++++++++--
 support/dependencies/dependencies.sh |  4 ++++
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 0d7641633c..c70ce94d94 100644
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
index 4db703a301..68f6d9e36b 100644
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
index 4353e9585e..943c7d0daf 100755
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
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
