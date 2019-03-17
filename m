From: Christian Stewart <christian@paral.in>
Date: Sat, 16 Mar 2019 18:21:37 -0700
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
Message-ID: <20190317012142.10545-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit moves from the GOPATH mechanism to the new GO111MODULE approach for
Go based packages. Old Go packages (with the exception of docker-cli) will
compile without changes (for example, mender, flanneld).

Cavets with the current implementation:

 - "make source" may not produce a valid output
 - module downloading occurs ignoring the Buildroot download server
 - module downloading occurs in a post-patch hook

Go code uses a package-based imports system. Imports are
relative to a root directory, previously called GOPATH.

import "github.com/docker/docker/pkg/myutils"

This would resolve to $GOPATH/src/github.com/docker/docker/pkg/myutils.

Buildroot packages previously used an additional feature in the Go tool which
allows packages to avoid using GOPATH by "vendoring" dependencies - copying the
code directly into the Git repository.

vendor/github.com/docker/docker/pkg/myutils

Old packages that used the vendor/ approach remain compatible via inferring the
root import path from the download URL if no go.mod is present.

All current Buildroot Go modules use "vendor" to avoid downloading dependencies.
This requires that the Go projects added to Buildroot include all of their
dependencies in their repositories. It also does not allow us the opportunity to
validate or adjust dependency versions when upgrading packages in Buildroot.

The Go module system aims to completely replace the GOPATH mechanism by
allowing the Go tool to reason about package versioning, code fetching,
proxying, and checksumming.

A project can contain any number of go.mod files. A go.mod file is akin to
Node's package.json file. It specifies all direct and indirect dependencies of
all Go packages in the subtree below the file. The Go tool can manage this file
automatically if desired, and specifies a required format. Go.mod additionally
requires dependency versions to be explicitly specified. There is no semantic
versioning or asterisk-based version specifiers.

module mymodule

require (
github.com/aws/aws-sdk-go v1.17.12 // indirect
github.com/blang/semver v3.5.2-0.20180723201105-3c1074078d32+incompatible
)

The Go tool creates a go.sum file next to the go.mod file. The go.sum
file is akin to Node's package-shrinkwrap.json.

github.com/aws/aws-sdk-go v1.15.31/go.mod
h1:mFuSZ37Z9YOHbQEwBWztmVzqXrEkub65tZoCYDt7FT0=
github.com/aws/aws-sdk-go v1.17.12
h1:jMFwRUaM0LcfdenfvbDLePNoWSoCdOHqF4RCvSB4xNQ=
github.com/aws/aws-sdk-go v1.17.12/go.mod
h1:KmX6BPdI08NWTb3/sm4ZGu5ShLoqVDhKgpiN924inxo=
github.com/blang/semver
v3.5.2-0.20180723201105-3c1074078d32+incompatible
h1:8fBbhRkI5/0ocLFbrhPgnGUm0ogc+Gko1cRodPWDKX4=
github.com/blang/semver
v3.5.2-0.20180723201105-3c1074078d32+incompatible/go.mod
h1:kRBLl5iJ+tD4TcOOxsy/0fnwebNt5EWlYSAyrTnjyyk=

The file contains import paths, versions, and file hashes for the download as
well as the contained go.mod file.

With replace directives, it's possible to link together local copies of modules:

replace (
k8s.io/gengo => ./staging/src/k8s.io/gengo
k8s.io/kube-openapi => ./staging/src/k8s.io/kube-openapi
)

When GO111MODULE=on, all of the Go tool commands become "module-aware." GOPATH
is no longer required. Running "go build" for example will fetch dependencies
from the Internet, checksum them, and extract to a staging directory (defaulting
currently to GOPATH/pkg/gomod or so). Imports are automatically resolved to the
appropriately versioned staging directory.

