From: Geoff Levand <geoff@infradead.org>
Date: Fri, 04 Mar 2016 18:22:15 +0000
Subject: [Buildroot] [PATCH v2 2/3] go: new host package
In-Reply-To: <cover.1457115561.git.geoff@infradead.org>
References: <cover.1457115561.git.geoff@infradead.org>
Message-ID: <1306fe10de0fdb6a00a27fe1e582c415182672ce.1457115561.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package 'go' which builds the host cross compiler and libraries for the
go programming language.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/Config.in.host    |  1 +
 package/go/Config.in.host | 13 ++++++++
 package/go/go.hash        |  2 ++
 package/go/go.mk          | 75 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 package/go/Config.in.host
 create mode 100644 package/go/go.hash
 create mode 100644 package/go/go.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 1c691a3..4dae12f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/go/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
new file mode 100644
index 0000000..e69259c
--- /dev/null
+++ b/package/go/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GO_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc
+	depends on !BR2_ARM_CPU_ARMV4
+
+config BR2_PACKAGE_HOST_GO
+	bool "host go"
+	depends on BR2_PACKAGE_GO_ARCH_SUPPORTS
+	help
+	  The Go Programming Language.
+
+	  https://golang.org
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
index 0000000..8dd51b1
--- /dev/null
+++ b/package/go/go.mk
@@ -0,0 +1,75 @@
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
+else ifeq ($(BR2_aarch64),y)
+GO_GOARCH = arm64
+else ifeq ($(BR2_i386),y)
+GO_GOARCH = 386
+else ifeq ($(BR2_x86_64),y)
+GO_GOARCH = amd64
+else ifeq ($(BR2_powerpc),y)
+GO_GOARCH = ppc64
+else
+GO_GOARCH = unknown
+endif
+
+ifeq ($(BR2_arm)$(BR2_ARM_CPU_ARMV5),yy)
+GO_GOARM = 5
+else ifeq ($(BR2_arm)$(BR2_ARM_CPU_ARMV6),yy)
+GO_GOARM = 6
+else ifeq ($(BR2_arm)$(BR2_ARM_CPU_ARMV7A),yy)
+GO_GOARM = 7
+else ifeq ($(BR2_arm),y)
+GO_GOARM = unknown
+endif
+
+HOST_GO_DEPENDENCIES = host-go-bootstrap
+HOST_GO_FINAL = $(HOST_DIR)/usr/lib/go
+
+HOST_GO_MAKE_ENV = \
+	GOROOT_BOOTSTRAP=$(GO_BOOTSTRAP_FINAL) \
+	GOROOT_FINAL=$(HOST_GO_FINAL) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOARCH=$(GO_GOARCH) \
+	GOARM=$(GO_GOARM) \
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
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_FINAL)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_FINAL)/bin/gofmt
+
+	ln -sf ../lib/go/bin/go $(HOST_DIR)/usr/bin/
+	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/usr/bin/
+
+	cp -a $(@D)/lib $(HOST_GO_FINAL)/
+
+	mkdir -p $(HOST_GO_FINAL)/pkg
+	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_FINAL)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_FINAL)/pkg/
+
+	# There is a known issue which requires the go sources to be installed
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(HOST_GO_FINAL)/
+endef
+
+$(eval $(host-generic-package))
-- 
2.5.0
