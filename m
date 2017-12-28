From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 16:51:46 +0100
Subject: [Buildroot] [PATCH v9 8/8] cargo: new package
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228155146.18193-9-eric.le.bihan.dev@free.fr>
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
 2. A snapshot of Cargo, provided by cargo-bin, builds the final
    version of Cargo.
 3. A configuration file telling Cargo how to cross-compile programs for
    the target is generated and installed.

Currently, only the host variant is provided.

[1] https://github.com/alexcrichton/cargo-vendor

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/cargo/Config.in.host |  8 ++++
 package/cargo/cargo.hash     |  4 ++
 package/cargo/cargo.mk       | 96 ++++++++++++++++++++++++++++++++++++++++++++
 package/cargo/config.in      |  2 +
 6 files changed, 112 insertions(+)
 create mode 100644 package/cargo/Config.in.host
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c16ec9598..0902fd2fd4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -538,6 +538,7 @@ F:	package/xxhash/
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	package/adwaita-icon-theme/
 F:	package/cargo-bin/
+F:	package/cargo/
 F:	package/darkhttpd/
 F:	package/eudev/
 F:	package/execline/
diff --git a/package/Config.in.host b/package/Config.in.host
index 2f20dd0e48..199a8e9856 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cmake/Config.in.host"
diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
new file mode 100644
index 0000000000..0f1ca305c6
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
index 0000000000..2b2ae43f6b
--- /dev/null
+++ b/package/cargo/cargo.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256 f4bbe2a8719dbb8da20842235093f7f70f034d01633189e83f75897d68cd274f  cargo-0.23.0.tar.gz
+sha512 9060ec6e67b54f7fad7da8dd8450dd051d62b3f8ed4606196fc238a98beba1c3b43087c787f35d012d9b641c8572e70f50b95b0e01fdd75ed82932b6e6efbbf0  cargo-0.23.0-vendor.tar.xz
+sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
new file mode 100644
index 0000000000..3794f450c1
--- /dev/null
+++ b/package/cargo/cargo.mk
@@ -0,0 +1,96 @@
+################################################################################
+#
+# cargo
+#
+################################################################################
+
+CARGO_VERSION = 0.23.0
+CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
+CARGO_LICENSE = Apache-2.0 or MIT
+CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+CARGO_DEPS_SHA512 = 9060ec6e67b54f7fad7da8dd8450dd051d62b3f8ed4606196fc238a98beba1c3b43087c787f35d012d9b641c8572e70f50b95b0e01fdd75ed82932b6e6efbbf0
+CARGO_DEPS_SITE = http://pkgs.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)
+CARGO_DEPS_SOURCE = cargo-$(CARGO_VERSION)-vendor.tar.xz
+
+CARGO_INSTALLER_VERSION = 4f994850808a572e2cc8d43f968893c8e942e9bf
+CARGO_INSTALLER_SITE = $(call github,rust-lang,rust-installer,$(CARGO_INSTALLER_VERSION))
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
+	host-cargo-bin
+
+HOST_CARGO_SNAP_BIN = $(HOST_CARGO_BIN_DIR)/cargo/bin/cargo
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
+	( \
+		echo "[source.crates-io]"; \
+		echo "registry = 'https://github.com/rust-lang/crates.io-index'"; \
+		echo "replace-with = 'vendored-sources'"; \
+		echo "[source.vendored-sources]"; \
+		echo "directory = '$(@D)/vendor'"; \
+	) > $(@D)/.cargo/config
+endef
+
+HOST_CARGO_PRE_CONFIGURE_HOOKS += HOST_CARGO_SETUP_DEPS
+
+HOST_CARGO_SNAP_OPTS = --release
+HOST_CARGO_SNAP_OPTS += $(if $(VERBOSE),--verbose)
+
+HOST_CARGO_ENV = \
+	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
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
+$(eval $(host-generic-package))
diff --git a/package/cargo/config.in b/package/cargo/config.in
new file mode 100644
index 0000000000..cc048c71c4
--- /dev/null
+++ b/package/cargo/config.in
@@ -0,0 +1,2 @@
+[target. at RUST_TARGET_NAME@]
+linker = "@CROSS_PREFIX at gcc"
-- 
2.14.3
