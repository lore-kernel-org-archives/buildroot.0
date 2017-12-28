From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 16:51:40 +0100
Subject: [Buildroot] [PATCH v9 2/8] rust-bin: new package
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228155146.18193-3-eric.le.bihan.dev@free.fr>
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
 package/rust-bin/rust-bin.hash | 30 ++++++++++++++++++++
 package/rust-bin/rust-bin.mk   | 63 ++++++++++++++++++++++++++++++++++++++++++
 package/rustc/Config.in.host   | 29 +++++++++++++++++++
 4 files changed, 123 insertions(+)
 create mode 100644 package/rust-bin/rust-bin.hash
 create mode 100644 package/rust-bin/rust-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f4f282203..bf4766886d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -543,6 +543,7 @@ F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
+F:	package/rust-bin/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
new file mode 100644
index 0000000000..211f9fbbe0
--- /dev/null
+++ b/package/rust-bin/rust-bin.hash
@@ -0,0 +1,30 @@
+# From https://static.rust-lang.org/dist/rustc-1.22.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 d87e15a8f8b3d53270866076824559926d01145733144c4a5905affff3819b47  rustc-1.22.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.22.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 9730e46b2301417a5c5e1410f8ab8b8b6979f448b7fffc5e63221bd1bdaa15a3  rustc-1.22.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 b9c004288c5516dae88e325d24f26c10702dc617268e35b51b4bc83f4f2fc30d  rust-std-1.22.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 d48e918af118cacd2074c1c357cea46f2db73d42510c54fdfdcdf0ff60ba58ec  rust-std-1.22.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 b64b4047dcdfa4aa617f7606a92320c95cdd44cadadac72d3e7d162addc62c92  rust-std-1.22.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 e85b649aa18e1903e3c9c899ded55652713017a1e3a35e6fd58a7f40738805be  rust-std-1.22.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 112e17646bc5c513e81396b2c8042a44071a268b0d77810e378bdc9122abedc1  rust-std-1.22.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 80f0bc95273805e1ffe424b004b71a23d6d36acac2999d7361ce3cd3b17f39e9  rust-std-1.22.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 d50e4b52133b58235ff6f2c9de18d2ca81647fc2ef50aeaf9c1df5d726b3b2a3  rust-std-1.22.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 6f61b30cd54c24fcdffddb67eb4073b2199dbea487c7be2c9ab6dd4bab46dabf  rust-std-1.22.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 01278fa6596d8193bff76ddaacb78c339d610c5dbe035a38f7d0d9ebcf2bcce7  rust-std-1.22.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 39b26eaa3006aea11539d63bffdeada7078d79a4a06916cc8e6f6d66434e0a91  rust-std-1.22.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 dcaf8f636ad4290bc761566d5fac77f4d6757046fe0ee539417fc6543246877b  rust-std-1.22.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 9f5f047c8817b9c9bb45465fdccf55be9a551ebae5859100fdfa2c429f9d0574  rust-std-1.22.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.22.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 edd3313eb6523b2c08c84fc9cd7a80e4fb14c32168639d1833fd1b46e088a9a1  rust-std-1.22.1-x86_64-unknown-linux-gnu.tar.xz
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
new file mode 100644
index 0000000000..29f94b7f2d
--- /dev/null
+++ b/package/rust-bin/rust-bin.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# rust-bin
+#
+################################################################################
+
+RUST_BIN_VERSION = 1.22.1
+RUST_BIN_SITE = https://static.rust-lang.org/dist
+RUST_BIN_LICENSE = Apache-2.0 or MIT
+RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_RUST_BIN_PROVIDES = host-rustc
+
+HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+HOST_RUST_BIN_LIBSTD_SOURCES = \
+	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz \
+	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.xz
+
+HOST_RUST_BIN_EXTRA_DOWNLOADS = $(HOST_RUST_BIN_LIBSTD_SOURCES)
+
+HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
+
+define HOST_RUST_BIN_LIBSTD_EXTRACT
+	mkdir -p $(@D)/std
+	for file in $(addprefix $(DL_DIR)/,$(HOST_RUST_BIN_LIBSTD_SOURCES)); do \
+		$(TAR) -C $(@D)/std -xJf $${file}; \
+	done
+	(\
+		cd $(@D)/rustc/lib/rustlib; \
+		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME) \
+	)
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
index 16c95fa0b4..e42187d477 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -10,8 +10,37 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on !BR2_MIPS_NABI32
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 
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
