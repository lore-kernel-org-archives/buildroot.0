From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:24 +0200
Subject: [Buildroot] [PATCH 23/30] toolchain/toolchain-external: move
	functions and utility logic into a separate file
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-24-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-toolchain-external-utils.mk for the utility functions mainly
used to copy the libraries to the target, to copy the toolchain
sysroot, etc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../pkg-toolchain-external-utils.mk                | 212 +++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 172 -----------------
 2 files changed, 212 insertions(+), 172 deletions(-)
 create mode 100644 toolchain/toolchain-external/pkg-toolchain-external-utils.mk

diff --git a/toolchain/toolchain-external/pkg-toolchain-external-utils.mk b/toolchain/toolchain-external/pkg-toolchain-external-utils.mk
new file mode 100644
index 0000000..2c7b6be
--- /dev/null
+++ b/toolchain/toolchain-external/pkg-toolchain-external-utils.mk
@@ -0,0 +1,212 @@
+#
+# This file contains various utility functions used by the external
+# toolchain package infrastructure. Those functions are mainly
+# responsible for:
+#
+#   - installation the toolchain libraries to $(TARGET_DIR)
+#   - copying the toolchain sysroot to $(STAGING_DIR)
+#   - installing a gdbinit file
+#
+# Details about sysroot directory selection.
+#
+# To find the sysroot directory, we use the trick of looking for the
+# 'libc.a' file with the -print-file-name gcc option, and then
+# mangling the path to find the base directory of the sysroot.
+#
+# Note that we do not use the -print-sysroot option, because it is
+# only available since gcc 4.4.x, and we only recently dropped support
+# for 4.2.x and 4.3.x.
+#
+# When doing this, we don't pass any option to gcc that could select a
+# multilib variant (such as -march) as we want the "main" sysroot,
+# which contains all variants of the C library in the case of multilib
+# toolchains. We use the TARGET_CC_NO_SYSROOT variable, which is the
+# path of the cross-compiler, without the --sysroot=$(STAGING_DIR),
+# since what we want to find is the location of the original toolchain
+# sysroot. This "main" sysroot directory is stored in SYSROOT_DIR.
+#
+# Then, multilib toolchains are a little bit more complicated, since
+# they in fact have multiple sysroots, one for each variant supported
+# by the toolchain. So we need to find the particular sysroot we're
+# interested in.
+#
+# To do so, we ask the compiler where its sysroot is by passing all
+# flags (including -march and al.), except the --sysroot flag since we
+# want to the compiler to tell us where its original sysroot
+# is. ARCH_SUBDIR will contain the subdirectory, in the main
+# SYSROOT_DIR, that corresponds to the selected architecture
+# variant. ARCH_SYSROOT_DIR will contain the full path to this
+# location.
+#
+# One might wonder why we don't just bother with ARCH_SYSROOT_DIR. The
+# fact is that in multilib toolchains, the header files are often only
+# present in the main sysroot, and only the libraries are available in
+# each variant-specific sysroot directory.
+
+# toolchain_find_sysroot returns the sysroot location for the given
+# compiler + flags. We need to handle cases where libc.a is in:
+#
+#  - lib/
+#  - usr/lib/
+#  - lib32/
+#  - lib64/
+#  - lib32-fp/ (Cavium toolchain)
+#  - lib64-fp/ (Cavium toolchain)
+#  - usr/lib/<tuple>/ (Linaro toolchain)
+#
+# And variations on these.
+define toolchain_find_sysroot
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
+endef
+
+# Returns the lib subdirectory for the given compiler + flags (i.e
+# typically lib32 or lib64 for some toolchains)
+define toolchain_find_libdir
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
+endef
+
+# Returns the location of the libc.a file for the given compiler + flags
+define toolchain_find_libc_a
+$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
+endef
+
+# Integration of the toolchain into Buildroot: find the main sysroot
+# and the variant-specific sysroot, then copy the needed libraries to
+# the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
+# to $(STAGING_DIR).
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
+#                       usr/lib[32|64]/libc.a part of the path.
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
+#                       usr/lib[32|64]/libc.a at the end of the path.
+#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/
+#
+# ARCH_LIB_DIR:         'lib', 'lib32' or 'lib64' depending on where libraries
+#                       are stored. Deduced from ARCH_LIBC_A_LOCATION by
+#                       looking at usr/lib??/libc.a.
+#                       Ex: lib
+#
+# ARCH_SUBDIR:          the relative location of the sysroot of the selected
+#                       multilib variant compared to the main sysroot.
+#			Ex: mips16/soft-float/el
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
+
+# $1: toolchain LIBS
+ifeq ($(BR2_STATIC_LIBS),)
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
+	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
+	$(Q)for libs in $(1); do \
+		$(call copy_toolchain_lib_root,$$libs); \
+	done
+endef
+endif
+
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+# $3: toolchain INSTALL_DIR
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
+	$(Q)$(call MESSAGE,"Copying gdbserver")
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(1) $(2))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(1) $(2))" ; \
+	gdbserver_found=0 ; \
+	for d in $${ARCH_SYSROOT_DIR}/usr \
+		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
+		 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+		 $(3); do \
+		if test -f $${d}/bin/gdbserver ; then \
+			install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
+			gdbserver_found=1 ; \
+			break ; \
+		fi ; \
+	done ; \
+	if [ $${gdbserver_found} -eq 0 ] ; then \
+		echo "Could not find gdbserver in external toolchain" ; \
+		exit 1 ; \
+	fi
+endef
+endif
+
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(1))" ; \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(1) $(2))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(1) $(2))" ; \
+	SUPPORT_LIB_DIR="" ; \
+	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+		LIBSTDCPP_A_LOCATION=$$(LANG=C $(1) $(2) -print-file-name=libstdc++.a) ; \
+		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
+			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+		fi ; \
+	fi ; \
+	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
+endef
+
+# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
+# Note: the skeleton package additionally creates lib32->lib or lib64->lib
+# (as appropriate)
+#
+# $1: destination directory (TARGET_DIR / STAGING_DIR)
+# $2: toolchain CC
+# $3: toolchain CFLAGS
+create_lib_symlinks = \
+       $(Q)DESTDIR="$(strip $1)" ; \
+       TOOLCHAIN_CC="$(strip $2)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
+       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
+       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
+               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
+       fi
+
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
+       $(call create_lib_symlinks,$(STAGING_DIR),$(1),$(2))
+endef
+
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
+       $(call create_lib_symlinks,$(TARGET_DIR),$(1),$(2))
+endef
+
+#
+# Generate gdbinit file for use with Buildroot
+#
+define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
+	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
+		$(call MESSAGE,"Installing gdbinit"); \
+		$(call gen_gdbinit_file) ; \
+	fi
+endef
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 46134f2..c997a0a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -467,33 +467,6 @@ TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
 	TOOLCHAIN_EXTERNAL_MOVE
 endif
 
