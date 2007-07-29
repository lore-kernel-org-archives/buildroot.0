From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:36:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070729173645.72ECCA4577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:36:45 -0700 (Sun, 29 Jul 2007)
New Revision: 19330

Log:
gcc config for AVR32

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-29 17:34:20 UTC (rev 19329)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-29 17:36:45 UTC (rev 19330)
@@ -9,58 +9,59 @@
 	  Select the version of gcc you wish to use.
 
 	config BR2_GCC_VERSION_3_3_5
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 3.3.5"
 
 	config BR2_GCC_VERSION_3_3_6
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 3.3.6"
 
 	config BR2_GCC_VERSION_3_4_2
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "gcc 3.4.2"
 
 	config BR2_GCC_VERSION_3_4_3
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "gcc 3.4.3"
 
 	config BR2_GCC_VERSION_3_4_4
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "gcc 3.4.4"
 
 	config BR2_GCC_VERSION_3_4_5
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "gcc 3.4.5"
 
 	config BR2_GCC_VERSION_3_4_6
+		depends on !BR2_avr32
 		bool "gcc 3.4.6"
 
 	config BR2_GCC_VERSION_4_0_0
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.0"
 
 	config BR2_GCC_VERSION_4_0_1
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.1"
 
 	config BR2_GCC_VERSION_4_0_2
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.2"
 
 	config BR2_GCC_VERSION_4_0_3
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.3"
 
 	config BR2_GCC_VERSION_4_0_4
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.4"
 
 	config BR2_GCC_VERSION_4_1_0
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.1.0"
 
 	config BR2_GCC_VERSION_4_1_1
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.1.1"
 
 	config BR2_GCC_VERSION_4_1_2
@@ -68,21 +69,22 @@
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_0
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.2.0"
 
 	config BR2_GCC_VERSION_4_2_1
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.2.1"
 
 #	config BR2_GCC_VERSION_4_3
-#		depends !BR2_nios2
+#		depends !BR2_avr32 && !BR2_nios2
 #		select BR2_GCC_IS_SNAP
 #		bool "gcc 4.3"
 
 endchoice
 
 config BR2_GCC_IS_SNAP
+	depends !BR2_avr32
 	bool
 	default n
 
@@ -138,6 +140,16 @@
 	  proper stack unwinding during exception handling.  Most people
 	  can leave this set to n.
 
+config BR2_GCC_AVR32_CONFIGURATION
+	bool "Enable default AVR32 GCC configuration"
+	default y
+	depends BR2_avr32
+	help
+	  For the AVR32 platform there is some configuration which are not
+	  supported.
+
+	  Currently this will add "--disable-libmudflap" to configure.
+
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
 	default ""
@@ -147,27 +159,29 @@
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
-	# >= 4.2.0 work fine without LARGEFILE
-	select BR2_LARGEFILE if BR2_GCC_VERSION_3_3_5 || BR2_GCC_VERSION_3_3_6 || BR2_GCC_VERSION_3_4_2 || BR2_GCC_VERSION_3_4_3 || BR2_GCC_VERSION_3_4_4 || BR2_GCC_VERSION_3_4_5 || BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_0 || BR2_GCC_VERSION_4_0_1 || BR2_GCC_VERSION_4_0_2 || BR2_GCC_VERSION_4_0_3 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_0 || BR2_GCC_VERSION_4_1_1 || BR2_GCC_VERSION_4_1_2
+	# huh? why so? select BR2_LARGEFILE
+	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_3
 	help
 	  Build/install c++ compiler and libstdc++?
 
 config BR2_INSTALL_LIBGCJ
 	bool "Build/install java compiler and libgcj?"
 	default n
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
 	help
 	  Build/install java compiler and libgcj?
 
 config BR2_INSTALL_OBJC
 	bool "Build/install Objective-C compiler and runtime?"
 	default n
+	depends on !BR2_avr32
 	help
 	  Build/install Objective-C compiler and runtime?
 
 config BR2_INSTALL_FORTRAN
 	bool "Build/install Fortran compiler and runtime?"
 	default n
+	depends on !BR2_avr32
 	select BR2_PACKAGE_LIBMPFR
 	help
 	  Build/install Fortran compiler and runtime?
