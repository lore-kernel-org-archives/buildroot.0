From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Dec 2013 16:14:44 +0000
Subject: [Buildroot] [PATCH 2/2] blackbox: merge patch and fix linkage
	problem
In-Reply-To: <1387296884-27777-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1387296884-27777-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1387296884-27777-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-Merge the current blackbox-0.70.1-configure.patch to a new one named
blackbox-001-Fix-configure-ac.patch that will patch configure.ac instead
and also will add -lpthreads to LIBS to fix a linkage problem.
-Force autoreconf to generate the new configure script using the new
patched configure.ac file.

Fixes:

   http://autobuild.buildroot.net/results/a97/a979cc079706be2012fb4b6c72894aca636adfb6/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/blackbox/blackbox-0.70.1-configure.patch   |   15 ---------
 .../blackbox/blackbox-001-Fix-configure-ac.patch   |   34 ++++++++++++++++++++
 package/blackbox/blackbox.mk                       |    2 +
 3 files changed, 36 insertions(+), 15 deletions(-)
 delete mode 100644 package/blackbox/blackbox-0.70.1-configure.patch
 create mode 100644 package/blackbox/blackbox-001-Fix-configure-ac.patch

diff --git a/package/blackbox/blackbox-0.70.1-configure.patch b/package/blackbox/blackbox-0.70.1-configure.patch
deleted file mode 100644
index 3606f97..0000000
--- a/package/blackbox/blackbox-0.70.1-configure.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/configure	2005-11-03 03:27:16.000000000 -0500
-+++ b/configure	2008-02-02 23:25:25.000000000 -0500
-@@ -1980,12 +1980,6 @@ am__tar='${AMTAR} chof - "$$tardir"'; am
- 
- test "x$prefix" = "xNONE" && prefix="$ac_default_prefix"
- 
--CPPFLAGS="$CPPFLAGS -I$prefix/include"
--LDFLAGS="$LDFLAGS -L$prefix/lib"
--if test "x$prefix" != "x/usr/local"; then
--  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
--  LDFLAGS="$LDFLAGS -L/usr/local/lib"
--fi
- 
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
diff --git a/package/blackbox/blackbox-001-Fix-configure-ac.patch b/package/blackbox/blackbox-001-Fix-configure-ac.patch
new file mode 100644
index 0000000..1804473
--- /dev/null
+++ b/package/blackbox/blackbox-001-Fix-configure-ac.patch
@@ -0,0 +1,34 @@
+blackbox: merge existing patch and fix lpthread
+
+Merge the current configure patch into this one so it will patch 
+configure.ac instead. Also add pthread to libs to fix a linkage problem.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+--- blackbox-0.70.1/configure.ac.orig	2013-12-17 11:02:38.799055141 +0000
++++ blackbox-0.70.1/configure.ac	2013-12-17 11:09:08.421204545 +0000
+@@ -8,14 +8,6 @@ AC_CONFIG_SRCDIR([src/blackbox.cc])
+ dnl Determine default prefix
+ test "x$prefix" = "xNONE" && prefix="$ac_default_prefix"
+ 
+-dnl Look in the most logical places for external libraries
+-CPPFLAGS="$CPPFLAGS -I$prefix/include"
+-LDFLAGS="$LDFLAGS -L$prefix/lib"
+-if test "x$prefix" != "x/usr/local"; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+-
+ dnl Locate required external software
+ AC_PROG_CC
+ 
+@@ -128,6 +120,10 @@ int main(int, char **)
+                   [AC_MSG_RESULT([no])]
+                  )
+ 
++dnl required pthread
++AC_CHECK_LIB([pthread],
++	     [pthread_cancel],
++	     [LIBS="$LIBS -lpthread"])
+ dnl needed for some X11 libs
+ AC_CHECK_LIB([nsl],
+              [t_open],
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 09d15f1..ce8f06e 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -17,4 +17,6 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
 endif
 
+BLACKBOX_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
1.7.1
