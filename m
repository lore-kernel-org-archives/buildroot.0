From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2016 20:20:25 +0100
Subject: [Buildroot] [PATCH 4/5] toolchain-external: align library locations
	in target and staging dir
In-Reply-To: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1455304826-10557-5-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The toolchain-external logic is roughly:
- populate the staging dir by rsyncing the entire ${ARCH_LIB_DIR} and
  usr/${ARCH_LIB_DIR} from sysroot.
- populate the target dir by explictly copying some libraries from sysroot
  into target/lib and some other libraries in target/usr/lib, the split
  being hardcoded into buildroot regardless of the location in the sysroot.

This means that a library libfoo could be located in:
  staging/lib/libfoo.so
  target/usr/lib/libfoo.so

When debugging an application that links against this library, gdb will
fruitlessly search for 'usr/lib/libfoo.so' in staging, and then suggest to
use 'set solib-search-path' which is a hack, really.

To solve the problem, we need to make sure that libraries from the toolchain
are installed in the same relative location in staging and target.
Achieve this by:
- replacing the convoluted search for libraries using for+find in sysroot
  with a simple find in staging.
- determining DESTDIR for each library individually based on the location in
  staging.
- treating LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS equivalently

These changes also allow for the removal of most arguments to
copy_toolchain_lib_root in the method itself and their callers.

Test procedure:
- set configuration for a given toolchain
- make clean toolchain
- find output/target | sort > /tmp/out-before
- apply patch
- make clean toolchain
- find output/target | sort > /tmp/out-after
- diff -u /tmp/out-before /tmp/out-after

The only changes should be some libraries moving from lib to usr/lib or vice
versa. Notable examples being libstdc++ and libatomic.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/glibc/glibc.mk                             |  2 +-
 toolchain/helpers.mk                               | 57 ++--------------------
 toolchain/toolchain-external/toolchain-external.mk | 39 ++++-----------
 3 files changed, 15 insertions(+), 83 deletions(-)

Test notes:
I have executed the mentioned test procedure for all external toolchains
listed on http://autobuild.buildroot.org/toolchains/configs/, for the x86
ARMv7a Thumb2 EABIhf Linaro toolchain, and for an internal glibc toolchain.
An x86_64 qemu image was booted, both with internal and external toolchain.


diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e60575f..bcec47f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -117,7 +117,7 @@ endif
 
 define GLIBC_INSTALL_TARGET_CMDS
 	for libs in $(GLIBC_LIBS_LIB); do \
-		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
+		$(call copy_toolchain_lib_root,$$libs) ; \
 	done
 endef
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ee878e8..d5dc16f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -6,62 +6,15 @@
 # toolchain logic, and the glibc package, so care must be taken when
 # changing this function.
 #
-# Most toolchains (CodeSourcery ones) have their libraries either in
-# /lib or /usr/lib relative to their ARCH_SYSROOT_DIR, so we search
-# libraries in:
-#
-#  $${ARCH_LIB_DIR}
-#  usr/$${ARCH_LIB_DIR}
-#
-# Buildroot toolchains, however, have basic libraries in /lib, and
-# libstdc++/libgcc_s in /usr/<target-name>/lib(64), so we also need to
-# search libraries in:
-#
-#  usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR}
-#
-# Linaro toolchains have most libraries in lib/<target-name>/, so we
-# need to search libraries in:
-#
-#  $${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX)
-#
-# And recent Linaro toolchains have the GCC support libraries
-# (libstdc++, libgcc_s, etc.) into a separate directory, outside of
-# the sysroot, that we called the "SUPPORT_LIB_DIR", into which we
-# need to search as well.
-#
-# Thanks to ARCH_LIB_DIR we also take into account toolchains that
-# have the libraries in lib64 and usr/lib64.
-#
-# Please be very careful to check the major toolchain sources:
-# Buildroot, Crosstool-NG, CodeSourcery and Linaro before doing any
-# modification on the below logic.
-#
-# $1: arch specific sysroot directory
-# $2: support libraries directory (can be empty)
-# $3: library directory ('lib' or 'lib64') from which libraries must be copied
-# $4: library name
-# $5: destination directory of the libary, relative to $(TARGET_DIR)
+# $1: library name
 #
 copy_toolchain_lib_root = \
-	ARCH_SYSROOT_DIR="$(strip $1)"; \
-	SUPPORT_LIB_DIR="$(strip $2)" ; \
-	ARCH_LIB_DIR="$(strip $3)" ; \
-	LIB="$(strip $4)"; \
-	DESTDIR="$(strip $5)" ; \
+	LIB="$(strip $1)"; \
 \
-	for dir in \
-		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
-		$${ARCH_SYSROOT_DIR}/usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
-		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} \
-		$${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
-		$${SUPPORT_LIB_DIR} ; do \
-		LIBPATHS=`find $${dir} -maxdepth 1 -name "$${LIB}" 2>/dev/null` ; \
-		if test -n "$${LIBPATHS}" ; then \
-			break ; \
-		fi \
-	done ; \
-	mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
+	LIBPATHS=`find $(STAGING_DIR) -follow -name "$${LIB}" 2>/dev/null` ; \
 	for LIBPATH in $${LIBPATHS} ; do \
+		DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
+		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
 			LIBDIR=`dirname $${LIBPATH}` ; \
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d5445e5..a333c32 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -585,24 +585,16 @@ endef
 #                       our sysroot, and the directory will also be
 #                       considered when searching libraries for copy
 #                       to the target filesystem.
+#
+# Please be very careful to check the major toolchain sources:
+# Buildroot, Crosstool-NG, CodeSourcery and Linaro
+# before doing any modification on the below logic.
 
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	SUPPORT_LIB_DIR="" ; \
-	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
-		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
-			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-		fi ; \
-	fi ; \
-	if test -z "$(BR2_STATIC_LIBS)" ; then \
+	$(Q)if test -z "$(BR2_STATIC_LIBS)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
-		for libs in $(LIB_EXTERNAL_LIBS); do \
-			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
-		done ; \
-		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
+		for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+			$(call copy_toolchain_lib_root,$$libs); \
 		done ; \
 	fi
 endef
@@ -671,21 +663,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 endef
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
-	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	FDPIC_SUPPORT_LIB_DIR="" ; \
-	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
-	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
-	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-	        fi ; \
-	fi ; \
-	for libs in $(LIB_EXTERNAL_LIBS); do \
-	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/lib); \
-	done ; \
-	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/usr/lib); \
+	for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
 endif
-- 
2.4.10
