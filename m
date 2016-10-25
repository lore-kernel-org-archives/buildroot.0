From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:31:47 +0200
Subject: [Buildroot] [git commit] toolchain: configs: improve toolchain
	config readability
Message-ID: <20161025213353.41BED817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8218ab8019bbab0538b484c663df4469e44fecf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add (or move) comment lines in toolchain-related Config.in files
to improve readability of the toolchain config section.

Source linux-headers/Config.in.host after toolchain-buildroot items.

For toolchain-buildroot case, the config file now looks like this:
*
* Toolchain
*

*
* Toolchain Buildroot Options
*

*
* Kernel Header Options
*

*
* uClibc Options
*

*
* Binutils Options
*

*
* GCC Options
*

*
* Host GDB Options
*

*
* Toolchain Generic Options
*

Signed-off-by: Petri Gynther <pgynther@google.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host              | 2 ++
 package/linux-headers/Config.in.host    | 4 ++--
 package/uclibc/Config.in                | 4 ++--
 toolchain/toolchain-buildroot/Config.in | 5 +++--
 toolchain/toolchain-common.in           | 2 ++
 toolchain/toolchain-external/Config.in  | 2 ++
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 081073b..a36dc0f 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -1,3 +1,5 @@
+comment "Host GDB Options"
+
 config BR2_PACKAGE_HOST_GDB
 	bool "Build cross gdb for the host"
 	# When the external toolchain gdbserver is used, we shouldn't
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae2a3cd..47ef25d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -1,8 +1,8 @@
+comment "Kernel Header Options"
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS
 	bool
 
-comment "Kernel Header Options"
-
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index cbae096..fdf007e 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,12 +1,12 @@
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
+comment "uClibc Options"
+
 config BR2_PACKAGE_UCLIBC
 	bool
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
 
-comment "uClibc Options"
-
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
 	default "package/uclibc/uClibc-ng.config"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c89e181..c8436cc 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -2,6 +2,8 @@
 
 if BR2_TOOLCHAIN_BUILDROOT
 
+comment "Toolchain Buildroot Options"
+
 config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 	string "custom toolchain vendor name"
 	default "buildroot"
@@ -18,8 +20,6 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
-source "package/linux-headers/Config.in.host"
-
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
@@ -89,6 +89,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
+source "package/linux-headers/Config.in.host"
 source "package/linux-headers/Config.in"
 source "package/musl/Config.in"
 source "package/uclibc/Config.in"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index b682e4d..bf9dc7b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,6 +5,8 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
+comment "Toolchain Generic Options"
+
 # https://sourceware.org/bugzilla/show_bug.cgi?id=19405
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 	bool
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index cdf01c9..5324599 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1,5 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL
 
+comment "Toolchain External Options"
+
 choice
 	prompt "Toolchain"
 
