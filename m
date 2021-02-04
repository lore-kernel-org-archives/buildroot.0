From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 17:57:59 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libbsd: needs
 dynamic library
Message-ID: <20210204164015.7C7FD802AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89fffe2d773003a7a06fc6aa25bf54e7a74f1d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Static linking with libbsd fails because of multiple definition of the
strlcpy symbol. uClibc optionally provides these symbols.

So add a dependency on dynamic library to avoid a build failure with a
zeromq-enabled bitcoin or with stress-ng.

Fixes:
 - http://autobuild.buildroot.org/results/ba87544d42ad5e77a27a7a504bc6336a06f6e291

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1edd0ac66a28e975610abdd60e02ad147c6c97e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/Config.in           | 5 +++--
 package/libbsd/Config.in         | 6 ++++--
 package/netcat-openbsd/Config.in | 6 ++++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 269f065fd5..a700da0eba 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FWTS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, libbsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libbsd
+	depends on !BR2_STATIC_LIBS # libbsd
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_JSON_C
@@ -33,10 +34,10 @@ comment "efi_runtime module needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 endif
 
-comment "fwts needs a glibc toolchain w/ wchar, threads"
+comment "fwts needs a glibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index e54f5e6f23..845a22162b 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
@@ -21,6 +22,7 @@ config BR2_PACKAGE_LIBBSD
 
 	  http://libbsd.freedesktop.org/
 
-comment "libbsd needs a toolchain w/ threads, wchar"
+comment "libbsd needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 4734ff9901..beaa8ed451 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETCAT_OPENBSD
 	bool "netcat-openbsd"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # libbsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -21,8 +22,9 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 
 	  https://packages.debian.org/sid/netcat-openbsd
 
-comment "netcat-openbsd needs a glibc toolchain w/ threads, headers >= 3.12"
+comment "netcat-openbsd needs a glibc toolchain w/ dynamic library, threads, headers >= 3.12"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
