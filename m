From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 10:19:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package target
	target/device toolchain etc...
Message-ID: <20070206181938.DD35C4866D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 10:19:38 -0800 (Tue, 06 Feb 2007)
New Revision: 17800

Log:
Support building using an external toolchain. Questions to the mailing list and all other comments to <biteme@devnull.com>.


Added:
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/external-toolchain/
   trunk/buildroot/toolchain/external-toolchain/Config.in
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
   trunk/buildroot/toolchain/gdb/Config.in.2

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/Makefile.in
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-02-06 18:17:31 UTC (rev 17799)
+++ trunk/buildroot/Makefile	2007-02-06 18:19:38 UTC (rev 17800)
@@ -44,7 +44,11 @@
 # along with the packages to build for the target.
 #
 ##############################################################
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
+else
+TARGETS:=uclibc
+endif
 include toolchain/Makefile.in
 include package/Makefile.in
 

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-02-06 18:17:31 UTC (rev 17799)
+++ trunk/buildroot/package/Makefile.in	2007-02-06 18:19:38 UTC (rev 17800)
@@ -19,7 +19,12 @@
 #")
 
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+else
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
+TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
+endif
 HOSTCC:=gcc
 HOSTCXX:=g++
 
@@ -44,13 +49,14 @@
 #PATCH_DIR=$(BASE_DIR)/sources/patches
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 TARGET_DIR:=$(BUILD_DIR)/root
-TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
 #"))
 
 STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
 #"))
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(PATH)"
@@ -59,6 +65,19 @@
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 KERNEL_CROSS=$(STAGING_DIR)/bin/$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)-
 TARGET_CROSS=$(STAGING_DIR)/bin/$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)-
+else
+TOOLCHAIN_EXTERNAL_PREFIX:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PREFIX)))
+#"))
+TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PATH)))
+#"))
+TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
+TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+IMAGE:=$(BASE_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
+REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
+GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
+KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+endif
 TARGET_CC=$(TARGET_CROSS)gcc
 TARGET_CXX=$(TARGET_CROSS)g++
 TARGET_RANLIB=$(TARGET_CROSS)ranlib

Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-02-06 18:17:31 UTC (rev 17799)
+++ trunk/buildroot/target/Makefile.in	2007-02-06 18:19:38 UTC (rev 17800)
@@ -7,4 +7,7 @@
 # and finally build the filesystems/tarballs
 include target/*/*.mk
 # kernel rules
+ifeq ($(BR2_PACKAGE_LINUX),y)
+TARGETS+=linux26
+endif
 include target/linux*.mk

Modified: trunk/buildroot/target/device/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Makefile.in	2007-02-06 18:17:31 UTC (rev 17799)
+++ trunk/buildroot/target/device/Makefile.in	2007-02-06 18:19:38 UTC (rev 17800)
@@ -1,6 +1,3 @@
 TARGET_DEVICE_DEPMOD:=target/device/x86/depmod.pl
 
 -include target/device/*/Makefile.in
-ifeq ($(BR2_PACKAGE_LINUX),y)
-TARGETS+=linux26
-endif

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-02-06 18:17:31 UTC (rev 17799)
+++ trunk/buildroot/toolchain/Config.in	2007-02-06 18:19:38 UTC (rev 17800)
@@ -1,67 +1,20 @@
 #
 
-menu "Toolchain Options"
-
-
-source "toolchain/kernel-headers/Config.in"
-source "toolchain/uClibc/Config.in"
-source "toolchain/binutils/Config.in"
-source "toolchain/gcc/Config.in"
-source "toolchain/ccache/Config.in"
-source "toolchain/gdb/Config.in"
-source "toolchain/elf2flt/Config.in"
-source "toolchain/mklibs/Config.in"
-
-comment "Common Toolchain Options"
-
-source "toolchain/sstrip/Config.in"
-
-config BR2_ENABLE_MULTILIB
-	bool "Enable multilib support?"
-	default n
+choice
+	prompt "Toolchain type"
+	default BR2_TOOLCHAIN_BUILDROOT
 	help
-	    If you want multilib enabled, enable this...
+	  Select whether to use the toolchain built by the buildroot
+	  system or an external pre-built toolchain.
 
-config BR2_LARGEFILE
-	bool "Enable large file (files > 2 GB) support?"
-	depends on !BR2_cris
-	default y
-	help
-	    Enable large file (files > 2 GB) support
+config BR2_TOOLCHAIN_BUILDROOT
+	bool
+	prompt "Buildroot toolchain"
 
-config BR2_SOFT_FLOAT
-	bool "Use software floating point by default"
-	default n
-	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
-	help
-	  If your target CPU does not have a Floating Point Unit (FPU) or a
-	  kernel FPU emulator, but you still wish to support floating point
-	  functions, then everything will need to be compiled with soft
-	  floating point support (-msoft-float).
+config BR2_TOOLCHAIN_EXTERNAL
+	bool
+	prompt " External toolchain"
+endchoice
 
-	  Most people will answer N.
-
-#config BR2_SOFT_FLOAT_FP
-#	bool "Use softfp"
-#	default n
-
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
-	help
-	  Optimizations to use when building for the target host.
-
-config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
-	bool "Include target utils in cross toolchain"
-	default y
-	help
-	  When using buildroot to build a deployable cross toolchain,
-	  it is handy to include certain target apps with that toolchain
-	  as a convenience.
-	  Examples include ldd, gdbserver, and strace.
-
-	  Answer Y if you want these apps (if built) copied into the
-	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
-
-endmenu
-
+source "toolchain/Config.in.2"
+source "toolchain/external-toolchain/Config.in"

Added: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	                        (rev 0)
+++ trunk/buildroot/toolchain/Config.in.2	2007-02-06 18:19:38 UTC (rev 17800)
@@ -0,0 +1,66 @@
+#
+
+menu "Toolchain Options"
+	depends on BR2_TOOLCHAIN_BUILDROOT
+
+source "toolchain/kernel-headers/Config.in"
+source "toolchain/uClibc/Config.in"
+source "toolchain/binutils/Config.in"
+source "toolchain/gcc/Config.in"
+source "toolchain/ccache/Config.in"
+source "toolchain/gdb/Config.in"
+source "toolchain/elf2flt/Config.in"
+source "toolchain/mklibs/Config.in"
+
+comment "Common Toolchain Options"
+
+source "toolchain/sstrip/Config.in"
+
+config BR2_ENABLE_MULTILIB
+	bool "Enable multilib support?"
+	default n
+	help
+	    If you want multilib enabled, enable this...
+
+config BR2_LARGEFILE
+	bool "Enable large file (files > 2 GB) support?"
+	depends on !BR2_cris
+	default y
+	help
+	    Enable large file (files > 2 GB) support
+
+config BR2_SOFT_FLOAT
+	bool "Use software floating point by default"
+	default n
+	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU) or a
+	  kernel FPU emulator, but you still wish to support floating point
+	  functions, then everything will need to be compiled with soft
+	  floating point support (-msoft-float).
+
+	  Most people will answer N.
+
+#config BR2_SOFT_FLOAT_FP
+#	bool "Use softfp"
+#	default n
+
+config BR2_TARGET_OPTIMIZATION
+	string "Target Optimizations"
+	default "-Os -pipe"
+	help
+	  Optimizations to use when building for the target host.
+
+config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
+	bool "Include target utils in cross toolchain"
+	default y
+	help
+	  When using buildroot to build a deployable cross toolchain,
+	  it is handy to include certain target apps with that toolchain
+	  as a convenience.
+	  Examples include ldd, gdbserver, and strace.
+
+	  Answer Y if you want these apps (if built) copied into the
+	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
+
+endmenu

