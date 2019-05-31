From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit] package/gcc: add C-SKY specific gcc version
Message-ID: <20190602201237.C482081354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7873a5bd5ebbeb1674293dae6b06b50f0a1f2184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 13 +++++++++++++
 package/gcc/gcc.hash       |  2 ++
 package/gcc/gcc.mk         |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index effb113925..4b7f11f3b1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,7 @@ comment "GCC Options"
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
+	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_7_X
 	help
@@ -14,6 +15,12 @@ config BR2_GCC_VERSION_ARC
 	depends on BR2_arc
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_VERSION_CSKY
+	bool "gcc csky"
+	# Only supported architecture
+	depends on BR2_csky
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_GCC_VERSION_OR1K
 	bool "gcc or1k (5.x)"
 	# Only supported architecture
@@ -25,6 +32,7 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
 	depends on !BR2_arc
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	# musl on microblaze, ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
@@ -39,6 +47,7 @@ config BR2_GCC_VERSION_5_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
 	depends on !BR2_arc
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	# musl on ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
@@ -52,6 +61,7 @@ config BR2_GCC_VERSION_6_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	# Broken or unsupported architectures
 	depends on !BR2_arc
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
@@ -59,12 +69,14 @@ config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	# Broken or unsupported architectures
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
 	# Broken or unsupported architectures
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
@@ -85,6 +97,7 @@ config BR2_GCC_VERSION
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2019.03-rc1" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
+	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 74bbd3cfbf..09926f3b91 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,5 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
 sha512  5b80cfa987f615659ccfbd4b3f0cea5a28d8464398b5f7163d9cfad2fec1b15e8e6575628f3f6094a1081be9d4f521ca33795105d1d12295c7207935f51603c0  gcc-arc-2019.03-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/gcc)
+sha512  1c3564fd6573dce13451a73015e7d88fecbb214dc1df96607976255b1d8b9e60318405333f4f218eea8d07e3675a802b66eff6df3921d505c4036481512792c2  gcc-48152afb96c59733d5bc79e3399bb7b3d4b44266.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5901624ea5..abc29c7df0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,6 +16,9 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_or1k),y)
 GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+else ifeq ($(BR2_csky),y)
+GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 # From version 5.5.0, 6.4.0, 7.2.0 and 8.1.0 a bz2 release tarball is not
