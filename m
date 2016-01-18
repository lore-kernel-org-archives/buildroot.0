From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 18 Jan 2016 22:12:23 +0100
Subject: [Buildroot] [PATCH v2] package/scrub: new package
Message-ID: <1453151543-30515-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch fixing autoreconf call.
Patch already sent upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in                                  |  1 +
 ...c-make-sure-m4-macros-are-included-in-the.patch | 49 ++++++++++++++++++++++
 package/scrub/Config.in                            |  7 ++++
 package/scrub/scrub.hash                           |  2 +
 package/scrub/scrub.mk                             | 16 +++++++
 5 files changed, 75 insertions(+)
 create mode 100644 package/scrub/0001-configure.ac-make-sure-m4-macros-are-included-in-the.patch
 create mode 100644 package/scrub/Config.in
 create mode 100644 package/scrub/scrub.hash
 create mode 100644 package/scrub/scrub.mk

diff --git a/package/Config.in b/package/Config.in
index 06ed4a8..0f6a61c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1585,6 +1585,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/scrub/0001-configure.ac-make-sure-m4-macros-are-included-in-the.patch b/package/scrub/0001-configure.ac-make-sure-m4-macros-are-included-in-the.patch
new file mode 100644
index 0000000..166bdf2
--- /dev/null
+++ b/package/scrub/0001-configure.ac-make-sure-m4-macros-are-included-in-the.patch
@@ -0,0 +1,49 @@
+Fetched from: https://github.com/chaos/scrub/pull/7
+Upstream status: PR sent
+
+From 11d30916dd9c11a26c7c8a0f6db9e6ebca301594 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 18 Jan 2016 21:45:23 +0100
+Subject: [PATCH] configure.ac: make sure m4 macros are included in the build
+
+This change prevents the following error to occur when calling
+autoreconf:
+
+  >>> scrub 2.6.1 Autoreconfiguring
+  cd /work/build/scrub/build/scrub-2.6.1/ &&  PATH="/work/build/scrub/host/bin:/work/build/scrub/host/sbin:/work/build/scrub/host/usr/bin:/work/build/scrub/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/sbin:/usr/sbin" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/work/build/scrub/host/usr/include" CFLAGS="-O2 -I/work/build/scrub/host/usr/include" CXXFLAGS="-O2 -I/work/build/scrub/host/usr/include" LDFLAGS="-L/work/build/scrub/host/lib -L/work/build/scrub/host/usr/lib -Wl,-rpath,/work/build/scrub/host/usr/lib" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG="/work/build/scrub/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/work/build/scrub/host/usr/lib/pkgconfig:/work/build/s
 crub/host/usr/share/pkgconfig" INTLTOOL_PERL=/usr/bin/perl ACLOCAL="/work/build/scrub/host/usr/bin/aclocal -I /work/build/scrub/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/aclocal" AUTOCONF="/work/build/scrub/host/usr/bin/autoconf" AUTOHEADER="/work/build/scrub/host/usr/bin/autoheader" AUTOMAKE="/work/build/scrub/host/usr/bin/automake" AUTOPOINT=/bin/true /work/build/scrub/host/usr/bin/autoreconf -f -i -I "/work/build/scrub/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/aclocal" -I "/work/build/scrub/host/usr/share/aclocal"
+  libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'config'.
+  libtoolize: copying file 'config/ltmain.sh'
+  libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
+  libtoolize: and rerunning libtoolize and aclocal.
+  libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
+  configure.ac:10: error possibly undefined macro: X_AC_META
+        If this token and others are legitimate, please use m4_pattern_allow.
+        See the Autoconf documentation.
+  configure.ac:11: error possibly undefined macro: X_AC_EXPAND_INSTALL_DIRS
+  configure.ac:51: error possibly undefined macro: AC_PKGCONFIG
+  configure.ac:70: error possibly undefined macro: X_AC_CHECK_PTHREADS
+  autoreconf: /work/build/scrub/host/usr/bin/autoconf failed with exit status: 1
+  package/pkg-generic.mk:185: recipe for target '/work/build/scrub/build/scrub-2.6.1/.stamp_configured' failed
+  make: *** [/work/build/scrub/build/scrub-2.6.1/.stamp_configured] Error 1
+  make: Leaving directory '/work/repos/buildroot'
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 3d71289..07eaf33 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -7,6 +7,7 @@ AC_INIT(m4_esyscmd([awk '/Name:/ {printf "%s",$2; exit}' META]),
+ AC_CONFIG_AUX_DIR([config])
+ AC_CONFIG_SRCDIR([NEWS])
+ AC_CANONICAL_SYSTEM
++AC_CONFIG_MACRO_DIR([config])
+ X_AC_META
+ X_AC_EXPAND_INSTALL_DIRS
+ 
+-- 
+2.7.0
+
diff --git a/package/scrub/Config.in b/package/scrub/Config.in
new file mode 100644
index 0000000..3c7d28b
--- /dev/null
+++ b/package/scrub/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SCRUB
+	bool "scrub"
+	help
+	  Scrub iteratively writes patterns on files or disk devices to make
+	  retrieving the data more difficult.
+
+	  https://code.google.com/p/diskscrub/
diff --git a/package/scrub/scrub.hash b/package/scrub/scrub.hash
new file mode 100644
index 0000000..42f7b2f
--- /dev/null
+++ b/package/scrub/scrub.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  838b061b2e1932b342fb9695c5579cdff5d2d72506cb41d6d8032eba18aed969  scrub-2.6.1.tar.gz
diff --git a/package/scrub/scrub.mk b/package/scrub/scrub.mk
new file mode 100644
index 0000000..0ea77eb
--- /dev/null
+++ b/package/scrub/scrub.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# scrub
+#
+################################################################################
+
+SCRUB_VERSION = 2.6.1
+SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
+SCRUB_LICENSE = GPLv2+
+SCRUB_LICENSE_FILES = COPYING
+
+# Fetching from the git repo, no configure/Makefile generated, and patching
+# configure.ac
+SCRUB_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.7.0
