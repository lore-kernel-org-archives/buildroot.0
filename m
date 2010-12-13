From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: Improve C library
	option selection
Message-ID: <20101213214843.850098E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fff711786a9ea6a038f5753c5d8599e5cede07c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Turn BR2_LARGEFILE, BR2_INET_IPV6, BR2_INET_RPC, BR2_USE_WCHAR,
BR2_ENABLE_LOCALE and BR2_PROGRAM_INVOCATION into hidden options.

Then, for Buildroot toolchains, external toolchains and Crosstool-NG
toolchains, provide visible options that selects the hidden options.

This allows :

 * To show a different label and help text in the case of Buildroot
   toolchain (do you want to enable feature X ?) and in the case of
   external toolchain (is feature X available in your toolchain ?)

 * To not show any option when a glibc external toolchain is selected
   (since glibc is assumed to support all of largefile, IPv6, RPC,
   WCHAR, locale and program invocation) and have them all selected in
   that case.

There is some amount of duplication between Buildroot toolchain config
options and Crosstool-NG toolchain config options, because kconfig
doesn't allow to source the same Config.in file twice (even if under
mutually exclusive conditions). This duplication is more readable that
the hack that consists in splitting files in multiple pieces.

However, this commit changes the name of the options visible in the
configuration interface, so existing .config files will have to be
updated accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-buildroot/Config.in.2  |   50 +++++++++++++++++++++++
 toolchain/toolchain-common.in              |   57 +++++----------------------
 toolchain/toolchain-crosstool-ng/Config.in |   53 +++++++++++++++++++++++++
 toolchain/toolchain-external/Config.in     |   59 ++++++++++++++++++++++++++++
 4 files changed, 172 insertions(+), 47 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 2a17796..2a8dcf5 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -1,6 +1,56 @@
 # Buildroot backend specific options
 
 if BR2_TOOLCHAIN_BUILDROOT
+
+comment "Toolchain Options"
+
+config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
+	bool "Enable large file (files > 2 GB) support"
+	select BR2_LARGEFILE
+	help
+	  Enable this option if you want your toolchain to support
+	  files bigger than 2 GB.
+
+config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
+	bool "Enable IPv6 support"
+	select BR2_INET_IPV6
+	help
+	  Enable this option if you want your toolchain to support
+	  IPv6.
+
+config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
+	bool "Enable RPC support"
+	select BR2_INET_RPC
+	help
+	  Enable this option if you want your toolchain to support
+	  RPC (needed for NFS, for example).
+
+config BR2_TOOLCHAIN_BUILDROOT_WCHAR
+	bool "Enable WCHAR support"
+	select BR2_USE_WCHAR
+	help
+	  Enable this option if you want your toolchain to support
+	  wide characters (i.e characters longer than 8 bits, needed
+	  for locale support).
+
+config BR2_TOOLCHAIN_BUILDROOT_LOCALE
+	bool "Enable toolchain locale/i18n support"
+	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
+	select BR2_ENABLE_LOCALE
+	help
+	  Enable this option if you want your toolchain to support
+	  localization and internationalization.
+
+config BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION
+	bool "Enable 'program invocation name' support"
+	select BR2_PROGRAM_INVOCATION
+	help
+	  Enable this option if you want your toolchain to support the
+	  GNU-specific program_invocation_name and
+	  program_invocation_short_name strings.  Some GNU packages
+	  (like tar and coreutils) utilize these for extra useful
+	  output, but in general are not required.
+
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index f67c30a..ea47466 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,42 +5,23 @@
 # so put it here instead
 source "toolchain/gdb/Config.in"
 
-comment "Common Toolchain Options"
-
 config BR2_LARGEFILE
-	bool "Enable large file (files > 2 GB) support?"
-	help
-	  If you are building your own toolchain and you want to 
-	  support files larger than 2GB then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with large file support (files > 2GB) then enable 
-	  this option.
+	bool
 
 config BR2_INET_IPV6
-	bool "Enable IPv6"
-	help
-	  If you are building your own toolchain and you want to 
-	  enable IPV6 support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with IPV6 support then enable this option.
+	bool
 
 config BR2_INET_RPC
-	bool "Enable RPC"
-	help
-	  Enable RPC. RPC support is needed for nfs.
-	  If you are building your own toolchain and you want to 
-	  enable RPC support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with RPC support then enable this option.
+	bool
+
+config BR2_USE_WCHAR
+	bool
 
 config BR2_ENABLE_LOCALE
