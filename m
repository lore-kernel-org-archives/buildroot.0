From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:16:52 +0200
Subject: [Buildroot] [PATCH 2/6] package/cargo-bin: declare as cargo provider
In-Reply-To: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171656.30187-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If cargo-bin is explicitly selected, then install binary in $(HOST_DIR)
and declare package as cargo provider.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo-bin/cargo-bin.mk |  8 ++++++++
 package/cargo/Config.in.host   | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 3614f7a53d..809bb64cae 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -9,5 +9,13 @@ CARGO_BIN_SITE = https://static.rust-lang.org/dist
 CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
 CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+CARGO_BIN_PROVIDES = host-cargo
+
+ifeq ($(BR2_PACKAGE_HOST_CARGO_BIN),y)
+define HOST_CARGO_BIN_INSTALL_CMDS
+	$(@D)/install.sh --prefix=$(HOST_DIR) --disable-ldconfig
+endef
+HOST_CARGO_BIN_POST_INSTALL_HOOKS += HOST_CARGO_INSTALL_CONFIG
+endif
 
 $(eval $(host-generic-package))
diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
index 82652fa980..bae30d2f57 100644
--- a/package/cargo/Config.in.host
+++ b/package/cargo/Config.in.host
@@ -7,10 +7,29 @@ config BR2_PACKAGE_HOST_CARGO
 
 	  https://crates.io/
 
+if BR2_PACKAGE_HOST_CARGO
+
+choice
+	prompt "Cargo provider"
+	help
+	  Select a Cargo package manager provider
+
+config BR2_PACKAGE_HOST_CARGO_BIN
+	bool "host cargo (pre-built)"
+	depends on BR2_PACKAGE_HOST_RUST_BIN
+	select BR2_PACKAGE_HAS_HOST_CARGO
+	help
+	  This package will install a pre-built version of Cargo.
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_HAS_HOST_CARGO
 	bool
 
 config BR2_PACKAGE_PROVIDES_HOST_CARGO
 	string
 	depends on BR2_PACKAGE_HAS_HOST_CARGO
+	default "host-cargo-bin" if !BR2_PACKAGE_HOST_RUST
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
-- 
2.21.0
