From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Jul 2016 15:25:41 +0200
Subject: [Buildroot] [PATCH] package/liboping: fix build after bump
Message-ID: <1467725141-26791-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/6a9/6a9b4d7b1b3cd72e32579fbaf5a69dbde0fea8e4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../liboping/0001-clock_gettime-needs-lrt.patch    | 29 ++++++++++++++++++++++
 package/liboping/liboping.mk                       |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/liboping/0001-clock_gettime-needs-lrt.patch

diff --git a/package/liboping/0001-clock_gettime-needs-lrt.patch b/package/liboping/0001-clock_gettime-needs-lrt.patch
new file mode 100644
index 0000000..63b2e55
--- /dev/null
+++ b/package/liboping/0001-clock_gettime-needs-lrt.patch
@@ -0,0 +1,29 @@
+configure: also check for clockgettime()
+
+clock_gettime() is also in -lrt so we also need to check for it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN liboping-1.9.0.orig/configure.ac liboping-1.9.0/configure.ac
+--- liboping-1.9.0.orig/configure.ac	2016-06-27 08:41:10.000000000 +0200
++++ liboping-1.9.0/configure.ac	2016-07-05 15:14:15.793663190 +0200
+@@ -199,12 +199,16 @@
+ 
+ AC_SUBST(LIBOPING_PC_LIBS_PRIVATE)
+ 
+-nanosleep_needs_rt="no"
++needs_rt="no"
+ AC_CHECK_FUNCS(nanosleep, [],
+ 	AC_CHECK_LIB(rt, nanosleep,
+-		[nanosleep_needs_rt="yes"],
++		[needs_rt="yes"],
+ 		AC_MSG_ERROR(cannot find nanosleep)))
+-AM_CONDITIONAL(BUILD_WITH_LIBRT, test "x$nanosleep_needs_rt" = "xyes")
++AC_CHECK_FUNCS(clock_gettime, [],
++	AC_CHECK_LIB(rt, nanosleep,
++		[needs_rt="yes"],
++		AC_MSG_ERROR(cannot find clock_gettime)))
++AM_CONDITIONAL(BUILD_WITH_LIBRT, test "x$needs_rt" = "xyes")
+ 
+ with_ncurses="no"
+ AC_CHECK_HEADERS(ncursesw/ncurses.h ncurses.h, [with_ncurses="yes"], [])
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 6e071a5..dd70387 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -13,4 +13,6 @@ LIBOPING_CONF_OPTS = --without-perl-bindings
 LIBOPING_LICENSE = LGPLv2.1+, GPLv2
 LIBOPING_LICENSE_FILES = COPYING
 
+LIBOPING_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.7.4
