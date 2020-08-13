From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:32:14 -0700
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
Message-ID: <20200813213220.260112-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Go compiler needs to know the "import path" to the root of package source
repositories. Previously, this was done by creating a fake _gopath in the build
directory and symlinking the package source into that path.

Go has deprecated the GOPATH mechanism in favor of a new approach - Modules -
which specifies the root import path (and dependencies) in a "go.mod" file.

This commit moves Buildroot to use the new go.mod approach. Both host and target
Go packages compile correctly with small tweaks adjusting the build target
specifier.

Note: the Go module system will NOT download sources from the Internet due to
GOPROXY=off and -mod=vendor. All Buildroot packages currently have "vendor"
directories included with dependencies' source code.

The environment variables passed to Go during host and target package
compilation have been fixed to correctly pass CC, CXX, CFLAGS, and so on.

Reference: https://github.com/golang/go/wiki/Modules

Signed-off-by: Christian Stewart <christian@paral.in>

v2 -> v3:

 - cjs: cleaned up spelling and moved extract hook to configure step
 - cjs: applied fixes from vincent fazio related to host packages

v3 -> v4:

 - cjs: clean up HOST and TARGET variables passed to Go
 - cjs: fix all CXXflags, cgo env vars to be consistent/correct
 - cjs: document / explain the difference from GOPATH

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.mk      | 55 +++++++++++++++++++++++++--------
 package/pkg-golang.mk | 71 +++++++++++++++++++++----------------------
 2 files changed, 76 insertions(+), 50 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 72604a250b..74e5298e66 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,6 +12,7 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
+HOST_GO_GOPATH = $(HOST_DIR)/usr/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
 HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
@@ -43,16 +44,51 @@ else ifeq ($(BR2_mips64el),y)
 GO_GOARCH = mips64le
 endif
 
-# For the convienience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
-HOST_GO_TARGET_ENV = \
-	GO111MODULE=off \
-	GOARCH=$(GO_GOARCH) \
-	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
+HOST_GO_COMMON_ENV = \
+	CC=$(HOSTCC_NOCCACHE) \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	GO111MODULE=on \
+	GOBIN= \
+	GOFLAGS=-mod=vendor \
+	GOPATH="$(HOST_GO_GOPATH)" \
+	GOPROXY=off \
 	GOROOT="$(HOST_GO_ROOT)" \
+	GOTOOLDIR="$(HOST_GO_TOOLDIR)" \
+	PATH=$(BR_PATH)
+
+# Used for compiling host packages.
+HOST_GO_HOST_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	CGO_CFLAGS="$(HOST_CFLAGS)" \
+	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
+	CGO_FFLAGS="$(HOST_FCFLAGS)" \
+	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
+	GOARCH="" \
+	GOCACHE="$(HOST_GO_HOST_CACHE)"
+
+# Used for compiling the host-go compiler and target packages.
+HOST_GO_CROSS_ENV = \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOARCH=$(GO_GOARCH) \
+	GO_ASSUME_CROSSCOMPILING=1
+
+# Used for compiling target packages.
+#
+# Note: CC and CXX must be set as well as TARGET_ variants.
+HOST_GO_TARGET_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	$(HOST_GO_CROSS_ENV) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
+	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	CGO_FFLAGS="$(TARGET_FCFLAGS)" \
+	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
+	GOCACHE="$(HOST_GO_TARGET_CACHE)"
 
 # The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
 # set, build in cgo support for any go programs that may need it.  Note that
@@ -64,13 +100,6 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 
-HOST_GO_CROSS_ENV = \
-	CC_FOR_TARGET="$(TARGET_CC)" \
-	CXX_FOR_TARGET="$(TARGET_CXX)" \
-	GOARCH=$(GO_GOARCH) \
-	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
-	GO_ASSUME_CROSSCOMPILING=1
-
 else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # host-go can still be used to build packages for the host. No need to set all
 # the arch stuff since we will not be cross-compiling.
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 2494ce028c..2d80e99619 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -23,21 +23,11 @@
 
 GO_BIN = $(HOST_DIR)/bin/go
 
