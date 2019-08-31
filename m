From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 12:13:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbsd: security bump version to
 0.10.0
Message-ID: <20190831101314.8247-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html

"This release includes:

 - Several security related fixes for nlist() reported by Daniel Hodson
   and one by Coverity Scan."

Removed patch applied upstream:
https://cgit.freedesktop.org/libbsd/commit/?id=13c32916b4baab58d93940d57fea9ff0777f1931

Upstream added support for ARC:
https://cgit.freedesktop.org/libbsd/commit/?id=4997efa59a607a2b4aa2519a50f9e51017b667d2

Added all hashes provided by upstream and updated license hash due to
upstream commits: https://cgit.freedesktop.org/libbsd/log/COPYING

Moved _SITE to freedesktop.org.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---

 ...0001-flopen-fix-build-with-musl-libc.patch | 40 -------------------
 package/libbsd/Config.in                      |  1 -
 package/libbsd/libbsd.hash                    |  9 +++--
 package/libbsd/libbsd.mk                      |  4 +-
 4 files changed, 8 insertions(+), 46 deletions(-)
 delete mode 100644 package/libbsd/0001-flopen-fix-build-with-musl-libc.patch

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
-flopen.c: In function ?vflopenat?:
-flopen.c:60:14: error: ?O_CREAT? undeclared (first use in this function)
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
index 1a107d41f0..88b33efb0e 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	default y
 	# libbsd does not support those architectures (see src/local-elf.h)
 	depends on !BR2_microblaze
-	depends on !BR2_arc
 	depends on !BR2_xtensa
 	depends on !BR2_nds32
 	# uClibc on noMMU doesn't provide __register_atfork()
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 93af3944ae..cbd8d4e52e 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,6 @@
-# From https://lists.freedesktop.org/archives/libbsd/2018-May/000190.html
-sha256	56d835742327d69faccd16955a60b6dcf30684a8da518c4eca0ac713b9e0a7a4	libbsd-0.9.1.tar.xz
-sha256	df6d8e1b5b3a5b06376c658c8ad3afc82687f1c0e0404cec4738ad14b2675708	COPYING
+# From https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html
+md5 ead96d240d02faa5b921c0aa50c812b5  libbsd-0.10.0.tar.xz
+sha1 9cb8f0b717da13c8aa13b9f3f5f8105ee6e5ccb5  libbsd-0.10.0.tar.xz
+sha256 34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887  libbsd-0.10.0.tar.xz
+# Locally computed
+sha256 933d14a6bc89ee1fd7adbf5b6ec97f6ff0e002549d0b0c164f8a8895371d78f8  COPYING
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
-- 
2.20.1
