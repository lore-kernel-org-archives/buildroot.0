Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0191AC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 07:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88BAC60BC5;
	Wed, 15 Feb 2023 07:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88BAC60BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G64G6OXA8joD; Wed, 15 Feb 2023 07:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE4B60BC7;
	Wed, 15 Feb 2023 07:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE4B60BC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC5521BF5A7
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 07:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F5C960BC9
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 07:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F5C960BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2D_diSQR8fj for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 07:33:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B8760BC5
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39B8760BC5
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 07:33:00 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id r8so19472504pls.2
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 23:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8W20lv6WSjM1+6ojhFvZq2YSCh1xqa92dICdIENSY7M=;
 b=a3VMfLR2M0My/Ifni40vi7AGKEYaieHhnbZNRKFb+TU34vunGby9rNIHbMWc4wnjjP
 JJeccF+1FMfhTip98stDWSEwkszHgA3E9UsaL3hMdp95K7VoF9qM2Mjl0GTfY4eIV5Vd
 go3NN2HPdKxev1FfszoT36pu1T4SiWRx27E9kAU5semb2qFbdLXZoaPz/XYWwll1Ledq
 L7qru1ue4RasLqzrUxWLvIp0l/oJcRsOvrXHL5BSXE4+yAOCTOBs2gaz5FQafyJr29Wv
 NJt/+JW7RTwz3zdiiPELXFLLnelVsxDP5XH09AdAIaa91bcXxX5lQAkjGIznReEHnBml
 lfQA==
X-Gm-Message-State: AO0yUKVMRpttLUgolHSSzeGc82yL998DCCPyrOVhM8FMOLP2WffY6xdc
 L+zGaOY4VUdXpBakCGO8ivnEPCAeRSU=
X-Google-Smtp-Source: AK7set83olAg4H1EA0wouHcO5uNLNN6dn9JzzvBoYhbAkKKvFV4euXKxMtTMyk/pwAEVY+00Lk65wA==
X-Received: by 2002:a17:90a:974b:b0:230:d782:7954 with SMTP id
 i11-20020a17090a974b00b00230d7827954mr1981224pjw.9.1676446378993; 
 Tue, 14 Feb 2023 23:32:58 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 nm1-20020a17090b19c100b00233c727510csm762343pjb.40.2023.02.14.23.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 23:32:58 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 23:32:54 -0800
Message-Id: <20230215073256.186476-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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

Go 1.20 requires a minimum version of go 1.17.13 to bootstrap.

https://go.dev/doc/go1.20#bootstrap

As Go 1.4 was the previous version that could be compiled with C, there is now
no way to bootstrap go with a C compiler, unless we use a two-stage bootstrap:

 - build host-go-bootstrap-1.4-20170531
 - build host-go-bootstrap-1.19.5 with host-go-bootstrap-1.4-20170531
 - build host-go-1.20 with host-go-bootstrap-1.19.5

This is implemented in this commit first, before upgrading host-go to 1.20.

Note: the .patch files from package/go version 1.19.x are not necessary for
package/go-bootstrap-stage2 and have not been included there.

Discussion of possible alternate approaches for future use:

