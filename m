From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:12:06 +0200
Subject: [Buildroot] [Patch v7 10/10] cargo: new package
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081206.7774-11-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides Cargo, the Rust official package manager.
Cargo is written in Rust and uses Cargo as its build system. It also
depends on other Rust packages.

Normally, a previously installed version of Cargo would be used to:

 1. Fetch the dependencies.
 2. Build the new version of Cargo, using the available Rust compiler.

But the fetching step prevents offline builds. So instead two features
of Cargo are levelled: vendoring [1] and local registry.

First, a tarball of the build dependencies generated using `cargo
vendor` is fetched along with Cargo source code.

Then, the build process is as follows:

 1. The tarball of the build dependencies is uncompressed in a local
    registry.
 2. A snapshot of Cargo, provided by cargo-bootstrap, builds the final
    version of Cargo.
 3. A configuration file telling Cargo how to cross-compile programs for
    the target is generated and installed.

Currently, only the host variant is provided.

[1] https://github.com/alexcrichton/cargo-vendor

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                   |   1 +
 package/Config.in.host       |   1 +
 package/cargo/Config.in.host |   8 ++++
 package/cargo/cargo.hash     |   4 ++
 package/cargo/cargo.in       |   2 +
 package/cargo/cargo.mk       | 112 +++++++++++++++++++++++++++++++++++++++++++
 package/cargo/config.in      |   2 +
 7 files changed, 130 insertions(+)
 create mode 100644 package/cargo/Config.in.host
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.in
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 008a569..2463a31 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -488,6 +488,7 @@ F:	package/xxhash/
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	package/adwaita-icon-theme/
 F:	package/cargo-bootstrap/
+F:	package/cargo/
 F:	package/darkhttpd/
 F:	package/eudev/
 F:	package/execline/
