From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:15 +0100
Subject: [Buildroot] [PATCH v4 20/22] toolchain-external-custom: new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-21-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package to support custom external toolchains.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 351 +--------------------
 .../toolchain-external-custom/Config.in            |   5 +
 .../toolchain-external-custom/Config.in.options    | 334 ++++++++++++++++++++
 .../toolchain-external-custom.mk                   |  15 +
 toolchain/toolchain-external/toolchain-external.mk |   6 -
 5 files changed, 361 insertions(+), 350 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-custom/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-custom/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5188e1a..e592ec2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -43,6 +43,11 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.
 # Musl based toolchains (after all the others)
 source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
 
+# Kept last, so it remains the non-default choice, unless there isn't
+# any available toolchain profile for the currently selected
+# architecture.
+source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -109,12 +114,6 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
 
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-	bool "Custom toolchain"
-	help
-	  Use this option to use a custom toolchain pre-installed on
-	  your system.
-
 endchoice
 
 choice
@@ -146,25 +145,12 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
 	help
 	  Path to where the external toolchain is installed.
 
-config BR2_TOOLCHAIN_EXTERNAL_URL
-	string "Toolchain URL"
-	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
-	help
-	  URL of the custom toolchain tarball to download and install.
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
-	string "Toolchain prefix"
-	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-	default "$(ARCH)-linux"
-
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
-					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
@@ -224,331 +210,8 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.
 # Musl based toolchains
 source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options"
 
