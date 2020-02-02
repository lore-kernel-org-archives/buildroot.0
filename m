From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 09:07:14 +0100
Subject: [Buildroot] [git commit] package/libpam-tacplus: fix build on uclibc
Message-ID: <20200202075629.BA271881B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=059360f4e739e0fe93910cbe34fb36c9106f9bdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/05c67484136f3bb433ce7fc47b2ce01167048cc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-libtac-lib-magic.c-fix-build-on-uclibc.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/libpam-tacplus/0001-libtac-lib-magic.c-fix-build-on-uclibc.patch b/package/libpam-tacplus/0001-libtac-lib-magic.c-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..8cdbba4506
--- /dev/null
+++ b/package/libpam-tacplus/0001-libtac-lib-magic.c-fix-build-on-uclibc.patch
@@ -0,0 +1,52 @@
+From b2af0aca53d696e6dad17d8a0351d233d1dd1200 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Jan 2020 20:51:59 +0100
+Subject: [PATCH] libtac/lib/magic.c: fix build on uclibc
+
+Commit 7e990f9db6d8805d369876f45964df87efad9e08 replaced _GNU_SOURCE by
+AC_SYSTEM_EXTENSIONS. This is fine but then config.h must be included
+before system includes otherwise build fails with uclibc on:
+
+libtac/lib/magic.c: In function 'magic':
+libtac/lib/magic.c:70:11: error: implicit declaration of function 'getrandom' [-Werror=implicit-function-declaration]
+     ret = getrandom(&num, sizeof(num), GRND_NONBLOCK);
+           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/05c67484136f3bb433ce7fc47b2ce01167048cc2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kravietz/pam_tacplus/pull/137]
+---
+ libtac/lib/magic.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtac/lib/magic.c b/libtac/lib/magic.c
+index 9df5e3f..e13a483 100644
+--- a/libtac/lib/magic.c
++++ b/libtac/lib/magic.c
+@@ -18,6 +18,10 @@
+  * See `CHANGES' file for revision history.
+  */
+ 
++#ifdef HAVE_CONFIG_H
++  #include "config.h"
++#endif
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+@@ -27,10 +31,6 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ 
+-#ifdef HAVE_CONFIG_H
+-  #include "config.h"
+-#endif
+-
+ #include "magic.h"
+ 
+ #ifdef _MSC_VER
+-- 
+2.24.1
+
