From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:43 +0100
Subject: [Buildroot] [PATCH 03/16] Improve external toolchain logic to
	support IA32 Sourcery CodeBench toolchain
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3c46baf71046c9d39f6ac582593e7c7b8ebdb875.1327772176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The IA32 Sourcery CodeBench toolchain has a relatively special
structure, with the following multilib variants:

 * Intel Pentium 4, 32 bits, the multilib variant is in ./ relative to
   the main sysroot, with the libraries in the lib/ directory.

 * Intel Xeon Nocona, 64 bits, the multilib variant is in ./ relative
   to the main sysroot, with the libraries in the lib64/ directory.

 * Intel Atom 32 bits, the multilib variant is in atom/ relative to
   the main sysroot, with the libraries in the lib/ directory.

 * Intel Core 2 64 bits, the multilib variant is in core2/ relative to
   the main sysroot, with the libraries in lib64/ directory.

So the first two variants are in the same sysroot, only the name of
the directory for the libraries is different.

Therefore, we introduce a new ARCH_LIB_DIR variable, which contains
either 'lib' or 'lib64'. This variable is defined according to the
location of the libc.a file for the selected multilib variant, and is
then used when copying the libraries to the target and to the staging
directory.

In addition to this, we no longer use the -print-multi-directory to
get the ARCH_SUBDIR, since in the case of the 64 bits variants of this
toolchain, it returns just '64' and not a real path. Instead, we
simply compute the difference between the arch-specific sysroot and
the main sysroot.

We also take that opportunity to expand the documentation on the
meaning of the different variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                     |   19 ++++++----
 toolchain/toolchain-external/ext-tool.mk |   57 +++++++++++++++++++++++-------
 2 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 65cc998..4c3f240 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -10,19 +10,22 @@
 # Most toolchains have their libraries either in /lib or /usr/lib
 # relative to their ARCH_SYSROOT_DIR. Buildroot toolchains, however,
 # have basic libraries in /lib, and libstdc++/libgcc_s in
-# /usr/<target-name>/lib(64).
+# /usr/<target-name>/lib(64). Thanks to ARCH_LIB_DIR we also take into
+# account toolchains that have the libraries in lib64 and usr/lib64.
 #
 # $1: arch specific sysroot directory
-# $2: library name
-# $3: destination directory of the libary, relative to $(TARGET_DIR)
+# $2: library directory ('lib' or 'lib64') from which libraries must be copied
+# $3: library name
+# $4: destination directory of the libary, relative to $(TARGET_DIR)
 #
 copy_toolchain_lib_root = \
 	ARCH_SYSROOT_DIR="$(strip $1)"; \
-	LIB="$(strip $2)"; \
-	DESTDIR="$(strip $3)" ; \
+	ARCH_LIB_DIR="$(strip $2)" ; \
+	LIB="$(strip $3)"; \
+	DESTDIR="$(strip $4)" ; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
-		find -L lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib* \
+		find -L $${ARCH_LIB_DIR} usr/$${ARCH_LIB_DIR} usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
 			-maxdepth 1 -name "$${LIB}.*" 2>/dev/null \
 		)` ; \
 	for FILE in $${LIBS} ; do \
@@ -84,12 +87,14 @@ copy_toolchain_lib_root = \
 # $1: main sysroot directory of the toolchain
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
+# $4: directory of libraries ('lib' or 'lib64')
 #
 copy_toolchain_sysroot = \
 	SYSROOT_DIR="$(strip $1)"; \
 	ARCH_SYSROOT_DIR="$(strip $2)"; \
 	ARCH_SUBDIR="$(strip $3)"; \
-	for i in etc lib sbin usr ; do \
+	ARCH_LIB_DIR="$(strip $4)" ; \
+	for i in etc $${ARCH_LIB_DIR} sbin usr ; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 		fi ; \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 2ac4973..eb8ed4f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -267,10 +267,8 @@ endif
 $(STAMP_DIR)/ext-toolchain-checked:
 	@echo "Checking external toolchain settings"
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)SYSROOT_DIR=`$(TOOLCHAIN_EXTERNAL_CC) -print-sysroot 2>/dev/null` ; \
-	if test -z "$${SYSROOT_DIR}" ; then \
-		SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
-	fi ; \
+	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
@@ -292,27 +290,60 @@ $(STAMP_DIR)/ext-toolchain-checked:
 # and the variant-specific sysroot, then copy the needed libraries to
 # the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
 # to $(STAGING_DIR).
+#
+# Variables are defined as follows:
+#
+#  LIBC_A_LOCATION:     location of the libc.a file in the default
+#                       multilib variant (allows to find the main
+#                       sysroot directory)
+#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/usr/lib/libc.a
+#
+#  SYSROOT_DIR:         the main sysroot directory, deduced from
+#                       LIBC_A_LOCATION by removing the
+#                       usr/lib[64]/libc.a part of the path.
+#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/
+#
+# ARCH_LIBC_A_LOCATION: location of the libc.a file in the selected
+#                       multilib variant (taking into account the
+#                       CFLAGS). Allows to find the sysroot of the
+#                       selected multilib variant.
+#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/usr/lib/libc.a
+#
+# ARCH_SYSROOT_DIR:     the sysroot of the selected multilib variant,
+#                       deduced from ARCH_LIBC_A_LOCATION by removing
+#                       usr/lib[64]/libc.a at the end of the path.
+#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/
+#
+# ARCH_LIB_DIR:         'lib' or 'lib64' depending on where libraries are
+#                       stored. Deduced from ARCH_LIBC_A_LOCATION by
+#                       looking at usr/lib??/libc.a.
+#                       Ex: lib
+#
+# ARCH_SUBDIR:          the relative location of the sysroot of the selected
+#                       multilib variant compared to the main sysroot.
+#			Ex: mips16/soft-float/el
+
 $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
-	$(Q)SYSROOT_DIR=`$(TOOLCHAIN_EXTERNAL_CC) -print-sysroot 2>/dev/null` ; \
-	if test -z "$${SYSROOT_DIR}" ; then \
-		SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
-	fi ; \
+	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	ARCH_SUBDIR=`$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-multi-directory` ; \
-	ARCH_SYSROOT_DIR=$${SYSROOT_DIR}/$${ARCH_SUBDIR} ; \
+	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
+	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/libc\.a::'` ; \
+	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/libc.a:\1:'` ; \
+	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
 	echo "Copy external toolchain libraries to target..." ; \
 	for libs in $(LIB_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/lib); \
+		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
 	done ; \
 	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/usr/lib); \
+		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 	done ; \
 	echo "Copy external toolchain sysroot to staging..." ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR}) ; \
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR}) ; \
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
-- 
1.7.4.1