-if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-
-choice
-	bool "External toolchain gcc version"
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
-	help
-	  Set to the gcc version that is used by your external
-	  toolchain.
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_6
-	bool "6.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_5
-	bool "5.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
-	bool "4.9.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
-	bool "4.8.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
-	bool "4.7.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
-	bool "4.6.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
-	bool "4.5.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
-	bool "4.4.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
-	bool "4.3.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-
-endchoice
-
-choice
-	bool "External toolchain kernel headers series"
-	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
-	help
-	  Set to the kernel headers version that were used to build
-	  this external toolchain.
-
-	  This is used to hide/show some packages that have strict
-	  requirements on the version of kernel headers.
-
-	  If unsure what version your toolchain is using, you can look
-	  at the value of LINUX_VERSION_CODE in linux/version.h in your
-	  toolchain. The Linux version is M.m.p, with:
-	    M = ( LINUX_VERSION_CODE >> 16 ) & 0xFF
-	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
-	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
-	bool "4.8.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
-	bool "4.7.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6
-	bool "4.6.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_5
-	bool "4.5.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4
-	bool "4.4.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3
-	bool "4.3.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2
-	bool "4.2.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1
-	bool "4.1.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0
-	bool "4.0.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_19
-	bool "3.19.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18
-	bool "3.18.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
-	bool "3.17.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
-	bool "3.16.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
-	bool "3.15.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
-	bool "3.14.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
-	bool "3.13.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
-	bool "3.12.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
-	bool "3.11.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
-	bool "3.10.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
-	bool "3.9.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
-	bool "3.8.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
-	bool "3.7.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
-	bool "3.6.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
-	bool "3.5.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
-	bool "3.4.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
-	bool "3.3.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
-	bool "3.2.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
-	bool "3.1.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
-	bool "3.0.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
-	bool "2.6.x"
-
-endchoice
-
-choice
-	prompt "External toolchain C library"
-	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-	bool "uClibc/uClibc-ng"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	# For the time being, we assume that all custom external
-	# toolchains have shadow password support.
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	help
-	  Select this option if your external toolchain uses the
-	  uClibc (available from http://www.uclibc.org/)
-	  or uClibc-ng (available from http://www.uclibc-ng.org)
-	  C library.
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc/eglibc"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Select this option if your external toolchain uses the GNU C
-	  library (available from https://www.gnu.org/software/libc/)
-	  or its variant the eglibc library (http://www.eglibc.org/).
-
-	  Note: eglibc is a variant of glibc that (among other things)
-	  can be configured to exclude some of its features. Using a
-	  toolchain with eglibc configured to exclude key features may
-	  cause build failures to some packages.
-
-comment "glibc only available with shared lib support"
-	depends on BR2_STATIC_LIBS
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
-	bool "musl"
-	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-	help
-	  Select this option if your external toolchain uses the
-	  'musl' C library, available from http://www.musl-libc.org/.
-
-endchoice
-
-if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_WCHAR
-	bool "Toolchain has WCHAR support?"
-	select BR2_USE_WCHAR
-	help
-	  Select this option if your external toolchain supports
-	  WCHAR. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_LOCALE
-	bool "Toolchain has locale support?"
-	select BR2_TOOLCHAIN_EXTERNAL_WCHAR
-	select BR2_ENABLE_LOCALE
-	help
-	  Select this option if your external toolchain has locale
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
-	bool "Toolchain has threads support?"
-	select BR2_TOOLCHAIN_HAS_THREADS
-	default y
-	help
-	  Select this option if your external toolchain has thread
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-if BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
-	bool "Toolchain has threads debugging support?"
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	default y
-	help
-	  Select this option if your external toolchain has thread
-	  debugging support. If you don't know, leave the default
-	  value, Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
-	bool "Toolchain has NPTL threads support?"
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	default y
-	help
-	  Select this option if your external toolchain uses the NPTL
-	  (Native Posix Thread Library) implementation of Posix
-	  threads. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-endif # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
-
-endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
-	bool "Toolchain has SSP support?"
-	select BR2_TOOLCHAIN_HAS_SSP
-	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	default y if BR2_TOOLCHAIN_EXTERNAL_MUSL
-	help
-	  Selection this option if your external toolchain has Stack
-	  Smashing Protection support enabled. If you don't know,
-	  leave the default value, Buildroot will tell you if it's
-	  correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
-	bool "Toolchain has RPC support?"
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
-	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Select this option if your external toolchain supports
-	  RPC. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_CXX
-	bool "Toolchain has C++ support?"
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Select this option if your external toolchain has C++
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
-	bool "Toolchain has Fortran support?"
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Select this option if your external toolchain has Fortran
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
-	string "Extra toolchain libraries to be copied to target"
-	help
-	  If your external toolchain provides extra libraries that
-	  need to be copied to the target filesystem, enter them
-	  here, separated by spaces.
-
-endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+# Custom toolchains
+source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
 
 config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	bool "Copy gdb server to the Target"
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in b/toolchain/toolchain-external/toolchain-external-custom/Config.in
new file mode 100644
index 0000000..a913feb
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in
@@ -0,0 +1,5 @@
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+	bool "Custom toolchain"
+	help
+	  Use this option to use a custom toolchain pre-installed on
+	  your system.
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
new file mode 100644
index 0000000..cdc2555
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -0,0 +1,334 @@
+if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-custom"
+
+config BR2_TOOLCHAIN_EXTERNAL_URL
+	string "Toolchain URL"
+	depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  URL of the custom toolchain tarball to download and install.
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
+	string "Toolchain prefix"
+	default "$(ARCH)-linux"
+
+choice
+	bool "External toolchain gcc version"
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
+	help
+	  Set to the gcc version that is used by your external
+	  toolchain.
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_6
+	bool "6.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_5
+	bool "5.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
+	bool "4.9.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
+	bool "4.7.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
+	bool "4.6.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
+	bool "4.5.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
+	bool "4.4.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+
+config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
+	bool "4.3.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+
+endchoice
+
+choice
+	bool "External toolchain kernel headers series"
+	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	help
+	  Set to the kernel headers version that were used to build
+	  this external toolchain.
+
+	  This is used to hide/show some packages that have strict
+	  requirements on the version of kernel headers.
+
+	  If unsure what version your toolchain is using, you can look
+	  at the value of LINUX_VERSION_CODE in linux/version.h in your
+	  toolchain. The Linux version is M.m.p, with:
+	    M = ( LINUX_VERSION_CODE >> 16 ) & 0xFF
+	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
+	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
+	bool "4.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6
+	bool "4.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_5
+	bool "4.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4
+	bool "4.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3
+	bool "4.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2
+	bool "4.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1
+	bool "4.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0
+	bool "4.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_19
+	bool "3.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18
+	bool "3.18.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
+	bool "3.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
+	bool "3.16.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
+	bool "3.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
+	bool "3.14.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
+	bool "3.13.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
+	bool "3.12.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
+	bool "3.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
+	bool "3.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
+	bool "3.9.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
+	bool "3.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
+	bool "3.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
+	bool "3.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
+	bool "3.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
+	bool "3.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
+	bool "3.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
+	bool "3.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
+	bool "3.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
+	bool "3.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	bool "2.6.x"
+
+endchoice
+
+choice
+	prompt "External toolchain C library"
+	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+	bool "uClibc/uClibc-ng"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	# For the time being, we assume that all custom external
+	# toolchains have shadow password support.
+	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	help
+	  Select this option if your external toolchain uses the
+	  uClibc (available from http://www.uclibc.org/)
+	  or uClibc-ng (available from http://www.uclibc-ng.org)
+	  C library.
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
+	bool "glibc/eglibc"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Select this option if your external toolchain uses the GNU C
+	  library (available from https://www.gnu.org/software/libc/)
+	  or its variant the eglibc library (http://www.eglibc.org/).
+
+	  Note: eglibc is a variant of glibc that (among other things)
+	  can be configured to exclude some of its features. Using a
+	  toolchain with eglibc configured to exclude key features may
+	  cause build failures to some packages.
+
+comment "(e)glibc only available with shared lib support"
+	depends on BR2_STATIC_LIBS
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
+	bool "musl (experimental)"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Select this option if your external toolchain uses the
+	  'musl' C library, available from http://www.musl-libc.org/.
+
+endchoice
+
+if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
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
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+	bool "Toolchain has threads support?"
+	select BR2_TOOLCHAIN_HAS_THREADS
+	default y
+	help
+	  Select this option if your external toolchain has thread
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+if BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
+	bool "Toolchain has threads debugging support?"
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	default y
+	help
+	  Select this option if your external toolchain has thread
+	  debugging support. If you don't know, leave the default
+	  value, Buildroot will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
+	bool "Toolchain has NPTL threads support?"
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	default y
+	help
+	  Select this option if your external toolchain uses the NPTL
+	  (Native Posix Thread Library) implementation of Posix
+	  threads. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+endif # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+
+endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
+	bool "Toolchain has SSP support?"
+	select BR2_TOOLCHAIN_HAS_SSP
+	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	default y if BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Selection this option if your external toolchain has Stack
+	  Smashing Protection support enabled. If you don't know,
+	  leave the default value, Buildroot will tell you if it's
+	  correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
+	bool "Toolchain has RPC support?"
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
+	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Select this option if your external toolchain supports
+	  RPC. If you don't know, leave the default value, Buildroot
+	  will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTERNAL_CXX
+	bool "Toolchain has C++ support?"
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Select this option if your external toolchain has C++
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
+	string "Extra toolchain libraries to be copied to target"
+	help
+	  If your external toolchain provides extra libraries that
+	  need to be copied to the target filesystem, enter them
+	  here, separated by spaces. They will be copied to the
+	  target's /lib directory.
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk b/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
new file mode 100644
index 0000000..c4ae612
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# toolchain-external-custom
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CUSTOM_SITE = $(patsubst %/,%,$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL))))
+TOOLCHAIN_EXTERNAL_CUSTOM_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),y)
+# We can't check hashes for custom downloaded toolchains
+BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
+endif
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0680473..e13d240 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -69,12 +69,6 @@ else
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
 endif
 TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
-else
-# Custom toolchain
-TOOLCHAIN_EXTERNAL_SITE = $(patsubst %/,%,$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL))))
-TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-# We can't check hashes for custom downloaded toolchains
-BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
 endif
 
 # Some toolchain vendors have a regular file naming pattern.
-- 
2.10.2
