From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Dec 2020 16:35:18 +0100
Subject: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
In-Reply-To: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces the download post-process script
support/download/go-post-process, and hooks it into the Go package
infrastructure.

The -modcacherw flag is added to ensure that the Go cache is
read/write, and can be deleted properly upon "make clean".

The <pkg>_LICENSE variable of golang packages is expanded with ",
vendored dependencies licenses probably not listed" as currently for
all packages, the licenses of the vendored dependencies are not taken
into account.

The logic to generate go.mod when not available is moved to the
download post-process helper, as it must be done before "go mod
vendor" is executed. Also, "go mod init" is used instead of manually
crafting go.mod. This was suggested by Christian Stewart
<christian@paral.in>. The Go module name is passed down to
go-post-process using the BR_GOMOD environment variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk            | 20 ++++++++++--------
 support/download/go-post-process | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 9 deletions(-)
 create mode 100755 support/download/go-post-process

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index d07242310d..00a74a4d18 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -42,12 +42,13 @@ define inner-golang-package
 
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
+	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
 	-p $(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host.
-$(2)_DEPENDENCIES += host-go
+$(2)_DOWNLOAD_DEPENDENCIES += host-go
 
 $(2)_BUILD_TARGETS ?= .
 
@@ -72,14 +73,15 @@ $(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
 # If the go.mod file does not exist, one is written with this root path.
 $(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 
-# Generate a go.mod file if it doesn't exist. Note: Go is configured
-# to use the "vendor" dir and not make network calls.
-define $(2)_GEN_GOMOD
-	if [ ! -f $$(@D)/go.mod ]; then \
-		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
-	fi
-endef
-$(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
+$(2)_DOWNLOAD_POST_PROCESS = go
+$(2)_DL_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	GOPROXY=direct \
+	BR_GOMOD=$$($(2)_GOMOD)
+
+# Due to vendoring, it is pretty likely that not all licenses are
+# listed in <pkg>_LICENSE.
+$(2)_LICENSE += , vendored dependencies licenses probably not listed
 
 # Build step. Only define it if not already defined by the package .mk
 # file.
diff --git a/support/download/go-post-process b/support/download/go-post-process
new file mode 100755
index 0000000000..4ca3e9a710
--- /dev/null
+++ b/support/download/go-post-process
@@ -0,0 +1,35 @@
+#!/usr/bin/env bash
+
+set -e
+
+. $(dirname $0)/post-process-helpers
+
+# Parse our options
+while getopts "n:o:" OPT; do
+        case "${OPT}" in
+        o)  output="${OPTARG}";;
+        n)  base_name="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+done
+
+# Already vendored tarball, nothing to do
+if tar tf ${output} | grep -q "^[^/]*/vendor" ; then
+	exit 0
+fi
+
+unpack ${base_name} ${output}
+
+# Do the Go vendoring
+pushd ${base_name} > /dev/null
+
+# Generate go.mod if it doesn't exist
+if [ ! -f go.mod ] && [ -n "${BR_GOMOD}" ]; then
+	go mod init ${BR_GOMOD}
+fi
+
+go mod vendor -v -modcacherw
+popd > /dev/null
+
+repack ${base_name} ${output}
-- 
2.29.2
