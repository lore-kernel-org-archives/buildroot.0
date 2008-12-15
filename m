From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 15 Dec 2008 07:28:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain:
	external-toolchain gdb
Message-ID: <20081215152848.8ACC03C2C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-15 07:28:48 -0800 (Mon, 15 Dec 2008)
New Revision: 24418

Log:
toolchain: use same gdb Config.in for internal/external toolchains

We used to use different gdb configs for internal and external toolchains
because mconf won't source the same file twice. This works, but is kind of
sub optimal, as people forget to keep them in sync.

Fix it to use the same file for both situations by shuffling around the
config options a bit. Should work identical to before (except for the newer
gdb versions available for ext).

Added:
   trunk/buildroot/toolchain/Config.in.1
   trunk/buildroot/toolchain/external-toolchain/Config.in.2

Removed:
   trunk/buildroot/toolchain/gdb/Config.in.2

Modified:
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/external-toolchain/Config.in
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2008-12-15 11:26:36 UTC (rev 24417)
+++ trunk/buildroot/toolchain/Config.in	2008-12-15 15:28:48 UTC (rev 24418)
@@ -28,7 +28,16 @@
 
 source "target/device/Config.in.toolchain"
 
-source "toolchain/Config.in.2"
+source "toolchain/Config.in.1"
 source "toolchain/external-toolchain/Config.in"
 
+# we want gdb config in the middle of both source and external
+# toolchains, but mconf won't let us source the same file twice,
+# so put it here instead
+source "toolchain/gdb/Config.in"
+comment "Common Toolchain Options"
+
+source "toolchain/Config.in.2"
+source "toolchain/external-toolchain/Config.in.2"
+
 endmenu

Added: trunk/buildroot/toolchain/Config.in.1
===================================================================
--- trunk/buildroot/toolchain/Config.in.1	                        (rev 0)
+++ trunk/buildroot/toolchain/Config.in.1	2008-12-15 15:28:48 UTC (rev 24418)
@@ -0,0 +1,9 @@
+#
+
+if BR2_TOOLCHAIN_SOURCE
+source "toolchain/kernel-headers/Config.in"
+source "toolchain/uClibc/Config.in"
+source "toolchain/binutils/Config.in"
+source "toolchain/gcc/Config.in"
+source "toolchain/ccache/Config.in"
+endif

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2008-12-15 11:26:36 UTC (rev 24417)
+++ trunk/buildroot/toolchain/Config.in.2	2008-12-15 15:28:48 UTC (rev 24418)
@@ -1,15 +1,6 @@
 #
 
 if BR2_TOOLCHAIN_SOURCE
-source "toolchain/kernel-headers/Config.in"
-source "toolchain/uClibc/Config.in"
-source "toolchain/binutils/Config.in"
-source "toolchain/gcc/Config.in"
-source "toolchain/ccache/Config.in"
-source "toolchain/gdb/Config.in"
-
-comment "Common Toolchain Options"
-
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2008-12-15 11:26:36 UTC (rev 24417)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2008-12-15 15:28:48 UTC (rev 24418)
@@ -1,9 +1,6 @@
 #
 
 if BR2_TOOLCHAIN_EXTERNAL
-comment "External Toolchain Options"
-
-
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C
 	string "The core C library from the external toolchain"
 	default "libc.so.0"
@@ -27,82 +24,4 @@
         prompt "Strip shared libraries"
 	help
 	  Strip shared libraries copied from the external toolchain.
-
-comment "Common Toolchain Options"
-
-source "toolchain/gdb/Config.in.2"
-
-config BR2_TOOLCHAIN_EXTERNAL_PATH
-	string "External toolchain path"
-	default "/path/to/staging_dir/usr"
-	help
-	  Path to where the external toolchain is installed.
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	string "External toolchain prefix"
-	default "$(ARCH)-linux"
-	help
-	  This the the external toolchain prefix. For example:
-	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
-
-choice
-	prompt "Thread library implementation"
-	default BR2_EXT_PTHREADS_OLD
-	help
-	  Select the version of libpthreads used in the external toolchain.
-
-	config BR2_EXT_PTHREADS_NONE
-		bool
-		prompt "none"
-
-	config BR2_EXT_PTHREADS
-		bool
-		prompt "linuxthreads"
-
-	config BR2_EXT_PTHREADS_OLD
-		bool
-		prompt "linuxthreads (stable/old)"
-
-	config BR2_EXT_PTHREADS_NATIVE
-		bool
-		prompt "Native POSIX Threading (NPTL)"
-endchoice
-
-config BR2_LARGEFILE
-	bool "Toolchain supports large files (> 2 GB) ?"
-	depends on !BR2_cris
-	default y
-	help
-	  Set this option if the external toolchain supports large
-	  files (> 2 GB)
-
-
-config BR2_INET_IPV6
-	bool "Toolchain supports IPv6 ?"
-	help
-	  Set this option if the external toolchain supports IPv6.
-
-config BR2_INET_RPC
-	bool "Toolchain supports RPC ?"
-	help
-	  Set this option if the external toolchain supports RPC.
-
-config BR2_SOFT_FLOAT
-	bool "Toolchain supports soft float ?"
-	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
-	help
-	  Set this option if the external toolchain supports soft float.
-
-config BR2_GCC_CROSS_CXX
-	bool "Toolchain has C++ cross-compiler ?"
-	help
-	  Set this option if the external toolchain has a C++
-	  cross-compiler.
-
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
-	help
-	  Optimizations to use when building for the target host.
-
 endif