https://lore.kernel.org/all/CA+h8R2rtcynkCBsz=_9yANOEguyPCOcQDj8_ns+cv8RS8+8t9A@mail.gmail.com/
https://lore.kernel.org/all/20220525234312.643dfc03@windsurf/T/

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - fix indentation of GOROOT_BOOTSTRAP in stage2 MAKE_ENV
 - adjust commit description
 - remove duplicate MAKE_ENV declaration line
 - reorder depends on lines in config.in.host

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                                    |  2 +
 package/Config.in.host                        |  3 +-
 package/go-bootstrap-stage1/Config.in.host    |  6 ++
 .../go-bootstrap-stage1.hash}                 |  0
 .../go-bootstrap-stage1.mk                    | 46 ++++++++++++++++
 package/go-bootstrap-stage2/Config.in.host    |  4 ++
 .../go-bootstrap-stage2.hash                  |  3 +
 .../go-bootstrap-stage2.mk                    | 55 +++++++++++++++++++
 package/go-bootstrap/Config.in.host           |  7 ---
 package/go-bootstrap/go-bootstrap.mk          | 50 -----------------
 package/go/Config.in.host                     |  6 +-
 package/go/go.mk                              |  9 ++-
 12 files changed, 126 insertions(+), 65 deletions(-)
 create mode 100644 package/go-bootstrap-stage1/Config.in.host
 rename package/{go-bootstrap/go-bootstrap.hash => go-bootstrap-stage1/go-bootstrap-stage1.hash} (100%)
 create mode 100644 package/go-bootstrap-stage1/go-bootstrap-stage1.mk
 create mode 100644 package/go-bootstrap-stage2/Config.in.host
 create mode 100644 package/go-bootstrap-stage2/go-bootstrap-stage2.hash
 create mode 100644 package/go-bootstrap-stage2/go-bootstrap-stage2.mk
 delete mode 100644 package/go-bootstrap/Config.in.host
 delete mode 100644 package/go-bootstrap/go-bootstrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index df2b98ad53..80305fdf1e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -548,6 +548,8 @@ F:	package/docker-engine/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
