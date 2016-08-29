From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 Aug 2016 22:17:54 +0200
Subject: [Buildroot] [PATCH] package/libaio: disable for static only build
Message-ID: <1472501874-6666-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build system try to build a shared library unconditionally.

-static [...] -fPIC [...] -Wl,-soname=libaio.so.1

Fixes:
http://autobuild.buildroot.net/results/8c8/8c86402bd14a0af1b82e6e07c06531a856dd37c6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/blktrace/Config.in      | 6 ++++--
 package/gadgetfs-test/Config.in | 1 +
 package/libaio/Config.in        | 5 +++++
 package/xen/Config.in           | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index c17de80..f98ec88 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BLKTRACE
 	# Uses posix_spawn()
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # libaio
 	select BR2_PACKAGE_LIBAIO
 	help
 	  blktrace is a block layer IO tracing mechanism which provides
@@ -11,6 +12,7 @@ config BR2_PACKAGE_BLKTRACE
 
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
 
-comment "blktrace needs a glibc or musl toolchain"
+comment "blktrace needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		BR2_STATIC_LIBS
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index 9a60306..5bb94c2 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -9,6 +9,7 @@ if BR2_PACKAGE_GADGETFS_TEST
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	bool "use asynchronous i/o"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # libaio
 	select BR2_PACKAGE_LIBAIO
 	help
 	  Select this to have gadgetfs-test do asynchronous I/O using
diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index 3031c89..24b8264 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -7,5 +7,10 @@ config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBAIO
 	bool "libaio"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
 	help
 	  Library for doing asynchronous I/O
+
+comment "libaio needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
diff --git a/package/xen/Config.in b/package/xen/Config.in
index 7254a07..a427d56 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_XEN_HYPERVISOR
 
 config BR2_PACKAGE_XEN_TOOLS
 	bool "Xen tools"
-	depends on !BR2_STATIC_LIBS # dtc (libfdt)
+	depends on !BR2_STATIC_LIBS # dtc (libfdt), libaio
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2, util-linux
-- 
2.5.5
