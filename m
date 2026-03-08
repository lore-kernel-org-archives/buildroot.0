Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F73F55121
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 00:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE6D60F57;
	Sun,  8 Mar 2026 00:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2Npf9mptKfd; Sun,  8 Mar 2026 00:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 313B860F82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772931486;
	bh=Ts2jaLXTJCenlKxJAgAvHr2LpJD8O3Pdtm5hc7Q3LjI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=PeA3CsLtUMDSHHjwE82yfUi/Maj9lnaC6/Pg4EBTvxBhOnpXx2R6Bay6fUH2degxo
	 pbsj3O18Lm1n6RlLw/UFUWLskLpHahAiWJrPA+DbXFJFQRp8PomJuS/buieyenilpr
	 pJUXKuWLc85gF/m4c0R+0LQ0X4ikPUb5lx3CDDTZJgjCnGjs4IZBOulYiz/6Llbp1M
	 jXYjab6hlzkAJzg7Yh6JgvbqmKvntNuOb8FXeAY2517cdImsqP8v2oS/QpJwY1+nvp
	 MJV4Ys3up/L5zvrpI5/+lE9QaAzKYDePt+ggOty2Hwm/6rMF7Jn5yR57U1IeDAjbhg
	 Y3GMXXQ6GVMEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 313B860F82;
	Sun,  8 Mar 2026 00:58:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B08B2223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 00:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9627E83BEB
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 00:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZCqqZI7g4mS for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 00:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C15A83BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C15A83BCA
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C15A83BCA
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 00:58:02 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-4042fe53946so2236202fac.3
 for <buildroot@buildroot.org>; Sat, 07 Mar 2026 16:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772931481; x=1773536281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jvUWj+XIQIbT35kbj3tDYar52N+tg8ND8286ZEblQc=;
 b=D5woZAnzjdsMHApJdGHWM6U11xWvTqmzlkDY53nRtrPh4tfjO3xWhtc08Ro1xEcyMs
 ZvU/dwiSCfJHhDGLMynz0PC/yghmOYZiVOWptTDovmo4KLVynBri/iLYLbN9270V4kib
 +pc3IG2CQ0ZUaSRCbKLWrYCTUy6gBKJNveU40wGBVug8uX8KL7N1KqruFKbwFe/Gl9o5
 QDQpb86udlLOibligP+3LOx2zef12VfxpuVXVgUxL6z6xBi2sFAWfI8yjLMzy84/Mbtw
 QW8p0rQXIVvBt5twOmyN+92d7dE8lIwZK3FYeW/wyrWu3ENBg287/IM2mxhnnjRS5pwQ
 iu/A==
X-Gm-Message-State: AOJu0Yy2BubbAfU9vqQsoNe0OZPfOnPfY722JNwZZ+wICGfPZ34j/RmF
 uxcI4YDeyS0U2ps1X2G1O2N3C6EHRdagzJk//VBoues90blp5jhqMgFE1Ros24JOmFlX5DSLIeO
 zJOdDmKqGgQ==
X-Gm-Gg: ATEYQzyX53SgeiUN5mhi7iJLIMnWf2K6TiE4xlyuSDF/GYOyw/7FIFFCU3SIRsyuJBo
 BrOCPlMtITqD0Z7SIyi2+7yC59uSXPg74SFvPuED3c1SunRTk+yfETjd+gONLeRT203jKlPs3gO
 faW100pqjtUbXyld+l6Gjx1Bv0wZ33+pUWsRJHNtipef7L6cigHUsq0tGPeJGrs1pWknNW9TSHj
 ciQWXXZlKBfMEicnaJwNEsc56NlBXwtigB7TIbzxKClwM0qyYArcSA0mrUeTe1idVBwI+RKQgYm
 bbvoEBZzea3TquW3ZhQKyZBd3pptHxhPbWI1P8svH8ZPEMPToHBh+Shmf+McyiXCkqwLJigP24t
 6nNznK5hm25ImSfqpIYIpk+wSotitbpiicufTOAgNIFGk2Q/NHna6cFnJbOXzrYOOWyrNSykMhv
 5PQScmCVJPWCTt6TEPkGacfoByW4DrdFH4k7jmCoo90vBA30BP/K7aue4eyDY=
X-Received: by 2002:a05:6808:105:b0:466:f57b:2ad2 with SMTP id
 5614622812f47-466f57b47c1mr792391b6e.31.1772931480987; 
 Sat, 07 Mar 2026 16:58:00 -0800 (PST)
