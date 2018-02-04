From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  4 Feb 2018 19:07:41 +0100
Subject: [Buildroot] [PATCH v10 02/10] rust-bin: new package
In-Reply-To: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180204180749.29942-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides a pre-built version of rustc, the compiler for the
Rust programming language, fetched from the upstream project.

A pre-built version of the standard library for the host as well as one
for the chosen target are also fetched and installed.

Only the host variant is provided to allow the user to cross-compile
Rust programs and run them on the target.

This package could also be used to provide a bootstrap compiler when building
Rust from source. So, in order to add it as a build dependency, the compiler and
standard libraries are only installed in $(HOST_DIR) if the package is
explicitly selected.

The menuconfig entry for rustc is also updated to expose this provider.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                     |  1 +
 package/rust-bin/rust-bin.hash | 33 +++++++++++++++++++++++
 package/rust-bin/rust-bin.mk   | 61 ++++++++++++++++++++++++++++++++++++++++++
 package/rustc/Config.in.host   | 29 ++++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 package/rust-bin/rust-bin.hash
 create mode 100644 package/rust-bin/rust-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4f2c84758e..7e04f872ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -548,6 +548,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/meson/
 F:	package/ninja/
+F:	package/rust-bin/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
new file mode 100644
index 0000000000..5b34a6aa0c
--- /dev/null
+++ b/package/rust-bin/rust-bin.hash
@@ -0,0 +1,33 @@
+# From https://static.rust-lang.org/dist/rustc-1.23.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 243de2826b2d545b8428414a3f7e86ce5e86163ec927a374958052a047b55e69  rustc-1.23.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.23.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 d72674a683dcc8a07ad72d6ae08b96a7dfc72cf08433e2ae69c0f8a2b9c79c17  rustc-1.23.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 0d9c976c46a277ef860ce5766387ea8e40f84657e5f9962cba91be62a00ca345  rust-std-1.23.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 3d7ce58f6d2bbf6faf91049893e96611a172b0af02d98190e36a49e8b0f974ee  rust-std-1.23.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 0a2a43668c2ddc2516e85e1c097d2672acaf61541d2b70f40daba548b3ccbee1  rust-std-1.23.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 b2f7f4e2e31d86302e929d0435b6f40778c22fc9306f0850b0edc4738ff2634e  rust-std-1.23.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 f9659f844ccd2e25e9f01a49fb7adf0ce26cbbec7a4df7081dd2d0929a86b2d3  rust-std-1.23.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 8324d9c1eacba0de31fff29841d0f0567261489ee46a270e30be929095bfe19a  rust-std-1.23.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 521f70f3346ff8e28e33350fd5ad9bbba7dfc9038389f3965bcfa2f1d1a498a5  rust-std-1.23.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 d08f5792bd0d4f5d3d81a4ec1b3a2b36e7c389de2ecf2e777e390461ff015d08  rust-std-1.23.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 77291fff357b9e1764a4d7975bdbecdb37aeb0d37d85ccb68f7d785f4da1a056  rust-std-1.23.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 d1b862d32c4921058ff4ea5b7fead3b2954b5f0f036603b1c58a600e602d1f25  rust-std-1.23.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 e03bf7907914c88d2f19e719f07641b1b1ffbb65cf9daae8b028f4ab4619b4ff  rust-std-1.23.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 674f74245341119409e203109c22d432d0ed3312a6ff4d3b03cab251e61cc53a  rust-std-1.23.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.23.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 0d87225dd081c7ea5002fdeb21983d23bc52fa37d23c88d5c97b2c44660f8af9  rust-std-1.23.0-x86_64-unknown-linux-gnu.tar.xz
+# Locally generated
+sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
new file mode 100644
index 0000000000..255573e582
--- /dev/null
+++ b/package/rust-bin/rust-bin.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# rust-bin
+#
+################################################################################
+
+RUST_BIN_VERSION = 1.23.0
+RUST_BIN_SITE = https://static.rust-lang.org/dist
+RUST_BIN_LICENSE = Apache-2.0 or MIT
+RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_RUST_BIN_PROVIDES = host-rustc
+
+HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+
+HOST_RUST_BIN_EXTRA_DOWNLOADS = \
+	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz \
+	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.xz
+
+HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
+
+define HOST_RUST_BIN_LIBSTD_EXTRACT
+	mkdir -p $(@D)/std
+	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
+		$(call suitable-extractor,$(f)) $(DL_DIR)/$(f) | \
+			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
+        )
+	cd $(@D)/rustc/lib/rustlib; \
+		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME)
+endef
+
+HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
+
+HOST_RUST_BIN_INSTALL_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--disable-ldconfig
+
+ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)
+define HOST_RUST_BIN_INSTALL_RUSTC
+	(cd $(@D); \
+		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
+endef
+
+define HOST_RUST_BIN_INSTALL_LIBSTD_HOST
+	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME); \
+		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
+endef
+
+define HOST_RUST_BIN_INSTALL_LIBSTD_TARGET
+	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME); \
+		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
+endef
+endif
+
+define HOST_RUST_BIN_INSTALL_CMDS
+	$(HOST_RUST_BIN_INSTALL_RUSTC)
+	$(HOST_RUST_BIN_INSTALL_LIBSTD_HOST)
+	$(HOST_RUST_BIN_INSTALL_LIBSTD_TARGET)
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index a49f635d65..66c50c4579 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -24,8 +24,37 @@ config BR2_PACKAGE_HOST_RUSTC_ABI
 	default "eabihf" if BR2_ARM_EABIHF
 	default "abi64"  if BR2_MIPS_NABI64
 
+config BR2_PACKAGE_HOST_RUSTC
+	bool "host rustc"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	help
+	  Compiler for the Rust language
+
+	  http://www.rust-lang.org
+
+if BR2_PACKAGE_HOST_RUSTC
+
+choice
+	prompt "Rust compiler variant"
+	default BR2_PACKAGE_HOST_RUST_BIN
+	help
+	  Select a Rust compiler
+
+config BR2_PACKAGE_HOST_RUST_BIN
+	bool "host rust (pre-built)"
+	select BR2_PACKAGE_HAS_HOST_RUSTC
+	help
+	  This package will install pre-built versions of the compiler
+	  for the host and the Rust standard library for the target.
+
+endchoice
+
 config BR2_PACKAGE_HAS_HOST_RUSTC
 	bool
 
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	string
+	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
+
+endif
+
-- 
2.14.3
