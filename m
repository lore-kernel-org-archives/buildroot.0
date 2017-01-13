From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 13 Jan 2017 02:30:49 -0200
Subject: [Buildroot] [PATCH 1/1] util-linux: fix ncurses/wchar handling
	(again)
Message-ID: <1484281849-25875-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

util-linux #defines "wchar_t" as "char" when configured without widechar
support. This conflicts with definition of wchar_t contained in stddef.h,
so the compilation fails with

    error: two or more data types in declaration specifiers
    #define
     wchar_t char

The error can be reproduced rearrangin the incluson order in some files
under the text-utils directory.

Fixes:

  http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
  http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
  http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...3-Fix-compilation-with-ncurses-and-uClibc.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/util-linux/0003-Fix-compilation-with-ncurses-and-uClibc.patch

diff --git a/package/util-linux/0003-Fix-compilation-with-ncurses-and-uClibc.patch b/package/util-linux/0003-Fix-compilation-with-ncurses-and-uClibc.patch
new file mode 100644
index 0000000..95f9e34
--- /dev/null
+++ b/package/util-linux/0003-Fix-compilation-with-ncurses-and-uClibc.patch
@@ -0,0 +1,70 @@
+From bcad0c3629101aeafec266ecb0221cac0f52fcec Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Fri, 13 Jan 2017 01:13:19 -0200
+Subject: [PATCH] Fix compilation with ncurses and uClibc
+
+Replacing "wchar_t" by "char" in widechar.h causes a conflict with the
+definition of wchar_t contained in stddef.h, which is included by c.h,
+so the compilation fails with
+
+   error: two or more data types in declaration specifiers #define
+   wchar_t char
+
+The error can be reproduced by configuring with --disable-widechar
+--without-ncursesw --with-ncurses. It can be avoided by moving the
+inclusion of widechar.h below the inclusion of c.h in colcrt.c,
+colrm.c and column.c.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ text-utils/colcrt.c | 2 +-
+ text-utils/colrm.c  | 2 +-
+ text-utils/column.c | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/text-utils/colcrt.c b/text-utils/colcrt.c
+index 62f8425..f376350 100644
+--- a/text-utils/colcrt.c
++++ b/text-utils/colcrt.c
+@@ -46,8 +46,8 @@
+ #include <getopt.h>
+ 
+ #include "nls.h"
+-#include "widechar.h"
+ #include "c.h"
++#include "widechar.h"
+ #include "closestream.h"
+ 
+ /*
+diff --git a/text-utils/colrm.c b/text-utils/colrm.c
+index 431eae0..e799cd1 100644
+--- a/text-utils/colrm.c
++++ b/text-utils/colrm.c
+@@ -44,9 +44,9 @@
+ #include <unistd.h>
+ 
+ #include "nls.h"
+-#include "widechar.h"
+ #include "strutils.h"
+ #include "c.h"
++#include "widechar.h"
+ #include "closestream.h"
+ 
+ /*
+diff --git a/text-utils/column.c b/text-utils/column.c
+index b8d31c9..e0144a2 100644
+--- a/text-utils/column.c
++++ b/text-utils/column.c
+@@ -50,8 +50,8 @@
+ #include <getopt.h>
+ 
+ #include "nls.h"
+-#include "widechar.h"
+ #include "c.h"
++#include "widechar.h"
+ #include "xalloc.h"
+ #include "strutils.h"
+ #include "closestream.h"
+-- 
+2.7.4
+
-- 
2.7.4
