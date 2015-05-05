From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 May 2015 19:57:48 +0200
Subject: [Buildroot] [PATCHv2] package/at: fix glibcism
Message-ID: <1430848668-12897-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at needs __isleap() which is in (e)glibc and uClibc, but not in musl.

Add a patch (from Open Embedded) that removes use of the macros, and
directly expands the corresponding code in lieu of the macro calls.

Fixes:
    http://autobuild.buildroot.org/results/6f2/6f25e80e8aedec91323ef9b67576b550d7abee60/
    http://autobuild.buildroot.org/results/da5/da5bb779f3077b079203fcbdb2533dd790963cd4/
    http://autobuild.buildroot.org/results/8a6/8a6ce608c6f46d08ed77049f796e98e6e10a1709/
    ...

Thanks to J?rg for pointing to the OE patch! :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../at/0008-remove-glibc-__isleap-assumption.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/at/0008-remove-glibc-__isleap-assumption.patch

diff --git a/package/at/0008-remove-glibc-__isleap-assumption.patch b/package/at/0008-remove-glibc-__isleap-assumption.patch
new file mode 100644
index 0000000..2152249
--- /dev/null
+++ b/package/at/0008-remove-glibc-__isleap-assumption.patch
@@ -0,0 +1,59 @@
+From 7f811d9c4ebc9444e613e251c31d6bf537a24dc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 16:35:30 -0700
+Subject: [PATCH] remove glibc assumption
+
+glibc time.h header has an undocumented __isleap macro
+that we are using anf musl is missing it.
+Since it is undocumented & does not appear
+on any other libc, stop using it and just define the macro in
+locally  instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[patch from: http://patchwork.openembedded.org/patch/91893/ ]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+ parsetime.y | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/parsetime.y b/parsetime.y
+index 7005e88..324e6d3 100644
+--- a/parsetime.y
++++ b/parsetime.y
+@@ -8,6 +8,9 @@
+ 
+ #define YYDEBUG 1
+ 
++#define is_leap_year(y) \
++    ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
++
+ struct tm exectm;
+ static int isgmt;
+ static int yearspec;
+@@ -217,8 +220,8 @@ date            : month_name day_number
+ 				 mnum == 12) && dnum > 31)
+ 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
+ 			         mnum == 11) && dnum > 30)
+-			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
+-			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
++			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
++			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
+ 			   )
+ 			{
+ 			    yyerror("Error in day of month");
+@@ -261,8 +264,8 @@ date            : month_name day_number
+ 				 mnum == 12) && dnum > 31)
+ 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
+ 			         mnum == 11) && dnum > 30)
+-			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
+-			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
++			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
++			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
+ 			   )
+ 			{
+ 			    yyerror("Error in day of month");
+-- 
+2.1.4
-- 
1.9.1
