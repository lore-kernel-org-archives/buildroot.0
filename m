From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 13 Feb 2018 08:21:27 +0100
Subject: [Buildroot] [PATCH v2 1/2] rustc: use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180213072128.4669-1-eric.le.bihan.dev@free.fr>
References: <20180213072128.4669-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180213072128.4669-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

utils/check-package complains as follows:

  package/rustc/rustc.mk:10: possible typo: RUST_TARGET_NAME -> *RUSTC*
  package/rustc/rustc.mk:18: possible typo: RUST_HOST_NAME -> *RUSTC*

As RUST_{HOST,TARGET}_NAME are related to the Rust compiler, it
sounds sensible to rename them to RUSTC_{HOST,TARGET}_NAME.

So update all rust related packages to use the new variables.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-cargo.txt |  4 ++--
 package/cargo-bin/cargo-bin.mk        |  2 +-
 package/cargo/cargo.mk                |  2 +-
 package/cargo/config.in               |  2 +-
 package/rust-bin/rust-bin.mk          | 14 +++++++-------
 package/rust/rust.mk                  |  4 ++--
 package/rustc/rustc.mk                |  4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 3f9ddfed16..b78163e6a1 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -49,11 +49,11 @@ package. Let's start with an example:
 15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
 17:
-18: FOO_BIN_DIR = target/$(RUST_TARGET_NAME)/$(FOO_CARGO_MODE)
+18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
 19:
 20: FOO_CARGO_OPTS = \
 21:   --$(FOO_CARGO_MODE) \
-22: 	--target=$(RUST_TARGET_NAME) \
+22: 	--target=$(RUSTC_TARGET_NAME) \
 23: 	--manifest-path=$(@D)/Cargo.toml
 24:
 25: define FOO_BUILD_CMDS
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 0f235748ff..3c834d9033 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -6,7 +6,7 @@
 
 CARGO_BIN_VERSION = 0.24.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
-CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
 CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 5625127fcd..3fd088d727 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -82,7 +82,7 @@ define HOST_CARGO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
 	$(INSTALL) -D package/cargo/config.in \
 		$(HOST_DIR)/share/cargo/config
-	$(SED) 's/@RUST_TARGET_NAME@/$(RUST_TARGET_NAME)/' \
+	$(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
 		$(HOST_DIR)/share/cargo/config
 	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
 		$(HOST_DIR)/share/cargo/config
diff --git a/package/cargo/config.in b/package/cargo/config.in
index cc048c71c4..47fad026be 100644
--- a/package/cargo/config.in
+++ b/package/cargo/config.in
@@ -1,2 +1,2 @@
-[target. at RUST_TARGET_NAME@]
+[target. at RUSTC_TARGET_NAME@]
 linker = "@CROSS_PREFIX at gcc"
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 5ace7bf08f..cd5844b115 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -11,13 +11,13 @@ RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
 HOST_RUST_BIN_PROVIDES = host-rustc
 
-HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
 HOST_RUST_BIN_EXTRA_DOWNLOADS = \
-	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz \
-	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.xz
+	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz \
+	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
 
-HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
+HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME)/rust-std-$(RUSTC_HOST_NAME)
 
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
@@ -26,7 +26,7 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
 	cd $(@D)/rustc/lib/rustlib; \
-		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME)
+		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)
 endef
 
 HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
@@ -42,12 +42,12 @@ define HOST_RUST_BIN_INSTALL_RUSTC
 endef
 
 define HOST_RUST_BIN_INSTALL_LIBSTD_HOST
-	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME); \
+	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME); \
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
 endef
 
 define HOST_RUST_BIN_INSTALL_LIBSTD_TARGET
-	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME); \
+	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME); \
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
 endef
 endif
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6d6ac4370a..ff2634b996 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -48,7 +48,7 @@ HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
 define HOST_RUST_CONFIGURE_CMDS
 	( \
 		echo '[build]'; \
-		echo 'target = ["$(RUST_TARGET_NAME)"]'; \
+		echo 'target = ["$(RUSTC_TARGET_NAME)"]'; \
 		echo 'cargo = "$(HOST_CARGO_BIN_DIR)/cargo/bin/cargo"'; \
 		echo 'rustc = "$(HOST_RUST_BIN_DIR)/rustc/bin/rustc"'; \
 		echo 'python = "$(HOST_DIR)/bin/python2"'; \
@@ -61,7 +61,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'prefix = "$(HOST_DIR)"'; \
 		echo '[rust]'; \
 		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
-		echo '[target.$(RUST_TARGET_NAME)]'; \
+		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo $(HOST_RUST_JEMALLOC_CONF); \
 	) > $(@D)/config.toml
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 7a951c0cfd..bed74f3c2c 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -7,7 +7,7 @@
 RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
 RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
 
-RUST_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
 
 ifeq ($(HOSTARCH),x86)
 RUSTC_HOST_ARCH = i686
@@ -15,6 +15,6 @@ else
 RUSTC_HOST_ARCH = $(HOSTARCH)
 endif
 
-RUST_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
+RUSTC_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
 
 $(eval $(host-virtual-package))
-- 
2.14.3