There are various ways to control the download / extract behavior:

  The GOPROXY environment variable allows further control over the
  download source. If GOPROXY is unset, is the empty string, or is the
  string "direct", downloads use the default direct connection to
  version control systems. Setting GOPROXY to "off" disallows
  downloading modules from any source. Otherwise, GOPROXY is expected to
  be the URL of a module proxy, in which case the go command will fetch
  all modules from that proxy. No matter the source of the modules,
  downloaded modules must match existing entries in go.sum...

  Even when downloading directly from version control systems, the go
  command synthesizes explicit info, mod, and zip files and stores them
  in its local cache, $GOPATH/pkg/mod/cache/download, the same as if it
  had downloaded them directly from a proxy. The cache layout is the
  same as the proxy URL space, so serving $GOPATH/pkg/mod/cache/download
  at (or copying it to) https://example.com/proxy would let other users
  access those cached module versions with
  GOPROXY=https://example.com/proxy.

GOPROXY additionally supports file:// URLs.

This commit sets GOPATH to $(DL_DIR)/go-module, as the Go module system will
download and cache code sources in the GOPATH/pkg/mod path.

The go.mod and go.sum files can optionally be placed in $(2)_PKGDIR next to
Config.in and other support files. They are copied in with a post-download hook,
and "go mod download" is executed to pull the dependencies from the internet.

A hook is added to execute "go mod vendor".

Upstream vendor trees are still optionally supported, but can be overridden by
placing go.mod into the Buildroot tree as described above. Package developers
can alternatively specify LIBFOO_GOMOD to indicate the root module path. This
allows the Go module tool to compile code using a legacy vendor/ tree, without a
GOPATH to indicate the import path for the root module.

DOCKER_ENGINE_GOMOD = github.com/docker/docker

A Buildroot user can serve the dl/go-modules directory directly with a HTTP
server and set GOPROXY such that all module downloads come from that server.
This could be configurable eventually via the Buildroot KConfig architecture.

During the build phase, the "-mod=vendor" option is used to indicate that the
extracted vendor/ tree (from the post-extract step) is to be used.

Go modules are never disabled with this approach. They are compatible with the
legacy vendor/ tree approach by the above mechanisms.

Reference: https://github.com/golang/go/wiki/Modules

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.mk      |  7 +++++-
 package/pkg-golang.mk | 50 ++++++++++++++++++++++++++++---------------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 4daa2fe093..be05602f14 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -36,6 +36,9 @@ else ifeq ($(BR2_mips64el),y)
 GO_GOARCH = mips64le
 endif
 
+# GOPATH is used only for Go module downloads.
+HOST_GO_GOPATH = $(DL_DIR)/go-module
+
 HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -44,10 +47,12 @@ HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
 # For the convienience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
-	GO111MODULE=off \
+	GO111MODULE=on \
 	GOARCH=$(GO_GOARCH) \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
+	GOPROXY=off \
 	GOROOT="$(HOST_GO_ROOT)" \
+	GOPATH="$(HOST_GO_GOPATH)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 4f2c7e77e1..91651c5fca 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -57,6 +57,7 @@ endif
 
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
+	-mod=vendor \
 	-tags "$$($(2)_TAGS)" \
 	-p $(PARALLEL_JOBS)
 
@@ -75,38 +76,53 @@ endif
 
 $(2)_INSTALL_BINS ?= $(1)
 
-# Source files in Go should be extracted in a precise folder in the hierarchy
-# of GOPATH. It usually resolves around domain/vendor/software. By default, we
-# derive domain/vendor/software from the upstream URL of the project, but we
-# allow $(2)_SRC_SUBDIR to be overridden if needed.
+# Source files in Go usually use an import path resolved around
+# domain/vendor/software. We infer domain/vendor/software from the upstream URL
+# of the project. $(2)_GOMOD can be overridden.
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
+$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
+
+# Correctly configure the go.mod and go.sum files for the module system.
+# TODO: GOPROXY: use fallback mechanism and Buildroot proxy
+# TODO: Perform the downloading / vendoring such that "make source" is correct
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
+	if [ ! -d $$(@D)/vendor ]; then \
+		cd $$(@D); \
+		$$(GO_TARGET_ENV) \
+			$$($(2)_GO_ENV) \
+			GOPROXY="direct" \
+			$$(GO_BIN) mod vendor -v; \
+	fi
 endef
-endif
+
+$(2)_POST_EXTRACT_HOOKS += $(2)_APPLY_EXTRACT_GOMOD
 
 # Build step. Only define it if not already defined by the package .mk
 # file.
 ifndef $(2)_BUILD_CMDS
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
 endif
-- 
2.19.2
