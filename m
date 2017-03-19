From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:46:29 +0100
Subject: [Buildroot] [git commit] package/gnupg2: bump version to 2.1.19
Message-ID: <20170319204703.C8FBF81E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=284e71a0ad0b76256e67b352470c438cfd134fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for GnuPG 2.0 will end 2017-12-31:
https://lists.gnupg.org/pipermail/gnupg-announce/2017q1/000402.html

Removed all patches:

- 0001-fix-pth-config-usage.patch
  Not needed anymore, gnupg2 now depends on libnpth:
  https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=001352077cdc7e402421c77328bea1a052005673

- 0002-missing-include.patch
  Not needed anymore after upstream commit
  https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=0367a4b8cfbf1f197e093ca2b83b27e0a409c3c7

- 0003-dont-run-tests.patch
  Not needed anymore after upstream commit
  https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=4a232d23a8f51bebf9ee382e480248b4bde30f28

- 0004-silence-git-when-not-in-git-tree.patch
  Not needed anymore after upstream commit restricting the usage of git
  commands to the case where the directory .git exists
  https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=b67e4e523e6d19d384e23c5bb03010caebd150e7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/0001-fix-pth-config-usage.patch     | 24 -------------
 package/gnupg2/0002-missing-include.patch          | 15 ---------
 package/gnupg2/0003-dont-run-tests.patch           | 39 ----------------------
 .../0004-silence-git-when-not-in-git-tree.patch    | 26 ---------------
 package/gnupg2/Config.in                           | 10 +++---
 package/gnupg2/gnupg2.hash                         |  6 ++--
 package/gnupg2/gnupg2.mk                           |  9 ++---
 7 files changed, 11 insertions(+), 118 deletions(-)

