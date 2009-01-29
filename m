From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 29 Jan 2009 13:50:12 +0000
Subject: [Buildroot] Updating toolchain config options to help external
	toolchain support.
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF39BD968@EU1RDCRDC1WX029.exi.nxp.com>
References: <C13DBBE85AD6974B85C118C35890CA5F1AF39BD968@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <COL102-DS4F672F3105EE1F6476A4CDCC90@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone any feedback on the patch below, I am running with it and have
seen no issues but if you have any feedback please do provide it.  If not I
am planning to apply these changes on friday, giving a week for them to be
pulled if necessary (do not believe this will need to be done)

Many thanks
Daniel Laird

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of Daniel James Laird
Sent: 2009 Jan 28 11:53
To: buildroot at uclibc.org
Subject: [Buildroot] Updating toolchain config options to help external
toolchain support.

After a lot a playing around I have made some changes to the toolchain
configuration options.
This now allows users of external binary toolchains to enable/disable the
same set of features as those
who are building a toolchain using buildroot or external source.
However the number of changes mean that I would like to post the patch below
for comments before commiting it.
I have tested the external toolchain support side of things and checked the
options are all ok but I have not built a new
buildroot toolchain (never done this)
perhaps someone can comment on patch below: If not I would like to commit by
friday to enable a few days testing before final release.

Many thanks
Daniel Laird

Index: toolchain/binutils/Config.in
===================================================================
--- toolchain/binutils/Config.in	(revision 25087)
+++ toolchain/binutils/Config.in	(working copy)
@@ -13,7 +13,6 @@
 		depends on BR2_DEPRECATED || (BR2_avr32 &&
BR2_EXT_BINUTILS_VERSION_2_17)
 		bool "binutils 2.17"
 
-
 	config BR2_BINUTILS_VERSION_2_17_50_0_17
 		depends on !BR2_avr32 && !BR2_nios2
 		depends on BR2_DEPRECATED
Index: toolchain/gcc/Config.in
===================================================================
--- toolchain/gcc/Config.in	(revision 25087)
+++ toolchain/gcc/Config.in	(working copy)
@@ -125,25 +125,12 @@
 	help
 	  Any additional gcc configure options you may want to include....
 
-config BR2_GCC_CROSS_CXX
-	bool "C++ cross-compiler support"
-	help
-	  Build a C++ cross-compiler
-
 config BR2_GCC_CROSS_FORTRAN
 	bool "Fortran cross-compiler support"
 	depends on !BR2_avr32
 	help
 	  Build a Fortran cross-compiler
 
-config BR2_INSTALL_LIBSTDCPP
-	bool "Build/install c++ compiler and libstdc++?"
-	# >= 4.2.0 work fine without LARGEFILE
-	select BR2_LARGEFILE if !BR2_GCC_SUPPORTS_SYSROOT
-	select BR2_GCC_CROSS_CXX
-	help
-	  Build/install c++ compiler and libstdc++?
-
 config BR2_INSTALL_LIBGCJ
 	bool "Build/install java compiler and libgcj?"
 	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
Index: toolchain/external-toolchain/Config.in.2
===================================================================
--- toolchain/external-toolchain/Config.in.2	(revision 25087)
+++ toolchain/external-toolchain/Config.in.2	(working copy)
@@ -14,64 +14,4 @@
 	  This the the external toolchain prefix. For example:
 	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
 
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
-	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel ||
BR2_powerpc
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
Index: toolchain/uClibc/Config.in
===================================================================
--- toolchain/uClibc/Config.in	(revision 25087)
+++ toolchain/uClibc/Config.in	(working copy)
@@ -48,43 +48,6 @@
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_ENABLE_LOCALE
-	bool "Enable locale/gettext/i18n support?"
-	help
-	  Enable locale/gettext/i18n support?
-
-config BR2_ENABLE_LOCALE_PREGENERATED
-	bool "Use pregenerated locale data?"
-	depends on BR2_ENABLE_LOCALE
-	help
-	  Instead of generating the locale data locally you can optionally
-	  download a pregenerated set of locales.
-
-	  Say N here unless your buildhost lacks locale support and you
-	  desparately want to use internationalization on your target.
-
-choice
-	prompt "Thread library implementation"
-	default BR2_PTHREADS_OLD
-	help
-	  Select the version of libpthreads you want to use.
-	  Not all thread variants work with all versions of uClibc,
-	  the "linuxthreads (stable/old)" may be a working fallback
-	  if you need threading at all.
-
-	config BR2_PTHREADS_NONE
-		bool "none"
-
-	config BR2_PTHREADS
-		bool "linuxthreads"
-
-	config BR2_PTHREADS_OLD
-		bool "linuxthreads (stable/old)"
-
-	config BR2_PTHREADS_NATIVE
-		bool "Native POSIX Threading (NPTL)"
-endchoice
-
 config BR2_PTHREAD_DEBUG
 	bool "Thread library debugging"
 	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
Index: toolchain/Config.in.2
===================================================================
--- toolchain/Config.in.2	(revision 25087)
+++ toolchain/Config.in.2	(working copy)
@@ -1,35 +1,56 @@
 #
