From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Sep 2010 14:44:36 +0200
Subject: [Buildroot] [git commit master 1/1] Remove code specific to removed
	architectures
Message-ID: <20100930124532.B73928B7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97d8618c6cc2970ea5870ae214344b3bff083883
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/jffs2/Config.in            |    4 ++--
 package/liboil/liboil.mk      |    3 ---
 package/ltrace/Config.in      |    2 +-
 package/openssl/openssl.mk    |    3 ---
 toolchain/gcc/Config.in       |    2 +-
 toolchain/toolchain-common.in |    1 -
 6 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index b787ec9..de13768 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -95,10 +95,10 @@ config BR2_TARGET_ROOTFS_JFFS2_PADSIZE
 
 choice
 	prompt "Endianess"
-	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_alpha || BR2_armeb || \
+	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_armeb || \
 			BR2_avr32 || BR2_m68k || BR2_mips || \
 			BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
-			BR2_sh3eb || BR2_sh4eb || BR2_sparc || BR2_sparc64
+			BR2_sh3eb || BR2_sh4eb || BR2_sparc
 
 config BR2_TARGET_ROOTFS_JFFS2_LE
 	bool "little-endian"
diff --git a/package/liboil/liboil.mk b/package/liboil/liboil.mk
index 1bb412f..44017be 100644
--- a/package/liboil/liboil.mk
+++ b/package/liboil/liboil.mk
@@ -16,9 +16,6 @@ LIBOIL_INSTALL_TARGET = YES
 ifeq ($(BR2_avr32),y)
 LIBOIL_CONF_ENV = as_cv_unaligned_access=no
 endif
-ifeq ($(BR2_cris),y)
-LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
-endif
 ifeq ($(BR2_x86_64),y)
 LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
 endif
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 10a0e0a..9e71d82 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_cris || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64 || BR2_xtensa)
+	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64 || BR2_xtensa)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index edbfe8b..22b14f2 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -11,9 +11,6 @@ OPENSSL_DEPENDENCIES = zlib
 OPENSSL_TARGET_ARCH=generic32
 
 # Some architectures are optimized in OpenSSL
-ifeq ($(ARCH),ia64)
-OPENSSL_TARGET_ARCH=ia64
-endif
 ifeq ($(ARCH),powerpc)
 OPENSSL_TARGET_ARCH=ppc
 endif
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 70d8de9..760bb98 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -93,7 +93,7 @@ config BR2_GCC_SHARED_LIBGCC
 	bool "Build/install a shared libgcc?"
 	depends on !BR2_PREFER_STATIC_LIB
 	default y
-	depends on !BR2_sparc && !BR2_sparc64
+	depends on !BR2_sparc
 	help
 	  Build/install a shared libgcc library
 
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index ea06ace..f67c30a 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -9,7 +9,6 @@ comment "Common Toolchain Options"
 
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
-	depends on !BR2_cris
 	help
 	  If you are building your own toolchain and you want to 
 	  support files larger than 2GB then enable this option.
-- 
1.7.1
