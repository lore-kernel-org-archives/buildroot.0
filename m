From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 09:23:16 +0100
Subject: [Buildroot] [git commit] package/opentyrian: fix build on bfin
Message-ID: <20150220082322.B57DD817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=120a3efeec66dbbade3d8213682c0a8940c906eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a conflict with the _strchrnul symbole from mingw_fixes.c
and the one from uClibc.

Add a guard around strchrnul function for unix systems.

Fixes:
http://autobuild.buildroot.net/results/a08/a085fb55269971e3c7b8ae8c167e7330c3c042a5/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-don-t-redefine-strchrnul-for-unix-system.patch |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch b/package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch
new file mode 100644
index 0000000..e20ab00
--- /dev/null
+++ b/package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch
@@ -0,0 +1,42 @@
+From 1c64c2d103c9356750a3d3b559068329bb0c7e3c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 20 Feb 2015 00:29:47 +0100
+Subject: [PATCH] mingw_fixes: don't redefine strchrnul for unix system
+
+On bfin architecture all symbols are prefixed with a underscore '_', hence a
+conflict with the _strchrnul symbole from mingw_fixes.c and the one from uClibc.
+
+Path/to/sysroot/usr/lib/libc.a(strchrnul.o): In function `*___GI_strchrnul':
+Path/to/uClibc/libc/string/generic/strchrnul.c:33: multiple definition of `_strchrnul'
+obj/mingw_fixes.o:src/mingw_fixes.c:(.text+0x0): first defined here
+
+Since mingw_fixes.c is intended for WIN32 system, add a guard around strchrnul function
+and use the one defined from string.h.
+
+Fixes:
+http://autobuild.buildroot.net/results/a08/a085fb55269971e3c7b8ae8c167e7330c3c042a5/
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/mingw_fixes.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/mingw_fixes.c b/src/mingw_fixes.c
+index d734438..2f4069e 100644
+--- a/src/mingw_fixes.c
++++ b/src/mingw_fixes.c
+@@ -18,9 +18,11 @@
+  */
+ #include "mingw_fixes.h"
+ 
++#ifndef TARGET_UNIX
+ char *strchrnul( const char *s, int c )
+ {
+ 	for (; *s != c && *s != '\0'; ++s)
+ 		;
+ 	return (char *)s;
+ }
++#endif
+-- 
+1.9.3
+
