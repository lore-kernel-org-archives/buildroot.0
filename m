Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67027C36014
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 02:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5F960842;
	Thu,  3 Apr 2025 02:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs1bfVKs3ids; Thu,  3 Apr 2025 02:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADCD607C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADCD607C9;
	Thu,  3 Apr 2025 02:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFB12220
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 02:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B84564120E
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 02:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl3AiXyWH-Qr for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 02:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B88840749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B88840749
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B88840749
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 02:12:30 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-af523f4511fso399582a12.0
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 19:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743646350; x=1744251150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpuHVgzzTu26XlEZRP1LIsAqAUttJlXZCrwNaf46yzU=;
 b=bI6F0l+gI3TxhOA3tqhMlaWYSRjRdA0uILiGM2YXudhbJaDl7hdLAgMeKjkEccuaTc
 xV9hDWsBcDfmOd+oMfpSLKO/5+0T2qn1vWkqDaSm8EDl00iMOv4bRUUGrc9GnRpn+HGl
 2YI0LpezmFE0uwsUGdcoE0Ncz3iiFGlagwilco+3gqZMfvH0Y6xseT4TD9z3i/CajKWu
 1jrsU+llNVZ7aUEWE5GxdwYBTEX4P/kohdZ6A1lK4cZn0kkTxmp46jrSvyN8//8pD5ja
 IhAq/4dJIwYcUAZ52w61rPur3c4eWsH/RdtFwOz63mCU0quiIPJbkZv2j7685Iq0XurG
 /R5Q==
X-Gm-Message-State: AOJu0Yw9Rfd6ObPejEwA+CjtayMtPIXDm5gdFVh3Dh33qcAfXubPvORG
 f0MIJsu/IxdsZEjyz9AmW1qesbbHCTtR84VQLq+4ilrL5DFF8jMQdmZMWfr33zQKmEqw6te47Or
 U
X-Gm-Gg: ASbGncv2aK4n6SvrXVjyRIDr5o85KZLWNbUladKwgtXKLRYFgUNF+CdwP21C+XcUZih
 Gf01T//EE+ttepOZ70//jb4TNzUqqACyXYXouWUF7/pgwqydPBGORrH1lkloGPdLSJeAmRthSOf
 036WoAz/e1w1TirMrvatYrRS8/xsmtNLJ2U3uDeHTEeImny/Dn2vPFMgbCt1EWoBbNzbYqXHx4V
 9QtvUeB7ywT+e4oUa1CKKb28qHy8yReT2QbuoUnWRctABymIhhhcoxmcjMvRxEKrpW/3tFvOF00
 67lQhXEItkCI1OoKR5cXa1hzwzIHlh3A/vtiLtR8PliWgf31+EunX8Kl7F2/ZYDfzF5z9Q==
X-Google-Smtp-Source: AGHT+IF9Ke49HlezgctV5DIhBctv+VvK4AQM2EQFhB47pYGj0yomdA/42CZwQ6oSgpTmE/ISfKFvRg==
X-Received: by 2002:a17:902:8506:b0:223:5c33:56b4 with SMTP id
 d9443c01a7336-2292f9629b3mr202442565ad.20.1743646349631; 
 Wed, 02 Apr 2025 19:12:29 -0700 (PDT)
Received: from localhost.localdomain ([185.228.19.20])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866e267sm2880515ad.188.2025.04.02.19.12.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 19:12:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 19:12:21 -0700
Message-ID: <20250403021222.25741-1-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743646350; x=1744251150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CpuHVgzzTu26XlEZRP1LIsAqAUttJlXZCrwNaf46yzU=;
 b=y7tVnDl+CCY6X644pRtd4vcopZ2ocmo6HG+SHIr/ZoHh6iNVjIRjBsaIyoYrAzn9Ha
 tEz6OvYeLaAyOWC3kxHNr6DhN4eD9khRXlDfkfSdVtjklc7Om11fR+EB3eZHgsYbiRPo
 PCExslzgUXf47as3e+u6GouSKr5XMUPQldDqCRI9rUVbE5LeM3M6t8bEP4j/pAtz6HjN
 DXkKr70G7mFVgTE3YfH0/HP3dkDyfZePr3tgzKnZKw76DJUkt/L4bI15Em+wsFHzLWmK
 CIKm49n0ARDwRb8qQZgvZKng1Rov0XasXULc9JCzLLDADa8exby+cKzpshd9uOlcHNE1
 SE5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=y7tVnDl+
Subject: [Buildroot] [PATCH v2 1/2] package/go-bootstrap-stage4: add stage4
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
