Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F83C636CC
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 01:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC4D60BFE;
	Sun, 12 Feb 2023 01:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BC4D60BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74eE9PNXVDHs; Sun, 12 Feb 2023 01:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F97E60C29;
	Sun, 12 Feb 2023 01:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F97E60C29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B21A1BF855
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 01:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FD24051B
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 01:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FD24051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dX0_maRLkHXB for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 01:54:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BA6400A4
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09BA6400A4
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 01:54:49 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id o13so8950418pjg.2
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 17:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rImlvNZcUR/VX8t+7PdlWzD1VUVFaru1F59o/b+iUT4=;
 b=FsheJoAZhLaucyRF1cXTo7Bb6/wiCSyLdhswwF0R4cGfRi+s0nu2yn4uf5/k0FokT6
 2O12hlc+s6P44VeOjYsyEJx/9bRnDBbo3ByFzUeHLH2LCLlqb28DS5DeImHInPHvTSbV
 XyalQZ390TTaTHTuERLYtOqiYGFQ/W8zFIBnavUTWuTHIzgcmUCk60NKBu1vWf143DyH
 HSxswVx1jsgEn+U1/eD7dN7Q1oeWm4zWpgAy0aYPTZdaUZWK1n1w5SmwOZghjXHg1WUB
 HNR702ySWB5Z8DpKfGTjXR4eojAQf7WAny9o8ntAC+9pMHF+43NUQ0jEklXeWlrTPAzu
 KddA==
X-Gm-Message-State: AO0yUKUf6+t6Q3cfTGdOoPd5GxfqhdK7wDH0lQuSLqqJOXTUem4S+fty
 Qx9tQe+Tr4/8AB9/FJj8E4YdHGmfd+I=
X-Google-Smtp-Source: AK7set8sPKcjoSrCfurKIAqeyFO2DhiilxDgv7Ow/8ZKSj6pwWdS/0yJqK55uJHJUVwMOUCVnqMlBQ==
X-Received: by 2002:a17:902:ebcf:b0:19a:723b:433e with SMTP id
 p15-20020a170902ebcf00b0019a723b433emr5721625plg.42.1676166888998; 
 Sat, 11 Feb 2023 17:54:48 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f3-20020a170902ab8300b0019615a0d083sm5528703plr.210.2023.02.11.17.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 17:54:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 17:54:43 -0800
Message-Id: <20230212015443.7740-3-christian@paral.in>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212015443.7740-1-christian@paral.in>
References: <20230212015443.7740-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/go: use host compiler when
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
index cf6635bff6..e2a8db5d9d 100755
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
