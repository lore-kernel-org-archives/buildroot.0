From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  3 Feb 2016 22:45:29 +0100
Subject: [Buildroot] [PATCH RFC 2/2] toolchain-external: unify library
	locations in target and staging dir
In-Reply-To: <1454535929-25379-1-git-send-email-patrickdepinguin@gmail.com>
References: <1454535929-25379-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1454535929-25379-3-git-send-email-patrickdepinguin@gmail.com>
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
- determine DESTDIR for each library individually based on the location in
  staging.
- treating LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS equivalently

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
 toolchain/helpers.mk                               | 16 +++-------------
 toolchain/toolchain-external/toolchain-external.mk | 14 ++++----------
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ee878e8..aa53c7c 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -47,21 +47,11 @@ copy_toolchain_lib_root = \
 	SUPPORT_LIB_DIR="$(strip $2)" ; \
 	ARCH_LIB_DIR="$(strip $3)" ; \
 	LIB="$(strip $4)"; \
-	DESTDIR="$(strip $5)" ; \
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
index 518afd6..c2076d9 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -604,11 +604,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	if test -z "$(BR2_STATIC_LIBS)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
-		for libs in $(LIB_EXTERNAL_LIBS); do \
-			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
-		done ; \
-		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
+		for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs); \
 		done ; \
 	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
@@ -668,11 +665,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 	        fi ; \
 	fi ; \
-	for libs in $(LIB_EXTERNAL_LIBS); do \
-	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/lib); \
-	done ; \
-	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/usr/lib); \
+	for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs); \
 	done
 endef
 endif
-- 
2.4.10
