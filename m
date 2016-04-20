From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 22:29:34 +0200
Subject: [Buildroot] [git commit] go: new host package
Message-ID: <20160420210351.7295A80E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec50eb3e4226e69d11dffff8e509a981586dd81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new package 'go' which builds the host cross compiler and
libraries for the go programming language.

Signed-off-by: Geoff Levand <geoff@infradead.org>
[Thomas:
 - Put the computation of GO_GOARM inside the ifeq ($(BR2_arm),y)
   condition rather than duplicating this condition.
 - Remove the GO_GOARCH=unknown case, since there is no way to fall in
   this case as only supported architectures can use host-go.
 - Remove the GO_GOARM=unknown case, since we are sure that only
   ARMv5/6/7 will use host-go.
 - Rename HOST_GO_FINAL to HOST_GO_ROOT, since it's really the "root"
   of the Go installation.
 - Remove visible Config.in.host option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host    |  1 +
 package/go/Config.in.host |  5 ++++
 package/go/go.hash        |  2 ++
 package/go/go.mk          | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index c1d40f4..d27242f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/go/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
new file mode 100644
index 0000000..094e402
--- /dev/null
+++ b/package/go/Config.in.host
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc
+	depends on !BR2_ARM_CPU_ARMV4
diff --git a/package/go/go.hash b/package/go/go.hash
new file mode 100644
index 0000000..e7c72de
--- /dev/null
+++ b/package/go/go.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  754e06dab1c31ab168fc9db9e32596734015ea9e24bc44cae7f237f417ce4efe  go1.5.3.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
new file mode 100644
index 0000000..5454fd5
--- /dev/null
+++ b/package/go/go.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# go
+#
+################################################################################
+
+GO_VERSION = 1.5.3
+GO_SITE = https://storage.googleapis.com/golang
+GO_SOURCE = go$(GO_VERSION).src.tar.gz
+
+GO_LICENSE = BSD-3c
+GO_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_arm),y)
+GO_GOARCH = arm
+ifeq ($(BR2_ARM_CPU_ARMV5),y)
+GO_GOARM = 5
+else ifeq ($(BR2_ARM_CPU_ARMV6),y)
+GO_GOARM = 6
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+GO_GOARM = 7
+endif
+else ifeq ($(BR2_aarch64),y)
+GO_GOARCH = arm64
+else ifeq ($(BR2_i386),y)
+GO_GOARCH = 386
+else ifeq ($(BR2_x86_64),y)
+GO_GOARCH = amd64
+else ifeq ($(BR2_powerpc),y)
+GO_GOARCH = ppc64
+endif
+
+HOST_GO_DEPENDENCIES = host-go-bootstrap
+HOST_GO_ROOT = $(HOST_DIR)/usr/lib/go
+
+HOST_GO_MAKE_ENV = \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
+	GOOS=linux \
+	CGO_ENABLED=1 \
+	CC_FOR_TARGET=$(TARGET_CC) \
+	CXX_FOR_TARGET=$(TARGET_CXX)
+
+define HOST_GO_BUILD_CMDS
+	cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
+endef
+
+define HOST_GO_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
+
+	ln -sf ../lib/go/bin/go $(HOST_DIR)/usr/bin/
+	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/usr/bin/
+
+	cp -a $(@D)/lib $(HOST_GO_ROOT)/
+
+	mkdir -p $(HOST_GO_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
+
+	# There is a known issue which requires the go sources to be installed
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(HOST_GO_ROOT)/
+endef
+
+$(eval $(host-generic-package))
