Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF28CD6E44
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE3F641FBD;
	Wed, 27 May 2026 08:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uma91Nc3728h; Wed, 27 May 2026 08:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F74841FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870269;
	bh=WTaf49uSY5Q1/ilLBErnB+6fAw1f2bnc+xVCXkuz2S8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P63YGgHT3vLzPbuwdz1T6G6o7qA0hKJhTyi2HbermErJhZv92ARw4JueYGO0MOI0N
	 JLIhEm+IYlGp/kTOGKT+yobJYtScPu832qC5G9e0MsE3DcEyiIT2QVsPmnQIR4rdl+
	 +AvqnYyZHosWnx9lP/37gl3ZSqugV7ZEEEXzivZHSbifbZ9WNCjSpZhrvEzaI1IWUU
	 q+9R2dZbcArFJngMhhCvh1z7/+38tdbqGeC3Qa4OOsOwjcJHfs6Pdkulr+51gj4Waa
	 QfWtyXhXS+e0tl15M+U1+PpntJE+ivn72ohJhqlaUBpDCL9wl7yJZ6rbvYn1sYl/Se
	 1Tpk9KNWigrVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F74841FB1;
	Wed, 27 May 2026 08:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 173F721F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB68C61366
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zr22FIwxZV-b for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15D026135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D026135C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15D026135C
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4905529b933so30142245e9.0
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870259; x=1780475059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5d7T8woyAdTO9+viuK5G/PPyoKhq3mc5HHp25TGddso=;
 b=IE6540xPtokZWxnWsSxI5wzextV4DCm4WHkIZ2/Ie3JcBH++IJpqzQPYD5YEIQOEEZ
 hhl4qx9FQGw7yie3iTkbDWU6wcBTJM/S74EEfauso8Fc1gRp/+RAi3EsIAkJkGS4bZE3
 PlNXWJ5ZWxIwD7V9toHTiyHU02ZgZpDWN4oE9V84GhVR3a/SOS0kuBItRLVgwZLVM/FX
 coCgvk9WBNbXI1xNgXCDjcNDw8wXjnqYmHkYfKqmW3oRiIuTBLj6MZsWlBclLJQtoKDC
 3yieegXj2FzcGzMnISHDhaML828+X0Z2sFsdXSwLpM/fGRjIMuRNLYD9TH+VQJfLqzZD
 wP1w==
X-Gm-Message-State: AOJu0Yyx6kwU3vrikEsYEL/X3f5yCdsLEJdyY2n3bsSeDjZHpSFJzQyz
 7IRQqw4AKZSRx0vOCRuXkBCIIfwDkO+N7lMwjWezPVmfCNJLhN+uoIf3pKA/Mtox+tTwSPmxMqj
 z5UA3
X-Gm-Gg: Acq92OF5luZ9UGekn4YgyDGArHXwVUKnG5qImou8L4/ir9nXkcgo6iQip5GLpxFOPdY
 /GiZUu4KRCU7npQpAJg69WgdHwfRdJkA+v4MpwdyY6btRCxU86t3dr3JyXB2Eu4EJloyWjUjMih
 ilY0FKonS0Z6K/W9MW2oKw72ZCOTifwrrnCMNb5wUfmb13wfti+v/tgYjpT2LlcqsHIyEyJ8Pl+
 gJc5wAFfTUt9ozSVlQ0CU/pRWWnBrscwvyFTMvAPpRU0c17F6wcVeEC8GdANfmw3yUt1nQk8Wco
 WFPKNaCpSy9NAw0pPFKD7VsKFffQvr71PcQMR/9UeB2Ysfb/cJJY1ljj1SuvOewPblk7dZfd7xK
 yWx1R/tEyQyTAxQ0GGMXv6XmpipRaiR/dmNNud7KWUrUo5D7rCtGhZ9+yx9bt8nkwKI9S8B/52B
 z9sHAXHewZfYr25lpXDwxZsXhsJHBVRcL6Lz2owRgKdaBVON9/1G26HYcS1g==
X-Received: by 2002:a05:600d:6413:20b0:48a:9540:1a3a with SMTP id
 5b1f17b1804b1-49042495183mr276763405e9.8.1779870259540; 
 Wed, 27 May 2026 01:24:19 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:10 +0200
Message-ID: <20260527082418.151980-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870259; x=1780475059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5d7T8woyAdTO9+viuK5G/PPyoKhq3mc5HHp25TGddso=;
 b=aNK0aEAfuT6Eozsu6hFtQJY7Lc0RWAERgZtB8IpnBgPTzZDTWxQTGoUFnuBNqscytb
 PeeJ3MYCiUt1lM43X+I26tEBEMlfdVcm1Jfj2V4ohe7CZ0o1/cTTRu5fwZsOr7WZrFqA
 WkBIDzQXdNezGebtzCoYA63i4425oSAv8sR/B2z4hNCMc7cl1mNCfGtEvZ3EJboMbGuZ
 X0DQheYjXu9sNuypiRm+b9ORDxqxAlcjimnnCseLklfTeb4XzOaS0f+bCSK2fLN62B/F
 NL4dqKY/N4w49uJz4q9vWbnXKLw1SVH5OCek/2Smk1fXoqRPx0nwqbykwyVjiqNmKW/Y
 SZAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aNK0aEAf