-	bool "Enable toolchain locale/i18n support?"
-	select BR2_USE_WCHAR
-	help
-	  If you are building your own toolchain and you want to 
-	  enable locale/i18n support then enable this option.
-	  If you have an external binary toolchain that has been 
-	  built with locale/i18n support then enable this option.
+	bool
+
+config BR2_PROGRAM_INVOCATION
+	bool
 
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
@@ -78,14 +59,6 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
-config BR2_USE_WCHAR
-	bool "Enable WCHAR support"
-	help
-	  If you are building your own toolchain and you want to 
-	  enable WCHAR support then enable this option.
-	  If you have an external binary toolchain that has been built 
-	  with WCHAR support then enable this option.
-
 config BR2_PREFER_SOFT_FLOAT
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel
@@ -135,16 +108,6 @@ choice
 		depends on BR2_UCLIBC_VERSION_SNAPSHOT
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
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index f9b7e69..4f30588 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -45,6 +45,59 @@ config BR2_TOOLCHAIN_CTNG_CONFIG
 	  To finetune your toolchain, you can also call:
 	  make ctng-menuconfig
 
+if BR2_TOOLCHAIN_CTNG_uClibc
+
+comment "Toolchain Options"
+
+config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
+	bool "Enable large file (files > 2 GB) support"
+	select BR2_LARGEFILE
+	help
+	  Enable this option if you want your toolchain to support
+	  files bigger than 2 GB.
+
+config BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6
+	bool "Enable IPv6 support"
+	select BR2_INET_IPV6
+	help
+	  Enable this option if you want your toolchain to support
+	  IPv6.
+
+config BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC
+	bool "Enable RPC support"
+	select BR2_INET_RPC
+	help
+	  Enable this option if you want your toolchain to support
+	  RPC (needed for NFS, for example).
+
+config BR2_TOOLCHAIN_CTNG_uClibc_WCHAR
+	bool "Enable WCHAR support"
+	select BR2_USE_WCHAR
+	help
+	  Enable this option if you want your toolchain to support
+	  wide characters (i.e characters longer than 8 bits, needed
+	  for locale support).
+
+config BR2_TOOLCHAIN_CTNG_uClibc_LOCALE
+	bool "Enable toolchain locale/i18n support"
+	select BR2_TOOLCHAIN_CTNG_uClibc_WCHAR
+	select BR2_ENABLE_LOCALE
+	help
+	  Enable this option if you want your toolchain to support
+	  localization and internationalization.
+
+config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
+	bool "Enable 'program invocation name' support"
+	select BR2_PROGRAM_INVOCATION
+	help
+	  Enable this option if you want your toolchain to support the
+	  GNU-specific program_invocation_name and
+	  program_invocation_short_name strings.  Some GNU packages
+	  (like tar and coreutils) utilize these for extra useful
+	  output, but in general are not required.
+
+endif # BR2_TOOLCHAIN_CTNG_uClibc
+
 config BR2_TOOLCHAIN_CTNG_STRIP_LIBS
 	bool "Strip libs copied to target"
 	default !BR2_STRIP_none
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a340de6..f0268a7 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -10,9 +10,68 @@ config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool "glibc"
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_INET_RPC
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_PROGRAM_INVOCATION
 
 endchoice
 
+if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_LARGEFILE
+	bool "Toolchain has large file support?"
+	select BR2_LARGEFILE
+	help
+	  Select this option if your external toolchain supports
+	  largefile. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
+	bool "Toolchain has IPv6 support?"
+	select BR2_INET_IPV6
+	help
+	  Select this option if your external toolchain supports
+	  IPv6. If you don't know, leave the default value, Buildroot
+	  will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
+	bool "Toolchain has RPC support ?"
+	select BR2_INET_RPC
+	help
+	  Select this option if your external toolchain supports
+	  RPC. If you don't know, leave the default value, Buildroot
+	  will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_WCHAR
+	bool "Toolchain has WCHAR support?"
+	select BR2_USE_WCHAR
+	help
+	  Select this option if your external toolchain supports
+	  WCHAR. If you don't know, leave the default value, Buildroot
+	  will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_LOCALE
+	bool "Toolchain has locale support?"
+	select BR2_TOOLCHAIN_EXTERNAL_WCHAR
+	select BR2_ENABLE_LOCALE
+	help
+	  Select this option if your external toolchain has locale
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
+	bool "Toolchain has program invocation support?"
+	select BR2_PROGRAM_INVOCATION
+	help
+	  Select this option if your external toolchain has program
+	  invocation support. If you don't know, leave the default
+	  value, Buildroot will tell you if it's correct or not.
+
+endif
+
 config BR2_TOOLCHAIN_EXTERNAL_STRIP
 	bool
 	default y
-- 
1.7.2.2
