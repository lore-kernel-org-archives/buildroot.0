From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 17:50:55 +0200
Subject: [Buildroot] [git commit] bcusdk: make it build with the musl C
	library
Message-ID: <20150808155221.8E12180559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=feaa241ce35de6c6b8c0ad6fa6a8c0e669919037
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes bcusdk build with the musl C library by:

 * Adding a dependency on argp-standalone

 * Adding a patch to fix the incorrect usage of <sys/cdefs.h>

 * Adding a patch to fix a missing header include for fd_set

Both patches have been submitted upstream,
https://sourceforge.net/p/bcusdk/patches/3/.

Fixes:

  http://autobuild.buildroot.net/results/46054f28d3fde173dd8f880fa8ac2784c8e1750f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...t-use-the-non-standard-sys-cdefs.h-header.patch |   48 ++++++++++++++++++++
 ...fd_set-requires-inclusion-of-sys-select.h.patch |   31 +++++++++++++
 package/bcusdk/Config.in                           |    2 +-
 3 files changed, 80 insertions(+), 1 deletions(-)

diff --git a/package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch b/package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
new file mode 100644
index 0000000..fc64386
--- /dev/null
+++ b/package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
@@ -0,0 +1,48 @@
+From c36db3f798bf576f42d81a0c51198b17d7112e8c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 8 Aug 2015 17:43:28 +0200
+Subject: [PATCH] Do not use the non-standard <sys/cdefs.h> header
+
+<sys/cdefs.h> is glibc-specific, and should be used only internally by
+glibc, not by external libraries/programs. It is not available in all
+standard C libraries.
+
+Submitted upstream: https://sourceforge.net/p/bcusdk/patches/3/
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ eibd/include/eibclient.h | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/eibd/include/eibclient.h b/eibd/include/eibclient.h
+index 2781878..b095a1c 100644
+--- a/eibd/include/eibclient.h
++++ b/eibd/include/eibclient.h
+@@ -27,10 +27,11 @@
+ #ifndef EIBCLIENT_H
+ #define EIBCLIENT_H
+ 
+-#include <sys/cdefs.h>
+ #include <stdint.h>
+ 
+-__BEGIN_DECLS;
++#ifdef	__cplusplus
++extern "C" {
++#endif
+ 
+ #include "eibloadresult.h"
+ 
+@@ -889,5 +890,9 @@ int EIB_Cache_LastUpdates_async (EIBConnection * con, uint16_t start,
+ 				 uint16_t * end);
+ 
+ 
+-__END_DECLS
++
++#ifdef	__cplusplus
++}
++#endif
++
+ #endif
+-- 
+2.5.0
+
diff --git a/package/bcusdk/0002-fd_set-requires-inclusion-of-sys-select.h.patch b/package/bcusdk/0002-fd_set-requires-inclusion-of-sys-select.h.patch
new file mode 100644
index 0000000..723de5c
--- /dev/null
+++ b/package/bcusdk/0002-fd_set-requires-inclusion-of-sys-select.h.patch
@@ -0,0 +1,31 @@
+From 2541ee3d709803096b17e45610ccc1404e2e5eee Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 8 Aug 2015 17:46:34 +0200
+Subject: [PATCH] fd_set requires inclusion of <sys/select.h>
+
+According to POSIX.1-2001, the definition fd_set and related macros is
+in <sys/select.h>, so it should be included in files using fd_set to
+make the code compatible with all standard C libraries.
+
+Submitted upstream: https://sourceforge.net/p/bcusdk/patches/3/
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ eibd/examples/common.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eibd/examples/common.h b/eibd/examples/common.h
+index 51fc514..f038da1 100644
+--- a/eibd/examples/common.h
++++ b/eibd/examples/common.h
+@@ -20,6 +20,7 @@
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <unistd.h>
++#include <sys/select.h>
+ #include "eibclient.h"
+ 
+ /** unsigned char*/
+-- 
+2.5.0
+
diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index 72deef1..8f9330e 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BCUSDK
 	depends on BR2_USE_MMU # libpthsem
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPTHSEM
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
 	  A free development environment for the Bus Coupling Units of
 	  the European Installation Bus.