-# Returns the location of the libc.a file for the given compiler + flags
-define toolchain_find_libc_a
-$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
-endef
-
-# Returns the sysroot location for the given compiler + flags. We need
-# to handle cases where libc.a is in:
-#
-#  - lib/
-#  - usr/lib/
-#  - lib32/
-#  - lib64/
-#  - lib32-fp/ (Cavium toolchain)
-#  - lib64-fp/ (Cavium toolchain)
-#  - usr/lib/<tuple>/ (Linaro toolchain)
-#
-# And variations on these.
-define toolchain_find_sysroot
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
-endef
-
-# Returns the lib subdirectory for the given compiler + flags (i.e
-# typically lib32 or lib64 for some toolchains)
-define toolchain_find_libdir
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
-endef
-
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it is usable, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
@@ -549,141 +522,6 @@ endef
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
 endif
 
-# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
-# Note: the skeleton package additionally creates lib32->lib or lib64->lib
-# (as appropriate)
-#
-# $1: destination directory (TARGET_DIR / STAGING_DIR)
-# $2: toolchain CC
-# $3: toolchain CFLAGS
-create_lib_symlinks = \
-       $(Q)DESTDIR="$(strip $1)" ; \
-       TOOLCHAIN_CC="$(strip $2)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
-       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
-               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
-               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
-       fi
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
-       $(call create_lib_symlinks,$(STAGING_DIR),$(1),$(2))
-endef
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
-       $(call create_lib_symlinks,$(TARGET_DIR),$(1),$(2))
-endef
-
-# Integration of the toolchain into Buildroot: find the main sysroot
-# and the variant-specific sysroot, then copy the needed libraries to
-# the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
-# to $(STAGING_DIR).
-#
-# Variables are defined as follows:
-#
-#  LIBC_A_LOCATION:     location of the libc.a file in the default
-#                       multilib variant (allows to find the main
-#                       sysroot directory)
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/usr/lib/libc.a
-#
-#  SYSROOT_DIR:         the main sysroot directory, deduced from
-#                       LIBC_A_LOCATION by removing the
-#                       usr/lib[32|64]/libc.a part of the path.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/
-#
-# ARCH_LIBC_A_LOCATION: location of the libc.a file in the selected
-#                       multilib variant (taking into account the
-#                       CFLAGS). Allows to find the sysroot of the
-#                       selected multilib variant.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/usr/lib/libc.a
-#
-# ARCH_SYSROOT_DIR:     the sysroot of the selected multilib variant,
-#                       deduced from ARCH_LIBC_A_LOCATION by removing
-#                       usr/lib[32|64]/libc.a at the end of the path.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/
-#
-# ARCH_LIB_DIR:         'lib', 'lib32' or 'lib64' depending on where libraries
-#                       are stored. Deduced from ARCH_LIBC_A_LOCATION by
-#                       looking at usr/lib??/libc.a.
-#                       Ex: lib
-#
-# ARCH_SUBDIR:          the relative location of the sysroot of the selected
-#                       multilib variant compared to the main sysroot.
-#			Ex: mips16/soft-float/el
-#
-# SUPPORT_LIB_DIR:      some toolchains, such as recent Linaro toolchains,
-#                       store GCC support libraries (libstdc++,
-#                       libgcc_s, etc.) outside of the sysroot. In
-#                       this case, SUPPORT_LIB_DIR is set to a
-#                       non-empty value, and points to the directory
-#                       where these support libraries are
-#                       available. Those libraries will be copied to
-#                       our sysroot, and the directory will also be
-#                       considered when searching libraries for copy
-#                       to the target filesystem.
-#
-# Please be very careful to check the major toolchain sources:
-# Buildroot, Crosstool-NG, CodeSourcery and Linaro
-# before doing any modification on the below logic.
-
-# $1: toolchain LIBS
-ifeq ($(BR2_STATIC_LIBS),)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
-	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
-	$(Q)for libs in $(1); do \
-		$(call copy_toolchain_lib_root,$$libs); \
-	done
-endef
-endif
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-# $3: toolchain INSTALL_DIR
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
-	$(Q)$(call MESSAGE,"Copying gdbserver")
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(1) $(2))" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(1) $(2))" ; \
-	gdbserver_found=0 ; \
-	for d in $${ARCH_SYSROOT_DIR}/usr \
-		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
-		 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
-		 $(3); do \
-		if test -f $${d}/bin/gdbserver ; then \
-			install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
-			gdbserver_found=1 ; \
-			break ; \
-		fi ; \
-	done ; \
-	if [ $${gdbserver_found} -eq 0 ] ; then \
-		echo "Could not find gdbserver in external toolchain" ; \
-		exit 1 ; \
-	fi
-endef
-endif
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(1))" ; \
-	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(1) $(2))" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(1) $(2))" ; \
-	SUPPORT_LIB_DIR="" ; \
-	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-		LIBSTDCPP_A_LOCATION=$$(LANG=C $(1) $(2) -print-file-name=libstdc++.a) ; \
-		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
-			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-		fi ; \
-	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
-	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
-endef
-
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
@@ -766,16 +604,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	done
 endef
 
-#
-# Generate gdbinit file for use with Buildroot
-#
-define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
-	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
-		$(call MESSAGE,"Installing gdbinit"); \
-		$(gen_gdbinit_file); \
-	fi
-endef
-
 # uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
 # patched specifically for uClibc-ng, so it continues to generate
 # binaries that expect the dynamic loader to be named ld-uClibc.so.0,
-- 
2.5.5
