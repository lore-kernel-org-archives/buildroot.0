Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2874FC001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A25560D94;
	Sat, 22 Jul 2023 21:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A25560D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o81BFH-PZZaz; Sat, 22 Jul 2023 21:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C679160F0C;
	Sat, 22 Jul 2023 21:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C679160F0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B13011BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AFCB40500
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AFCB40500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KPouMqy-0LMs for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE9AE403A5
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9AE403A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA1D381F7C; Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 22:59:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e380d0581f29b1ea2ed1f0a14e47db5ca21c64f
X-Git-Newrev: 6bedfdf6917ab7e4fb6d692f2e17eaff09b136a8
X-Patchwork-Hint: ignore
Message-Id: <20230722210646.BA1D381F7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6bedfdf6917ab7e4fb6d692f2e17eaff09b136a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go 1.20 requires a minimum version of go 1.17.13 to bootstrap.

https://go.dev/doc/go1.20#bootstrap

As Go 1.4 was the previous version that could be compiled with C, there is now
no way to bootstrap go with a C compiler, unless we use a two-stage bootstrap:

 - build host-go-bootstrap-1.4-20170531
 - build host-go-bootstrap-1.19.10 with host-go-bootstrap-1.4-20170531
 - build host-go-1.20 with host-go-bootstrap-1.19.9

This is implemented in this commit first, before upgrading host-go to 1.20.

Note: the .patch files from package/go version 1.19.x are not necessary for
package/go-bootstrap-stage2 and have not been included there.

Previous discussion of possible alternatives:

https://lore.kernel.org/all/CA+h8R2rtcynkCBsz=_9yANOEguyPCOcQDj8_ns+cv8RS8+8t9A@mail.gmail.com/
https://lore.kernel.org/all/20220525234312.643dfc03@windsurf/T/

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 package/Config.in.host                             |  3 +-
 package/go-bootstrap-stage1/Config.in.host         |  6 +++
 .../go-bootstrap-stage1.hash}                      |  0
 package/go-bootstrap-stage1/go-bootstrap-stage1.mk | 43 ++++++++++++++++++
 package/go-bootstrap-stage2/Config.in.host         |  4 ++
 .../go-bootstrap-stage2/go-bootstrap-stage2.hash   |  3 ++
 package/go-bootstrap-stage2/go-bootstrap-stage2.mk | 53 ++++++++++++++++++++++
 package/go-bootstrap/Config.in.host                |  7 ---
 package/go-bootstrap/go-bootstrap.mk               | 50 --------------------
 package/go/Config.in.host                          |  4 +-
 package/go/go.mk                                   |  4 +-
 12 files changed, 117 insertions(+), 62 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 01050ebf59..469a93449a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -558,6 +558,8 @@ F:	package/docker-engine/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
+F:	package/go-bootstrap-stage1/
+F:	package/go-bootstrap-stage2/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index 9addc88522..ab91bd4e70 100644
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
index 0000000000..3e4ee57432
--- /dev/null
+++ b/package/go-bootstrap-stage1/go-bootstrap-stage1.mk
@@ -0,0 +1,43 @@
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
+HOST_GO_BOOTSTRAP_STAGE1_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE1_VERSION)
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE. See https://github.com/golang/go/issues/11685.
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
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
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
index 0000000000..874737ea2d
--- /dev/null
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
new file mode 100644
index 0000000000..477c24299c
--- /dev/null
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# go-bootstrap-stage2
+#
+################################################################################
+
+# Use last Go version that go-bootstrap-stage1 can build: v1.19.x
+# See https://golang.org/doc/install/source#bootstrapFromSource
+GO_BOOTSTRAP_STAGE2_VERSION = 1.19.10
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
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
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
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE2_ROOT)/
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
index ded02d3b3a..90a54f0da6 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
@@ -28,4 +28,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
diff --git a/package/go/go.mk b/package/go/go.mk
index 22b8161e05..94c90877d1 100644
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
@@ -126,7 +126,7 @@ HOST_GO_HOST_ENV = \
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