Added: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	                        (rev 0)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-02-06 18:19:38 UTC (rev 17800)
@@ -0,0 +1,72 @@
+#
+
+menu "Toolchain Options"
+	depends on BR2_TOOLCHAIN_EXTERNAL
+
+config BR2_TOOLCHAIN_EXTERNAL_LIB_C
+	string "The core C library from the external toolchain"
+	default "libc.so.6"
+	help
+	  Specify the core C shared library found in the external
+	  toolchain. This is required in addition to any other
+	  libraries to be copied.
+
+config BR2_TOOLCHAIN_EXTERNAL_LIBS
+	string "Libraries to copy from the external toolchain"
+	default ""
+	help
+	  A space separated list of the shared libraries to be copied
+	  from the external toolchain into the root filesystem. Only
+	  the top-level name is needed, i.e. libc.so, libpthread.so as
+	  the actual shared library symlinked to will be copied also.
+
+config BR2_TOOLCHAIN_EXTERNAL_STRIP
+        bool
+        default y
+        prompt "Strip shared libraries"
+	help
+	  Strip shared libraries copied from the external toolchain.
+
+source "toolchain/gdb/Config.in.2"
+
+comment "Common Toolchain Options"
+
+config BR2_TOOLCHAIN_EXTERNAL_PATH
+	string "External toolchain path"
+	default ""
+	help
+	  Path to where the external toolchain is installed.
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	string "External toolchain prefix"
+	default ""
+	help
+	  This the the external toolchain prefix. For example:
+	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
+
+config BR2_LARGEFILE
+	bool "Enable large file (files > 2 GB) support?"
+	depends on !BR2_cris
+	default y
+	help
+	  Enable large file (files > 2 GB) support
+
+config BR2_SOFT_FLOAT
+	bool "Use software floating point by default"
+	default n
+	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU) or a
+	  kernel FPU emulator, but you still wish to support floating point
+	  functions, then everything will need to be compiled with soft
+	  floating point support (-msoft-float).
+
+	  Most people will answer N.
+
+config BR2_TARGET_OPTIMIZATION
+	string "Target Optimizations"
+	default "-Os -pipe"
+	help
+	  Optimizations to use when building for the target host.
+
+endmenu

