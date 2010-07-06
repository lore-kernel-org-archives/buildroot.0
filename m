From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: hardcode
	the destination directory for a library
Message-ID: <20100706060218.EF5C4825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ecb7642cce36bc68d93f0eee677adc7da538228d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, the function copy_toolchain_lib_root was copying a given
library to the target filesystem by assuming that it should be at the
same place it was in the toolchain sysroot.

However, with Buildroot hiding libstdc++ in
/usr/<target-name>/lib(64), this isn't correct, and it is probably
safer not to rely on the toolchain organization anyway.

Therefore :

 * Instead of having a single EXTERNAL_LIBS variable, we now have
   LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS, which respectively
   list the libraries that should be copied to /lib and /usr/lib. As
   of today, only libstdc++ is part of the second list.

 * The copy_toolchain_lib_root takes another argument, which is the
   destination directory of the library, relative to $(TARGET_DIR)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/external-toolchain/ext-tool.mk |   30 +++++++++++++++++-------------
 1 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1c84893..7ca138b 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -49,12 +49,13 @@
 #
 # $1: arch specific sysroot directory
 # $2: library name
-# $3: destination directory
+# $3: destination directory of the libary, relative to $(TARGET_DIR)
 # $4: strip (y|n), default is to strip
 #
 copy_toolchain_lib_root = \
 	ARCH_SYSROOT_DIR="$(strip $1)"; \
 	LIB="$(strip $2)"; \
+	DESTDIR="$(strip $3)" ; \
 	STRIP="$(strip $4)"; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
@@ -67,17 +68,17 @@ copy_toolchain_lib_root = \
 		LIBDIR=`dirname $${FILE}` ; \
 		while test \! -z "$${LIB}"; do \
 			FULLPATH="$${ARCH_SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
-			rm -fr $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
-			mkdir -p $(TARGET_DIR)/$${LIBDIR}; \
+			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIB}; \
+			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 			if test -h $${FULLPATH} ; then \
-				cp -d $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/; \
+				cp -d $${FULLPATH} $(TARGET_DIR)/$${DESTDIR}/; \
 			elif test -f $${FULLPATH}; then \
-				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
+				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIB}; \
 				case "$${STRIP}" in \
 				(0 | n | no) \
 ;; \
 				(*) \
-					$(TARGET_CROSS)strip "$(TARGET_DIR)/$${LIBDIR}/$${LIB}"; \
+					$(TARGET_CROSS)strip "$(TARGET_DIR)/$${DESTDIR}/$${LIB}"; \
 ;; \
 				esac; \
 			else \
@@ -277,19 +278,19 @@ check_cross_compiler_exists = \
 
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
-EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GCLIBC),y)
-EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
+LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-EXTERNAL_LIBS+=libstdc++.so
+USR_LIB_EXTERNAL_LIBS+=libstdc++.so
 endif
 
 ifneq ($(BR2_PTHREADS_NONE),y)
-EXTERNAL_LIBS+=libpthread.so
+LIB_EXTERNAL_LIBS+=libpthread.so
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-EXTERNAL_LIBS+=libthread_db.so
+LIB_EXTERNAL_LIBS+=libthread_db.so
 endif # gdbserver
 endif # ! no threads
 
@@ -338,8 +339,11 @@ else
 endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
-	$(Q)for libs in $(EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+	$(Q)for libs in $(LIB_EXTERNAL_LIBS); do \
+		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+	done
+	$(Q)for libs in $(USR_LIB_EXTERNAL_LIBS); do \
+		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/usr/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	@echo "Copy external toolchain sysroot to staging..."
 	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR),$(ARCH_SYSROOT_DIR),$(ARCH_SUBDIR))
-- 
1.7.1
