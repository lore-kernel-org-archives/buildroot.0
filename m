From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:25 +0100
Subject: [Buildroot] [PATCH 6/6] toolchain: Clarify configuration option
	files organization
In-Reply-To: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d5e7b56275fdde2b36c437e80dcfe398fd462624.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of a mess of Config.in, Config.in.1 and Config.in.2 files, the
organization is now as follows:

 * Config.in only provides the Buildroot toolchain vs. external
   toolchain choices. Depending on this, it sources either
   Config.in.buildroot or Config.in.external files

 * Config.in.buildroot provides the Buildroot toolchain configuration
   options

 * Config.in.external provides the external toolchain configuration
   options

Options such as RPC, IPv6, large file, wide char, locale support,
program invocation and so forth are duplicated in Buildroot and
external toolchain support. This allows to provide an option label
that really matches what the option is for.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                            |   16 +--
 toolchain/Config.in.1                          |    9 --
 toolchain/{Config.in.2 => Config.in.buildroot} |   60 ++++++------
 toolchain/Config.in.external                   |  128 ++++++++++++++++++++++++
 toolchain/external-toolchain/Config.in         |   22 ----
 toolchain/external-toolchain/Config.in.2       |   17 ---
 6 files changed, 165 insertions(+), 87 deletions(-)
 delete mode 100644 toolchain/Config.in.1
 rename toolchain/{Config.in.2 => Config.in.buildroot} (80%)
 create mode 100644 toolchain/Config.in.external
 delete mode 100644 toolchain/external-toolchain/Config.in
 delete mode 100644 toolchain/external-toolchain/Config.in.2

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ee34e03..c3052fc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -16,16 +16,12 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 endchoice
 
-source "toolchain/Config.in.1"
-source "toolchain/external-toolchain/Config.in"
+if BR2_TOOLCHAIN_BUILDROOT
+source "toolchain/Config.in.buildroot"
+endif
 
-# we want gdb config in the middle of both source and external
-# toolchains, but mconf won't let us source the same file twice,
-# so put it here instead
-source "toolchain/gdb/Config.in"
-comment "Common Toolchain Options"
-
-source "toolchain/Config.in.2"
-source "toolchain/external-toolchain/Config.in.2"
+if BR2_TOOLCHAIN_EXTERNAL
+source "toolchain/Config.in.external"
+endif
 
 endmenu
diff --git a/toolchain/Config.in.1 b/toolchain/Config.in.1
deleted file mode 100644
index 5c26858..0000000
--- a/toolchain/Config.in.1
+++ /dev/null
@@ -1,9 +0,0 @@
-#
-
-if BR2_TOOLCHAIN_BUILDROOT
-source "toolchain/kernel-headers/Config.in"
-source "toolchain/uClibc/Config.in"
-source "toolchain/binutils/Config.in"
-source "toolchain/gcc/Config.in"
-source "toolchain/ccache/Config.in"
-endif
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.buildroot
similarity index 80%
rename from toolchain/Config.in.2
rename to toolchain/Config.in.buildroot
index e404657..70ac3ec 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.buildroot
@@ -1,43 +1,58 @@
-#
+source "toolchain/kernel-headers/Config.in"
+source "toolchain/uClibc/Config.in"
+source "toolchain/binutils/Config.in"
+source "toolchain/gcc/Config.in"
+source "toolchain/gdb/Config.in"
+source "toolchain/ccache/Config.in"
+
+comment "Toolchain options"
+
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
 	depends on !BR2_cris
 	help
-	  If you are building your own toolchain and you want to 
+	  If you are building your own toolchain and you want to
 	  support files larger than 2GB then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with large file support (files > 2GB) then enable 
-	  this option.
 
 config BR2_INET_IPV6
 	bool "Enable IPv6"
 	help
-	  If you are building your own toolchain and you want to 
+	  If you are building your own toolchain and you want to
 	  enable IPV6 support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with IPV6 support then enable this option.
 
 config BR2_INET_RPC
 	bool "Enable RPC"
 	help
 	  Enable RPC. RPC support is needed for nfs.
-	  If you are building your own toolchain and you want to 
+	  If you are building your own toolchain and you want to
 	  enable RPC support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with RPC support then enable this option.
 
 config BR2_ENABLE_LOCALE
 	bool "Enable toolchain locale/i18n support?"
 	select BR2_USE_WCHAR
 	help
-	  If you are building your own toolchain and you want to 
+	  If you are building your own toolchain and you want to
 	  enable locale/i18n support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with locale/i18n support then enable this option.
+
+config BR2_USE_WCHAR
+	bool "Enable WCHAR support"
+	help
+	  If you are building your own toolchain and you want to
+	  enable WCHAR support then enable this option.
+
+config BR2_PROGRAM_INVOCATION
+	bool "Enable 'program invocation name'"
+	help
+	  Support for the GNU-specific program_invocation_name and
+	  program_invocation_short_name strings.  Some GNU packages
+	  (like tar and coreutils) utilize these for extra useful
+	  output, but in general are not required.
+	  If you have an external binary toolchain that has been built
+	  with program invocation support then enable this option.
 
 config BR2_ENABLE_LOCALE_PREGENERATED
 	bool "Use pregenerated locale data?"
