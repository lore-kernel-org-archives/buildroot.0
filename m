From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Dec 2020 21:48:21 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to version
 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
In-Reply-To: <20201207204821.3588178-1-romain.naour@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
Message-ID: <20201207204821.3588178-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been added.
  Remove the ARC specific version.

- Remove --enable-obsolete-rpc configure option.

- toolchain: don't enable RPC unconditionally since it was removed from glibc
  No need to update packaged external toolchains since they already select
  BR2_TOOLCHAIN_HAS_NATIVE_RPC.

- All config fragments using a custom external toolchain has been updated by a
  previous commit to select BR2_TOOLCHAIN_EXTERNAL_INET_RPC.

- Existing packages that requires rpc support can already fallback to libtirpc
  when BR2_TOOLCHAIN_HAS_NATIVE_RPC is set (musl and uClibc-ng).

See:
https://sourceware.org/pipermail/libc-announce/2020/000029.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v2: update to 2.32-24
    remove CVE from release note (Peter)
---
 .../glibc.hash                                           | 7 -------
 .../glibc.hash                                           | 2 +-
 package/glibc/glibc.mk                                   | 9 ++-------
 .../0001-HACK-only-build-and-install-localedef.patch     | 0
 ...x-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 0
 .../localedef.hash                                       | 2 +-
 package/localedef/localedef.mk                           | 2 +-
 toolchain/toolchain-buildroot/Config.in                  | 2 --
 .../toolchain-external-custom/Config.in.options          | 1 -
 9 files changed, 5 insertions(+), 20 deletions(-)
 delete mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
 rename package/glibc/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2}/glibc.hash (70%)
 rename package/localedef/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2}/0001-HACK-only-build-and-install-localedef.patch (100%)
 rename package/localedef/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
 rename package/localedef/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2}/localedef.hash (70%)

diff --git a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
deleted file mode 100644
index c6259a4745..0000000000
--- a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256  07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b  glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash b/package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
similarity index 70%
rename from package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
rename to package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
index a1b2ae12fd..45ecc2895f 100644
--- a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
+++ b/package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
+sha256  04946bb7cbaf4062bf5e727e0d6784e105b07611587d71f00d25ea896753c26d  glibc-2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4721177d83..b5c70a3007 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,16 +11,12 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-ifeq ($(BR2_arc),y)
-# ARC support in upstream was merged in 2.32 release
-# This can be removed once BR upgrades to 2.32 or later
-GLIBC_VERSION = 2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5
-else ifeq ($(BR2_RISCV_32),y)
+ifeq ($(BR2_RISCV_32),y)
 # RISC-V 32-bit (RV32) requires glibc 2.33 or newer
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
+GLIBC_VERSION = 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
@@ -137,7 +133,6 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--disable-werror \
 		--without-gd \
-		--enable-obsolete-rpc \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
similarity index 70%
rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
rename to package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
index a1b2ae12fd..45ecc2895f 100644
--- a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
+++ b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
+sha256  04946bb7cbaf4062bf5e727e0d6784e105b07611587d71f00d25ea896753c26d  glibc-2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 413e3acb65..d75702d847 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
+LOCALEDEF_VERSION = 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 25ac9759f1..e46477dbaa 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -58,8 +58,6 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
-	# our glibc.mk enables RPC support
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  This option selects glibc as the C library for the
 	  cross-compilation toolchain.
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index f7aa5454e3..14046739d5 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -448,7 +448,6 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
-	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
-- 
2.25.4