-# We pass an empty GOBIN, otherwise "go install: cannot install
-# cross-compiled binaries when GOBIN is set"
-GO_COMMON_ENV = \
-	PATH=$(BR_PATH) \
-	GOBIN= \
-	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
-
-GO_TARGET_ENV = \
-	$(HOST_GO_TARGET_ENV) \
-	$(GO_COMMON_ENV)
-
-GO_HOST_ENV = \
-	CGO_CFLAGS="$(HOST_CFLAGS)" \
-	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
-	$(GO_COMMON_ENV)
+# Used when compiling host packages.
+GO_HOST_ENV = $(HOST_GO_HOST_ENV)
+
+# Used when compiling target packages.
+GO_TARGET_ENV =	$(HOST_GO_TARGET_ENV)
 
 ################################################################################
 # inner-golang-package -- defines how the configuration, compilation and
@@ -56,8 +46,6 @@ GO_HOST_ENV = \
 
 define inner-golang-package
 
-$(2)_WORKSPACE ?= _gopath
-
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-tags "$$($(2)_TAGS)" \
@@ -79,25 +67,36 @@ endif
 
 $(2)_INSTALL_BINS ?= $(1)
 
-# Source files in Go should be extracted in a precise folder in the hierarchy
-# of GOPATH. It usually resolves around domain/vendor/software. By default, we
-# derive domain/vendor/software from the upstream URL of the project, but we
-# allow $(2)_SRC_SUBDIR to be overridden if needed.
+# Source files in Go usually use an import path resolved around
+# domain/vendor/software. We infer domain/vendor/software from the upstream URL
+# of the project.
 $(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
 $(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
 $(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
 
-$(2)_SRC_SUBDIR ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
-$(2)_SRC_PATH = $$(@D)/$$($(2)_WORKSPACE)/src/$$($(2)_SRC_SUBDIR)
-
-# Configure step. Only define it if not already defined by the package .mk
-# file.
-ifndef $(2)_CONFIGURE_CMDS
-define $(2)_CONFIGURE_CMDS
-	mkdir -p $$(dir $$($(2)_SRC_PATH))
-	ln -sf $$(@D) $$($(2)_SRC_PATH)
+# $(2)_GOMOD is the root Go module path for the project, inferred if not set.
+# If the go.mod file does not exist, one is written with this root path.
+# Replaces the old GOPATH/symlink mechanism for setting the root import path.
+$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
+
+# Correctly configure the go.mod and go.sum files for the module system.
+# Note: Go is configured to use the "vendor" dir and not make network calls.
+define $(2)_APPLY_EXTRACT_GOMOD
+	if [ -f $$($(2)_PKGDIR)/go.mod ]; then \
+		cp $$($(2)_PKGDIR)/go.mod $$(@D)/go.mod; \
+		if [ -f $$(@D)/go.sum ]; then \
+			rm $$(@D)/go.sum; \
+		fi; \
+	fi; \
+	if [ -f $$($(2)_PKGDIR)/go.sum ]; then \
+		cp $$($(2)_PKGDIR)/go.sum $$(@D)/go.sum; \
+	fi
+	if [ ! -f $$(@D)/go.mod ] && [ -n "$$($(2)_GOMOD)" ]; then \
+		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
+	fi
 endef
-endif
+
+$(2)_POST_EXTRACT_HOOKS += $(2)_APPLY_EXTRACT_GOMOD
 
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -111,26 +110,24 @@ endif
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$($(2)_SRC_PATH); \
+		cd $$(@D); \
 		$$(GO_TARGET_ENV) \
-			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
-			./$$(d)
+			$$(d)
 	)
 endef
 else
 # Build package for host
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$($(2)_SRC_PATH); \
+		cd $$(@D); \
 		$$(GO_HOST_ENV) \
-			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
-			./$$(d)
+			$$(d)
 	)
 endef
 endif
-- 
2.28.0
