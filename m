From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:36 +0200
Subject: [Buildroot] [Patch v5 3/7] rust-bin: new package
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-4-eric.le.bihan.dev@free.fr>
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

The menuconfig entry for rustc is also updated to expose this provider.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                     |  1 +
 package/rust-bin/rust-bin.hash | 30 ++++++++++++++++++++++++++++++
 package/rust-bin/rust-bin.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 package/rustc/Config.in.host   | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 package/rust-bin/rust-bin.hash
 create mode 100644 package/rust-bin/rust-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 123a8f9..b352042 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -451,6 +451,7 @@ F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
+F:	package/rust-bin/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
new file mode 100644
index 0000000..42988f8
--- /dev/null
+++ b/package/rust-bin/rust-bin.hash
@@ -0,0 +1,30 @@
+# From https://static.rust-lang.org/dist/rustc-1.16.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 f8e0f96c17d8345be7818035e9bcae8e809a1b13635fe9a322df4a82d6dd1275  rustc-1.16.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rustc-1.16.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 b1dc3f754eeaf03891a3bd398c8c5024404c0078a334e5d8795e9dc419d147b3  rustc-1.16.0-x86_64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-aarch64-unknown-linux-gnu.tar.gz.sha256
+sha256 dafe92282dd5ca67f95c5b8cc2a729b2f8cb04d6e30c6d790819a27f0119d8ca  rust-std-1.16.0-aarch64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-arm-unknown-linux-gnueabi.tar.gz.sha256
+sha256 b220d8c0fd1a5039b91181fd083e96c9b48c71fb5892e98ec99e60e4ac4bb29d  rust-std-1.16.0-arm-unknown-linux-gnueabi.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-arm-unknown-linux-gnueabihf.tar.gz.sha256
+sha256 bc7846a432d672995bf7ef349a79ee422a003b808579996fe0a30f335dce16f4  rust-std-1.16.0-arm-unknown-linux-gnueabihf.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-armv7-unknown-linux-gnueabihf.tar.gz.sha256
+sha256 dd6869bf2d2f31711d327ac9a5e42667a65b3fa9476e36a4c6418cb1cc5109fb  rust-std-1.16.0-armv7-unknown-linux-gnueabihf.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 5a74e3661f4b300bf73353389acab097f3e07813b0f3073007830a549656054a  rust-std-1.16.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-mips-unknown-linux-gnu.tar.gz.sha256
+sha256 0d2f91ce61e261e11f44732ea3bdf04c2dd498f441b89b3ab1cf0eebc6d0b8cb  rust-std-1.16.0-mips-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-mips64-unknown-linux-gnuabi64.tar.gz.sha256
+sha256 2c0cca2d97f79b4027c9ff0ebde611fae527b2c6ce1accddd6b4b3936a4c8a8c  rust-std-1.16.0-mips64-unknown-linux-gnuabi64.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-mips64el-unknown-linux-gnuabi64.tar.gz.sha256
+sha256 5396748787b81e2d136bcd3ed8a86ca1b0b77b469e0065d14002815000fb6c42  rust-std-1.16.0-mips64el-unknown-linux-gnuabi64.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-mipsel-unknown-linux-gnu.tar.gz.sha256
+sha256 deeade93a16fa3c2258fb11ca2cbc31fa22e721c89f5db7457ac233351efe073  rust-std-1.16.0-mipsel-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-powerpc-unknown-linux-gnu.tar.gz.sha256
+sha256 a8faf140202c3ad35fd335b32c4b0ce14aad0ef5b9485b9a542b1bb8aa495a7a  rust-std-1.16.0-powerpc-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-powerpc64-unknown-linux-gnu.tar.gz.sha256
+sha256 b8d1e47adaef06a05fb021071e4dca1469422056352ad77a74be2a5a3a95099e  rust-std-1.16.0-powerpc64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-powerpc64le-unknown-linux-gnu.tar.gz.sha256
+sha256 0cd7f99ef3e620865781bd13a89a1de3dc46593f9de6927d52c47f8d44a31d26  rust-std-1.16.0-powerpc64le-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.16.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 cbd43de2ab819d3332ce309046f3b5d715c1b47877a237791b99c96b1fe0d555  rust-std-1.16.0-x86_64-unknown-linux-gnu.tar.gz
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
new file mode 100644
index 0000000..8310c40
--- /dev/null
+++ b/package/rust-bin/rust-bin.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# rust-bin
+#
+################################################################################
+
+RUST_BIN_VERSION = 1.16.0
+RUST_BIN_SITE = https://static.rust-lang.org/dist
+RUST_BIN_LICENSE = Apache-2.0 or MIT
+RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_RUST_BIN_PROVIDES = host-rustc
+
+HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.gz
+HOST_RUST_BIN_LIBSTD_SOURCES = \
+	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.gz \
+	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.gz
+
+HOST_RUST_BIN_EXTRA_DOWNLOADS = $(HOST_RUST_BIN_LIBSTD_SOURCES)
+
+define HOST_RUST_BIN_LIBSTD_EXTRACT
+	mkdir -p $(@D)/std
+	for file in $(addprefix $(DL_DIR)/,$(HOST_RUST_BIN_LIBSTD_SOURCES)); do \
+		$(TAR) -C $(@D)/std -xzf $${file}; \
+	done
+endef
+
+HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
+
+define HOST_RUST_BIN_INSTALL_CMDS
+	for exe in $$(find $(@D) -name install.sh -executable); do \
+		$${exe} \
+			--prefix=$(HOST_DIR)/usr \
+			--docdir=$(HOST_DIR)/usr/share/doc/rust \
+			--libdir=$(HOST_DIR)/usr/lib \
+			--mandir=$(HOST_DIR)/usr/share/man \
+			--disable-ldconfig; \
+	done
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index fef78a7..7f2c276 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,5 +1,46 @@
+config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on  BR2_i386 || BR2_x86_64 \
+		|| BR2_arm  || BR2_aarch64 \
+		|| BR2_powerpc  || BR2_powerpc64 \
+		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	depends on !BR2_MIPS_NABI32
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_HOST_RUSTC
+	bool "host rustc"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	help
+	  Select the desired provider for the Rust compiler.
+
+	  http://www.rust-lang.org
+
+if BR2_PACKAGE_HOST_RUSTC
+
+choice
+	prompt "Rust compiler variant"
+	default BR2_PACKAGE_HOST_RUST_BIN
+	help
+	  Choose a provider for the Rust compiler.
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
2.9.3