Added: trunk/buildroot/toolchain/external-toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in.2	                        (rev 0)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in.2	2008-12-15 15:28:48 UTC (rev 24418)
@@ -0,0 +1,77 @@
+#
+
+if BR2_TOOLCHAIN_EXTERNAL
+config BR2_TOOLCHAIN_EXTERNAL_PATH
+	string "External toolchain path"
+	default "/path/to/staging_dir/usr"
+	help
+	  Path to where the external toolchain is installed.
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	string "External toolchain prefix"
+	default "$(ARCH)-linux"
+	help
+	  This the the external toolchain prefix. For example:
+	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
+
+choice
+	prompt "Thread library implementation"
+	default BR2_EXT_PTHREADS_OLD
+	help
+	  Select the version of libpthreads used in the external toolchain.
+
+	config BR2_EXT_PTHREADS_NONE
+		bool
+		prompt "none"
+
+	config BR2_EXT_PTHREADS
+		bool
+		prompt "linuxthreads"
+
+	config BR2_EXT_PTHREADS_OLD
+		bool
+		prompt "linuxthreads (stable/old)"
+
+	config BR2_EXT_PTHREADS_NATIVE
+		bool
+		prompt "Native POSIX Threading (NPTL)"
+endchoice
+
+config BR2_LARGEFILE
+	bool "Toolchain supports large files (> 2 GB) ?"
+	depends on !BR2_cris
+	default y
+	help
+	  Set this option if the external toolchain supports large
+	  files (> 2 GB)
+
+
+config BR2_INET_IPV6
+	bool "Toolchain supports IPv6 ?"
+	help
+	  Set this option if the external toolchain supports IPv6.
+
+config BR2_INET_RPC
+	bool "Toolchain supports RPC ?"
+	help
+	  Set this option if the external toolchain supports RPC.
+
+config BR2_SOFT_FLOAT
+	bool "Toolchain supports soft float ?"
+	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
+	help
+	  Set this option if the external toolchain supports soft float.
+
+config BR2_GCC_CROSS_CXX
+	bool "Toolchain has C++ cross-compiler ?"
+	help
+	  Set this option if the external toolchain has a C++
+	  cross-compiler.
+
+config BR2_TARGET_OPTIMIZATION
+	string "Target Optimizations"
+	default "-Os -pipe"
+	help
+	  Optimizations to use when building for the target host.
+
+endif

Deleted: trunk/buildroot/toolchain/gdb/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in.2	2008-12-15 11:26:36 UTC (rev 24417)
+++ trunk/buildroot/toolchain/gdb/Config.in.2	2008-12-15 15:28:48 UTC (rev 24418)
@@ -1,54 +0,0 @@
-# Keep this in sync with Config.in
-# Why don't you use Config.in in the first place?
-
-comment "Gdb Options"
-
-config BR2_PACKAGE_GDB
-	bool "Build gdb debugger for the Target"
-	select BR2_PACKAGE_NCURSES
-	help
-	    Build the full gdb debugger to run on the target.
-
-config BR2_PACKAGE_GDB_SERVER
-	bool "Build gdb server for the Target"
-	help
-	    Build the gdbserver stub to run on the target.
-	    A full gdb is needed to debug the progam.
-
-config BR2_PACKAGE_GDB_HOST
-	bool "Build gdb for the Host"
-	help
-	    Build gdb to run on the host to debug programs run on the target.
-
-choice
-	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_3
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
-	help
-	  Select the version of gdb you wish to use.
-
-	config BR2_EXT_GDB_VERSION_6_2_1
-		bool "gdb 6.2.1"
-
-	config BR2_EXT_GDB_VERSION_6_3
-		bool "gdb 6.3"
-
-	config BR2_EXT_GDB_VERSION_6_4
-		bool "gdb 6.4"
-
-	config BR2_EXT_GDB_VERSION_6_5
-		bool "gdb 6.5"
-
-	config BR2_EXT_GDB_VERSION_SNAPSHOT
-		bool "gdb snapshot"
-
-endchoice
-
-config BR2_EXT_GDB_VERSION
-	string
-	default "6.2.1"    if BR2_EXT_GDB_VERSION_6_2_1
-	default "6.3"      if BR2_EXT_GDB_VERSION_6_3
-	default "6.4"      if BR2_EXT_GDB_VERSION_6_4
-	default "6.5"      if BR2_EXT_GDB_VERSION_6_5
-	default "6.6"      if BR2_EXT_GDB_VERSION_6_6
-	default "snapshot" if BR2_EXT_GDB_VERSION_SNAPSHOT

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-15 11:26:36 UTC (rev 24417)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-15 15:28:48 UTC (rev 24418)
@@ -3,13 +3,8 @@
 # gdb
 #
 ######################################################################
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 GDB_VERSION:=$(strip $(subst ",, $(BR2_GDB_VERSION)))
 #"))
-else
-GDB_VERSION:=$(strip $(subst ",, $(BR2_EXT_GDB_VERSION)))
-#"))
-endif
 
 ifeq ($(GDB_VERSION),snapshot)
 # Be aware that this changes daily....