-	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_BUILDROOT && BROKEN # tarball missing
+	depends on BR2_ENABLE_LOCALE && BROKEN # tarball missing
 	help
 	  Instead of generating the locale data locally you can optionally
 	  download a pregenerated set of locales.
@@ -87,16 +102,6 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 endchoice
 
-config BR2_PROGRAM_INVOCATION
-	bool "Enable 'program invocation name'"
-	help
-	  Support for the GNU-specific program_invocation_name and
-	  program_invocation_short_name strings.  Some GNU packages
-	  (like tar and coreutils) utilize these for extra useful
-	  output, but in general are not required.
-	  If you have an external binary toolchain that has been built
-	  with program invocation support then enable this option.
-
 config BR2_GCC_CROSS_CXX
 	bool
 	help
@@ -107,7 +112,7 @@ config BR2_GCC_CROSS_CXX
 
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
-	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT && BR2_TOOLCHAIN_BUILDROOT)
+	select BR2_LARGEFILE if !BR2_GCC_SUPPORTS_SYSROOT
 	select BR2_GCC_CROSS_CXX
 	help
 	  If you are building your own toolchain and want to build and install
@@ -116,7 +121,6 @@ config BR2_INSTALL_LIBSTDCPP
 	  support and you want to use the compiler / library then you need 
 	  to select this option.
 
-if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
@@ -137,5 +141,3 @@ config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
 
 	  Answer Y if you want these apps (if built) copied into the
 	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
-
-endif
diff --git a/toolchain/Config.in.external b/toolchain/Config.in.external
new file mode 100644
index 0000000..060b9bb
--- /dev/null
+++ b/toolchain/Config.in.external
@@ -0,0 +1,128 @@
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
+	prompt "External toolchain C library"
+	default BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	bool "uClibc"
+
+config BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	bool "glibc"
+
+endchoice
+
+#
+# Toolchain options with uClibc
+#
+if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+comment "External toolchain features"
+
+config BR2_LARGEFILE
+	bool "Toolchain has large file (files > 2 GB) support?"
+	depends on !BR2_cris
+	help
+	  Select this option if your external toolchain has a uClibc
+	  configured with large file support.
+
+config BR2_INET_IPV6
+	bool "Toolchain has IPv6?"
+	help
+	  Select this option if your external toolchain has a uClibc
+	  configured with IPv6 support.
+
+config BR2_INET_RPC
+	bool "Toolchain has RPC?"
+	help
+	  Select this option if your external toolchain has a uClibc
+	  configured with RPC support.
+
+config BR2_USE_WCHAR
+	bool "Toolchain has WCHAR support?"
+	help
+	  Select this option if your external toolchain has a uClibc
+	  configured with wide char support.
+
+config BR2_ENABLE_LOCALE
+	bool "Toolchain has locale/i18n support?"
+	select BR2_USE_WCHAR
+	help
+	  Select this option if your external toolchain has a uClibc
+	  configured with locale support.
+
+config BR2_PROGRAM_INVOCATION
+	bool "Toolchain supports program invocation name?"
+	help
+	  Select this option if your external toolchain has a uClibc
+	  configured with program invocation support.
+
+endif
+
+#
+# Toolchain options with glibc
+#
+
+if BR2_TOOLCHAIN_EXTERNAL_GLIBC
+
+config BR2_LARGEFILE
+       bool
+       default y
+
+config BR2_INET_IPV6
+       bool
+       default y
+
+config BR2_INET_RPC
+       bool
+       default y
+
+config BR2_ENABLE_LOCALE
+       bool
+       default y
+
+config BR2_USE_WCHAR
+       bool
+       default y
+
+config BR2_PROGRAM_INVOCATION
+       bool
+       default y
+
+endif
+
+#
+# Common toolchain options
+#
+
+comment "Integration options"
+
+config BR2_GCC_CROSS_CXX
+	bool
+
+config BR2_INSTALL_LIBSTDCPP
+	bool "Install libstdc++?"
+	select BR2_LARGEFILE
+	select BR2_GCC_CROSS_CXX
+	help
+	  If you have an external toolchain that has been built with C++
+	  support and you want to use the compiler / library then you need
+	  to select this option.
+
+config BR2_TOOLCHAIN_EXTERNAL_STRIP
+        bool
+        default y
+        prompt "Strip shared libraries"
+	help
+	  Strip shared libraries copied from the external toolchain.
diff --git a/toolchain/external-toolchain/Config.in b/toolchain/external-toolchain/Config.in
deleted file mode 100644
index efc8378..0000000
--- a/toolchain/external-toolchain/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-
-if BR2_TOOLCHAIN_EXTERNAL
-choice
-	prompt "External toolchain C library"
-	default BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	bool "uClibc"
-
-config BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	bool "glibc"
-
-endchoice
-
-config BR2_TOOLCHAIN_EXTERNAL_STRIP
-        bool
-        default y
-        prompt "Strip shared libraries"
-	help
-	  Strip shared libraries copied from the external toolchain.
-endif
diff --git a/toolchain/external-toolchain/Config.in.2 b/toolchain/external-toolchain/Config.in.2
deleted file mode 100644
index 489558c..0000000
--- a/toolchain/external-toolchain/Config.in.2
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-
-if BR2_TOOLCHAIN_EXTERNAL
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
-endif
-- 
1.6.3.3
