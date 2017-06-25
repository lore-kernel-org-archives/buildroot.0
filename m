From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 25 Jun 2017 22:56:10 +0200
Subject: [Buildroot] [Patch v6 3/7] rust-bin: new package
In-Reply-To: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
References: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170625205614.6723-4-eric.le.bihan.dev@free.fr>
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
index 9e421f4..6ab48ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -483,6 +483,7 @@ F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
+F:	package/rust-bin/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
new file mode 100644
index 0000000..6a56e99
--- /dev/null
+++ b/package/rust-bin/rust-bin.hash
@@ -0,0 +1,30 @@
+# From https://static.rust-lang.org/dist/rustc-1.18.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 0cb9bb95373cee8ba26e8f517c46f8c58a29e22f2c7c08a4d152306c6ffc7115  rustc-1.18.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rustc-1.18.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 f2a34e20166ccf6eda4de46a9efb02821df5c3f34667e2988284a8eaee408113  rustc-1.18.0-x86_64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-aarch64-unknown-linux-gnu.tar.gz.sha256
+sha256 1a6b33f8bce7637fe038667cd82dda60a69fe319adf3820f621670ef9d75af2b  rust-std-1.18.0-aarch64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-arm-unknown-linux-gnueabi.tar.gz.sha256
+sha256 8da327ff42cf895ff341bca862f8a235c1bd78e473464183bff85ceccdfa3a91  rust-std-1.18.0-arm-unknown-linux-gnueabi.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-arm-unknown-linux-gnueabihf.tar.gz.sha256
+sha256 8cf92d8a4f6c04f66edafbbfd1ad12839bcc0ee1477b2ccdaeb43fb81788c4fc  rust-std-1.18.0-arm-unknown-linux-gnueabihf.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-armv7-unknown-linux-gnueabihf.tar.gz.sha256
+sha256 bafef1cc817fc0b6fcc06d19fc9a28638d7a85dd6c2345a803c4c89d3ed89a9f  rust-std-1.18.0-armv7-unknown-linux-gnueabihf.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 3b93c7b856b98f61ec0f640bc96373f4762484ab3340866902c8c96933bcf10b  rust-std-1.18.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-mips-unknown-linux-gnu.tar.gz.sha256
+sha256 312bc9444d3b43a78fc82755f84ccf6b692778233983546c4616e08419a06bb0  rust-std-1.18.0-mips-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-mips64-unknown-linux-gnuabi64.tar.gz.sha256
+sha256 86bd6c2a364359b8c749b31f4ec9a2de0d6d4af72582c4edab80e443b59f06f6  rust-std-1.18.0-mips64-unknown-linux-gnuabi64.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-mips64el-unknown-linux-gnuabi64.tar.gz.sha256
+sha256 d3af657644a6e4a4d2285a522f5189f5722c78f59fc17f36f2b0487e374cf829  rust-std-1.18.0-mips64el-unknown-linux-gnuabi64.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-mipsel-unknown-linux-gnu.tar.gz.sha256
+sha256 76b14be2770bff9945a16f95e23f6bf0bbd921b9529b9cfdb5c7569f312746c8  rust-std-1.18.0-mipsel-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-powerpc-unknown-linux-gnu.tar.gz.sha256
+sha256 8716a44ee1be60500e9cc1460f12f211e1ae84ddf50dd6f05faafe13478962c0  rust-std-1.18.0-powerpc-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-powerpc64-unknown-linux-gnu.tar.gz.sha256
+sha256 3572c3477271c61e816ac030277eb1aa7a948e34af00b8a2d6eb73a367220e66  rust-std-1.18.0-powerpc64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-powerpc64le-unknown-linux-gnu.tar.gz.sha256
+sha256 60deedd6f61c7460231067bf1e0fbf5aff1666e6be581f8ab73df9016e84e47d  rust-std-1.18.0-powerpc64le-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 4a66150781e224412ebd9dd6d643ad65ecc5668a7754e4a12e115be6ce7bf527  rust-std-1.18.0-x86_64-unknown-linux-gnu.tar.gz
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
new file mode 100644
index 0000000..2f4bdff
--- /dev/null
+++ b/package/rust-bin/rust-bin.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# rust-bin
+#
+################################################################################
+
+RUST_BIN_VERSION = 1.18.0
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
2.9.4
