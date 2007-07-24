From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 24 Jul 2007 11:14:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc:  4.2.1
Message-ID: <20070724181455.A8DFCA6114@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-24 11:14:53 -0700 (Tue, 24 Jul 2007)
New Revision: 19255

Log:
- add gcc-4.2.1


Added:
   trunk/buildroot/toolchain/gcc/4.2.1/

Modified:
   trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/gcc/4.2.1 (from rev 19242, trunk/buildroot/toolchain/gcc/4.2.0)

Modified: trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.0/200-uclibc-locale.patch	2007-07-24 06:17:43 UTC (rev 19242)
+++ trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch	2007-07-24 18:14:53 UTC (rev 19255)
@@ -1,14 +1,14 @@
 --- gcc/libstdc++-v3/acinclude.m4
 +++ gcc/libstdc++-v3/acinclude.m4
 @@ -1369,7 +1369,7 @@
-   AC_MSG_CHECKING([for C locale to use])
+ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
    GLIBCXX_ENABLE(clocale,auto,[@<:@=MODEL@:>@],
      [use MODEL for target locale package],
 -    [permit generic|gnu|ieee_1003.1-2001|yes|no|auto])
 +    [permit generic|gnu|ieee_1003.1-2001|uclibc|yes|no|auto])
-   
-   # If they didn't use this option switch, or if they specified --enable
-   # with no specific model, we'll have to look for one.  If they
+ 
+   # Deal with gettext issues.  Default to not using it (=no) until we detect
+   # support for it later.  Let the user turn it off via --e/d, but let that
 @@ -1385,6 +1385,9 @@
    # Default to "generic".
    if test $enable_clocale_flag = auto; then

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-24 17:59:15 UTC (rev 19254)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-24 18:14:53 UTC (rev 19255)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_2_0
+	default BR2_GCC_VERSION_4_2_1
 	help
 	  Select the version of gcc you wish to use.
 
@@ -71,6 +71,10 @@
 		depends !BR2_nios2
 		bool "gcc 4.2.0"
 
+	config BR2_GCC_VERSION_4_2_1
+		depends !BR2_nios2
+		bool "gcc 4.2.1"
+
 #	config BR2_GCC_VERSION_4_3
 #		depends !BR2_nios2
 #		select BR2_GCC_IS_SNAP
@@ -108,6 +112,7 @@
 	default "4.1.1"     if BR2_GCC_VERSION_4_1_1
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
 	default "4.2.0"     if BR2_GCC_VERSION_4_2_0
+	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
@@ -142,8 +147,8 @@
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
-	# huh? why so? select BR2_LARGEFILE
-	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_3
+	# >= 4.2.0 work fine without LARGEFILE
+	select BR2_LARGEFILE if BR2_GCC_VERSION_3_3_5 || BR2_GCC_VERSION_3_3_6 || BR2_GCC_VERSION_3_4_2 || BR2_GCC_VERSION_3_4_3 || BR2_GCC_VERSION_3_4_4 || BR2_GCC_VERSION_3_4_5 || BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_0 || BR2_GCC_VERSION_4_0_1 || BR2_GCC_VERSION_4_0_2 || BR2_GCC_VERSION_4_0_3 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_0 || BR2_GCC_VERSION_4_1_1 || BR2_GCC_VERSION_4_1_2
 	help
 	  Build/install c++ compiler and libstdc++?
 
