From: sam.voss at gmail.com <sam.voss@gmail.com>
Date: Mon, 16 Jul 2018 23:29:53 -0500
Subject: [Buildroot] [PATCH] rust: Modify Rust to be usable as host-tool only
Message-ID: <20180717042953.23648-1-sam.voss@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <sam.voss@gmail.com>

Modify host-rust virtual package to default to host-rust-bin when no
other selection has been made, as long as the host supports rust. This
allows host only tools to still use rust when the target architecture
does not support it.

Add target-specific variable which is used to differentiate host and
target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).

A target package shall depend on this variable where a host package will
use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new
"target" version is selectable for the same set of architectures as
before, but now depends on the host variant.

Signed-off-by: Sam Voss <sam.voss@gmail.com>
---

Note: this has been tested on x86_64 host compiling to:

- x86_64 qemu target (building package to be upstreamed shortly)
- mips64el (based on librsvg build failures seen at
http://autobuild.buildroot.net/results/f33/f335ed517b402c094ed3b10a3da4cdc23620dbd6/defconfig)
  this target was only tested to compile, with no runtime tests.

 package/rust-bin/rust-bin.mk |  5 ++++-
 package/rust/rust.mk         |  1 +
 package/rustc/Config.in.host | 21 ++++++++++++++++++---
 package/rustc/rustc.mk       |  2 ++
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index e10dbcebd0..c426da8d15 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -15,7 +15,10 @@ HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
 HOST_RUST_BIN_EXTRA_DOWNLOADS = \
 	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz \
-	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
+HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+endif
 
 HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME)/rust-std-$(RUSTC_HOST_NAME)
 
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index af5c366495..c11dbb23b0 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -19,6 +19,7 @@ HOST_RUST_DEPENDENCIES = \
 	host-python \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
+
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 HOST_RUST_DEPENDENCIES += jemalloc
 HOST_RUST_JEMALLOC_ENABLED = true
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 2ae8f89d3f..d7f0efcd3f 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -14,6 +14,19 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
+config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_aarch64
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 \
+	        && !(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI)
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
+	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
+		&& BR2_MIPS_NABI64
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
@@ -66,9 +79,11 @@ config BR2_PACKAGE_HOST_RUST_BIN
 
 endchoice
 
+endif
+
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	string
 	default "host-rust" if BR2_PACKAGE_HOST_RUST
-	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
-
-endif
+	# Default to host-rust-bin as long as host arch supports it
+	default "host-rust-bin" if !BR2_PACKAGE_HOST_RUST
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index bed74f3c2c..6eea9b4fc5 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -7,7 +7,9 @@
 RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
 RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
 RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+endif
 
 ifeq ($(HOSTARCH),x86)
 RUSTC_HOST_ARCH = i686
-- 
2.18.0
