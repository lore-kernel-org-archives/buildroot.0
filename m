From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 31 Jan 2020 12:27:48 +0100
Subject: [Buildroot] [RFC PATCH 3/4] package/pkg-cargo.mk: split download &
 build phase
In-Reply-To: <20200131112749.30915-1-patrick.havelange@essensium.com>
References: <20200131112749.30915-1-patrick.havelange@essensium.com>
Message-ID: <20200131112749.30915-3-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use cargo to download the dependencies of a given package before
building it. This ensures that the CARGO_HOME directory is being
populated with all the necessary sources. The build phase is
forced to not query the online repository anymore and thus uses
the previously downloaded files.
It also allows to have offline builds.
Updated the cargo doc w.r.t. that aspect.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-cargo.txt | 16 ++++-------
 package/pkg-cargo.mk                  | 13 ++++++++-
 support/download/cargo                | 41 +++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100755 support/download/cargo

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 9a496224e3..62a6611214 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -61,16 +61,10 @@ Those will then replace the commands from the cargo infrastructure.
 ==== About Dependencies Management
 
 A crate can depend on other libraries from crates.io or git repositories, listed
-in its Cargo.toml file. Before starting a build, Cargo usually downloads
-automatically them. This step can also be performed independently, via the
-+cargo fetch+ command.
+in its Cargo.toml file. Before starting a build, the +cargo fetch+ command
+will be run and will take care of downloading those dependencies.
 
 Cargo maintains a local cache of the registry index and of git checkouts of the
-crates, whose location is given by +$CARGO_HOME+. As seen in the package
-Makefile example at line 15, this environment variable is set to
-+$(HOST_DIR)/share/cargo+.
-
-This dependency download mechanism is not convenient when performing an offline
-build, as Cargo will fail to fetch the dependencies. In that case, it is advised
-to generate a tarball of the dependencies using the +cargo vendor+ and add it to
-+FOO_EXTRA_DOWNLOADS+.
+crates, whose location is given by +$CARGO_HOME+.
+
+This effectively permits to perform an offline build.
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 2242f3a082..cfdae06a4e 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -46,6 +46,15 @@ ifeq ($(4),target)
     $(2)_CARGO_TARGET_OPT = --target $$(RUSTC_TARGET_NAME)
 endif
 
+define $(2)_CARGO_DL_STEP
+	$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
+		$(TOPDIR)/support/download/cargo \
+		$$($(2)_DL_DIR)/$$($(2)_SOURCE) \
+		$$($(2)_CARGO_TARGET_OPT)
+endef
+
+$(2)_POST_DOWNLOAD_HOOKS += $(2)_CARGO_DL_STEP
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -56,7 +65,8 @@ define $(2)_BUILD_CMDS
 		cargo build \
 			--$$($(2)_CARGO_MODE) \
 			$$($(2)_CARGO_TARGET_OPT) \
-			--manifest-path $$(@D)/Cargo.toml
+			--manifest-path $$(@D)/Cargo.toml \
+			--offline
 endef
 endif
 
@@ -72,6 +82,7 @@ define $(2)_INSTALL_TARGET_CMDS
 			--bins \
 			--path $$(@D) \
 			$$($(2)_CARGO_TARGET_OPT) \
+			--offline \
 			--force
 endef
 endif
diff --git a/support/download/cargo b/support/download/cargo
new file mode 100755
index 0000000000..51b76ec4f5
--- /dev/null
+++ b/support/download/cargo
@@ -0,0 +1,41 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for cargo package. It will populate the CARGO_HOME
+# cache with the dependencies of a given package
+#
+# Arguments are in this order:
+# $1 mandatory fullpath to an already downloaded source file of a cargo package
+# $2+ optional arguments, e.g. the --target option
+#
+# Environment:
+# CARGO_HOME set
+# cargo in PATH
+
+tmpd=""
+
+do_clean() {
+    if [ ! -z "${tmpd}" ]; then
+        rm -rf "${tmpd}"
+    fi
+}
+
+trap do_clean EXIT
+
+if [ $# -eq 0 ] ; then
+    echo Need at least path to tarball as argument >&2
+    exit 1
+fi;
+if [ -z "$CARGO_HOME" ] ; then
+    echo CARGO_HOME must be set to a non empty value >&2
+    exit 1
+fi
+
+tmpd="$(mktemp -d)"
+cd "${tmpd}"
+
+tar xf "${1}"
+shift 1
+cargo fetch --manifest-path */Cargo.toml $*
-- 
2.17.1
