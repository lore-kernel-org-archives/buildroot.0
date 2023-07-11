Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D221EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D903E41EAD;
	Tue, 11 Jul 2023 22:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D903E41EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osHGynn_SCqV; Tue, 11 Jul 2023 22:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2307F41E61;
	Tue, 11 Jul 2023 22:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2307F41E61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04F4A1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E05B640493
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E05B640493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcqhGotmwNbf for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:08:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDB1C4000B
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDB1C4000B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:08:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6b74e2d8c98so5503688a34.2
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689113335; x=1691705335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TyJCcHb/m+HTrtulV+83NEZBlLCdtrC5/8D6bXho/c=;
 b=HWz8ymmBvDLOSIjIvociU/+KC6WVOMLHC6C/zWzuojzFfgbyfg27EZ2bT2iBttDxlD
 UzfyFkS7teKfDLve/QVakYby0netvsXVBbCnWAtp5BlseHPjlGcVbFCJOC0RHShfRkiA
 a0kjJXM9lmGblgekKE0SC8NY+oDU7Pb09nWfDMKF7B3GggQ1yKM7nmoRfg7aak5kRqL2
 Gi6M4lPHoYBBQlbnS7rDPMCb9RrnphzLPtuyCUclRP69Lw+sgcrZJmynsGSjT6sMsrsE
 DgRs4ua2A5E3eXH/3Jm3+vJp9OLPB/VZTMNQypBHcls4S+QGVV2xH+o5G7oLOnxPubVF
 GjPw==
X-Gm-Message-State: ABy/qLa7ibZ1vY94tuHGKHGvCVYsT0DMBrOXFkebWtvGj9zkIeiSjwK/
 P/l386xdvm09hlMcDELAwU1L3LkGHNM/IBsTbDAdYQ==
X-Google-Smtp-Source: APBJJlHdBLjz8o+0NRZsW6bntekhfW15Z6J+dVOjAZPKYBYjJIJDzlQg1xgJVJXlVgwmFwnHx0F+Xw==
X-Received: by 2002:a05:6870:d181:b0:1b7:3ddb:aa31 with SMTP id
 a1-20020a056870d18100b001b73ddbaa31mr6437929oac.21.1689113335706; 
 Tue, 11 Jul 2023 15:08:55 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ep11-20020a17090ae64b00b0025bbe90d3cbsm2268015pjb.44.2023.07.11.15.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:08:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:08:49 -0700
Message-ID: <20230711220849.1702358-4-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711220849.1702358-1-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689113335; x=1691705335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TyJCcHb/m+HTrtulV+83NEZBlLCdtrC5/8D6bXho/c=;
 b=nAUtlB2MSL50d8mOEVhhhpMvPNlu+IrHrAkU3p5gtBvBUu0zjuGB6InQ56uP2BcXu+
 reLcI33/KrkrNXd/rHlOKv+RoYJgi0W5ID2UzuzVvDM4AV0rYjpmpko3X2HALOAj8prL
 l8uFHJLMM1xrIaPiTZ/13hcmah+OMMtH+cJL6QA1Vx7xp0PrzpMw/b6UrRkRg9jWUi+r
 XCtow1t/wO4UGqjesL2lyiV4vnB0VfImn2Y6J0PRIWkV8ER070knV0ZVBxLc4O1vUbLp
 /7k7Vfhnuc4Uyij7e7Mq1s32eL+0D3Oj2whKqd8zUbGrbIVvCgGVkDpmTW78iPpQgYU6
 QOGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=nAUtlB2M
Subject: [Buildroot] [PATCH v7 4/4] package/go: use host compiler when
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
Cc: Christian Stewart <christian@aperture.us>,
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

Signed-off-by: Christian Stewart <christian@aperture.us>
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
index 50e3e85cf5..54b5d1fd97 100644
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
index 58f44c8723..48ec3a2eb0 100755
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
