From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:06 +0200
Subject: [Buildroot] [git commit branch/next] package/go: implement go
 modules integration
Message-ID: <20200829124232.F059A8152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7afd262da0e2a8fee0ebd33049619346de660cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Go compiler needs to know the "import path" to the root of package
source repositories. Previously, this was done by creating a fake
_gopath in the build directory and symlinking the package source into
that path.

Go has deprecated the GOPATH mechanism in favor of a new approach -
Modules - which specifies the root import path (and dependencies) in a
"go.mod" file. This commit moves Buildroot to use the new go.mod
approach, which requires:

 - Passing GO111MODULE=on when building host or target Go packages.

 - Passing GOPROXY=off and -mod=vendor to prevent the Go module system
   from downloading by itself sources from the Internet. We currently
   only support Go packages that have all their dependencies in their
   source tree in "vendor" directories.

 - Specifying a <pkg>_GOMOD variable, which is used both to create a
   minimal go.mod file in the package source tree if it exists, and to
   invoke the right build targets. Indeed, all elements in
   <pkg>_BUILD_TARGETS are now relative to <pkg>_GOMOD.

Reference: https://github.com/golang/go/wiki/Modules

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk      |  6 +++++-
 package/pkg-golang.mk | 38 +++++++++++++++++---------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 8dfd96c88a..ee68014355 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,6 +12,7 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
+HOST_GO_GOPATH = $(HOST_DIR)/usr/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
 HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
@@ -19,8 +20,11 @@ HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
 # We pass an empty GOBIN, otherwise "go install: cannot install
 # cross-compiled binaries when GOBIN is set"
 HOST_GO_COMMON_ENV = \
-	GO111MODULE=off \
+	GO111MODULE=on \
+	GOFLAGS=-mod=vendor \
 	GOROOT="$(HOST_GO_ROOT)" \
+	GOPATH="$(HOST_GO_GOPATH)" \
+	GOPROXY=off \
 	PATH=$(BR_PATH) \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 7424c31924..3813e1c406 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -40,8 +40,6 @@ GO_BIN = $(HOST_DIR)/bin/go
 
 define inner-golang-package
 
-$(2)_WORKSPACE ?= _gopath
-
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-tags "$$($(2)_TAGS)" \
@@ -63,25 +61,25 @@ endif
 
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
+# $(2)_GOMOD is the root Go module path for the project, inferred if not set.
+# If the go.mod file does not exist, one is written with this root path.
+$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 
-# Configure step. Only define it if not already defined by the package .mk
-# file.
-ifndef $(2)_CONFIGURE_CMDS
-define $(2)_CONFIGURE_CMDS
-	mkdir -p $$(dir $$($(2)_SRC_PATH))
-	ln -sf $$(@D) $$($(2)_SRC_PATH)
+# Generate a go.mod file if it doesn't exist. Note: Go is configured
+# to use the "vendor" dir and not make network calls.
+define $(2)_GEN_GOMOD
+	if [ ! -f $$(@D)/go.mod ]; then \
+		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
+	fi
 endef
-endif
+$(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -95,26 +93,24 @@ endif
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$($(2)_SRC_PATH); \
+		cd $$(@D); \
 		$$(HOST_GO_TARGET_ENV) \
-			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
-			./$$(d)
+			$$($(2)_GOMOD)/$$(d)
 	)
 endef
 else
 # Build package for host
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$($(2)_SRC_PATH); \
+		cd $$(@D); \
 		$$(HOST_GO_HOST_ENV) \
-			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
-			./$$(d)
+			$$($(2)_GOMOD)/$$(d)
 	)
 endef
 endif
