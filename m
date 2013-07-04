From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 10:33:56 +0200
Subject: [Buildroot] [git commit] uclibc: move configuration options into
	the package
Message-ID: <20130704095653.0A6159A2A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=095fa7d8754cdf354475c804e330c86054109274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the introduction of the eglibc library to the
internal toolchain backend, the options that allow to enable/disable C
library features such as largefile, IPv6, RPC and so on now belong to
the uClibc package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/Config.in                  |   77 +++++++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in.2 |   77 -----------------------------
 2 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 22c70a2..410326b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -49,6 +49,83 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
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
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
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
+choice
+	prompt "Thread library implementation"
+	default BR2_PTHREADS_NATIVE if !BR2_ARM_OABI && !(BR2_avr32 || BR2_xtensa)
+	default BR2_PTHREADS_OLD
+	help
+	  Use this option to select the thread library implementation
+	  that should be used in your toolchain. Not all thread
+	  variants work with all versions of uClibc, the "linuxthreads
+	  (stable/old)" may be a working fallback if you need
+	  threading at all.
+
+	config BR2_PTHREADS_NONE
+		bool "none"
+
+	config BR2_PTHREADS
+		bool "linuxthreads"
+		depends on !BR2_xtensa
+	        select BR2_TOOLCHAIN_HAS_THREADS
+
+	config BR2_PTHREADS_OLD
+		bool "linuxthreads (stable/old)"
+	        select BR2_TOOLCHAIN_HAS_THREADS
+
+	config BR2_PTHREADS_NATIVE
+		bool "Native POSIX Threading (NPTL)"
+	        select BR2_TOOLCHAIN_HAS_THREADS
+		depends on !BR2_ARM_OABI
+		depends on !BR2_x86_i386
+		depends on !BR2_avr32
+		depends on !BR2_xtensa
+		depends on !BR2_arc
+endchoice
+
+config BR2_PTHREAD_DEBUG
+	bool "Thread library debugging"
+	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  Build the thread library with debugging enabled.
+
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
 	select BR2_PACKAGE_MAKE
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 422602e..9bbf016 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -4,43 +4,6 @@ if BR2_TOOLCHAIN_BUILDROOT
 
 comment "Toolchain Options"
 
-config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
-	bool "Enable large file (files > 2 GB) support"
-	select BR2_LARGEFILE
-	help
-	  Enable this option if you want your toolchain to support
-	  files bigger than 2 GB.
-
-config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
-	bool "Enable IPv6 support"
-	select BR2_INET_IPV6
-	help
-	  Enable this option if you want your toolchain to support
-	  IPv6.
-
-config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
-	bool "Enable RPC support"
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	help
-	  Enable this option if you want your toolchain to support
-	  RPC (needed for NFS, for example).
-
-config BR2_TOOLCHAIN_BUILDROOT_WCHAR
-	bool "Enable WCHAR support"
-	select BR2_USE_WCHAR
-	help
-	  Enable this option if you want your toolchain to support
-	  wide characters (i.e characters longer than 8 bits, needed
-	  for locale support).
-
-config BR2_TOOLCHAIN_BUILDROOT_LOCALE
-	bool "Enable toolchain locale/i18n support"
-	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
-	select BR2_ENABLE_LOCALE
-	help
-	  Enable this option if you want your toolchain to support
-	  localization and internationalization.
-
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
@@ -58,46 +21,6 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
 
-choice
-	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if !BR2_ARM_OABI && !(BR2_avr32 || BR2_xtensa)
-	default BR2_PTHREADS_OLD
-	help
-	  Use this option to select the thread library implementation
-	  that should be used in your toolchain. Not all thread
-	  variants work with all versions of uClibc, the "linuxthreads
-	  (stable/old)" may be a working fallback if you need
-	  threading at all.
-
-	config BR2_PTHREADS_NONE
-		bool "none"
-
-	config BR2_PTHREADS
-		bool "linuxthreads"
-		depends on !BR2_xtensa
-	        select BR2_TOOLCHAIN_HAS_THREADS
-
-	config BR2_PTHREADS_OLD
-		bool "linuxthreads (stable/old)"
-	        select BR2_TOOLCHAIN_HAS_THREADS
-
-	config BR2_PTHREADS_NATIVE
-		bool "Native POSIX Threading (NPTL)"
-	        select BR2_TOOLCHAIN_HAS_THREADS
-		depends on !BR2_ARM_OABI
-		depends on !BR2_x86_i386
-		depends on !BR2_avr32
-		depends on !BR2_xtensa
-		depends on !BR2_arc
-endchoice
-
-config BR2_PTHREAD_DEBUG
-	bool "Thread library debugging"
-	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	help
-	  Build the thread library with debugging enabled.
-
 source "package/elf2flt/Config.in.host"
 
 config BR2_VFP_FLOAT
