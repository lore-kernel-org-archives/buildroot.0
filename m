From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  4 Feb 2018 19:07:47 +0100
Subject: [Buildroot] [PATCH v10 08/10] cargo: new package
In-Reply-To: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180204180749.29942-9-eric.le.bihan.dev@free.fr>
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
of Cargo are leveraged: vendoring [1] and local registry.

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
 package/cargo/cargo.hash     |  8 ++++
 package/cargo/cargo.mk       | 91 ++++++++++++++++++++++++++++++++++++++++++++
 package/cargo/config.in      |  2 +
 6 files changed, 111 insertions(+)
 create mode 100644 package/cargo/Config.in.host
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e041d6f40..c524cb6ac5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -542,6 +542,7 @@ N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
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
index 0000000000..f0990484d9
--- /dev/null
+++ b/package/cargo/cargo.hash
@@ -0,0 +1,8 @@
+# Locally generated
+sha256 a9d4291254a1d622d3c3cb942aaa56ab4059b8d04915c3af234f0362f14722e8  cargo-0.24.0.tar.gz
+sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
+sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256 8bd89f9222dc80292f4107347103b693ac66f3a083371f0629ccf42338abe880  LICENSE-THIRD-PARTY
+# From http://pkgs.fedoraproject.org/repo/pkgs/cargo/cargo-0.23.0-vendor.tar.xz/sha512
+sha512 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21  cargo-0.24.0-vendor.tar.xz
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
new file mode 100644
index 0000000000..dd060fed03
--- /dev/null
+++ b/package/cargo/cargo.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# cargo
+#
+################################################################################
+
+CARGO_VERSION = 0.24.0
+CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
+CARGO_LICENSE = Apache-2.0 or MIT
+CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+CARGO_DEPS_SHA512 = 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21
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
+	$(BR2_CMAKE_HOST_DEPENDENCY) \
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
+HOST_CARGO_SNAP_OPTS = \
+	--release \
+	$(if $(VERBOSE),--verbose)
+
+HOST_CARGO_ENV = \
+	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
+	CARGO_HOME=$(HOST_CARGO_HOME)
+
+define HOST_CARGO_BUILD_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(HOST_CARGO_SNAP_BIN) \
+		build $(HOST_CARGO_SNAP_OPTS))
+endef
+
+define HOST_CARGO_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
+	$(INSTALL) -D package/cargo/config.in \
+		$(HOST_DIR)/share/cargo/config
+	$(SED) 's/@RUST_TARGET_NAME@/$(RUST_TARGET_NAME)/' \
+		$(HOST_DIR)/share/cargo/config
+	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
+		$(HOST_DIR)/share/cargo/config
+endef
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
