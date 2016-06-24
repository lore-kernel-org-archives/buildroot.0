From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Jun 2016 00:27:10 +0200
Subject: [Buildroot] [PATCH 4/4] cargo: new package
In-Reply-To: <1466807230-9052-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466807230-9052-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1466807230-9052-5-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides Cargo, the Rust official package manager.

Currently, only the host variant is provided.

The build process is as follows:

 1. a snapshot of Cargo, provided by cargo-bootstrap, fetches the build
    dependencies.
 2. the snapshot builds the final version of Cargo.
 3. a configuration file telling Cargo how to cross-compile programs for
    the target is generated and installed.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo/0001-Allow-use-of-wget.patch |  56 +++++++++++++++
 package/cargo/cargo.hash                   |   2 +
 package/cargo/cargo.in                     |   2 +
 package/cargo/cargo.mk                     | 106 +++++++++++++++++++++++++++++
 package/cargo/config.in                    |   2 +
 5 files changed, 168 insertions(+)
 create mode 100644 package/cargo/0001-Allow-use-of-wget.patch
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.in
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in

diff --git a/package/cargo/0001-Allow-use-of-wget.patch b/package/cargo/0001-Allow-use-of-wget.patch
new file mode 100644
index 0000000..46dbfaf
--- /dev/null
+++ b/package/cargo/0001-Allow-use-of-wget.patch
@@ -0,0 +1,56 @@
+From a0320a052bd9ab8a0f874b6a518a60c9f1a5a6df Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sat, 25 Jun 2016 00:11:39 +0200
+Subject: [PATCH] Allow use of wget
+
+Update Python helper to use either wget or curl.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ configure           | 3 ---
+ src/etc/download.py | 8 +++++++-
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index d8dc591..2ff6250 100755
+--- a/configure
++++ b/configure
+@@ -262,9 +262,6 @@ need_cmd date
+ need_cmd tr
+ need_cmd sed
+ need_cmd cmake
+-if [ "${OS}" != "Windows_NT" ]; then
+-    need_cmd curl
+-fi
+ 
+ CFG_SRC_DIR="$(cd $(dirname $0) && pwd)/"
+ CFG_BUILD_DIR="$(pwd)/"
+diff --git a/src/etc/download.py b/src/etc/download.py
+index d61e9fa..b678d69 100644
+--- a/src/etc/download.py
++++ b/src/etc/download.py
+@@ -4,6 +4,7 @@ import shutil
+ import subprocess
+ import sys
+ import tarfile
++import distutils.spawn
+ 
+ 
+ def get(url, path, quiet=False):
+@@ -13,7 +14,12 @@ def get(url, path, quiet=False):
+              "(New-Object System.Net.WebClient).DownloadFile('" + url +
+              "', '" + path + "')"], quiet=quiet)
+     else:
+-        run(["curl", "-o", path, url], quiet=quiet)
++        if distutils.spawn.find_executable("curl"):
++            run(["curl", "-o", path, url], quiet=quiet)
++        elif distutils.spawn.find_executable("wget"):
++                run(["wget", "-O", path, url], quiet=quiet)
++        else:
++            raise Exception("can not find program to fetch url")
+ 
+ 
+ def unpack(tarball, dst, quiet=False, strip=0):
+-- 
+2.4.11
+
diff --git a/package/cargo/cargo.hash b/package/cargo/cargo.hash
new file mode 100644
index 0000000..50cacf4
--- /dev/null
+++ b/package/cargo/cargo.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 1e73c038681fe308195427b71322a6350c65d3b8cbea199e45c7b672b4754e0e cargo-0.10.0.tar.gz
diff --git a/package/cargo/cargo.in b/package/cargo/cargo.in
new file mode 100644
index 0000000..7c5064f
--- /dev/null
+++ b/package/cargo/cargo.in
@@ -0,0 +1,2 @@
+#!/bin/sh
+LD_LIBRARY_PATH=@HOST_DIR@/usr/lib RUST_TARGET_PATH=@HOST_DIR@/etc/rustc exec $(dirname $0)/cargo.real "$@"
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
new file mode 100644
index 0000000..9cc68f0
--- /dev/null
+++ b/package/cargo/cargo.mk
@@ -0,0 +1,106 @@
+################################################################################
+#
+# cargo
+#
+################################################################################
+
+CARGO_VERSION = 0.10.0
+CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
+CARGO_LICENSE = Apache-2.0, MIT
+CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_CARGO_DEPENDENCIES = \
+	host-cmake \
+	host-pkgconf \
+	host-openssl \
+	host-libhttpparser \
+	host-libssh2 \
+	host-rust \
+	host-cargo-bootstrap
+
+HOST_CARGO_SNAP_BIN = $(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo
+HOST_CARGO_SNAP_ENV = \
+	$(HOST_MAKE_ENV) \
+	CARGO_HOME=$(HOST_DIR)/usr/share/cargo
+
+# Use the cargo snapshot to fetch the dependencies after the extraction.
+# This operation requires an Internet connection to be available!
+# It can not be done in a post-download hook where only the Cargo.toml file
+# would be extracted and used, as there are multiple manifests in the source
+# tarball. So the whole source code should be extracted twice.
+define HOST_CARGO_DOWNLOAD_DEPS
+	$(INSTALL) -d $(HOST_DIR)/usr/share/cargo
+	$(HOST_CARGO_SNAP_ENV) $(HOST_CARGO_SNAP_BIN) fetch \
+		   --manifest-path $(HOST_CARGO_DIR)/Cargo.toml
+endef
+
+HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_DOWNLOAD_DEPS
+
+# rust-installer is a git submodule of Cargo, hosted at
+# https://github.com/rust-lang/rust-installer. But is also available in
+# host-rust source tree. Reuse it to avoid adding an unneeded package.
+define HOST_CARGO_HIGHJACK_RUST_INSTALLER
+	rm -rf $(HOST_CARGO_DIR)/src/rust-installer
+	ln -sf $(HOST_RUST_DIR)/src/rust-installer \
+		$(HOST_CARGO_DIR)/src/
+endef
+
+HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_HIGHJACK_RUST_INSTALLER
+
+HOST_CARGO_MAKE_OPTS = $(if $(VERBOSE),VERBOSE=1)
+
+HOST_CARGO_ENV = \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
+	RUST_TARGET_PATH=$(HOST_DIR)/etc/rustc \
+	CARGO_HOME=$(HOST_DIR)/usr/share/cargo
+
+define HOST_CARGO_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CARGO_ENV)                    \
+		$(HOST_CONFIGURE_OPTS)                  \
+		./configure                             \
+		--prefix="$(HOST_DIR)/usr"              \
+		--local-cargo="$(HOST_CARGO_SNAP_BIN)"  \
+		--local-rust-root="$(HOST_DIR)/usr"     \
+		--sysconfdir="$(HOST_DIR)/etc"          \
+		--localstatedir="$(HOST_DIR)/var/lib"   \
+		--datadir="$(HOST_DIR)/usr/share"       \
+		--infodir="$(HOST_DIR)/usr/share/info")
+endef
+
+define HOST_CARGO_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(MAKE) \
+		$(HOST_CARGO_MAKE_OPTS) -C $(@D)
+endef
+
+define HOST_CARGO_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(MAKE) \
+		$(HOST_CARGO_MAKE_OPTS) -C $(@D) install
+endef
+
+define HOST_CARGO_INSTALL_CONF_FILE
+	$(INSTALL) -D package/cargo/config.in \
+		$(HOST_DIR)/usr/share/cargo/config
+	$(SED) 's/@GNU_TARGET_NAME@/$(GNU_TARGET_NAME)/' \
+		$(HOST_DIR)/usr/share/cargo/config
+	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
+		$(HOST_DIR)/usr/share/cargo/config
+endef
+
+HOST_CARGO_POST_INSTALL_HOOKS += HOST_CARGO_INSTALL_CONF_FILE
+
+# No *RPATH tag is set in the Cargo binary, so provide a wrapper to find the
+# shared libraries
+define HOST_CARGO_INSTALL_WRAPPER
+	mv $(HOST_DIR)/usr/bin/cargo $(HOST_DIR)/usr/bin/cargo.real
+	$(INSTALL) -m 0755 package/cargo/cargo.in \
+		$(HOST_DIR)/usr/bin/cargo
+	$(SED) 's;@HOST_DIR@;$(HOST_DIR);g' $(HOST_DIR)/usr/bin/cargo
+endef
+
+HOST_CARGO_POST_INSTALL_HOOKS += HOST_CARGO_INSTALL_WRAPPER
+
+$(eval $(host-generic-package))
diff --git a/package/cargo/config.in b/package/cargo/config.in
new file mode 100644
index 0000000..1c601e1
--- /dev/null
+++ b/package/cargo/config.in
@@ -0,0 +1,2 @@
+[target. at GNU_TARGET_NAME@]
+linker = "@CROSS_PREFIX at gcc"
-- 
2.4.11
