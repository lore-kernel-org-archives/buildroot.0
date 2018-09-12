From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:44:57 +0200
Subject: [Buildroot] [git commit] rust: modify Rust packaging to be usable
 as host-tool only
Message-ID: <20180912214409.8247787FEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=025b863e6facb7b219b82ee6ee7a7916c2c3c47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit modifies the host-rust virtual package to default to
host-rust-bin when no other selection has been made, as long as the
host supports rust. This allows host only tools to still use rust when
the target architecture does not support it.

Add target-specific variable which is used to differentiate host and
target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).

A target package shall depend on this variable where a host package will
use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new
"target" version is selectable for the same set of architectures as
before, but now depends on the host variant.

Signed-off-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.mk |  9 ++++++---
 package/rustc/Config.in.host | 16 ++++++++++++----
 package/rustc/rustc.mk       |  2 ++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 923642f08d..7011e188bd 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -14,8 +14,11 @@ HOST_RUST_BIN_PROVIDES = host-rustc
 HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
 HOST_RUST_BIN_EXTRA_DOWNLOADS = \
-	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz \
-	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
+
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
+HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+endif
 
 HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME)/rust-std-$(RUSTC_HOST_NAME)
 
@@ -35,7 +38,6 @@ HOST_RUST_BIN_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--disable-ldconfig
 
-ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)
 define HOST_RUST_BIN_INSTALL_RUSTC
 	(cd $(@D); \
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
@@ -46,6 +48,7 @@ define HOST_RUST_BIN_INSTALL_LIBSTD_HOST
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
 endef
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
 define HOST_RUST_BIN_INSTALL_LIBSTD_TARGET
 	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME); \
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 2ae8f89d3f..c58ffdf352 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,4 +1,10 @@
+# All host rust packages should depend on this option
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+
+# All target rust packages should depend on this option
+config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	bool
 	# The pre-built Rust standard library is only available for the
 	# following architectures/ABIs, and is built against glibc.
@@ -12,7 +18,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
 		&& BR2_MIPS_NABI64
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
@@ -66,9 +72,11 @@ config BR2_PACKAGE_HOST_RUST_BIN
 
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
