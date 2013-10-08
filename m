From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:17:15 +0200
Subject: [Buildroot] [PATCHv3 18/20] toolchain-external: fix Linaro ARM
	toolchain support
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes bug #6452 (eglibc from Linaro 2013.07 not copied to
target correctly) by:

 * Copying only the relevant library loader to the target on ARMhf
   (i.e ld-linux-armhf.so and not ld.so*). This is needed since Linaro
   toolchains provide two library loaders, one ARMv7 hf, and one ARMv4
   soft-float.

 * Making sure a $(TARGET_DIR)/lib/arm-linux-gnueabihf/ symbolic link
   to $(TARGET_DIR)/lib/ exists, since the dynamic loader of Linaro
   toolchains expects libraries to be found in
   $(TARGET_DIR)/lib/arm-linux-gnueabihf/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 73a761b..b5b1ce7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -55,7 +55,12 @@
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-LIB_EXTERNAL_LIBS+=ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+LIB_EXTERNAL_LIBS+=libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+ifeq ($(BR2_ARM_EABIHF),y)
+LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.*
+else
+LIB_EXTERNAL_LIBS+=ld*.so.*
+endif
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIB_EXTERNAL_LIBS+=libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB_SERVER)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
@@ -216,6 +221,13 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
+# The Linaro ARMhf toolchain expects the libraries in
+# /lib/arm-linux-gnueabihf, but Buildroot copies them to /lib, so we
+# need to create a symbolic link.
+define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+	ln -sf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
+endef
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -242,12 +254,15 @@ endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.09_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.8.1.2
