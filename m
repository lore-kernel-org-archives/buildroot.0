From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Oct 2019 19:59:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/ytree: fix musl build
In-Reply-To: <20191001175911.16028-1-bernd.kuhls@t-online.de>
References: <20191001175911.16028-1-bernd.kuhls@t-online.de>
Message-ID: <20191001175911.16028-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ytree/0001-fix-musl.patch | 23 +++++++++++++++++++++++
 package/ytree/Config.in           |  5 -----
 2 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 package/ytree/0001-fix-musl.patch

diff --git a/package/ytree/0001-fix-musl.patch b/package/ytree/0001-fix-musl.patch
new file mode 100644
index 0000000000..72632122d6
--- /dev/null
+++ b/package/ytree/0001-fix-musl.patch
@@ -0,0 +1,23 @@
+Fix musl build
+
+Fixes
+
+  match.c.text+0x9c): undefined reference to `re_comp'
+  match.c.text+0xca): undefined reference to `re_exec'
+
+by using regcomp instead.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ytree-1.99pl2.orig/match.c ytree-1.99pl2/match.c
+--- ytree-1.99pl2.orig/match.c	2019-09-29 12:37:57.000000000 +0200
++++ ytree-1.99pl2/match.c	2019-10-01 19:46:56.193815327 +0200
+@@ -10,7 +10,7 @@
+ #include "ytree.h"
+ 
+ #if defined( sun ) || defined( linux ) || defined( __NeXT__ ) || defined( OSF1 ) ||  defined( __OpenBSD__ ) || defined(__NetBSD__) || defined( __FreeBSD__ ) || defined( __GNU__ )
+-#define HAS_REGEX
++#define HAS_REGCOMP
+ #endif
+ 
+ #ifdef linux
diff --git a/package/ytree/Config.in b/package/ytree/Config.in
index c6f75b5590..3ac9283a56 100644
--- a/package/ytree/Config.in
+++ b/package/ytree/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_YTREE
 	bool "ytree"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # re_comp/re_exec
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Ytree - a (curses-based) file manager similar to DOS Xtree(tm)
 
 	  https://www.han.de/~werner/ytree.html
-
-comment "ytree needs a glibc or uClibc toolchain"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.20.1
