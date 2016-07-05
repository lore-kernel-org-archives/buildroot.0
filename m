From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:21:42 +0200
Subject: [Buildroot] [git commit] package/liboping: fix build after bump
Message-ID: <20160705152202.68D178195E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=246c9918911c6faf9b505a474c3500a7f9671882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/6a9/6a9b4d7b1b3cd72e32579fbaf5a69dbde0fea8e4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-configure-also-check-for-clockgettime.patch | 39 ++++++++++++++++++++++
 package/liboping/liboping.mk                       |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/package/liboping/0001-configure-also-check-for-clockgettime.patch b/package/liboping/0001-configure-also-check-for-clockgettime.patch
new file mode 100644
index 0000000..b2c5855
--- /dev/null
+++ b/package/liboping/0001-configure-also-check-for-clockgettime.patch
@@ -0,0 +1,39 @@
+From a45f3610beba1f7e6e1a038e3a1fe4150057c262 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 5 Jul 2016 15:31:28 +0200
+Subject: [PATCH] configure: also check for clockgettime()
+
+clock_gettime() is also in -lrt so we also need to check for it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f83f5ab..3b6ae09 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -199,12 +199,16 @@ fi
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
++	AC_CHECK_LIB(rt, clock_gettime,
++		[needs_rt="yes"],
++		AC_MSG_ERROR(cannot find clock_gettime)))
++AM_CONDITIONAL(BUILD_WITH_LIBRT, test "x$needs_rt" = "xyes")
+ 
+ with_ncurses="no"
+ AC_CHECK_HEADERS(ncursesw/ncurses.h ncurses.h, [with_ncurses="yes"], [])
+-- 
+2.7.4
+
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
