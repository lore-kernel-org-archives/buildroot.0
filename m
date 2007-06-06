From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 11:14:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp package/mpfr
	toolchain/gcc t etc...
Message-ID: <20070606181400.D1A46480A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 11:14:00 -0700 (Wed, 06 Jun 2007)
New Revision: 18757

Log:
- adjust to use the gcc-4.2.0 release
- adjust default gdb version to 6.6
- fix stripping gmp/mpfr due to recent LIBTGTEXT changes


Added:
   trunk/buildroot/toolchain/gcc/4.2.0/

Removed:
   trunk/buildroot/toolchain/gcc/4.2/

Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-06-06 18:10:48 UTC (rev 18756)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-06-06 18:14:00 UTC (rev 18757)
@@ -86,7 +86,7 @@
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
             -C $(GMP_TARGET_DIR) install
-	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libgmp.{so*,a}
+	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libgmp$(LIBTGTEXT)*
 
 $(TARGET_DIR)/lib/libgmp.so $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION) $(TARGET_DIR)/lib/libgmp.a: $(STAGING_DIR)/lib/$(GMP_BINARY)
 	cp -dpf $(STAGING_DIR)/lib/libgmp$(LIBTGTEXT) $(TARGET_DIR)/lib/

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 18:10:48 UTC (rev 18756)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 18:14:00 UTC (rev 18757)
@@ -100,7 +100,7 @@
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(MPFR_TARGET_DIR) install;
-	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libmpfr.{so*,a}
+	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libmpfr$(LIBTGTEXT)*
 
 $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION) $(TARGET_DIR)/lib/libmpfr.a: $(STAGING_DIR)/lib/$(MPFR_BINARY)
 	cp -dpf $(STAGING_DIR)/lib/libmpfr$(LIBTGTEXT) $(TARGET_DIR)/lib/

Copied: trunk/buildroot/toolchain/gcc/4.2.0 (from rev 18748, trunk/buildroot/toolchain/gcc/4.2)

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-06-06 18:10:48 UTC (rev 18756)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-06-06 18:14:00 UTC (rev 18757)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_1_2
+	default BR2_GCC_VERSION_4_2_0
 	help
 	  Select the version of gcc you wish to use.
 
@@ -67,11 +67,15 @@
 		depends !BR2_nios2
 		bool "gcc 4.1.2"
 
-	config BR2_GCC_VERSION_4_2
+	config BR2_GCC_VERSION_4_2_0
 		depends !BR2_nios2
-		select BR2_GCC_IS_SNAP
-		bool "gcc 4.2"
+		bool "gcc 4.2.0"
 
+#	config BR2_GCC_VERSION_4_3
+#		depends !BR2_nios2
+#		select BR2_GCC_IS_SNAP
+#		bool "gcc 4.3"
+
 endchoice
 
 config BR2_GCC_IS_SNAP
@@ -80,7 +84,7 @@
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "20061121"
+	default "20070601"
 	depends BR2_GCC_IS_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
@@ -103,7 +107,8 @@
 	default "4.1.0"     if BR2_GCC_VERSION_4_1_0
 	default "4.1.1"     if BR2_GCC_VERSION_4_1_1
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
-	default "4.2"       if BR2_GCC_VERSION_4_2
+	default "4.2.0"     if BR2_GCC_VERSION_4_2_0
+	default "4.3"       if BR2_GCC_VERSION_4_3
 
 
 config BR2_GCC_USE_SJLJ_EXCEPTIONS

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-06-06 18:10:48 UTC (rev 18756)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-06-06 18:14:00 UTC (rev 18757)
@@ -36,13 +36,17 @@
 
 ifeq ($(findstring 3.,$(GCC_VERSION)),3.)
 GCC_NO_MPFR:=y
-endif
+else
+ifneq ($(BR2_INSTALL_FORTRAN),y)
+# fortran needs gmp and mpfr
 ifeq ($(findstring 4.0.,$(GCC_VERSION)),4.0.)
 GCC_NO_MPFR:=y
 endif
-#ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
-#GCC_NO_MPFR:=y
-#endif
+ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
+GCC_NO_MPFR:=y
+endif
+endif
+endif
 
 #############################################################
 #

Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2007-06-06 18:10:48 UTC (rev 18756)
+++ trunk/buildroot/toolchain/gdb/Config.in	2007-06-06 18:14:00 UTC (rev 18757)
@@ -22,7 +22,7 @@
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_3
+	default BR2_GDB_VERSION_6_6
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