Added: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	                        (rev 0)
+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2007-02-06 18:19:38 UTC (rev 17800)
@@ -0,0 +1,56 @@
+#
+# copy_toolchain_lib_root
+#
+# $1: source
+# $2: destination
+# $2: strip (y|n)	default is to strip
+#
+copy_toolchain_lib_root =									\
+	LIB="$(strip $1)";									\
+	DST="$(strip $2)";									\
+	STRIP="$(strip $3)";									\
+												\
+	LIB_DIR=`$(TARGET_CC) -print-file-name=$${LIB} | sed -e "s,/$${LIB}\$$,,"`;		\
+												\
+	if test -z "$${LIB_DIR}"; then								\
+		echo "copy_toolchain_lib_root: lib=$${LIB} not found";				\
+		exit -1;									\
+	fi;											\
+												\
+	LIB="$(strip $1)";									\
+	for FILE in `find $${LIB_DIR} -type l -name "$${LIB}*" -maxdepth 1`; do			\
+		LIB=`basename $${FILE}`;							\
+		while test \! -z "$${LIB}"; do							\
+			echo "copy_toolchain_lib_root lib=$${LIB} dst=$${DST}";			\
+			rm -fr $(TARGET_DIR)$${DST}/$${LIB};					\
+			mkdir -p $(TARGET_DIR)$${DST};						\
+			if test -h $${LIB_DIR}/$${LIB}; then					\
+				cp -d $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/;			\
+			elif test -f $${LIB_DIR}/$${LIB}; then					\
+				cp $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB};	\
+				case "$${STRIP}" in						\
+				(0 | n | no)							\
+					;;							\
+				(*)								\
+					$(TARGET_CROSS)strip "$(TARGET_DIR)$${DST}/$${LIB}";		\
+					;;							\
+				esac;								\
+			else									\
+				exit -1;							\
+			fi;									\
+			LIB="`readlink $${LIB_DIR}/$${LIB}`";					\
+		done;										\
+	done;											\
+												\
+	echo -n
+
+uclibc: dependencies $(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)))
+
+$(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))):
+#"))
+	mkdir -p $(TARGET_DIR)/lib
+	@$(call copy_toolchain_lib_root, $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
+#")))
+	for libs in $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIBS))) ; do \
+		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)) ; \
+	done

Added: trunk/buildroot/toolchain/gdb/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in.2	                        (rev 0)
+++ trunk/buildroot/toolchain/gdb/Config.in.2	2007-02-06 18:19:38 UTC (rev 17800)
@@ -0,0 +1,55 @@
+# Keep this in sync with Config.in
+
+comment "Gdb Options"
+
+config BR2_PACKAGE_GDB
+	bool "Build gdb debugger for the Target"
+	default n
+	select BR2_PACKAGE_NCURSES
+	help
+	    Build the full gdb debugger to run on the target.
+
+config BR2_PACKAGE_GDB_SERVER
+	bool "Build gdb server for the Target"
+	default n
+	help
+	    Build the gdbserver stub to run on the target.
+	    A full gdb is needed to debug the progam.
+
+config BR2_PACKAGE_GDB_HOST
+	bool "Build gdb for the Host"
+	default n
+	help
+	    Build gdb to run on the host to debug programs run on the target.
+
+choice
+	prompt "GDB debugger Version"
+	default BR2_GDB_VERSION_6_3
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
+	help
+	  Select the version of gdb you wish to use.
+
+	config BR2_EXT_GDB_VERSION_6_2_1
+		bool "gdb 6.2.1"
+
+	config BR2_EXT_GDB_VERSION_6_3
+		bool "gdb 6.3"
+
+	config BR2_EXT_GDB_VERSION_6_4
+		bool "gdb 6.4"
+
+	config BR2_EXT_GDB_VERSION_6_5
+		bool "gdb 6.5"
+
+	config BR2_EXT_GDB_VERSION_SNAPSHOT
+		bool "gdb snapshot"
+
+endchoice
+
+config BR2_EXT_GDB_VERSION
+	string
+	default "6.2.1"    if BR2_EXT_GDB_VERSION_6_2_1
+	default "6.3"      if BR2_EXT_GDB_VERSION_6_3
+	default "6.4"      if BR2_EXT_GDB_VERSION_6_4
+	default "6.5"      if BR2_EXT_GDB_VERSION_6_5
+	default "snapshot" if BR2_EXT_GDB_VERSION_SNAPSHOT

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-06 18:17:31 UTC (rev 17799)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-06 18:19:38 UTC (rev 17800)
@@ -4,6 +4,7 @@
 #
 #############################################################
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 # Be aware that this changes daily....
@@ -339,3 +340,4 @@
 uclibc_target-dirclean:
 	rm -rf $(TARGET_DIR)/usr/include
 
+endif
