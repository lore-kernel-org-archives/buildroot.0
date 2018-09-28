From: Fabio Urquiza <fabiorush@gmail.com>
Date: Fri, 28 Sep 2018 10:59:20 -0300
Subject: [Buildroot] [PATCH 1/4] host-go-glide: new package
In-Reply-To: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
References: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
Message-ID: <1538143163-20596-2-git-send-email-fabiorush@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Urquiza <flus@dmz.org.br>

A package management for Golang.

Signed-off-by: Fabio Urquiza <fabiorush@gmail.com>
---
 package/Config.in.host          |  1 +
 package/go-glide/Config.in.host | 12 ++++++++++++
 package/go-glide/go-glide.hash  |  3 +++
 package/go-glide/go-glide.mk    | 14 ++++++++++++++
 package/pkg-golang.mk           | 36 ++++++++++++++++++++++++++++++++----
 5 files changed, 62 insertions(+), 4 deletions(-)
 create mode 100644 package/go-glide/Config.in.host
 create mode 100644 package/go-glide/go-glide.hash
 create mode 100644 package/go-glide/go-glide.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 3a3578c..e8b6019 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -24,6 +24,7 @@ menu "Host utilities"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
+	source "package/go-glide/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
diff --git a/package/go-glide/Config.in.host b/package/go-glide/Config.in.host
new file mode 100644
index 0000000..5d085f9
--- /dev/null
+++ b/package/go-glide/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_GO_GLIDE
+	bool "host glide"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	help
+	  Glide is a tool for managing the _vendor_ directory within a Go
+	  package. This feature, first introduced in Go 1.5, allows each
+	  package to have a _vendor_ directory containing dependent
+	  packages for the project. These vendor packages can be
+	  installed by a tool (e.g. glide), similar to go get or they
+	  can be vendored and distributed with the package.
+
+	  https://github.com/Masterminds/glide
diff --git a/package/go-glide/go-glide.hash b/package/go-glide/go-glide.hash
new file mode 100644
index 0000000..856a0f7
--- /dev/null
+++ b/package/go-glide/go-glide.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 0886851af2437b161d47b279a32bef426577e7bec3f5acdadebe34549aae8270  go-glide-v0.13.2.tar.gz
+sha256 ff505b08691ce248f27dfe94d605419e6514c8b60912c7f4188a3e3168ad338f  LICENSE
diff --git a/package/go-glide/go-glide.mk b/package/go-glide/go-glide.mk
new file mode 100644
index 0000000..f3eecc1
--- /dev/null
+++ b/package/go-glide/go-glide.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# glide
+#
+################################################################################
+
+GO_GLIDE_VERSION = v0.13.2
+GO_GLIDE_SITE = $(call github,Masterminds,glide,$(GO_GLIDE_VERSION))
+GO_GLIDE_LICENSE = Glide
+GO_GLIDE_LICENSE_FILES = LICENSE
+HOST_GO_GLIDE_BIN_NAME = glide
+HOST_GO_GLIDE_INSTALL_BINS = glide
+
+$(eval $(host-golang-package))
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 6eacd14..6405edf 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -22,6 +22,7 @@
 ################################################################################
 
 GO_BIN = $(HOST_DIR)/bin/go
+GLIDE_BIN = $(HOST_DIR)/bin/glide
 
 # We pass an empty GOBIN, otherwise "go install: cannot install
 # cross-compiled binaries when GOBIN is set"
@@ -31,6 +32,15 @@ GO_TARGET_ENV = \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
 
+GO_HOST_ENV = \
+	GOROOT="$(HOST_GO_ROOT)" \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)" \
+	GOTOOLDIR="$(HOST_GO_TOOLDIR)" \
+	PATH=$(BR_PATH) \
+	GOBIN= \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
+
 ################################################################################
 # inner-golang-package -- defines how the configuration, compilation and
 # installation of a Go package should be done, implements a few hooks to tune
@@ -43,8 +53,6 @@ GO_TARGET_ENV = \
 #  argument 3 is the uppercase package name, without the HOST_ prefix for host
 #             packages
 #  argument 4 is the type (target or host)
-#
-# NOTE Only type target is supported at the moment
 ################################################################################
 
 define inner-golang-package
@@ -61,6 +69,14 @@ $(2)_BUILD_OPTS += -tags "$$($(2)_TAGS)"
 # Target packages need the Go compiler on the host.
 $(2)_DEPENDENCIES += host-go
 
+$(2)_GO_GET ?= NO
+$(2)_GO_GLIDE ?= NO
+
+ifeq ($($(2)_GO_GLIDE),YES)
+$(2)_DEPENDENCIES += host-go-glide
+endif
+
+
 $(2)_BUILD_TARGETS ?= .
 
 # If the build target is just ".", then we assume the binary to be
@@ -97,11 +113,14 @@ endif
 # file.
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
+	echo $$($(2)_DEPENDENCIES)
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
 		cd $$($(2)_SRC_PATH); \
-		$$(GO_TARGET_ENV) \
+		export $(if $(findstring $(4),target),$$(GO_TARGET_ENV),$$(GO_HOST_ENV)) \
 			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
-			$$($(2)_GO_ENV) \
+			$$($(2)_GO_ENV) && \
+			$(if $(findstring $($(2)_GO_GLIDE),YES),$$(GLIDE_BIN) install &&) \
+			$(if $(findstring $($(2)_GO_GET),YES),$$(GO_BIN) get -d &&) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
 			./$$(d)
@@ -119,6 +138,14 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$$(foreach d,$$($(2)_INSTALL_BINS),\
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/usr/bin/$$(d)
+	)
+endef
+endif
+
 # Call the generic package infrastructure to generate the necessary make
 # targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
@@ -130,3 +157,4 @@ endef # inner-golang-package
 ################################################################################
 
 golang-package = $(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-golang-package = $(call inner-golang-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.7.4
