From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Apr 2016 21:03:32 +0300
Subject: [Buildroot] [PATCH] mosh: fix build with the Codescape IMG toolchain
Message-ID: <95907701a43145654f7962319823a0f7fe73551b.1459879412.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Codescape IMG toolchain does not provide the ssp library even though it's
a glibc toolchain, and thus selects BR2_TOOLCHAIN_HAS_SSP. Add a patch that
changes the compile test for -fstack-protector-all to a build test that
correctly fails when ssp is missing.

This makes the seeding of ssp related configure variables unnecessary.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ure.ac-link-test-for-fstack-protector-all.patch | 33 ++++++++++++++++++++++
 package/mosh/mosh.mk                               | 11 ++------
 2 files changed, 35 insertions(+), 9 deletions(-)
 create mode 100644 package/mosh/0001-configure.ac-link-test-for-fstack-protector-all.patch

diff --git a/package/mosh/0001-configure.ac-link-test-for-fstack-protector-all.patch b/package/mosh/0001-configure.ac-link-test-for-fstack-protector-all.patch
new file mode 100644
index 000000000000..f8dc63b604fd
--- /dev/null
+++ b/package/mosh/0001-configure.ac-link-test-for-fstack-protector-all.patch
@@ -0,0 +1,33 @@
+From 5b3b697f50ba31842be544d6b54962df92c44958 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 5 Apr 2016 15:24:55 +0300
+Subject: [PATCH] configure.ac: link test for -fstack-protector-all
+
+There are (broken) compilers out there that accept -fstack-protector-*
+parameters, but do not provide the needed ssp library. As a result, build does
+not fail, but link does. Use the local check_link_flag autoconf function to
+correctly test for SSP availability.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/mobile-shell/mosh/pull/733
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3c9dea03e40a..f5799689f2c1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -93,7 +93,7 @@ AS_IF([test x"$hardening" != x"no"], [
+   # This one will likely succeed, even on platforms where it does nothing.
+   check_cc_cxx_flag([-D_FORTIFY_SOURCE=2], [HARDEN_CFLAGS="$HARDEN_CFLAGS -D_FORTIFY_SOURCE=2"])
+ 
+-  check_cc_cxx_flag([-fstack-protector-all],
++  check_link_flag([-fstack-protector-all],
+    [HARDEN_CFLAGS="$HARDEN_CFLAGS -fstack-protector-all"
+     check_cc_cxx_flag([-Wstack-protector], [HARDEN_CFLAGS="$HARDEN_CFLAGS -Wstack-protector"],
+       [], [-fstack-protector-all])
+-- 
+2.8.0.rc3
+
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index f8c45e8ccd2a..12691009da77 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -9,14 +9,7 @@ MOSH_SITE = https://mosh.mit.edu
 MOSH_DEPENDENCIES = zlib ncurses protobuf openssl host-pkgconf
 MOSH_LICENSE = GPLv3+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
-
-# help the detection of the SSP support: mosh configure.ac doesn't do
-# a link test, so it doesn't detect when the toolchain doesn't have
-# libssp.
-ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
-MOSH_CONF_ENV += \
-	ax_cv_check_cflags__Werror___fstack_protector_all=no \
-	ax_cv_check_cxxflags__Werror___fstack_protector_all=no
-endif
+# Patching configure.ac
+MOSH_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.8.0.rc3
