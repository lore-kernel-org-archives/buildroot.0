From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 23:12:50 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/zstd: bump to
 version 1.4.8
Message-ID: <20210323215020.CC5E08849A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87b304fc99d3787690576859f26176e6882b0cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Drop patch (already in version)

https://github.com/facebook/zstd/releases/tag/v1.4.7
https://github.com/facebook/zstd/releases/tag/v1.4.8
(No 1.4.6 release)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 202c083f4a6d0ea10d408ed80dd4acdf31db16e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rograms-util.c-fix-build-without-st_mtime.patch | 40 ----------------------
 package/zstd/zstd.hash                             |  6 ++--
 package/zstd/zstd.mk                               |  2 +-
 3 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch b/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch
deleted file mode 100644
index 0f735b8843..0000000000
--- a/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 26d01bdb26f1c7487ad4ba0151221dfe28cd878d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Jul 2020 21:19:14 +0200
-Subject: [PATCH] programs/util.c: fix build without st_mtime
-
-Since version 1.4.5 and commit
-5af8cb7aea8d890b4801e50e5274371510f2cf33, if st_mtime is not defined,
-programs/util.c uses utime without including utime.h which will raise
-the following build failure on some of the buildroot autobuilders:
-
-util.c: In function 'UTIL_setFileStat':
-util.c:161:24: error: storage size of 'timebuf' isn't known
-         struct utimbuf timebuf;
-                        ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/be902c5d110f37bce622a2215191f155b7d3e7e0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/facebook/zstd/pull/2246]
----
- programs/util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/programs/util.c b/programs/util.c
-index a0d45745..2493a4ad 100644
---- a/programs/util.c
-+++ b/programs/util.c
-@@ -28,7 +28,7 @@ extern "C" {
- #  include <io.h>         /* _chmod */
- #else
- #  include <unistd.h>     /* chown, stat */
--#  if PLATFORM_POSIX_VERSION < 200809L
-+#  if PLATFORM_POSIX_VERSION < 200809L || !defined(st_mtime)
- #    include <utime.h>    /* utime */
- #  else
- #    include <fcntl.h>    /* AT_FDCWD */
--- 
-2.27.0
-
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index b764917c8f..c370bf8c46 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,6 +1,6 @@
-# From https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz.sha256
-sha256  98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e  zstd-1.4.5.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz.sha256
+sha256  32478297ca1500211008d596276f5367c54198495cf677e9439f4791a4c69f24  zstd-1.4.8.tar.gz
 
-# License files (locally computed as well)
+# License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 35002da332..e26e67f46b 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.4.5
+ZSTD_VERSION = 1.4.8
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