Subject: [Buildroot] [PATCH 2025.02.x 1/9] package/go: bump to version 1.25.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

For relase notes, see:
https://go.dev/doc/devel/release#go1.25.0

Building Go 1.24 and later requires Go 1.22.6 or later for bootstrap.

To support this we use our previous Go version 1.23.12 as the version
for go-bootstrap-stage4 and have the build for Go 1.25.1 depend on
go-bootstrap-stage4.

Go version 1.23.12 is the latest go version we can build using
go-bootstrap-stage3.

The package build for go-bootstrap-stage4 if effectively identical to
go-bootstrap-stage3 with only the Go version and stage number changed.

Note: go version 1.25.1 release note mention a security fix
which is for CVE-2025-47910. This commit is not marked as security
bump, because the issue was introduced in version 1.25.0 which
was not included in Buildroot. See:
https://pkg.go.dev/vuln/GO-2025-3955

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Christian Stewart <christian@aperture.us>
[Julien: add link to release notes and
  comment about CVE in commit log.
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ecf12c186f1e62751980eb4c7345decd65305680)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/Config.in.host                     |  9 +--
 ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
 package/go/go-bootstrap-stage4/Config.in.host |  4 ++
 .../go-bootstrap-stage4.hash                  |  3 +
 .../go-bootstrap-stage4.mk                    | 54 ++++++++++++++
 package/go/go-src/go-src.mk                   |  4 +-
 package/go/go.hash                            | 16 ++---
 package/go/go.mk                              |  2 +-
 8 files changed, 148 insertions(+), 15 deletions(-)
 create mode 100644 package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
 create mode 100644 package/go/go-bootstrap-stage4/Config.in.host
 create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
 create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index a42e37f90b..7ba70c9843 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
@@ -57,7 +57,7 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
 	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
@@ -66,7 +66,7 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.
 
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
index 0000000000..eb10323ece
--- /dev/null
+++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
new file mode 100644
index 0000000000..db0c85e3d0
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
+# See https://go.dev/doc/go1.24#bootstrap
+GO_BOOTSTRAP_STAGE4_VERSION = 1.23.12
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
diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index c1f11a2262..9a18b6afe8 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -16,7 +16,7 @@ GO_SRC_CPE_ID_PRODUCT = go
 
 HOST_GO_SRC_PROVIDES = host-go
 HOST_GO_SRC_DEPENDENCIES = \
-	host-go-bootstrap-stage3 \
+	host-go-bootstrap-stage4 \
 	$(HOST_GO_DEPENDENCIES_CGO)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
@@ -37,7 +37,7 @@ endif
 HOST_GO_SRC_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
diff --git a/package/go/go.hash b/package/go/go.hash
index dc88e9beab..60d61433fc 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
-sha256  3b2fd446e26642555d1446a38ccbefb2a30bba3179d3ef132ed64d3c63b0c42a  go1.23.12.linux-386.tar.gz
-sha256  d3847fef834e9db11bf64e3fb34db9c04db14e068eeb064f49af747010454f90  go1.23.12.linux-amd64.tar.gz
-sha256  52ce172f96e21da53b1ae9079808560d49b02ac86cecfa457217597f9bc28ab3  go1.23.12.linux-arm64.tar.gz
-sha256  9704eba01401a3793f54fac162164b9c5d8cc6f3cab5cee72684bb72294d9f41  go1.23.12.linux-armv6l.tar.gz
-sha256  1a7cc5f7baeaf39125dce5d660a39438e7f0e04d13d3498590d240aae976b565  go1.23.12.linux-ppc64le.tar.gz
-sha256  2f43708aa0922d692da0a1fc775475c343907610bec77002de1bbe37601ea338  go1.23.12.linux-s390x.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
+sha256  d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594  go1.25.1.src.tar.gz
+sha256  d03cdcbc9bd8baf5cf028de390478e9e2b3e4d0afe5a6582dedc19bfe6a263b2  go1.25.1.linux-386.tar.gz
+sha256  7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e  go1.25.1.linux-amd64.tar.gz
+sha256  65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d  go1.25.1.linux-arm64.tar.gz
+sha256  eb949be683e82a99e9861dafd7057e31ea40b161eae6c4cd18fdc0e8c4ae6225  go1.25.1.linux-armv6l.tar.gz
+sha256  8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f  go1.25.1.linux-ppc64le.tar.gz
+sha256  9cfe517ba423f59f3738ca5c3d907c103253cffbbcc2987142f79c5de8c1bf93  go1.25.1.linux-s390x.tar.gz
+sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 69ca746783..535787c92a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.12
+GO_VERSION = 1.25.1
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
