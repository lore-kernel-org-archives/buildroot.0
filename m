From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:23 +0100
Subject: [Buildroot] [PATCH v2 06/10] package/pkg-cargo.mk: Introduce the
 cargo dl backend
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <20200214124827.30767-6-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cargo is now a fully supported PKGMGR, automatically set for any
package using the cargo infrastructure.
This effectively splits the download phase and the build phase.

The cargo backend will set CARGO_HOME inside DL_DIR during download.
The cached files in CARGO_HOME permits to download only once the
crates index and each dependencies.
During download phase, it will call cargo vendor to copy the
dependencies inside the VENDOR directory inside the source archive.

A local cargo config is also inserted inside the archive in order
to use the VENDOR dir during the build phase.
The build phase is forced to not query the online repository anymore
and thus will be using the vendored dependencies from the tarball.
This also permits to have offline builds.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 package/pkg-cargo.mk         | 10 ++++--
 package/ripgrep/ripgrep.hash |  2 +-
 support/download/cargo       | 65 ++++++++++++++++++++++++++++++++++++
 support/download/dl-wrapper  |  2 +-
 4 files changed, 75 insertions(+), 4 deletions(-)
 create mode 100755 support/download/cargo

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 2242f3a082..3067b12a56 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -39,6 +39,8 @@ define inner-cargo-package
 # We need host-rustc to run cargo
 $(2)_DEPENDENCIES += host-rustc
 
+$(2)_PKGMGR = cargo\|
+
 $(2)_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 $(2)_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
 
@@ -52,11 +54,13 @@ endif
 #
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
+	cd $$(@D) && \
 	$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
 		cargo build \
 			--$$($(2)_CARGO_MODE) \
 			$$($(2)_CARGO_TARGET_OPT) \
-			--manifest-path $$(@D)/Cargo.toml
+			--manifest-path Cargo.toml \
+			--offline
 endef
 endif
 
@@ -66,12 +70,14 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
+	cd $$(@D) && \
 	$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
 		cargo install \
 			--root $(TARGET_DIR)/usr/ \
 			--bins \
-			--path $$(@D) \
+			--path ./ \
 			$$($(2)_CARGO_TARGET_OPT) \
+			--offline \
 			--force
 endef
 endif
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 0841c0185c..8c48458cd8 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
+sha256 cb895cff182740c219fefbbaaf903e60f005a4ac4688cac1e43e5fbbbccc5a94 ripgrep-0.8.1.tar.gz
 sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
diff --git a/support/download/cargo b/support/download/cargo
new file mode 100755
index 0000000000..0ce94cf16b
--- /dev/null
+++ b/support/download/cargo
@@ -0,0 +1,65 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for cargo package. It will populate the VENDOR directory
+# inside the archive with the dependencies of the package
+#
+# Arguments are in this order:
+# $1 mandatory fullpath to an already downloaded source file of a cargo package
+# $2 mandatory fullpath to a temp dir
+# $3 mandatory fullpath to the DL_DIR
+#
+# Environment:
+# cargo in PATH
+
+tmpd=""
+
+do_clean() {
+    if [ -n "${tmpd}" ]; then
+        rm -rf "${tmpd}"
+    fi
+}
+
+trap do_clean EXIT
+
+if [ $# -le 2 ] ; then
+    echo 'Need at least 3 arguments' >&2
+    exit 1
+fi;
+
+tmpd="$(mktemp -d -p "$2")"
+cd "${tmpd}"
+
+tar xf "${1}"
+cd ./*/
+echo "Running cargo vendor."
+CARGO_HOME="${3}"/cargo_home cargo vendor -q --locked VENDOR
+# Create the local .cargo/config with vendor info
+mkdir -p .cargo/
+cat <<EOF >.cargo/config
+[source.crates-io]
+replace-with = "vendored-sources"
+
+[source.vendored-sources]
+directory = "VENDOR"
+EOF
+
+cd ..
+
+# Generate the archive, sort with the C locale so that it is reproducible.
+find "$(basename "$OLDPWD")" -not -type d -print0 >files.list
+LC_ALL=C sort -z <files.list >files.list.sorted
+# let's use a fixed hardcoded date to be reproducible
+date="2020-02-06 01:02:03"
+
+# Create GNU-format tarballs, since that's the format of the tarballs on
+# sources.buildroot.org and used in the *.hash files
+echo "Creating final archive."
+tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
+    --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
+gzip -6 -n <new.tar >new.tar.gz
+mv "${1}" "${1}".old
+mv new.tar.gz "${1}"
+rm "${1}".old
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3f613bb622..5e52b3e60f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -98,7 +98,7 @@ main() {
             case "${b}" in
                 urlencode) urlencode="${b}" ;;
                 git|svn|cvs|bzr|file|scp|hg) backend="${b}" ;;
-                # insert here supported second backends) backend2="${b}" ;;
+                cargo) backend2="${b}" ;;
             esac
         done
         uri=${uri#*+}
-- 
2.17.1
