From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:27:39 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] lldpd: remove check on
 CXX compiler
Message-ID: <20171227223843.5DBCC8376D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0127c4e865f2cd49d526d1221ef1195f40662851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

lldpd currently depends on a C++ compiler to configure properly, but
the package doesn't select that option, so builds fail if
BR2_TOOLCHAIN_BUILDROOT_CXX is not selected with following errors:

  checking how to run the C++ preprocessor... /lib/cpp
  configure: error: in `/home/dkc/src/buildroot/build-zii/build/lldpd-0.9.4':
  configure: error: C++ preprocessor "/lib/cpp" fails sanity check

This package actually builds fine without C++, so drop this check in
configure.ac. Attached patch has already been accepted upstream [1].

[1] https://github.com/vincentbernat/lldpd/pull/261

[Peter: adjust autoreconf comment]
Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Reviewed-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 18c9cda6e4b94aa9426a1355d05b000f69453c6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...03-configure-remove-check-on-CXX-compiler.patch | 35 ++++++++++++++++++++++
 package/lldpd/lldpd.mk                             |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch b/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
new file mode 100644
index 0000000..880f603
--- /dev/null
+++ b/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
@@ -0,0 +1,35 @@
+From d28b3bfa1b224f7770004dddf4dfaf10ad7ad6c9 Mon Sep 17 00:00:00 2001
+From: Damien Riegel <damien.riegel@savoirfairelinux.com>
+Date: Mon, 18 Dec 2017 14:37:08 -0500
+Subject: [PATCH] configure: remove check on CXX compiler
+
+lldpd fails to build if the toolchain doesn't have a C++ compiler
+because configure fails with the following error:
+
+  checking how to run the C++ preprocessor... /lib/cpp
+  configure: error: in `/home/dkc/src/buildroot/build-zii/build/lldpd-0.9.4':
+  configure: error: C++ preprocessor "/lib/cpp" fails sanity check
+
+Since "8d92800b: build: cleaner way to not alter CFLAGS/CPPFLAGS/LDFLAGS",
+it seems that the dependency on C++ is not required anymore, so there
+is no reason to keep this restriction. Dropping AC_PROG_CXX allows to
+build with a toolchain that doesn't have C++ just fine.
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0edceb1..5afe8f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,7 +48,6 @@ AC_PROG_CC_C99
+ if test x"$ac_cv_prog_cc_c99" = x"no"; then
+   AC_MSG_FAILURE([*** C99 support is mandatory])
+ fi
+-AC_PROG_CXX
+ AM_PROG_CC_C_O
+ AC_PROG_LIBTOOL
+ AC_PROG_LN_S
+-- 
+2.15.1
+
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 349c556..2bdda02 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -9,7 +9,7 @@ LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = README.md
-# 0002-configure-do-not-check-for-libbsd.patch
+# 0002-configure-do-not-check-for-libbsd.patch / 0003-configure-remove-check-on-CXX-compiler.patch
 LLDPD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_CHECK),y)
