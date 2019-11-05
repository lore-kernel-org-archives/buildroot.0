From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:58 +0100
Subject: [Buildroot] [RFC PATCH 6/7] package/cargo: drop package
In-Reply-To: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
References: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191105211259.27673-7-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As no package depends on the standalone cargo package, it can be
dropped.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host       |  1 -
 package/cargo/Config.in.host |  9 ----
 package/cargo/cargo.hash     |  8 ----
 package/cargo/cargo.mk       | 91 ------------------------------------
 package/cargo/config.in      |  2 -
 5 files changed, 111 deletions(-)
 delete mode 100644 package/cargo/Config.in.host
 delete mode 100644 package/cargo/cargo.hash
 delete mode 100644 package/cargo/cargo.mk
 delete mode 100644 package/cargo/config.in

diff --git a/package/Config.in.host b/package/Config.in.host
index c0ac4fbbcc..3d2d8a1c04 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -3,7 +3,6 @@ menu "Host utilities"
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
-	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
deleted file mode 100644
index c33c6851f2..0000000000
--- a/package/cargo/Config.in.host
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_HOST_CARGO
-	bool "host cargo"
-	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
-	select BR2_PACKAGE_HOST_RUSTC
-	help
-	  Cargo is the package manager for the Rust programming
-	  language.
-
-	  https://crates.io/
diff --git a/package/cargo/cargo.hash b/package/cargo/cargo.hash
deleted file mode 100644
index baa2cfbc33..0000000000
--- a/package/cargo/cargo.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# Locally generated
-sha256 1a4bae6910ca895157a1abe8225eb2b7e9b49ee1ee1e4e72fb81cb8e1446bff9  cargo-0.26.0.tar.gz
-sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
-sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
-sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
-sha256 8bd89f9222dc80292f4107347103b693ac66f3a083371f0629ccf42338abe880  LICENSE-THIRD-PARTY
-# From https://src.fedoraproject.org/repo/pkgs/cargo/cargo-0.26.0-vendor.tar.xz/sha512
-sha512 6ed2a1644c9b18fc24ddad5350d41b6c36cd5b62de4cf0b748a57b589f4f0ac12f91461989158d58d0892bf6fc2c1626cf574e7e2b9da4b0e35f72dfd88f9048  cargo-0.26.0-vendor.tar.xz
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
deleted file mode 100644
index a387281b4c..0000000000
--- a/package/cargo/cargo.mk
+++ /dev/null
@@ -1,91 +0,0 @@
-################################################################################
-#
-# cargo
-#
-################################################################################
-
-CARGO_VERSION = 0.26.0
-CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
-CARGO_LICENSE = Apache-2.0 or MIT
-CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-
-CARGO_DEPS_SHA512 = 6ed2a1644c9b18fc24ddad5350d41b6c36cd5b62de4cf0b748a57b589f4f0ac12f91461989158d58d0892bf6fc2c1626cf574e7e2b9da4b0e35f72dfd88f9048
-CARGO_DEPS_SITE = https://src.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)
-CARGO_DEPS_SOURCE = cargo-$(CARGO_VERSION)-vendor.tar.xz
-
-CARGO_INSTALLER_VERSION = 4f994850808a572e2cc8d43f968893c8e942e9bf
-CARGO_INSTALLER_SITE = $(call github,rust-lang,rust-installer,$(CARGO_INSTALLER_VERSION))
-CARGO_INSTALLER_SOURCE = rust-installer-$(CARGO_INSTALLER_VERSION).tar.gz
-
-HOST_CARGO_EXTRA_DOWNLOADS = \
-	$(CARGO_DEPS_SITE)/$(CARGO_DEPS_SOURCE) \
-	$(CARGO_INSTALLER_SITE)/$(CARGO_INSTALLER_SOURCE)
-
-HOST_CARGO_DEPENDENCIES = \
-	$(BR2_CMAKE_HOST_DEPENDENCY) \
-	host-pkgconf \
-	host-openssl \
-	host-libhttpparser \
-	host-libssh2 \
-	host-libcurl \
-	host-rustc \
-	host-cargo-bin
-
-HOST_CARGO_SNAP_BIN = $(HOST_CARGO_BIN_DIR)/cargo/bin/cargo
-HOST_CARGO_HOME = $(HOST_DIR)/share/cargo
-
-define HOST_CARGO_EXTRACT_DEPS
-	@mkdir -p $(@D)/vendor
-	$(call suitable-extractor,$(CARGO_DEPS_SOURCE)) \
-		$(HOST_CARGO_DL_DIR)/$(CARGO_DEPS_SOURCE) | \
-		$(TAR) --strip-components=1 -C $(@D)/vendor $(TAR_OPTIONS) -
-endef
-
-HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_DEPS
-
-define HOST_CARGO_EXTRACT_INSTALLER
-	@mkdir -p $(@D)/src/rust-installer
-	$(call suitable-extractor,$(CARGO_INSTALLER_SOURCE)) \
-		$(HOST_CARGO_DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
-		$(TAR) --strip-components=1 -C $(@D)/src/rust-installer $(TAR_OPTIONS) -
-endef
-
-HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_INSTALLER
-
-define HOST_CARGO_SETUP_DEPS
-	mkdir -p $(@D)/.cargo
-	( \
-		echo "[source.crates-io]"; \
-		echo "registry = 'https://github.com/rust-lang/crates.io-index'"; \
-		echo "replace-with = 'vendored-sources'"; \
-		echo "[source.vendored-sources]"; \
-		echo "directory = '$(@D)/vendor'"; \
-	) > $(@D)/.cargo/config
-endef
-
-HOST_CARGO_PRE_CONFIGURE_HOOKS += HOST_CARGO_SETUP_DEPS
-
-HOST_CARGO_SNAP_OPTS = \
-	--release \
-	$(if $(VERBOSE),--verbose)
-
-HOST_CARGO_ENV = \
-	RUSTFLAGS="$(addprefix -Clink-arg=,$(HOST_LDFLAGS))" \
-	CARGO_HOME=$(HOST_CARGO_HOME)
-
-define HOST_CARGO_BUILD_CMDS
-	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_CARGO_ENV) $(HOST_CARGO_SNAP_BIN) \
-		build $(HOST_CARGO_SNAP_OPTS))
-endef
-
-define HOST_CARGO_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
-	$(INSTALL) -D package/cargo/config.in \
-		$(HOST_DIR)/share/cargo/config
-	$(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
-		$(HOST_DIR)/share/cargo/config
-	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
-		$(HOST_DIR)/share/cargo/config
-endef
-
-$(eval $(host-generic-package))
diff --git a/package/cargo/config.in b/package/cargo/config.in
deleted file mode 100644
index 47fad026be..0000000000
--- a/package/cargo/config.in
+++ /dev/null
@@ -1,2 +0,0 @@
-[target. at RUSTC_TARGET_NAME@]
-linker = "@CROSS_PREFIX at gcc"
-- 
2.21.0
