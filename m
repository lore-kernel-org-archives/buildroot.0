From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:52:34 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libbsd: security
 bump to version 0.10.0
Message-ID: <20190902114905.3AEA789027@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e79c24b012dabf47e41487b087f4d153a07acc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Remove patch (already in version)
- Update site to get the latest version
- Update hash of license file (update in year, new file and author)
- Remove !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) dependency,
  __register_at_fork availability is correclty checked since
  https://gitlab.freedesktop.org/libbsd/libbsd/commit/b0ebb0d4c26b281facbab7a774510b541637b13b
- Includes Several security related fixes for nlist() reported by Daniel
  Hodson and one by Coverity Scan, see
  https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f6c7d6e0f1e6e531100b09ec766c54e6dbafb3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/Config.in                             |  2 +-
 .../0001-flopen-fix-build-with-musl-libc.patch     | 40 ----------------------
 package/libbsd/Config.in                           |  2 --
 package/libbsd/libbsd.hash                         |  6 ++--
 package/libbsd/libbsd.mk                           |  4 +--
 5 files changed, 6 insertions(+), 48 deletions(-)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 94ac606366..269f065fd5 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_FWTS
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
-	depends on BR2_USE_MMU # libglib2, libbsd
+	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, libbsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libbsd
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
diff --git a/package/libbsd/0001-flopen-fix-build-with-musl-libc.patch b/package/libbsd/0001-flopen-fix-build-with-musl-libc.patch
deleted file mode 100644
index 6f0aeffed7..0000000000
--- a/package/libbsd/0001-flopen-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8575450b9c1226fc38196b29e33c67f2b58cacf5 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 5 Jun 2018 19:18:47 +0300
-Subject: [PATCH] flopen: fix build with musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 993828d84ee (Add flopenat() function from FreeBSD) dropped the
-fcntl.h header. This breaks the build with musl libc:
-
-flopen.c: In function ???vflopenat???:
-flopen.c:60:14: error: ???O_CREAT??? undeclared (first use in this function)
-  if (flags & O_CREAT) {
-              ^~~~~~~
-
-Restore the fcntl.h header include to fix the build.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to libbsd at lists.freedesktop.org
-
- src/flopen.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/flopen.c b/src/flopen.c
-index b9972c94ec90..ff20d074445b 100644
---- a/src/flopen.c
-+++ b/src/flopen.c
-@@ -32,6 +32,7 @@
- #include <sys/stat.h>
- 
- #include <errno.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <unistd.h>
- 
--- 
-2.17.1
-
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 0f320302b9..a163ce9b6f 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_arc
 	depends on !BR2_xtensa
-	# uClibc on noMMU doesn't provide __register_atfork()
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 93af3944ae..95887bd607 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/libbsd/2018-May/000190.html
-sha256	56d835742327d69faccd16955a60b6dcf30684a8da518c4eca0ac713b9e0a7a4	libbsd-0.9.1.tar.xz
-sha256	df6d8e1b5b3a5b06376c658c8ad3afc82687f1c0e0404cec4738ad14b2675708	COPYING
+# From https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html
+sha256	34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887	libbsd-0.10.0.tar.xz
+sha256	933d14a6bc89ee1fd7adbf5b6ec97f6ff0e002549d0b0c164f8a8895371d78f8	COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 2d78b8c5f3..27bac6838a 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.9.1
+LIBBSD_VERSION = 0.10.0
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
-LIBBSD_SITE = https://archive.hadrons.org/software/libbsd
+LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
 		MIT, ISC, Beerware
 LIBBSD_LICENSE_FILES = COPYING
