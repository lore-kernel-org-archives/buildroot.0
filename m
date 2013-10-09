From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 15:15:06 +0200
Subject: [Buildroot] [git commit] toolchain: modify the wildcard logic for
	shared libraries copying
Message-ID: <20131009143429.9A8819B9A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=186a99b1c6562da724a5500190835c709d152df4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk                             |    8 ++++----
 toolchain/helpers.mk                               |    2 +-
 toolchain/toolchain-external/toolchain-external.mk |   10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4d89caf..0dab492 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -112,12 +112,12 @@ endef
 #
 
 GLIBC_LIBS_LIB = \
-	ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so	   \
-	libnsl.so libpthread.so libresolv.so librt.so libutil.so   \
-	libnss_files.so libnss_dns.so
+	ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.*        \
+	libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* libutil.so.*   \
+	libnss_files.so.* libnss_dns.so.*
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-GLIBC_LIBS_LIB += libthread_db.so
+GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
 define GLIBC_INSTALL_TARGET_CMDS
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 27b6710..37f2cf9 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
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
