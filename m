From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  2 Oct 2007 14:36:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package target
Message-ID: <20071002213650.2140BA6045@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-02 14:36:49 -0700 (Tue, 02 Oct 2007)
New Revision: 20175

Log:
- default to mips I for mipsel and mips III for mips 
- suggest some target flags for abi64


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-02 15:38:27 UTC (rev 20174)
+++ trunk/buildroot/package/Makefile.in	2007-10-02 21:36:49 UTC (rev 20175)
@@ -51,6 +51,10 @@
 TARGET_CFLAGS+=-mvis
 endif
 
+ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
+TARGET_CFLAGS+=-fno-pic -mno-abicalls
+endif
+
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 
 # else it's an external toolchain

Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2007-10-02 15:38:27 UTC (rev 20174)
+++ trunk/buildroot/target/Config.in.arch	2007-10-02 21:36:49 UTC (rev 20175)
@@ -124,9 +124,13 @@
 choice
 	prompt "Target Architecture Variant"
 	depends BR2_mips || BR2_mipsel
-	default BR2_mips_3
+	default BR2_mips_3 if BR2_mips
+	default BR2_mips_1 if BR2_mipsel
 	help
 	  Specific CPU variant to use
+	  
+	  64bit cabable: 3, 4, 64, 64r2
+	  non-64bit capable: 1, 2, 32, 32r2
 
 config BR2_mips_1
 	bool "mips I (generic)"
