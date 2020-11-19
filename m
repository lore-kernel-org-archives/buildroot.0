From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:50 +0100
Subject: [Buildroot] [PATCH next 05/12] support/download/go-post-process:
 implement Go vendoring support
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces the download post-process script
support/download/go-post-process, and hooks it into the Go package
infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk            |  7 ++++++-
 support/download/go-post-process | 29 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100755 support/download/go-post-process

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 3813e1c406..150445bf17 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -47,7 +47,7 @@ $(2)_BUILD_OPTS += \
 	-p $(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host.
-$(2)_DEPENDENCIES += host-go
+$(2)_DOWNLOAD_DEPENDENCIES += host-go
 
 $(2)_BUILD_TARGETS ?= .
 
@@ -72,6 +72,11 @@ $(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
 # If the go.mod file does not exist, one is written with this root path.
 $(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 
+$(2)_DOWNLOAD_POST_PROCESS = go
+$(2)_DL_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	GOPROXY=direct
+
 # Generate a go.mod file if it doesn't exist. Note: Go is configured
 # to use the "vendor" dir and not make network calls.
 define $(2)_GEN_GOMOD
diff --git a/support/download/go-post-process b/support/download/go-post-process
new file mode 100755
index 0000000000..01073aee8b
--- /dev/null
+++ b/support/download/go-post-process
@@ -0,0 +1,29 @@
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
+go mod vendor -v
+popd > /dev/null
+
+repack ${base_name} ${output}
-- 
2.28.0
