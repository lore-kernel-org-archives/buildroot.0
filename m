From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:24 +0200
Subject: [Buildroot] [PATCHv2 14/21] toolchain-external: modify the wildcard
	logic for shared libraries copying
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the copy_toolchain_lib_root function took as argument the
base name of a library (e.g: libm.so), and was assuming that the usual
scheme libm.so.<x> being a symbolic link to the real library was used.

However, with musl based toolchains, the C library is named libc.so
directly, with no symbolic link at all. Therefore, this commit changes
the copy_toolchain_lib_root to move the responsibility of using a
wildcard or not after the library name the caller's responsibility.

So, all the existing LIB_EXTERNAL_LIBS values are modified to have a
.* at the end, so that the behavior is effectively unchanged.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/helpers.mk            |  2 +-
 toolchain/toolchain-external/toolchain-external.mk | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/helpers.mk b/toolchain/toolchain-external/helpers.mk
index 27b6710..37f2cf9 100644
--- a/toolchain/toolchain-external/helpers.mk
+++ b/toolchain/toolchain-external/helpers.mk
@@ -54,7 +54,7 @@ copy_toolchain_lib_root = \
 		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} \
 		$${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
 		$${SUPPORT_LIB_DIR} ; do \
-		LIBSPATH=`find $${dir} -maxdepth 1 -name "$${LIB}.*" 2>/dev/null` ; \
+		LIBSPATH=`find $${dir} -maxdepth 1 -name "$${LIB}" 2>/dev/null` ; \
 		if test -n "$${LIBSPATH}" ; then \
 			break ; \
 		fi \
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index aaf4994..2bfe64a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -55,21 +55,21 @@
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-LIB_EXTERNAL_LIBS+=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+LIB_EXTERNAL_LIBS+=ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIB_EXTERNAL_LIBS+=libpthread.so
+LIB_EXTERNAL_LIBS+=libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB_SERVER)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
-LIB_EXTERNAL_LIBS+=libthread_db.so
+LIB_EXTERNAL_LIBS+=libthread_db.so.*
 endif # gdbserver
 endif # ! no threads
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
+LIB_EXTERNAL_LIBS+=libnss_files.so.* libnss_dns.so.*
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-USR_LIB_EXTERNAL_LIBS+=libstdc++.so
+USR_LIB_EXTERNAL_LIBS+=libstdc++.so.*
 endif
 
 LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
-- 
1.8.1.2
