From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 25 Jun 2015 16:04:55 +0200
Subject: [Buildroot] [PATCH 1/2] libaio: introduce a
	BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS option
Message-ID: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to allow other packages to easily select mplayer without
duplicating its complicated architecture dependencies, this commit
introduces a BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS blind option.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/blktrace/Config.in      |  6 +-----
 package/gadgetfs-test/Config.in |  6 +-----
 package/libaio/Config.in        | 11 +++++++----
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index 09c95eb39ae7..ed5d78a542c6 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -2,11 +2,7 @@ config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
 	# Uses posix_spawn()
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
-	# Because of libaio arch depends
-	depends on \
-		BR2_arm   || BR2_armeb || BR2_i386   || \
-		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
-		BR2_sparc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBAIO
 	help
 	  blktrace is a block layer IO tracing mechanism which provides
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index 38358f2a1cd5..9a603066e7af 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -8,12 +8,8 @@ if BR2_PACKAGE_GADGETFS_TEST
 
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	bool "use asynchronous i/o"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBAIO
-	# libaio is available only on few architectures
-	depends on \
-		BR2_arm   || BR2_armeb || BR2_i386   || \
-		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
-		BR2_sparc || BR2_x86_64
 	help
 	  Select this to have gadgetfs-test do asynchronous I/O using
 	  the libaio library.
diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index 622fd55a5e83..cc44cb6dbcf6 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -1,8 +1,11 @@
+config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_i386 || \
+		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
+		BR2_sparc || BR2_x86_64
+
 config BR2_PACKAGE_LIBAIO
 	bool "libaio"
-	depends on \
-		BR2_arm   || BR2_armeb || BR2_i386   || \
-		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
-		BR2_sparc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	help
 	  Library for doing asynchronous I/O
-- 
2.4.3
