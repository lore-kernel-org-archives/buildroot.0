From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 19:23:33 +0000
Subject: [Buildroot] [PATCH 2/4] Add go host support
In-Reply-To: <cover.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
Message-ID: <518d5cfb3bd5897ea408888e6c105388fccff5c2.1456946494.git.geoff@infradead.org>
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
 package/go/Config.in.host | 14 +++++++++
 package/go/go.hash        |  2 ++
 package/go/go.mk          | 73 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 package/go/Config.in.host
 create mode 100644 package/go/go.hash
 create mode 100644 package/go/go.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 7cacef9..158fbca 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
new file mode 100644
index 0000000..928944b
--- /dev/null
+++ b/package/go/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GO_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc
+	depends on !BR2_ARM_CPU_ARMV4
+
+config BR2_PACKAGE_HOST_GO
+	bool "host go"
+	depends on BR2_PACKAGE_GO_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO_BOOTSTRAP
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
index 0000000..95168a7
--- /dev/null
+++ b/package/go/go.mk
@@ -0,0 +1,73 @@
+################################################################################
+#
+# golang
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
+GO_BOOTSTRAP = $(HOST_DIR)/usr/lib/go-1.4.2
+
+ifeq ($(BR2_arm),y)
+	GO_GOARCH = arm
+else ifeq ($(BR2_aarch64),y)
+	GO_GOARCH = arm64
+else ifeq ($(BR2_i386),y)
+	GO_GOARCH = 386
+else ifeq ($(BR2_x86_64),y)
+	GO_GOARCH = amd64
+else ifeq ($(BR2_powerpc),y)
+	GO_GOARCH = ppc64
+else
+	GO_GOARCH = unknown
+endif
+
+ifeq ($(BR2_arm)$(BR2_ARM_CPU_HAS_VFPV3),yy)
+	GO_GOARM = 7
+else ifeq ($(BR2_arm)$(BR2_ARM_CPU_HAS_VFPV2),yy)
+	GO_GOARM = 6
+else ifeq ($(BR2_arm),y)
+	GO_GOARM = 5
+endif
+
+GO_HOST_DEPENDENCIES = host-go-bootstrap
+GO_HOST_FINAL = $(HOST_DIR)/usr/lib/go
+
+GO_HOST_MAKE_ENV = \
+	GOROOT_BOOTSTRAP=$(GO_BOOTSTRAP) \
+	GOROOT_FINAL=$(GO_HOST_FINAL) \
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
+	cd $(@D)/src && $(GO_HOST_MAKE_ENV) ./make.bash
+endef
+
+define HOST_GO_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(GO_HOST_FINAL)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(GO_HOST_FINAL)/bin/gofmt
+
+	ln -sf ../lib/go/bin/go $(HOST_DIR)/usr/bin/
+	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/usr/bin/
+
+	cp -a $(@D)/lib $(GO_HOST_FINAL)/
+	cp -a $(@D)/src $(GO_HOST_FINAL)/
+
+	mkdir -p $(GO_HOST_FINAL)/pkg
+	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(GO_HOST_FINAL)/pkg/
+	cp -a $(@D)/pkg/tool $(GO_HOST_FINAL)/pkg/
+	chmod -R +x $(GO_HOST_FINAL)/pkg/tool
+endef
+
+$(eval $(host-generic-package))
-- 
2.5.0
