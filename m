From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 00:24:50 +0100
Subject: [Buildroot] [PATCH] package,
	toolchain: remove BR2_TOOLCHAIN_HAS_GCC_BUG_* options
Message-ID: <1454109890-19470-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quite some time ago, we added the options
BR2_TOOLCHAIN_HAS_GCC_BUG_58595 and BR2_TOOLCHAIN_HAS_GCC_BUG_58854 to
indicate if the toolchain was affected by those gcc bugs, which were
causing build failure with a number of packages.

With the recent change in the external toolchain logic to provide only
the latest version of each toolchain "family", all the toolchains
which were affected by those issues disappeared from Buildroot. Those
options are no longer being selected anywhere, and being blind
options, it means their value is always going to be "disabled".

Conquently, this commit removes those options completely, and updates
all the packages where they were used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/Config.in      | 5 -----
 package/lttng-libust/Config.in | 6 ------
 package/lttng-tools/Config.in  | 8 --------
 package/netsniff-ng/Config.in  | 6 ------
 toolchain/toolchain-common.in  | 6 ------
 5 files changed, 31 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 36d5353..49510da 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
@@ -24,8 +23,4 @@ config BR2_PACKAGE_LIBURCU
 
 comment "liburcu needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "liburcu needs a toolchain not affected by GCC bug 58854"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 26838bb..ce60599 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_USE_WCHAR # util-linux
 	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -20,8 +19,3 @@ config BR2_PACKAGE_LTTNG_LIBUST
 comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
-
-comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
-	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index b758d32..dd72cc6 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
@@ -33,9 +31,3 @@ config BR2_PACKAGE_LTTNG_TOOLS
 comment "lttng-tools needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
-
-comment "lttng-tools needs a toolchain not affected by GCC bug 58854 and 58595"
-	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854 || BR2_TOOLCHAIN_HAS_GCC_BUG_58595
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index a2494a9..5d2f5df 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_NETSNIFF_NG
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	help
 	  netsniff-ng is a free, performant Linux network analyzer and
@@ -22,8 +21,3 @@ comment "netsniff-ng needs an (e)glibc toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854
-
-comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"
-	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 014a23d..8408852 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,12 +5,6 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
-config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
-	bool
-
-config BR2_TOOLCHAIN_HAS_GCC_BUG_58854
-	bool
-
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.6.4
