From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 10:00:22 +0100
Subject: [Buildroot] [git commit] package/atop: bump to version 2.4.0
Message-ID: <20190128090221.4FDD47FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=780ea788b60d1b0dcdc85e562a12178182d046a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0001 as it was applied upstream [1].
This new version uses PERF_FLAG_FD_CLOEXEC therefore it needs a
toolchain with headers >= 3.14.

[1] https://github.com/Atoptool/atop/commit/414127c03669b4eedc85778a7bff80cf601311d8

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ude-sysmacros.h-to-compile-with-newer-gcc.patch | 52 ----------------------
 package/atop/Config.in                             |  5 +++
 package/atop/atop.hash                             |  2 +-
 package/atop/atop.mk                               |  2 +-
 4 files changed, 7 insertions(+), 54 deletions(-)

diff --git a/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch b/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
deleted file mode 100644
index a80be7b736..0000000000
--- a/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 414127c03669b4eedc85778a7bff80cf601311d8 Mon Sep 17 00:00:00 2001
-From: SjonHortensius <SjonHortensius@users.noreply.github.com>
-Date: Fri, 24 Aug 2018 18:26:58 +0200
-Subject: [PATCH] Include sysmacros.h to compile with newer gcc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Older gcc throws a warning
-```
-photosyst.c: In function 'lvmmapname':
-photosyst.c:1465:13: warning: In the GNU C Library, "major" is defined
- by <sys/sysmacros.h>. For historical compatibility, it is
- currently defined by <sys/types.h> as well, but we plan to
- remove this soon. To use "major", include <sys/sysmacros.h>
- directly. If you did not intend to use a system-defined macro
- "major", you should undefine it after including <sys/types.h>.
-     dmp->major  = major(statbuf.st_rdev);
-```
-
-Newer gcc throws an error:
-
-```
-photosyst.c: In function ???lvmmapname???:
-photosyst.c:1482:19: error: called object ???major??? is not a function or function pointer
-     dmp->major  = major(statbuf.st_rdev);
-                   ^~~~~
-photosyst.c:1437:25: note: declared here
- lvmmapname(unsigned int major, unsigned int minor,
-            ~~~~~~~~~~~~~^~~~~
-```
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- photosyst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/photosyst.c b/photosyst.c
-index 19cbbe1..50841a1 100644
---- a/photosyst.c
-+++ b/photosyst.c
-@@ -152,6 +152,7 @@
- static const char rcsid[] = "$Id: photosyst.c,v 1.38 2010/11/19 07:40:40 gerlof Exp $";
- 
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
--- 
-2.17.1
-
diff --git a/package/atop/Config.in b/package/atop/Config.in
index d42a201bd9..9e42eddb57 100644
--- a/package/atop/Config.in
+++ b/package/atop/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ATOP
 	bool "atop"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # PERF_FLAG_FD_CLOEXEC
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
 	help
@@ -16,3 +17,7 @@ config BR2_PACKAGE_ATOP
 	  username, state, and exit code.
 
 	  http://www.atoptool.nl
+
+comment "atop needs a toolchain w/ headers >= 3.14"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 9ee0d62bc6..80082d022d 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  73e4725de0bafac8c63b032e8479e2305e3962afbe977ec1abd45f9e104eb264  atop-2.3.0.tar.gz
+sha256  be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69  atop-2.4.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 2cc0da6afa..aaf02908c4 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.3.0
+ATOP_VERSION = 2.4.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