Received: from localhost.localdomain ([185.81.126.190])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-466ecbcec59sm1756637b6e.7.2026.03.07.16.57.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 07 Mar 2026 16:58:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 16:57:17 -0800
Message-ID: <20260308005717.49411-1-christian@aperture.us>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1772931481; x=1773536281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6jvUWj+XIQIbT35kbj3tDYar52N+tg8ND8286ZEblQc=;
 b=RkNlOmVyN7GEO4mnZOwstF56cNEujKD522NyrAtgw/g8vzaDH21vqsgNzijsgU3zeN
 ZRBxSu0/cttSF+hJdIKiZmXzD8zIMK8gMlqkWPFZEfZiBkeXupDhvFCF3RBVL0BBP8rZ
 6LY0+6xPzby932TKNIgd3Pcw18pfNMfQ/5Vev62duPhNP//RPXpK1l1WGDIGnS+SUrN6
 9a7iGKYsg0ONHjr60hGBqX6GigERWLs1KLrfKCV0zrBlS22Ahm+A2eR5zPUTuJh7O5z6
 kotplUUNBAFjYUQDlWAdE7fkGad7fVITSNoFSjh/szzRBPxcmzPZPPD7UbAJKh5rhQs3
 jNcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=RkNlOmVy
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.26.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes, see:
https://go.dev/doc/devel/release#go1.26.0

Building Go 1.26 and later requires Go 1.24.6 or later for bootstrap.

To support this we use Go version 1.25.8 as the version for
go-bootstrap-stage5 and have the build for Go 1.26.1 depend on
go-bootstrap-stage5.

Go version 1.25.8 is the latest Go version we can build using
go-bootstrap-stage4.

The package build for go-bootstrap-stage5 is effectively identical to
go-bootstrap-stage4 with only the Go version and stage number changed.

Go 1.28 is expected to require a minor release of Go 1.26 for bootstrap.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host                     |  9 +--
 ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
 package/go/go-bootstrap-stage5/Config.in.host |  4 ++
 .../go-bootstrap-stage5.hash                  |  3 +
 .../go-bootstrap-stage5.mk                    | 54 ++++++++++++++
 package/go/go-src/go-src.mk                   |  4 +-
 package/go/go.hash                            | 14 ++--
 package/go/go.mk                              |  2 +-
 8 files changed, 147 insertions(+), 14 deletions(-)
 create mode 100644 package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
 create mode 100644 package/go/go-bootstrap-stage5/Config.in.host
 create mode 100644 package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
 create mode 100644 package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7ba70c9843..79950983c1 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
@@ -57,7 +57,7 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS
 	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
@@ -66,7 +66,7 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.
 
@@ -91,3 +91,4 @@ source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
 source "package/go/go-bootstrap-stage4/Config.in.host"