diff --git a/package/Config.in.host b/package/Config.in.host
index ab24081..cd7ed65 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
new file mode 100644
index 0000000..0f1ca30
--- /dev/null
+++ b/package/cargo/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CARGO
+	bool "host cargo"
+	depends on BR2_PACKAGE_HAS_HOST_RUSTC
+	help
+	  Cargo is the package manager for the Rust programming
+	  language.
+
+	  https://crates.io/
diff --git a/package/cargo/cargo.hash b/package/cargo/cargo.hash
new file mode 100644
index 0000000..83648d7
--- /dev/null
+++ b/package/cargo/cargo.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256 f0e21d23cffd3510ba8a65e6a4d1010073afc0e573d9d92c23d22b868ca0bc42  cargo-0.20.0.tar.gz
+sha512 0e44ff3fd9c74c595220ea9a53867457cafa797302d0591ddf5f8f02ad021273d012413b45398799700eea9ae471804412fde4525406c5eb5b6f4b69e93594ed  cargo-0.20.0-vendor.tar.xz
+sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
diff --git a/package/cargo/cargo.in b/package/cargo/cargo.in
new file mode 100644
index 0000000..be26abf
--- /dev/null
+++ b/package/cargo/cargo.in
@@ -0,0 +1,2 @@
+#!/bin/sh
+LD_LIBRARY_PATH=@HOST_DIR@/lib exec $(dirname $0)/cargo.real "$@"
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
new file mode 100644
index 0000000..270a766
--- /dev/null
+++ b/package/cargo/cargo.mk
@@ -0,0 +1,112 @@
+################################################################################
+#
+# cargo
+#
+################################################################################
+
+CARGO_VERSION = 0.20.0
+CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
+CARGO_LICENSE = Apache-2.0 or MIT
+CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+CARGO_DEPS_SITE = http://pkgs.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)
+CARGO_DEPS_SHA512 = 0e44ff3fd9c74c595220ea9a53867457cafa797302d0591ddf5f8f02ad021273d012413b45398799700eea9ae471804412fde4525406c5eb5b6f4b69e93594ed
+CARGO_DEPS_SOURCE = cargo-$(CARGO_VERSION)-vendor.tar.xz
+
+CARGO_INSTALLER_VERSION = 4f994850808a572e2cc8d43f968893c8e942e9bf
+CARGO_INSTALLER_SITE = https://github.com/rust-lang/rust-installer/archive/$(CARGO_INSTALLER_VERSION)
+CARGO_INSTALLER_SOURCE = rust-installer-$(CARGO_INSTALLER_VERSION).tar.gz
+
+HOST_CARGO_EXTRA_DOWNLOADS = \
+	$(CARGO_DEPS_SITE)/$(CARGO_DEPS_SOURCE) \
+	$(CARGO_INSTALLER_SITE)/$(CARGO_INSTALLER_SOURCE)
+
+HOST_CARGO_DEPENDENCIES = \
+	host-cmake \
+	host-pkgconf \
+	host-openssl \
+	host-libhttpparser \
+	host-libssh2 \
+	host-libcurl \
+	host-rustc \
+	host-cargo-bootstrap
+
+HOST_CARGO_SNAP_BIN = $(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo
+HOST_CARGO_HOME = $(HOST_DIR)/share/cargo
+
+define HOST_CARGO_EXTRACT_DEPS
+	@mkdir -p $(@D)/vendor
+	$(call suitable-extractor,$(CARGO_DEPS_SOURCE)) \
+		$(DL_DIR)/$(CARGO_DEPS_SOURCE) | \
+		$(TAR) --strip-components=1 -C $(@D)/vendor $(TAR_OPTIONS) -
+endef
+
+HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_DEPS
+
+define HOST_CARGO_EXTRACT_INSTALLER
+	@mkdir -p $(@D)/src/rust-installer
+	$(call suitable-extractor,$(CARGO_INSTALLER_SOURCE)) \
+		$(DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
+		$(TAR) --strip-components=1 -C $(@D)/src/rust-installer $(TAR_OPTIONS) -
+endef
+
+HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_INSTALLER
+
+define HOST_CARGO_SETUP_DEPS
+	mkdir -p $(@D)/.cargo
+	(cd $(@D)/.cargo; \
+		echo "[source.crates-io]" > config; \
+		echo "registry = 'https://github.com/rust-lang/crates.io-index'" >> config; \
+		echo "replace-with = 'vendored-sources'" >> config; \
+		echo >> config; \
+		echo "[source.vendored-sources]" >> config; \
+		echo "directory = '$(@D)/vendor'" >> config; \
+	)
+endef
+
+HOST_CARGO_PRE_CONFIGURE_HOOKS += HOST_CARGO_SETUP_DEPS
+
+HOST_CARGO_SNAP_OPTS = --release
+HOST_CARGO_SNAP_OPTS += $(if $(VERBOSE),--verbose)
+
+HOST_CARGO_ENV = \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
+	CARGO_HOME=$(HOST_DIR)/share/cargo
+
+define HOST_CARGO_BUILD_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(HOST_CARGO_SNAP_BIN) \
+		build $(HOST_CARGO_SNAP_OPTS))
+endef
+
+define HOST_CARGO_INSTALL_CMDS
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/bin
+	$(INSTALL) -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
+endef
+
+define HOST_CARGO_INSTALL_CONF_FILE
+	$(INSTALL) -D package/cargo/config.in \
+		$(HOST_DIR)/share/cargo/config
+	$(SED) 's/@RUST_TARGET_NAME@/$(RUST_TARGET_NAME)/' \
+		$(HOST_DIR)/share/cargo/config
+	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
+		$(HOST_DIR)/share/cargo/config
+endef
+
+HOST_CARGO_POST_INSTALL_HOOKS += HOST_CARGO_INSTALL_CONF_FILE
+
+# No *RPATH tag is set in the Cargo binary, so provide a wrapper to find the
+# shared libraries
+define HOST_CARGO_INSTALL_WRAPPER
+	mv $(HOST_DIR)/bin/cargo $(HOST_DIR)/bin/cargo.real
+	$(INSTALL) -m 0755 package/cargo/cargo.in \
+		$(HOST_DIR)/bin/cargo
+	$(SED) 's;@HOST_DIR@;$(HOST_DIR);g' $(HOST_DIR)/bin/cargo
+endef
+
+HOST_CARGO_POST_INSTALL_HOOKS += HOST_CARGO_INSTALL_WRAPPER
+
+$(eval $(host-generic-package))
diff --git a/package/cargo/config.in b/package/cargo/config.in
new file mode 100644
index 0000000..cc048c7
--- /dev/null
+++ b/package/cargo/config.in
@@ -0,0 +1,2 @@
+[target. at RUST_TARGET_NAME@]
+linker = "@CROSS_PREFIX at gcc"
-- 
2.9.4
