From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue,  1 Jun 2010 23:53:02 +0200
Subject: [Buildroot] [PATCH 4/5] toollchain: move buildroot config files
In-Reply-To: <1275429183-8974-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1275429183-8974-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1275429183-8974-5-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Handle the internal toolchain backend mechanism the
same way we handle other backends.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 toolchain/Config.in                       |   12 +--
 toolchain/Config.in.1                     |    9 --
 toolchain/Config.in.2                     |  200 -----------------------------
 toolchain/toolchain-buildroot/Config.in   |    9 ++
 toolchain/toolchain-buildroot/Config.in.2 |   37 ++++++
 toolchain/toolchain-common.in             |  172 +++++++++++++++++++++++++
 6 files changed, 221 insertions(+), 218 deletions(-)
 delete mode 100644 toolchain/Config.in.1
 delete mode 100644 toolchain/Config.in.2
 create mode 100644 toolchain/toolchain-buildroot/Config.in
 create mode 100644 toolchain/toolchain-buildroot/Config.in.2
 create mode 100644 toolchain/toolchain-common.in

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 52b9d8b..fc9a048 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -16,16 +16,10 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 endchoice
 
-source "toolchain/Config.in.1"
+source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
-
-# we want gdb config in the middle of both source and external
-# toolchains, but mconf won't let us source the same file twice,
-# so put it here instead
-source "toolchain/gdb/Config.in"
-comment "Common Toolchain Options"
-
-source "toolchain/Config.in.2"
+source "toolchain/toolchain-common.in"
+source "toolchain/toolchain-buildroot/Config.in.2"
 source "toolchain/toolchain-external/Config.in.2"
 
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
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
deleted file mode 100644
index 595ab87..0000000
--- a/toolchain/Config.in.2
+++ /dev/null
@@ -1,200 +0,0 @@
-#
-config BR2_LARGEFILE
-	bool "Enable large file (files > 2 GB) support?"
-	depends on !BR2_cris
-	help
-	  If you are building your own toolchain and you want to 
-	  support files larger than 2GB then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with large file support (files > 2GB) then enable 
-	  this option.
-
-config BR2_INET_IPV6
-	bool "Enable IPv6"
-	help
-	  If you are building your own toolchain and you want to 
-	  enable IPV6 support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with IPV6 support then enable this option.
-
-config BR2_INET_RPC
-	bool "Enable RPC"
-	help
-	  Enable RPC. RPC support is needed for nfs.
-	  If you are building your own toolchain and you want to 
-	  enable RPC support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with RPC support then enable this option.
-
-config BR2_ENABLE_LOCALE
-	bool "Enable toolchain locale/i18n support?"
-	select BR2_USE_WCHAR
-	help
-	  If you are building your own toolchain and you want to 
-	  enable locale/i18n support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with locale/i18n support then enable this option.
-
-config BR2_ENABLE_LOCALE_PURGE
-	bool "Purge unwanted locales"
-	help
-	  Explicitly specify what locales to install on target. If N
-	  then all locales supported by packages are installed.
-
-config BR2_ENABLE_LOCALE_WHITELIST
-	string "Locales to keep"
-	default "C en_US de fr"
-	depends on BR2_ENABLE_LOCALE_PURGE
-	help
-	  Whitespace seperated list of locales to allow on target.
-	  Locales not listed here will be removed from the target.
-	  See 'locale -a' on your host for a list of locales available
-	  on your build host, or have a look in /usr/share/locale in
-	  the target file system for available locales.
-
-	  Notice that listing a locale here doesn't guarantee that it
-	  will be available on the target - That purely depends on the
-	  support for that locale in the selected packages.
-
-# glibc and eglibc directly include gettext, so a separatly compiled
-# gettext isn't needed and shouldn't be built to avoid conflicts. Some
-# packages always need gettext, other packages only need gettext when
-# locale support is enabled. See the documentation for how packages
-# should rely on the following two options.
-
-config BR2_NEEDS_GETTEXT
-	bool
-	default y if BR2_TOOLCHAIN_BUILDROOT
-	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-
-config BR2_NEEDS_GETTEXT_IF_LOCALE
-	bool
-	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
-
-config BR2_USE_WCHAR
-	bool "Enable WCHAR support"
-	help
-	  If you are building your own toolchain and you want to 
-	  enable WCHAR support then enable this option.
-	  If you have an external binary toolchain that has been built 
-	  with WCHAR support then enable this option.
-
-config BR2_PREFER_SOFT_FLOAT
-	bool
-	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel
-
-config BR2_SOFT_FLOAT
-	bool "Use software floating point by default"
-	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc
-	default $(BR2_PREFER_SOFT_FLOAT)
-	help
-	  If your target CPU does not have a Floating Point Unit (FPU) or a
-	  kernel FPU emulator, but you still wish to support floating point
-	  functions, then everything will need to be compiled with soft
-	  floating point support (-msoft-float).
-
-config BR2_USE_SSP
-	bool "Enable stack protection support"
-	help
-	  Enable stack smashing protection support using GCCs
-	  -fstack-protector[-all] option.
-
-	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
-	  for details.
-
-choice
-	prompt "Thread library implementation"
-	default BR2_PTHREADS_OLD
-	help
-	  If you are building your own toolchain then select the type of 
-	  libpthreads you want to use.
-	  Not all thread variants work with all versions of uClibc,
-	  the "linuxthreads (stable/old)" may be a working fallback
-	  if you need threading at all.
-	  If you have an external binary toolchain then select the type 
-	  of libpthreads it was built with.
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
-		depends on BR2_UCLIBC_VERSION_SNAPSHOT
-endchoice
-
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
-config BR2_GCC_CROSS_CXX
-	bool
-	help
-	  If you are building your own toolchain and want to build 
-	  a C++ cross-compiler this needs to be enabled.
-	  If you have an external binary toolchain that has a C++ compiler
-	  and you want to use it then you need to enable this option.
-
-config BR2_INSTALL_LIBSTDCPP
-	bool "Build/install c++ compiler and libstdc++?"
-	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT && BR2_TOOLCHAIN_BUILDROOT)
-	select BR2_GCC_CROSS_CXX
-	help
-	  If you are building your own toolchain and want to build and install
-	  the C++ compiler and library then you need to enable this option.
-	  If you have an external toolchain that has been built with C++ 
-	  support and you want to use the compiler / library then you need 
-	  to select this option.
-
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
-	help
-	  Optimizations to use when building for the target host.
-
-if BR2_TOOLCHAIN_BUILDROOT
-source "toolchain/elf2flt/Config.in"
-source "toolchain/mklibs/Config.in"
-source "toolchain/sstrip/Config.in"
-
-config BR2_ENABLE_MULTILIB
-	bool "Enable multilib support?"
-	help
-	    Build libraries to support different ABIs.
-
-config BR2_VFP_FLOAT
-	bool "Use ARM Vector Floating Point unit"
-	depends on !BR2_SOFT_FLOAT
-	depends on BR2_arm || BR2_armeb
-	help
-	  Setting this option will enable the "-mfpu=vfp" option.
-	  If your ARM CPU has a Vector Floating Point Unit (VFP)
-	  and the toolchain supports the option, then the 
-	  code can be optimized.
-	  
-	  Most people will answer N.
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
-endif
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
new file mode 100644
index 0000000..a9dd192
--- /dev/null
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -0,0 +1,9 @@
+# Config entries for internal toolchain backend
+
+if BR2_TOOLCHAIN_BUILDROOT
+source "toolchain/kernel-headers/Config.in"
+source "toolchain/uClibc/Config.in"
+source "toolchain/binutils/Config.in"
+source "toolchain/gcc/Config.in"
+source "toolchain/ccache/Config.in"
+endif
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
new file mode 100644
index 0000000..512a608
--- /dev/null
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -0,0 +1,37 @@
+# Buildroot backend specific options
+
+if BR2_TOOLCHAIN_BUILDROOT
+source "toolchain/elf2flt/Config.in"
+source "toolchain/mklibs/Config.in"
+source "toolchain/sstrip/Config.in"
+
+config BR2_ENABLE_MULTILIB
+	bool "Enable multilib support?"
+	help
+	    Build libraries to support different ABIs.
+
+config BR2_VFP_FLOAT
+	bool "Use ARM Vector Floating Point unit"
+	depends on !BR2_SOFT_FLOAT
+	depends on BR2_arm || BR2_armeb
+	help
+	  Setting this option will enable the "-mfpu=vfp" option.
+	  If your ARM CPU has a Vector Floating Point Unit (VFP)
+	  and the toolchain supports the option, then the
+	  code can be optimized.
+
+	  Most people will answer N.
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
+endif
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
new file mode 100644
index 0000000..152d009
--- /dev/null
+++ b/toolchain/toolchain-common.in
@@ -0,0 +1,172 @@
+# Generic toolchain options
+
+# we want gdb config in the middle of both source and external
+# toolchains, but mconf won't let us source the same file twice,
+# so put it here instead
+source "toolchain/gdb/Config.in"
+
+comment "Common Toolchain Options"
+
+config BR2_LARGEFILE
+	bool "Enable large file (files > 2 GB) support?"
+	depends on !BR2_cris
+	help
+	  If you are building your own toolchain and you want to 
+	  support files larger than 2GB then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with large file support (files > 2GB) then enable 
+	  this option.
+
+config BR2_INET_IPV6
+	bool "Enable IPv6"
+	help
+	  If you are building your own toolchain and you want to 
+	  enable IPV6 support then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with IPV6 support then enable this option.
+
+config BR2_INET_RPC
+	bool "Enable RPC"
+	help
+	  Enable RPC. RPC support is needed for nfs.
+	  If you are building your own toolchain and you want to 
+	  enable RPC support then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with RPC support then enable this option.
+
+config BR2_ENABLE_LOCALE
+	bool "Enable toolchain locale/i18n support?"
+	select BR2_USE_WCHAR
+	help
+	  If you are building your own toolchain and you want to 
+	  enable locale/i18n support then enable this option.
+	  If you have an external binary toolchain that has been 
+	  built with locale/i18n support then enable this option.
+
+config BR2_ENABLE_LOCALE_PURGE
+	bool "Purge unwanted locales"
+	help
+	  Explicitly specify what locales to install on target. If N
+	  then all locales supported by packages are installed.
+
+config BR2_ENABLE_LOCALE_WHITELIST
+	string "Locales to keep"
+	default "C en_US de fr"
+	depends on BR2_ENABLE_LOCALE_PURGE
+	help
+	  Whitespace seperated list of locales to allow on target.
+	  Locales not listed here will be removed from the target.
+	  See 'locale -a' on your host for a list of locales available
+	  on your build host, or have a look in /usr/share/locale in
+	  the target file system for available locales.
+
+	  Notice that listing a locale here doesn't guarantee that it
+	  will be available on the target - That purely depends on the
+	  support for that locale in the selected packages.
+
+# glibc and eglibc directly include gettext, so a separatly compiled
+# gettext isn't needed and shouldn't be built to avoid conflicts. Some
+# packages always need gettext, other packages only need gettext when
+# locale support is enabled. See the documentation for how packages
+# should rely on the following two options.
+
+config BR2_NEEDS_GETTEXT
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT
+	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+config BR2_NEEDS_GETTEXT_IF_LOCALE
+	bool
+	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
+
+config BR2_USE_WCHAR
+	bool "Enable WCHAR support"
+	help
+	  If you are building your own toolchain and you want to 
+	  enable WCHAR support then enable this option.
+	  If you have an external binary toolchain that has been built 
+	  with WCHAR support then enable this option.
+
+config BR2_PREFER_SOFT_FLOAT
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel
+
+config BR2_SOFT_FLOAT
+	bool "Use software floating point by default"
+	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc
+	default $(BR2_PREFER_SOFT_FLOAT)
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU) or a
+	  kernel FPU emulator, but you still wish to support floating point
+	  functions, then everything will need to be compiled with soft
+	  floating point support (-msoft-float).
+
+config BR2_USE_SSP
+	bool "Enable stack protection support"
+	help
+	  Enable stack smashing protection support using GCCs
+	  -fstack-protector[-all] option.
+
+	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  for details.
+
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
+		depends on BR2_UCLIBC_VERSION_SNAPSHOT
+endchoice
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
+
+config BR2_GCC_CROSS_CXX
+	bool
+	help
+	  If you are building your own toolchain and want to build 
+	  a C++ cross-compiler this needs to be enabled.
+	  If you have an external binary toolchain that has a C++ compiler
+	  and you want to use it then you need to enable this option.
+
+config BR2_INSTALL_LIBSTDCPP
+	bool "Build/install c++ compiler and libstdc++?"
+	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT && BR2_TOOLCHAIN_BUILDROOT)
+	select BR2_GCC_CROSS_CXX
+	help
+	  If you are building your own toolchain and want to build and install
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
-- 
1.6.5
