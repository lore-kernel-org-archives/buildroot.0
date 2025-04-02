Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53B7C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 10:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE6080E75;
	Wed,  2 Apr 2025 10:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPujWIDVrc52; Wed,  2 Apr 2025 10:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6956D81FA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6956D81FA3;
	Wed,  2 Apr 2025 10:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 566C711F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 10:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42C5241278
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 10:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ySSxiRnHruL for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 10:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37B0541300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B0541300
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37B0541300
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 10:18:17 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22401f4d35aso128550475ad.2
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 03:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743589096; x=1744193896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpuHVgzzTu26XlEZRP1LIsAqAUttJlXZCrwNaf46yzU=;
 b=pAscWINyX4feWff24DCOKHD3PTMj6zI23XuYrHIlGpE5Fe+xJlsJIPuCgGXVY5ZvtI
 NgWIvNXfBfuVdzxzrJt4W8B3yZ6rd2hcZEeiMni5WZzpx2PMkCJc9jlIwO4KK8rQXNot
 XRcaH7QJ6SX7E/0uFkrzq1jMdp7M8Ax/cGGswBlK9JQDYINYGbuPtjQcF/TjgSEv5cYD
 b/jsSUd3RSepK0Wb8fhP5Y8Wuk69YyNOM33RSDEzwC4xDefav11GiyZmrPU7RAORj+tM
 BKfO6UTDg49KmZgqKQl9x/uqd90RT2B0zYUP3+p1Xr6wHGxhPl1yJ1ZDeAI4N3w5foxJ
 x5vQ==
X-Gm-Message-State: AOJu0Yx/a9WAvI7LnMKWbh119lZiWAfzkgWxjdXKCwSoZgUKYU8s2KZS
 HbbHkVXYr3xniinUdvUjZoH650jeHNw7cDJNahVQN0Fd7JmO5bsLsEqI+I7PiUX0tQsC8X+cBij
 Y
X-Gm-Gg: ASbGncsNEJO9wq76H3oFcZoGVIxHxgzK+sEJbS6VPqO/c/o7IyyN3GVevktDf6KFe8a
 V4zJ3WXQyx6c/prVxfRB/UtAgowUWXOjriVjChm1JaAxkdJFN+tCRJUXc/OBOnml18ww+8uYorw
 KJHBXiXlj/IqDxd8RhJEwvujHW+9KMVZs4t5jrT0IYcraLkMjYxpTfE6t0DqVAG3FR4W5dwJeQP
 86Np/YDX6tjwnQyumapUyRkguxZqAItTzIDQejov7e7ufMTkNk8WHG1GOPfKZd8KDEMegITjWfy
 bkWruO63rwClLiOrELVMyyFsWr5GUMkZtDpUcAzArdp/vyoUt1PdsbqvNXxxyfDEnZY5HzE=
X-Google-Smtp-Source: AGHT+IFsfZ6u043YYpYVbuT7Ny/4/UmgXhQVR8Xb8pAR3E2qCuMnRKxlw7HjccDJoP4QPcbEUurTsw==
X-Received: by 2002:a17:902:e746:b0:220:ff3f:6cc0 with SMTP id
 d9443c01a7336-2296c829906mr31252935ad.38.1743589096316; 
 Wed, 02 Apr 2025 03:18:16 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1ce08csm104591735ad.127.2025.04.02.03.18.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 03:18:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 03:18:04 -0700
Message-ID: <20250402101805.18896-1-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743589096; x=1744193896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CpuHVgzzTu26XlEZRP1LIsAqAUttJlXZCrwNaf46yzU=;
 b=HJiwzh3i7Pe53evJiY7HDbtdXNR9BYbuSaHDG0vpK1m86+61JX7R/nFwzWx6uH6Vn0
 NidJR/x1GRFX+ro2MoFmed/n8OhRscvNhFTG9rqRTDlrPCCszf7GJ5WRJEmK8VF3qOGY
 CbfcPNXb7A/e8OImJue8A2XP8TZJN/IkvG01jriksOg7QoUtSurAefRNum8d+4EhZUed
 gYmzexcMF6lf6EnWvPxR4gelIEIo+YTyWjLD3GnFVB/Px7Ebf7JaE1CjsS2VGYac+fFQ
 9QhC4n2kzDHL9IYqIGuvf8NlKKLCsDP1qylA4MdnaTLREDPQ4CcbH/IDkGb0EARrr7qB
 R6NA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=HJiwzh3i
Subject: [Buildroot] [PATCH v1 1/2] package/go-bootstrap-stage4: add stage4
 for go1.24 support
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

This patch is in preparation for bumping the host-go package to go1.24, which
requires a minimum of Go1.22.6 for bootstrap.

See: https://go.dev/doc/go1.24#bootstrap

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host                     |  1 +
 ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
 package/go/go-bootstrap-stage4/Config.in.host |  4 ++
 .../go-bootstrap-stage4.hash                  |  3 +
 .../go-bootstrap-stage4.mk                    | 54 ++++++++++++++
 5 files changed, 133 insertions(+)
 create mode 100644 package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
 create mode 100644 package/go/go-bootstrap-stage4/Config.in.host
 create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
 create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7e354b3298..4fd98c2301 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -90,3 +90,4 @@ source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
+source "package/go/go-bootstrap-stage4/Config.in.host"
diff --git a/package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
new file mode 100644
index 0000000000..58f4581b02
--- /dev/null
+++ b/package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
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
diff --git a/package/go/go-bootstrap-stage4/Config.in.host b/package/go/go-bootstrap-stage4/Config.in.host
new file mode 100644
index 0000000000..292486582c
--- /dev/null
+++ b/package/go/go-bootstrap-stage4/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
new file mode 100644
index 0000000000..115dc10fc0
--- /dev/null
+++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  0ca1f1e37ea255e3ce283af3f4e628502fb444587da987a5bb96d6c6f15930d4  go1.23.8.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
new file mode 100644
index 0000000000..e532718e52
--- /dev/null
+++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# go-bootstrap-stage4
+#
+################################################################################
+
+# Use last Go version that go-bootstrap-stage3 can build: v1.23.x
+# See https://go.dev/doc/go1.23#bootstrap
+GO_BOOTSTRAP_STAGE4_VERSION = 1.23.8
+GO_BOOTSTRAP_STAGE4_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE4_SOURCE = go$(GO_BOOTSTRAP_STAGE4_VERSION).src.tar.gz
+
+GO_BOOTSTRAP_STAGE4_LICENSE = BSD-3-Clause
+GO_BOOTSTRAP_STAGE4_LICENSE_FILES = LICENSE
+
+# Use go-bootstrap-stage3 to bootstrap.
+HOST_GO_BOOTSTRAP_STAGE4_DEPENDENCIES = host-go-bootstrap-stage3
+
+HOST_GO_BOOTSTRAP_STAGE4_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE4_VERSION)
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_BOOTSTRAP_STAGE4_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=0
+
+define HOST_GO_BOOTSTRAP_STAGE4_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_BOOTSTRAP_STAGE4_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_BOOTSTRAP_STAGE4_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/
+
+	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/pkg/
+
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/
+endef
+
+$(eval $(host-generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
