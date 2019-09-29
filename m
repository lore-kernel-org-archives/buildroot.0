From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:16:53 +0200
Subject: [Buildroot] [PATCH 3/6] package/rust: declare as cargo provider
In-Reply-To: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171656.30187-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable build of cargo along with Rust compiler and declare this package
as a cargo provider.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo/Config.in.host |  8 ++++++++
 package/rust/rust.mk         | 23 ++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
index bae30d2f57..d1bb913573 100644
--- a/package/cargo/Config.in.host
+++ b/package/cargo/Config.in.host
@@ -14,6 +14,13 @@ choice
 	help
 	  Select a Cargo package manager provider
 
+config BR2_PACKAGE_HOST_RUST_CARGO
+	bool "host rust"
+	depends on BR2_PACKAGE_HOST_RUST
+	select BR2_PACKAGE_HAS_HOST_CARGO
+	help
+	  Install Cargo built at the same time as the Rust compiler.
+
 config BR2_PACKAGE_HOST_CARGO_BIN
 	bool "host cargo (pre-built)"
 	depends on BR2_PACKAGE_HOST_RUST_BIN
@@ -32,4 +39,5 @@ config BR2_PACKAGE_PROVIDES_HOST_CARGO
 	string
 	depends on BR2_PACKAGE_HAS_HOST_CARGO
 	default "host-cargo-bin" if !BR2_PACKAGE_HOST_RUST
+	default "host-rust" if BR2_PACKAGE_HOST_RUST
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 5d14fc6682..ff23cd8930 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -10,7 +10,7 @@ RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
 RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
-HOST_RUST_PROVIDES = host-rustc
+HOST_RUST_PROVIDES = host-rustc host-cargo
 
 HOST_RUST_DEPENDENCIES = \
 	toolchain \
@@ -38,6 +38,25 @@ endef
 
 HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
 
+ifeq ($(BR2_PACKAGE_HOST_RUST_CARGO),y)
+
+define HOST_RUST_ENABLE_CARGO
+	echo 'extended = true'; \
+	echo 'tools = ["cargo"]';
+endef
+
+define HOST_RUST_INSTALL_CARGO
+	find $(@D)/build/tmp/dist -maxdepth 2 -wholename '*cargo*/install.sh' \
+		-exec {} --prefix=$(HOST_DIR) --disable-ldconfig \;
+
+endef
+
+HOST_RUST_POST_INSTALL_HOOKS += \
+	HOST_RUST_INSTALL_CARGO \
+	HOST_CARGO_INSTALL_CONFIG
+
+endif
+
 define HOST_RUST_CONFIGURE_CMDS
 	( \
 		echo '[build]'; \
@@ -47,11 +66,13 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'python = "$(HOST_DIR)/bin/python2"'; \
 		echo 'submodules = false'; \
 		echo 'vendor = true'; \
+		$(HOST_RUST_ENABLE_CARGO) \
 		echo 'compiler-docs = false'; \
 		echo 'docs = false'; \
 		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
 		echo '[install]'; \
 		echo 'prefix = "$(HOST_DIR)"'; \
+		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
-- 
2.21.0
