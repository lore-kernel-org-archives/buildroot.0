From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Nov 2015 17:36:20 +0100
Subject: [Buildroot] [PATCH 7/7] toolchain-external: bump CodeSourcery MIPS
	to 2015.11
In-Reply-To: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1448123780-30067-7-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a stronger hash.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/Config.in             | 10 +++----
 .../toolchain-external/toolchain-external.hash     |  4 +--
 toolchain/toolchain-external/toolchain-external.mk | 34 +---------------------
 3 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0933712..35cc5d0 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -237,7 +237,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	  This toolchain uses software-floating point.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	bool "Sourcery CodeBench MIPS 2015.05"
+	bool "Sourcery CodeBench MIPS 2015.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_mips_32r2 || BR2_mips_64r2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -247,12 +247,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.9.2, binutils 2.24.51, glibc
-	  2.21, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.19. It
+	  Mentor Graphics. It uses gcc 5.2, binutils 2.25.51, glibc
+	  2.22, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.2. It
 	  has support for the following variants:
 	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
 	      Select MIPS (big endian) core
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index d5b4ada..e8bce4d 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,6 +1,6 @@
 # Sourcery CodeBench Lite for MIPS
-# From: https://sourcery.mentor.com/GNUToolchain/release3068
-md5  0fcdc0fee260c7bed060c999bfe8440d  mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+# Locally computed
+sha256 e653102803d0fadc0a83286400c03bc7932ab081d3f8fc8917c34e76468315a2  mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
 ######################################
 # Next hashes are all locally computed
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 9ac9f3b..e04b775 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -255,37 +255,6 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
-# The CodeSourcery MIPS 2015.05 toolchain has some missing headers we
-# need to create manually in order to avoid compilation errors. A bug
-# has been already reported and fixed upstream, and the fix will be
-# included in the next release.
-define TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
-	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard.h \
-		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h
-	$(SED) 's#hard#soft#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h
-
-	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard.h \
-		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
-	$(SED) 's#hard#hard_2008#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
-	$(SED) 's#ld.so.1#ld-linux-mipsn8.so.1#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
-	$(SED) '/LD_SO/i \
-		#define LD_LINUX_MIPSN8_SO              "ld-linux-mipsn8.so.1"' \
-		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
-
-	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h \
-		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-n64_soft.h
-	$(SED) 's#o32#n64#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-n64_soft.h
-
-	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h \
-		$(STAGING_DIR)/usr/include/gnu/
-
-	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h \
-		$(STAGING_DIR)/usr/include/gnu/
-
-	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-n64_soft.h \
-		$(STAGING_DIR)/usr/include/gnu/
-endef
-
 # Buildroot picks up aarch64-linux-gnu/libc/lib64 and all its contents, but
 # does not pickup aarch64-linux-gnu/libc/lib to populate the staging directory.
 # aarch64-linux-gnu/libc/lib contain a single symlink which is lost during
@@ -359,8 +328,7 @@ endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.4.3
