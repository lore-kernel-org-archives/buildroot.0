From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:16:51 +0200
Subject: [Buildroot] [PATCH 1/6] package/cargo: convert to virtual package
In-Reply-To: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171656.30187-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo/Config.in.host | 11 ++++-
 package/cargo/cargo.mk       | 79 +-----------------------------------
 2 files changed, 11 insertions(+), 79 deletions(-)

diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
index c33c6851f2..82652fa980 100644
--- a/package/cargo/Config.in.host
+++ b/package/cargo/Config.in.host
@@ -1,9 +1,16 @@
 config BR2_PACKAGE_HOST_CARGO
 	bool "host cargo"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
-	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  Cargo is the package manager for the Rust programming
-	  language.
+	  language
 
 	  https://crates.io/
+
+config BR2_PACKAGE_HAS_HOST_CARGO
+	bool
+
+config BR2_PACKAGE_PROVIDES_HOST_CARGO
+	string
+	depends on BR2_PACKAGE_HAS_HOST_CARGO
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index a387281b4c..54dc86d811 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -4,82 +4,7 @@
 #
 ################################################################################
 
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
+define HOST_CARGO_INSTALL_CONFIG
 	$(INSTALL) -D package/cargo/config.in \
 		$(HOST_DIR)/share/cargo/config
 	$(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
@@ -88,4 +13,4 @@ define HOST_CARGO_INSTALL_CMDS
 		$(HOST_DIR)/share/cargo/config
 endef
 
-$(eval $(host-generic-package))
+$(eval $(host-virtual-package))
-- 
2.21.0