diff --git a/package/gnupg2/0001-fix-pth-config-usage.patch b/package/gnupg2/0001-fix-pth-config-usage.patch
deleted file mode 100644
index 756d351..0000000
--- a/package/gnupg2/0001-fix-pth-config-usage.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix usage of PTH_CONFIG to work with pthsem
-
-The pthsem re-implement of pth provides a compatibility layer for pth,
-but its pth-config script behaves slightly differently than the
-original one when reporting the version number. This patch to gnupg2's
-configure script adjusts the version checking to support this
-difference, since Buildroot uses pth-config from pthsem.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[yann.morin.1998 at free.fr: adapt to patch m4 macro for autoreconfiguring]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN gnupg2-2.0.29.orig/m4/gnupg-pth.m4 gnupg2-2.0.29/m4/gnupg-pth.m4
---- gnupg2-2.0.29.orig/m4/gnupg-pth.m4	2015-09-08 14:39:24.000000000 +0200
-+++ gnupg2-2.0.29/m4/gnupg-pth.m4	2015-12-16 18:30:54.336513493 +0100
-@@ -17,7 +17,7 @@
- # Taken and modified from the m4 macros which come with Pth.
- AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
-   [
--    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]3}'`
-+    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]2}'`
-     _req_version="ifelse([$1],,1.2.0,$1)"
- 
-     AC_MSG_CHECKING(for PTH - version >= $_req_version)
diff --git a/package/gnupg2/0002-missing-include.patch b/package/gnupg2/0002-missing-include.patch
deleted file mode 100644
index f20994c..0000000
--- a/package/gnupg2/0002-missing-include.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-tools/watchgnupg: select() is from sys/select.h
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN gnupg2-2.0.29.orig/tools/watchgnupg.c gnupg2-2.0.29/tools/watchgnupg.c
---- gnupg2-2.0.29.orig/tools/watchgnupg.c	2015-09-08 14:39:24.000000000 +0200
-+++ gnupg2-2.0.29/tools/watchgnupg.c	2015-12-16 18:17:17.758057787 +0100
-@@ -32,6 +32,7 @@
- #include <sys/un.h>
- #include <fcntl.h>
- #include <time.h>
-+#include <sys/select.h>
- 
- #define PGM "watchgnupg"
- 
diff --git a/package/gnupg2/0003-dont-run-tests.patch b/package/gnupg2/0003-dont-run-tests.patch
deleted file mode 100644
index 1858a0d..0000000
--- a/package/gnupg2/0003-dont-run-tests.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-tests: really don't run tests in cross-compilation
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN gnupg2-2.0.29.orig/tests/Makefile.am gnupg2-2.0.29/tests/Makefile.am
---- gnupg2-2.0.29.orig/tests/Makefile.am	2015-09-08 14:39:24.000000000 +0200
-+++ gnupg2-2.0.29/tests/Makefile.am	2015-12-16 18:27:55.778227183 +0100
-@@ -64,6 +64,7 @@
- asschk_SOURCES = asschk.c
- 
- 
-+if RUN_GPG_TESTS
- all-local: inittests.stamp
- 
- clean-local:
-@@ -72,4 +73,5 @@
- inittests.stamp: inittests
- 	srcdir=$(srcdir) $(TESTS_ENVIRONMENT) $(srcdir)/inittests
- 	echo timestamp >./inittests.stamp
-+endif # RUN_GPG_TESTS
- 
-diff -durN gnupg2-2.0.29.orig/tests/pkits/Makefile.am gnupg2-2.0.29/tests/pkits/Makefile.am
---- gnupg2-2.0.29.orig/tests/pkits/Makefile.am	2015-09-01 08:52:21.000000000 +0200
-+++ gnupg2-2.0.29/tests/pkits/Makefile.am	2015-12-16 18:44:06.422655594 +0100
-@@ -52,6 +52,7 @@
- 
- DISTCLEANFILES = pubring.kbx~ random_seed
- 
-+if RUN_GPG_TESTS
- all-local: inittests.stamp
- 
- clean-local:
-@@ -71,5 +72,5 @@
-            elif test $$? -eq 77; then echo "- SKIP $$tst"; \
- 	   fi; \
-          done
--
-+endif # RUN_GPG_TESTS
- 
diff --git a/package/gnupg2/0004-silence-git-when-not-in-git-tree.patch b/package/gnupg2/0004-silence-git-when-not-in-git-tree.patch
deleted file mode 100644
index 5eaefe4..0000000
--- a/package/gnupg2/0004-silence-git-when-not-in-git-tree.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-configure: silence autoreconf when not in a git tree
-
-When autoreconfiguring ourside of a git tree, the output is verbose
-with git errors.
-
-Silence that by consigning stderr to oblivion.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN gnupg2-2.0.29.orig/configure.ac gnupg2-2.0.29/configure.ac
---- gnupg2-2.0.29.orig/configure.ac	2015-09-08 14:39:24.000000000 +0200
-+++ gnupg2-2.0.29/configure.ac	2015-12-16 18:34:47.099493863 +0100
-@@ -33,11 +33,11 @@
- # flag indicating a development version (mym4_isgit).  Note that the
- # m4 processing is done by autoconf and not during the configure run.
- m4_define([mym4_revision],
--          m4_esyscmd([git rev-parse --short HEAD | tr -d '\n\r']))
-+          m4_esyscmd([git rev-parse --short HEAD 2>/dev/null | tr -d '\n\r']))
- m4_define([mym4_revision_dec],
-           m4_esyscmd_s([echo $((0x$(echo ]mym4_revision[|head -c 4)))]))
- m4_define([mym4_betastring],
--          m4_esyscmd_s([git describe --match 'gnupg-2.[0-9].*[0-9]' --long|\
-+          m4_esyscmd_s([git describe --match 'gnupg-2.[0-9].*[0-9]' --long 2>/dev/null |\
-                         awk -F- '$3!=0{print"-beta"$3}']))
- m4_define([mym4_isgit],m4_if(mym4_betastring,[],[no],[yes]))
- m4_define([mym4_full_version],[mym4_version[]mym4_betastring])
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index ba2a6bc..85a9805 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -1,6 +1,6 @@
-comment "gnupg2 needs a toolchain w/ dynamic library"
+comment "gnupg2 needs a toolchain w/ threads and dynamic library support"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GNUPG2
 	bool "gnupg2"
@@ -9,11 +9,11 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBASSUAN
 	select BR2_PACKAGE_LIBKSBA
-	select BR2_PACKAGE_LIBPTHSEM
-	select BR2_PACKAGE_LIBPTHSEM_COMPAT
+	select BR2_PACKAGE_LIBNPTH
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
-	depends on BR2_USE_MMU # libassuan
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
+	depends on BR2_USE_MMU # libassuan, libnpth
 	depends on !BR2_STATIC_LIBS
 	help
 	  GnuPG is the GNU project's complete and free implementation
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 67f7d9d..c589f6a 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q1/000385.html
-sha1	a9f024588c356a55e2fd413574bfb55b2e18794a	gnupg-2.0.30.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q1/000402.html
+sha1 10a088a6716789ac5c5cce2776952d8f4a5c57fc  gnupg-2.1.19.tar.bz2
 # Calculated based on the hash above
-sha256	e329785a4f366ba5d72c2c678a7e388b0892ac8440c2f4e6810042123c235d71	gnupg-2.0.30.tar.bz2
+sha256 46cced1f5641ce29cc28250f52fadf6e417e649b3bfdec49a5a0d0b22a639bf0  gnupg-2.1.19.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 763e945..55190cc 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,24 +4,21 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.30
+GNUPG2_VERSION = 2.1.19
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
 GNUPG2_LICENSE_FILES = COPYING
-GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libpthsem \
+GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-# Patching configure.ac and m4 macros, as well as Makefile.am
-GNUPG2_AUTORECONF = YES
-
 GNUPG2_CONF_OPTS = \
 	--disable-rpath --disable-regex --disable-doc \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
-	--with-pth-prefix=$(STAGING_DIR)/usr
+	--with-npth-prefix=$(STAGING_DIR)/usr
 GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
