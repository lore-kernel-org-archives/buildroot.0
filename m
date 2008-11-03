From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  3 Nov 2008 02:18:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: toolchain
	toolchain/external-toolchain
Message-ID: <20081103101839.6021A3C915@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-03 02:18:39 -0800 (Mon, 03 Nov 2008)
New Revision: 23908

Log:
External toolchain support improvements

Improve external toolchain support

 * Do not put kernel-headers in the dependencies of BASE_TARGETS in
   the case where BR2_TOOLCHAIN_SOURCE is not y. The kernel headers
   are already supposed to be part of the external toolchain, so
   there's no need to download, extract and install them.

 * In the configuration system, don't display the kernel headers
   version selection list when an external toolchain is selected. This
   is implemented by moving the source
   "toolchain/kernel-headers/Config.in" inside the if
   BR2_TOOLCHAIN_SOURCE in toolchain/Config.in.2.

 * Change the description and help message of the BR2_LARGEFILE,
   BR2_INET_IPV6, BR2_INET_RPC, and BR2_SOFT_FLOAT option in
   toolchain/external-toolchain/Config.in. In the case of an external
   toolchain, the semantic of these options is not to enable large
   file support, IPV6 or RPC (since the toolchain is already compiled,
   it has been decided previously). Their semantic is to let Buildroot
   know about the characteristics of the external toolchain being
   used.

   As an improvement, we could guess these values automatically:

    - for BR2_LARGEFILE, look at the value of __UCLIBC_HAS_LFS__ in
      bits/uClibc_config.h in the libc headers directory.

    - for BR2_INET_RPC, look at the value of __UCLIBC_HAS_RPC__ in the
      same file

    - for BR2_INET_IPV6, look at the value of __UCLIBC_HAS_IPV6__ in
      the same file

    - for BR2_SOFT_FLOAT, look at the output of $(CC) -v 2>&1 | grep
      -- "--with-float=soft"

   But I'm not sure how this would be possible, since these values are
   used at configuration-time by other configuration options, not only
   at build time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/external-toolchain/Config.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-03 06:16:36 UTC (rev 23907)
+++ trunk/buildroot/Makefile	2008-11-03 10:18:39 UTC (rev 23908)
@@ -202,7 +202,7 @@
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else
-BASE_TARGETS:=uclibc kernel-headers
+BASE_TARGETS:=uclibc
 endif
 TARGETS:=
 

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2008-11-03 06:16:36 UTC (rev 23907)
+++ trunk/buildroot/toolchain/Config.in.2	2008-11-03 10:18:39 UTC (rev 23908)
@@ -1,8 +1,7 @@
 #
 
-source "toolchain/kernel-headers/Config.in"
-
 if BR2_TOOLCHAIN_SOURCE
+source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"
 source "toolchain/gcc/Config.in"

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2008-11-03 06:16:36 UTC (rev 23907)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2008-11-03 10:18:39 UTC (rev 23908)
@@ -69,33 +69,30 @@
 endchoice
 
 config BR2_LARGEFILE
-	bool "Enable large file (files > 2 GB) support?"
+	bool "Toolchain supports large files (> 2 GB) ?"
 	depends on !BR2_cris
 	default y
 	help
-	  Enable large file (files > 2 GB) support
+	  Set this option if the external toolchain supports large
+	  files (> 2 GB)
 
+
 config BR2_INET_IPV6
-	bool "Enable IPv6"
+	bool "Toolchain supports IPv6 ?"
 	help
-	    Enable IPv6.
+	  Set this option if the external toolchain supports IPv6.
 
 config BR2_INET_RPC
-	bool "Enable RPC"
+	bool "Toolchain supports RPC ?"
 	help
-	    Enable RPC. RPC support is needed for nfs.
+	  Set this option if the external toolchain supports RPC.
 
 config BR2_SOFT_FLOAT
-	bool "Use software floating point by default"
+	bool "Toolchain supports soft float ?"
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
 	help
-	  If your target CPU does not have a Floating Point Unit (FPU) or a
-	  kernel FPU emulator, but you still wish to support floating point
-	  functions, then everything will need to be compiled with soft
-	  floating point support (-msoft-float).
+	  Set this option if the external toolchain supports soft float.
 
-	  Most people will answer N.
-
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-Os -pipe"
