From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:20:26 +0100
Subject: [Buildroot] [git commit] package/opentyrian: bump to latest
	revision.
Message-ID: <20150308212041.B5F54805EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ce5f4d27d72bddf6308a829e8e5ed65b124ec1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 120a3efeec66dbbade3d8213682c0a8940c906eb from Romain, Opentyrian
upstream has fixed the build problem on Blackfin (in a slightly different way).
So bump to latest revision to not keep the fix in BR.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-don-t-redefine-strchrnul-for-unix-system.patch |   42 --------------------
 package/opentyrian/opentyrian.mk                   |    6 +-
 2 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch b/package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch
deleted file mode 100644
index e20ab00..0000000
--- a/package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1c64c2d103c9356750a3d3b559068329bb0c7e3c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Fri, 20 Feb 2015 00:29:47 +0100
-Subject: [PATCH] mingw_fixes: don't redefine strchrnul for unix system
-
-On bfin architecture all symbols are prefixed with a underscore '_', hence a
-conflict with the _strchrnul symbole from mingw_fixes.c and the one from uClibc.
-
-Path/to/sysroot/usr/lib/libc.a(strchrnul.o): In function `*___GI_strchrnul':
-Path/to/uClibc/libc/string/generic/strchrnul.c:33: multiple definition of `_strchrnul'
-obj/mingw_fixes.o:src/mingw_fixes.c:(.text+0x0): first defined here
-
-Since mingw_fixes.c is intended for WIN32 system, add a guard around strchrnul function
-and use the one defined from string.h.
-
-Fixes:
-http://autobuild.buildroot.net/results/a08/a085fb55269971e3c7b8ae8c167e7330c3c042a5/
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/mingw_fixes.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/mingw_fixes.c b/src/mingw_fixes.c
-index d734438..2f4069e 100644
---- a/src/mingw_fixes.c
-+++ b/src/mingw_fixes.c
-@@ -18,9 +18,11 @@
-  */
- #include "mingw_fixes.h"
- 
-+#ifndef TARGET_UNIX
- char *strchrnul( const char *s, int c )
- {
- 	for (; *s != c && *s != '\0'; ++s)
- 		;
- 	return (char *)s;
- }
-+#endif
--- 
-1.9.3
-
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index f00a52b..3dc5af5 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENTYRIAN_VERSION = 2.1.20130907
-OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases
-OPENTYRIAN_SOURCE = opentyrian-$(OPENTYRIAN_VERSION)-src.tar.gz
+OPENTYRIAN_VERSION = 9c9f0ec3532b
+OPENTYRIAN_SITE = https://code.google.com/p/opentyrian/
+OPENTYRIAN_SITE_METHOD = hg
 OPENTYRIAN_LICENSE = GPLv2+
 OPENTYRIAN_LICENSE_FILES = COPYING
 