+source "package/go/go-bootstrap-stage5/Config.in.host"
diff --git a/package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
new file mode 100644
index 0000000000..58f4581b02
--- /dev/null
+++ b/package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
@@ -0,0 +1,71 @@
+From 6b05378097c6a386ed9912d2471976dc39504e86 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Thu, 27 Jul 2023 21:28:47 -0700
+Subject: [PATCH] cmd/dist: set buildvcs=false when building go-bootstrap
+
+When building go-bootstrap as part of the make.bash process, the cmd/dist
+invokes the bootstrap Go compiler to build the go_bootstrap tool:
+
+${GOROOT_BOOTSTRAP}/bin/go install -tags=math_big_pure_go compiler_bootstrap purego bootstrap/cmd/...
+
+If there is an invalid .git directory in a parent of ${GOROOT_BOOTSTRAP},
+make.bash will fail. Reproduction of the issue:
+
+  mkdir go-issue-61620
+  cd ./go-issue-61620
+  wget https://go.dev/dl/go1.19.11.src.tar.gz
+  mkdir go-bootstrap
+  tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
+  cd ./go-bootstrap/src/
+  bash make.bash
+  cd ../../
+  wget https://go.dev/dl/go1.20.6.src.tar.gz
+  mkdir go
+  tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
+  printf "gitdir: ../../does/not/exist/.git" > ./.git
+  cd ./go/src/
+  GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
+
+The build fails with the following error:
+
+  Building Go toolchain1 using [snip]/go-1.19.10.
+  error obtaining VCS status: exit status 128
+    Use -buildvcs=false to disable VCS stamping.
+  go tool dist: FAILED: [snip]/go-1.19.10/bin/go install -tags=math_big_pure_go \
+    compiler_bootstrap purego bootstrap/cmd/...: exit status 1
+
+This change unconditionally sets -buildvcs=false when compiling go-bootstrap. We
+don't need the revision information in those binaries anyway. Setting this flag
+was previously not done as we were unsure if the go-bootstrap compiler would be
+new enough to support the buildvcs build flag. Since Go 1.20.x, Go 1.19.x is the
+minimum version for go-bootstrap, and supports -buildvcs=false. We can now set
+-buildvcs=false without worrying about compatibility.
+
+Related: https://github.com/golang/go/issues/54852
+Fixes: https://github.com/golang/go/issues/61620
+
+Upstream: https://github.com/golang/go/pull/61621
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/cmd/dist/buildtool.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index a528d7aa76..3b411d6ebb 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -221,6 +221,9 @@ func bootstrapBuildTools() {
+ 	cmd := []string{
+ 		pathf("%s/bin/go", goroot_bootstrap),
+ 		"install",
++		// Fixes cases where an invalid .git is present in a parent of GOROOT_BOOTSTRAP.
++		// See: https://github.com/golang/go/issues/61620
++		"-buildvcs=false",
+ 		"-tags=math_big_pure_go compiler_bootstrap purego",
+ 	}
+ 	if vflag > 0 {
+--
+2.41.0
+
diff --git a/package/go/go-bootstrap-stage5/Config.in.host b/package/go/go-bootstrap-stage5/Config.in.host
new file mode 100644
index 0000000000..393780f21c
--- /dev/null
+++ b/package/go/go-bootstrap-stage5/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
new file mode 100644
index 0000000000..edd2e0a8c2
--- /dev/null
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
new file mode 100644
index 0000000000..9006e5bf44
--- /dev/null
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# go-bootstrap-stage5
+#
+################################################################################
+
+# Use last Go version that go-bootstrap-stage4 can build: v1.25.x
+# See https://go.dev/doc/go1.26#bootstrap
+GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
+GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
+GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
+
+GO_BOOTSTRAP_STAGE5_LICENSE = BSD-3-Clause
+GO_BOOTSTRAP_STAGE5_LICENSE_FILES = LICENSE
+
+# Use go-bootstrap-stage4 to bootstrap.
+HOST_GO_BOOTSTRAP_STAGE5_DEPENDENCIES = host-go-bootstrap-stage4
+
+HOST_GO_BOOTSTRAP_STAGE5_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE5_VERSION)
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_BOOTSTRAP_STAGE5_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE5_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=0
+
+define HOST_GO_BOOTSTRAP_STAGE5_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_BOOTSTRAP_STAGE5_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_BOOTSTRAP_STAGE5_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/
+
+	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/pkg/
+
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index ead535f4e0..7bdde1a8c1 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -16,7 +16,7 @@ GO_SRC_CPE_ID_PRODUCT = go
 
 HOST_GO_SRC_PROVIDES = host-go
 HOST_GO_SRC_DEPENDENCIES = \
-	host-go-bootstrap-stage4 \
+	host-go-bootstrap-stage5 \
 	$(HOST_GO_DEPENDENCIES_CGO)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
@@ -37,7 +37,7 @@ endif
 HOST_GO_SRC_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE5_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
diff --git a/package/go/go.hash b/package/go/go.hash
index 9a9a5a571a..bae223882a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a  go1.25.7.src.tar.gz
-sha256  2866517e9ca81e6a2e85a930e9b11bc8a05cfeb2fc6dc6cb2765e7fb3c14b715  go1.25.7.linux-386.tar.gz
-sha256  12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005  go1.25.7.linux-amd64.tar.gz
-sha256  ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129  go1.25.7.linux-arm64.tar.gz
-sha256  1ba07e0eb86b839e72467f4b5c7a5597d07f30bcf5563c951410454f7cda5266  go1.25.7.linux-armv6l.tar.gz
-sha256  42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f  go1.25.7.linux-ppc64le.tar.gz
-sha256  c6b77facf666dc68195ecab05dbf0ebb4e755b2a8b7734c759880557f1c29b0c  go1.25.7.linux-s390x.tar.gz
+sha256  3172293d04b209dc1144698e7ba13f0477f6ba8c5ffd0be66c20fdbc9785dfbb  go1.26.1.src.tar.gz
+sha256  da75d696c6b9440fe9fb6418429f29eaeee947707ee8c6ddb567c558051a1cc2  go1.26.1.linux-386.tar.gz
+sha256  031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a  go1.26.1.linux-amd64.tar.gz
+sha256  a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7  go1.26.1.linux-arm64.tar.gz
+sha256  c9937198994dc173b87630a94a0d323442bef81bf7589b1170d55a8ebf759bda  go1.26.1.linux-armv6l.tar.gz
+sha256  f56eed002998f5f51fa07fd4ed0c5de5e02d51cec7a4007f771c7576620d9d45  go1.26.1.linux-ppc64le.tar.gz
+sha256  60fe623ef63e6338c055ec0e0e3f4fa85c97a056de2d2f6ee38591e2bfa9cdde  go1.26.1.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a9c7d1ddc6..6c57be0ad7 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.7
+GO_VERSION = 1.26.1
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
