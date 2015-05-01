From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 May 2015 09:37:19 -0300
Subject: [Buildroot] [PATCH] wine: fix build breakage with ncursesw
Message-ID: <1430483839-26357-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script doesn't detect ncursesw at all hence breaks the
build. Backport a patch from upstream for this. Fixes:
http://autobuild.buildroot.net/results/426/42669ca3b7215765a59a85c53ed724cbff79384e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wine/0002-detect-ncursesw.patch | 17 +++++++++++++++++
 package/wine/wine.mk                    |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 package/wine/0002-detect-ncursesw.patch

diff --git a/package/wine/0002-detect-ncursesw.patch b/package/wine/0002-detect-ncursesw.patch
new file mode 100644
index 0000000..7f153b1
--- /dev/null
+++ b/package/wine/0002-detect-ncursesw.patch
@@ -0,0 +1,17 @@
+Detect libncursesw as well.
+Backport from upstream 8d4e1fa7d77636a88651c9d48a48d39fab931c49
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura wine-1.6.2.orig/configure.ac wine-1.6.2/configure.ac
+--- wine-1.6.2.orig/configure.ac	2015-05-01 09:24:24.741960685 -0300
++++ wine-1.6.2/configure.ac	2015-05-01 09:25:26.860069750 -0300
+@@ -1359,7 +1359,7 @@
+ CURSESLIBS=""
+ if test "$ac_cv_header_ncurses_h" = "yes"
+ then
+-    WINE_CHECK_SONAME(ncurses,waddch,[CURSESLIBS="-lncurses"])
++    WINE_CHECK_SONAME(ncurses,waddch,[CURSESLIBS="-lncurses"],,,[[libncursesw\\{0,1\\}]])
+ elif test "$ac_cv_header_curses_h" = "yes"
+ then
+     WINE_CHECK_SONAME(curses,waddch,[CURSESLIBS="-lcurses"])
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index c201186..a96060f 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,6 +10,8 @@ WINE_SITE = http://downloads.sourceforge.net/project/wine/Source
 WINE_LICENSE = LGPLv2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
+# For 0002-detect-ncursesw.patch
+WINE_AUTORECONF = YES
 
 # Wine needs its own directory structure and tools for cross compiling
 WINE_CONF_OPTS = \
-- 
2.0.5