-
-if BR2_TOOLCHAIN_SOURCE
-source "toolchain/elf2flt/Config.in"
-source "toolchain/mklibs/Config.in"
-source "toolchain/sstrip/Config.in"
-
-config BR2_ENABLE_MULTILIB
-	bool "Enable multilib support?"
-	help
-	    Build libraries to support different ABIs.
-
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
 	depends on !BR2_cris
 	help
-	    Enable large file (files > 2 GB) support
+	  If you are building your own toolchain and you want to 
+	  support files larger than 2GB then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with large file support (files > 2GB) then enable 
+	  this option.
 
 config BR2_INET_IPV6
 	bool "Enable IPv6"
 	help
-	    Enable IPv6.
+	  If you are building your own toolchain and you want to 
+	  enable IPV6 support then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with IPV6 support then enable this option.
 
 config BR2_INET_RPC
 	bool "Enable RPC"
 	help
-	    Enable RPC. RPC support is needed for nfs.
+	  Enable RPC. RPC support is needed for nfs.
+	  If you are building your own toolchain and you want to 
+	  enable RPC support then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with RPC support then enable this option.
 
+config BR2_ENABLE_LOCALE
+	bool "Toolchain built with locale/gettext/i18n support?"
+	help
+	  If you are building your own toolchain and you want to 
+	  enable locale/gettext/i18n support then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with locale/gettext/i18n support then enable this option.
+
+config BR2_ENABLE_LOCALE_PREGENERATED
+	bool "Use pregenerated locale data?"
+	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_SOURCE
+	help
+	  Instead of generating the locale data locally you can optionally
+	  download a pregenerated set of locales.
+
+	  Say N here unless your buildhost lacks locale support and you
+	  desparately want to use internationalization on your target.
+
 config BR2_USE_WCHAR
 	bool "Enable WCHAR support"
 	help
-	  Enable WCHAR. WCHAR support is needed for several packages
+	  If you are building your own toolchain and you want to 
+	  enable WCHAR support then enable this option.
+	  If you have an external binary toolchain that has been built 
+	  with WCHAR support then enable this option.
 
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
@@ -42,6 +63,66 @@
 
 	  Most people will answer N.
 
+choice
+	prompt "Thread library implementation"
+	default BR2_PTHREADS_OLD
+	help
+	  If you are building your own toolchain then select the type of 
+	  libpthreads you want to use.
+	  Not all thread variants work with all versions of uClibc,
+	  the "linuxthreads (stable/old)" may be a working fallback
+	  if you need threading at all.
+	  If you have an external binary toolchain then select the type 
+	  of libpthreads it was built with.
+
+	config BR2_PTHREADS_NONE
+		bool "none"
+
+	config BR2_PTHREADS
+		bool "linuxthreads"
+
+	config BR2_PTHREADS_OLD
+		bool "linuxthreads (stable/old)"
+
+	config BR2_PTHREADS_NATIVE
+		bool "Native POSIX Threading (NPTL)"
+endchoice
+
+config BR2_GCC_CROSS_CXX
+	bool
+	help
+	  If you are building your own toolchain and want to build 
+          a C++ cross-compiler this needs to be enabled.
+	  If you have an external binary toolchain that has a C++ compiler
+	  and you want to use it then you need to enable this option.
+
+config BR2_INSTALL_LIBSTDCPP
+	bool "Build/install c++ compiler and libstdc++?"
+	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT &&
BR2_TOOLCHAIN_SOURCE)
+	select BR2_GCC_CROSS_CXX
+	help
+	  If you are building your own toolchain and want to build and
install
+	  the C++ compiler and library then you need to enable this option.
+	  If you have an external toolchain that has been built with C++ 
+	  support and you want to use the compiler / library then you need 
+	  to select this option.
+
+config BR2_TARGET_OPTIMIZATION
+	string "Target Optimizations"
+	default "-Os -pipe"
+	help
+	  Optimizations to use when building for the target host.
+
+if BR2_TOOLCHAIN_SOURCE
+source "toolchain/elf2flt/Config.in"
+source "toolchain/mklibs/Config.in"
+source "toolchain/sstrip/Config.in"
+
+config BR2_ENABLE_MULTILIB
+	bool "Enable multilib support?"
+	help
+	    Build libraries to support different ABIs.
+
 config BR2_VFP_FLOAT
 	bool "Use ARM Vector Floating Point unit"
 	depends on !BR2_SOFT_FLOAT
@@ -54,12 +135,6 @@
 	  
 	  Most people will answer N.
 
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
-	help
-	  Optimizations to use when building for the target host.
-
 config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
 	bool "Include target utils in cross toolchain"
 	default y
Index: package/qte/Config.in
===================================================================
--- package/qte/Config.in	(revision 25087)
+++ package/qte/Config.in	(working copy)
@@ -2,7 +2,7 @@
 	bool "Qt/E"
 	depends on BR2_DEPRECATED
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PTHREADS_NATIVE
+	depends on BR2_PTHREADS_NATIVE
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
 	help 
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