+F:	package/go-bootstrap-stage1/
+F:	package/go-bootstrap-stage2/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..fff75cd165 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -40,7 +40,8 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
-	source "package/go-bootstrap/Config.in.host"
+	source "package/go-bootstrap-stage1/Config.in.host"
+	source "package/go-bootstrap-stage2/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go-bootstrap-stage1/Config.in.host b/package/go-bootstrap-stage1/Config.in.host
new file mode 100644
index 0000000000..56a743caf9
--- /dev/null
+++ b/package/go-bootstrap-stage1/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS
+	bool
+	# See src/cmd/dist/unix.c for the list of supported architectures
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "arm"
diff --git a/package/go-bootstrap/go-bootstrap.hash b/package/go-bootstrap-stage1/go-bootstrap-stage1.hash
similarity index 100%
rename from package/go-bootstrap/go-bootstrap.hash
rename to package/go-bootstrap-stage1/go-bootstrap-stage1.hash
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go-bootstrap-stage1/go-bootstrap-stage1.mk
new file mode 100644
index 0000000000..77e7046cd7
--- /dev/null
+++ b/package/go-bootstrap-stage1/go-bootstrap-stage1.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# go-bootstrap-stage1
+#
+################################################################################
+
+# Use last C-based Go compiler: v1.4.x
+# See https://golang.org/doc/install/source#bootstrapFromSource
+GO_BOOTSTRAP_STAGE1_VERSION = 1.4-bootstrap-20171003
+GO_BOOTSTRAP_STAGE1_SITE = https://dl.google.com/go
+GO_BOOTSTRAP_STAGE1_SOURCE = go$(GO_BOOTSTRAP_STAGE1_VERSION).tar.gz
+
+GO_BOOTSTRAP_STAGE1_LICENSE = BSD-3-Clause
+GO_BOOTSTRAP_STAGE1_LICENSE_FILES = LICENSE
+
+# The toolchain is needed for HOSTCC_NOCACHE used to compile the Go compiler.
+HOST_GO_BOOTSTRAP_STAGE1_DEPENDENCIES = toolchain
+
+HOST_GO_BOOTSTRAP_STAGE1_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE1_VERSION)
+
+# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
+HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV = \
+	GOOS=linux \
+	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_STAGE1_ROOT)" \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	CC=$(HOSTCC_NOCCACHE) \
+	CGO_ENABLED=0
+
+define HOST_GO_BOOTSTRAP_STAGE1_BUILD_CMDS
+	cd $(@D)/src && $(HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV) ./make.bash
+endef
+
+define HOST_GO_BOOTSTRAP_STAGE1_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE1_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE1_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE1_ROOT)/
+	cp -a $(@D)/pkg $(HOST_GO_BOOTSTRAP_STAGE1_ROOT)/
+
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE1_ROOT)/
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/go-bootstrap-stage2/Config.in.host b/package/go-bootstrap-stage2/Config.in.host
new file mode 100644
index 0000000000..967ddaed1d
--- /dev/null
+++ b/package/go-bootstrap-stage2/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
new file mode 100644
index 0000000000..4c22f0f274
--- /dev/null
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f  go1.19.5.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
new file mode 100644
index 0000000000..b623978500
--- /dev/null
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# go-bootstrap-stage2
+#
+################################################################################
+
+GO_BOOTSTRAP_STAGE2_VERSION = 1.19.5
+GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
+
+GO_BOOTSTRAP_STAGE2_LICENSE = BSD-3-Clause
+GO_BOOTSTRAP_STAGE2_LICENSE_FILES = LICENSE
+
+# Use go-bootstrap-stage1 to bootstrap.
+HOST_GO_BOOTSTRAP_STAGE2_DEPENDENCIES = host-go-bootstrap-stage1
+
+HOST_GO_BOOTSTRAP_STAGE2_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE2_VERSION)
+
+# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
+HOST_GO_BOOTSTRAP_STAGE2_MAKE_ENV = \
+	GO111MODULE=off \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE1_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=0
+
+define HOST_GO_BOOTSTRAP_STAGE2_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_BOOTSTRAP_STAGE2_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_BOOTSTRAP_STAGE2_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/
+
+	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/pkg/
+
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/
+
+	# Set all file timestamps to prevent the go compiler from rebuilding any
+	# built in packages when programs are built.
+	find $(HOST_GO_BOOTSTRAP_STAGE2_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/go-bootstrap/Config.in.host b/package/go-bootstrap/Config.in.host
deleted file mode 100644
index fab80d24b4..0000000000
--- a/package/go-bootstrap/Config.in.host
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
-	bool
-	# See src/cmd/dist/unix.c for the list of support
-	# architectures
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "arm"
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
deleted file mode 100644
index 71696a1540..0000000000
--- a/package/go-bootstrap/go-bootstrap.mk
+++ /dev/null
@@ -1,50 +0,0 @@
-################################################################################
-#
-# go-bootstrap
-#
-################################################################################
-
-# Use last C-based Go compiler: v1.4.x
-# See https://golang.org/doc/install/source#bootstrapFromSource
-GO_BOOTSTRAP_VERSION = 1.4-bootstrap-20171003
-GO_BOOTSTRAP_SITE = https://dl.google.com/go
-GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).tar.gz
-
-GO_BOOTSTRAP_LICENSE = BSD-3-Clause
-GO_BOOTSTRAP_LICENSE_FILES = LICENSE
-
-# To build programs that need cgo support the toolchain needs to be
-# available, so the toolchain is not needed to build host-go-bootstrap
-# itself, but needed by other packages that depend on
-# host-go-bootstrap.
-HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
-
-HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_VERSION)
-
-# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
-# here.  See https://github.com/golang/go/issues/11685.
-HOST_GO_BOOTSTRAP_MAKE_ENV = \
-	GOOS=linux \
-	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
-	GOROOT="$(@D)" \
-	GOBIN="$(@D)/bin" \
-	CC=$(HOSTCC_NOCCACHE) \
-	CGO_ENABLED=0
-
-define HOST_GO_BOOTSTRAP_BUILD_CMDS
-	cd $(@D)/src && $(HOST_GO_BOOTSTRAP_MAKE_ENV) ./make.bash
-endef
-
-define HOST_GO_BOOTSTRAP_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_ROOT)/bin/go
-	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_ROOT)/bin/gofmt
-
-	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_ROOT)/
-	cp -a $(@D)/pkg $(HOST_GO_BOOTSTRAP_ROOT)/
-
-	# There is a known issue which requires the go sources to be installed
-	# https://golang.org/issue/2775
-	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_ROOT)/
-endef
-
-$(eval $(host-generic-package))
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index ded02d3b3a..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,9 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	# See https://go.dev/doc/install/source#environment
+	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
@@ -28,4 +30,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
diff --git a/package/go/go.mk b/package/go/go.mk
index c38ae0b99c..b0dd002712 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,7 +12,7 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -121,12 +121,12 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
@@ -154,7 +154,6 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
-	# There is a known issue which requires the go sources to be installed
 	# https://golang.org/issue/2775
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
