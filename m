From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 May 2012 17:08:37 +0200
Subject: [Buildroot] [git commit] external-toolchain: add support for recent
	Linaro toolchains
Message-ID: <20120507153901.7EE1296C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1f0804cc11706648f33a96d68e613b8d6593db3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from 2012.03, the Linaro toolchains have separated the GCC
support libraries (libstdc++, libgcc_s) from the sysroot itself. So we
no longer have the case where all libraries are inside the sysroot, as
we had for all the previously supported toolchains.

Therefore, we add some logic to detect if such a separate directory is
used for GCC support libraries, and if it's the case, we make sure
that we take into account this directory when creating our own
sysroot, and when copying libraries to the target filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                     |   73 ++++++++++++++++++++----------
 toolchain/toolchain-external/ext-tool.mk |   23 ++++++++-
 2 files changed, 69 insertions(+), 27 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index bb1ea90..649b91b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -20,11 +20,16 @@
 #
 #  usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR}
 #
-# Finally, Linaro toolchains have the libraries in lib/<target-name>/,
-# so we need to search libraries in:
+# Linaro toolchains have most libraries in lib/<target-name>/, so we
+# need to search libraries in:
 #
 #  $${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX)
 #
+# And recent Linaro toolchains have the GCC support libraries
+# (libstdc++, libgcc_s, etc.) into a separate directory, outside of
+# the sysroot, that we called the "SUPPORT_LIB_DIR", into which we
+# need to search as well.
+#
 # Thanks to ARCH_LIB_DIR we also take into account toolchains that
 # have the libraries in lib64 and usr/lib64.
 #
@@ -33,35 +38,44 @@
 # modification on the below logic.
 #
 # $1: arch specific sysroot directory
-# $2: library directory ('lib' or 'lib64') from which libraries must be copied
-# $3: library name
-# $4: destination directory of the libary, relative to $(TARGET_DIR)
+# $2: support libraries directory (can be empty)
+# $3: library directory ('lib' or 'lib64') from which libraries must be copied
+# $4: library name
+# $5: destination directory of the libary, relative to $(TARGET_DIR)
 #
 copy_toolchain_lib_root = \
 	ARCH_SYSROOT_DIR="$(strip $1)"; \
-	ARCH_LIB_DIR="$(strip $2)" ; \
-	LIB="$(strip $3)"; \
-	DESTDIR="$(strip $4)" ; \
+	SUPPORT_LIB_DIR="$(strip $2)" ; \
+	ARCH_LIB_DIR="$(strip $3)" ; \
+	LIB="$(strip $4)"; \
+	DESTDIR="$(strip $5)" ; \
  \
-	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
-		find -L $${ARCH_LIB_DIR} usr/$${ARCH_LIB_DIR} usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} $${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
-			-maxdepth 1 -name "$${LIB}.*" 2>/dev/null \
-		)` ; \
-	for FILE in $${LIBS} ; do \
-		LIB=`basename $${FILE}`; \
-		LIBDIR=`dirname $${FILE}` ; \
-		while test \! -z "$${LIB}"; do \
-			FULLPATH="$${ARCH_SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
-			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIB}; \
+	for dir in \
+		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
+		$${ARCH_SYSROOT_DIR}/usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
+		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} \
+		$${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+		$${SUPPORT_LIB_DIR} ; do \
+		LIBSPATH=`find $${dir} -maxdepth 1 -name "$${LIB}.*" 2>/dev/null` ; \
+		if test -n "$${LIBSPATH}" ; then \
+			break ; \
+		fi \
+	done ; \
+	for LIBPATH in $${LIBSPATH} ; do \
+		LIBNAME=`basename $${LIBPATH}`; \
+		LIBDIR=`dirname $${LIBPATH}` ; \
+		while test \! -z "$${LIBNAME}" ; do \
+			LIBPATH=$${LIBDIR}/$${LIBNAME} ; \
+			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
-			if test -h $${FULLPATH} ; then \
-				cp -d $${FULLPATH} $(TARGET_DIR)/$${DESTDIR}/; \
-			elif test -f $${FULLPATH}; then \
-				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIB}; \
+			if test -h $${LIBPATH} ; then \
+				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/; \
+			elif test -f $${LIBPATH}; then \
+				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			else \
 				exit -1; \
 			fi; \
-			LIB="`readlink $${FULLPATH}`"; \
+			LIBNAME="`readlink $${LIBPATH}`"; \
 		done; \
 	done; \
  \
@@ -100,6 +114,11 @@ copy_toolchain_lib_root = \
 #    non-default architecture variant is used. Without this, the
 #    compiler fails to find libraries and headers.
 #
+# Some toolchains (i.e Linaro binary toolchains) store support
+# libraries (libstdc++, libgcc_s) outside of the sysroot, so we simply
+# copy all the libraries from the "support lib directory" into our
+# sysroot.
+#
 # Note that the 'locale' directories are not copied. They are huge
 # (400+MB) in CodeSourcery toolchains, and they are not really useful.
 #
@@ -107,12 +126,15 @@ copy_toolchain_lib_root = \
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
 # $4: directory of libraries ('lib' or 'lib64')
-#
+# $5: support lib directories (for toolchains storing libgcc_s,
+#     libstdc++ and other gcc support libraries outside of the
+#     sysroot)
 copy_toolchain_sysroot = \
 	SYSROOT_DIR="$(strip $1)"; \
 	ARCH_SYSROOT_DIR="$(strip $2)"; \
 	ARCH_SUBDIR="$(strip $3)"; \
 	ARCH_LIB_DIR="$(strip $4)" ; \
+	SUPPORT_LIB_DIR="$(strip $5)" ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr ; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
@@ -131,6 +153,9 @@ copy_toolchain_sysroot = \
 		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
 		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
 	fi ; \
+	if test -n "$${SUPPORT_LIB_DIR}" ; then \
+		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
+	fi ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
 #
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a45603a..2a01d68 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -359,6 +359,17 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 # ARCH_SUBDIR:          the relative location of the sysroot of the selected
 #                       multilib variant compared to the main sysroot.
 #			Ex: mips16/soft-float/el
+#
+# SUPPORT_LIB_DIR:      some toolchains, such as recent Linaro toolchains,
+#                       store GCC support libraries (libstdc++,
+#                       libgcc_s, etc.) outside of the sysroot. In
+#                       this case, SUPPORT_LIB_DIR is set to a
+#                       non-empty value, and points to the directory
+#                       where these support libraries are
+#                       available. Those libraries will be copied to
+#                       our sysroot, and the directory will also be
+#                       considered when searching libraries for copy
+#                       to the target filesystem.
 
 $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
@@ -370,19 +381,25 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
 	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
 	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
+	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+		LIBSTDCPP_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a)` ; \
+		SUPPORT_LIB_DIR=`echo $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+	else \
+		SUPPORT_LIB_DIR="" ; \
+	fi ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
 	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
 		echo "Copy external toolchain libraries to target..." ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
-			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
+			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
 		done ; \
 		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
+			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
 	fi ; \
 	echo "Copy external toolchain sysroot to staging..." ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR}) ; \
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
