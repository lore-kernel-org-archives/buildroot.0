From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 00:05:25 +0200
Subject: [Buildroot] [git commit] classpath: fix build errors with gmp
	support
Message-ID: <20130707221713.E15CE9A0B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44b16fb3972757e8936f753bca8c8bf621b5ef2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gmp support has a hardcoded /usr/include include PATH which causes
breakage when there is a distribution gmp with development headers
installed. Fixes:
http://autobuild.buildroot.net/results/849/8497648c0b21390782eecc5b4aa91281bcf58ad6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../classpath/classpath-01-fix-gmp-include.patch   |   46 ++++++++++++++++++++
 package/classpath/classpath.mk                     |    6 ++-
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/package/classpath/classpath-01-fix-gmp-include.patch b/package/classpath/classpath-01-fix-gmp-include.patch
new file mode 100644
index 0000000..f7a3920
--- /dev/null
+++ b/package/classpath/classpath-01-fix-gmp-include.patch
@@ -0,0 +1,46 @@
+The GMP include is hardcoded to /usr/include causing obvious problems.
+
+From classpath CVS:
+http://cvs.savannah.gnu.org/viewvc/classpath/configure.ac?root=classpath&r1=1.245&r2=1.246
+
+[Gustavo: ditch -L or libtool complains loudly]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/configure.ac	2010/01/30 01:33:50	1.245
++++ b/configure.ac	2010/05/04 12:29:23	1.246
+@@ -752,10 +752,32 @@
+   dnl __gmpz_mul_si for earlier versions (>= 3.1).
+   dnl IMPORTANT: if you decide to look for __gmpz_combit, don't forget to
+   dnl change the name of the corresponding ac_ variable on lines 860...
++  AC_ARG_WITH(gmp, [  --with-gmp=PATH         specify prefix directory for the installed GMP package.
++                          Equivalent to --with-gmp-include=PATH/include
++                          plus --with-gmp-lib=PATH/lib])
++  AC_ARG_WITH(gmp_include, [  --with-gmp-include=PATH specify directory for installed GMP include files])
++  AC_ARG_WITH(gmp_lib, [  --with-gmp-lib=PATH     specify directory for the installed GMP library])
++
+   if test "x${COMPILE_GMP}" = xyes; then
++    AC_MSG_CHECKING([for GMP directories])
++    if test "x$with_gmp" != x; then
++       gmplibs="-lgmp"
++       gmpinc="-I$with_gmp/include"
++       if test "x$with_gmp_include" != x; then
++       	  gmpinc="-I$with_gmp_include $gmpinc"
++       fi
++       if test "x$with_gmp_lib" != x; then
++       	  gmplibs="$gmplibs"
++       fi
++    else
++        with_gmp="/usr"
++	gmplibs="-lgmp"
++    	gmpinc="-I/usr/include"
++    fi
++    AC_MSG_RESULT([prefix=$with_gmp, libs=$gmplibs, inc=$gmpinc])
+     AC_CHECK_LIB(gmp, __gmpz_mul_si,
+-      [GMP_CFLAGS=-I/usr/include
+-       GMP_LIBS=-lgmp ],
++      [GMP_CFLAGS="$gmpinc"
++       GMP_LIBS="$gmplibs" ],
+       [GMP_CFLAGS=
+        GMP_LIBS= ])
+     AC_SUBST(GMP_CFLAGS)
diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 62167aa..c305178 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -17,8 +17,10 @@ CLASSPATH_CONF_OPT = \
 # classpath assumes qt runs on top of X11, but we
 # don't support qt4 on X11
 CLASSPATH_CONF_OPT += --disable-qt-peer
-
 CLASSPATH_DEPENDENCIES = host-pkgconf
+CLASSPATH_AUTORECONF = YES
+CLASSPATH_LICENSE = GPLv2+ with exception
+CLASSPATH_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 CLASSPATH_CONF_OPT += --enable-alsa
@@ -28,7 +30,7 @@ CLASSPATH_CONF_OPT += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_GMP),y)
-CLASSPATH_CONF_OPT += --enable-gmp
+CLASSPATH_CONF_OPT += --enable-gmp --with-gmp="$(STAGING_DIR)/usr"
 CLASSPATH_DEPENDENCIES += gmp
 else
 CLASSPATH_CONF_OPT += --disable-gmp
