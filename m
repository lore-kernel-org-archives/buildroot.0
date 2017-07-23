From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:11:58 +0200
Subject: [Buildroot] [Patch v7 02/10] rust-bin: new package
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081206.7774-3-eric.le.bihan.dev@free.fr>
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
index 0c22ffc..312b176 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -493,6 +493,7 @@ F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
+F:	package/rust-bin/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
new file mode 100644
index 0000000..538f376
--- /dev/null
+++ b/package/rust-bin/rust-bin.hash
@@ -0,0 +1,30 @@
+# From https://static.rust-lang.org/dist/rustc-1.19.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 458404eeac5439c7de35eb15b5922835401918935874672c07eb0f579a85fa40  rustc-1.19.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.19.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 023f1b63b77eab1e19e900ed6c15f144914bec82de96d644a20f428be1e565b1  rustc-1.19.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 bcadc15e62aa1e919409fd61212d2cde1b63c065afa4f001b8a33300a06a67ab  rust-std-1.19.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 458af663cbd06262bcc1bd3eea741a1ccb3a0b794329542fc81e83891b7291b2  rust-std-1.19.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 6e845a4c2b87f3764c42fbad835fd7deb6a872bfbe5fecdc4412d7344064b07d  rust-std-1.19.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 5f45d5e4f4b2cf2a91818c68d4fe463745c9133a6d85edb518b77f175eea2065  rust-std-1.19.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 f5dffacc264fb82b605dc66180cd327628caadedd4dca0c2115652f1933c6d93  rust-std-1.19.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 a74d1d91d28cb09d13b90451f59939ac01fcbb33eb3087e90b45eff76d5ab9ae  rust-std-1.19.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 eeb6d00d24ce9250219cb019cf08b64c2b629dec8e3e70546ddd103df5c8b9dc  rust-std-1.19.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 745fc612c64bb43f26be5240333842280c6aacfd5acafe3c279ab9ac1da77a46  rust-std-1.19.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 fabb4d203019eefcca2200cf1d519de47a376e71cdca6faa527e94d86b66ecd6  rust-std-1.19.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 0c0a6aad87c97b1777c43386c17a8a0dea4ebe774adcae563768cabb0a039bbf  rust-std-1.19.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 ddb66ff250ebdaab4593634236dcefe707918a424f3f5d2650a3b8e726d8081d  rust-std-1.19.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 5ca6c0943c883606c43c11d32c35382f019109544a7820d4279d479ce2393a3c  rust-std-1.19.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.19.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 da67633a1447656c4c9907776fc473b208737f4ed521727eb37a59177d1ae296  rust-std-1.19.0-x86_64-unknown-linux-gnu.tar.xz
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
new file mode 100644
index 0000000..900cc69
--- /dev/null
+++ b/package/rust-bin/rust-bin.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# rust-bin
+#
+################################################################################
+
+RUST_BIN_VERSION = 1.19.0
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
+define HOST_RUST_BIN_LIBSTD_EXTRACT
+	mkdir -p $(@D)/std
+	for file in $(addprefix $(DL_DIR)/,$(HOST_RUST_BIN_LIBSTD_SOURCES)); do \
+		$(TAR) -C $(@D)/std -xJf $${file}; \
+	done
+endef
+
+HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
+
+define HOST_RUST_BIN_INSTALL_CMDS
+	for exe in $$(find $(@D) -name install.sh -executable); do \
+		$${exe} \
+			--prefix=$(HOST_DIR) \
+			--docdir=$(HOST_DIR)/share/doc/rust \
+			--libdir=$(HOST_DIR)/lib \
+			--mandir=$(HOST_DIR)/share/man \
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
2.9.4
