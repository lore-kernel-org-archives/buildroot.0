From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2015 22:44:30 +0100
Subject: [Buildroot] [PATCH 2/2] package/gnupg2: really do not run tests in
	cross-compilation
In-Reply-To: <cover.1450302183.git.yann.morin.1998@free.fr>
References: <cover.1450302183.git.yann.morin.1998@free.fr>
Message-ID: <c7dd2e8bb5db5e326a7a4e7cb3611b8a0eea0e68.1450302183.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 still tries to run test even if it tries to avoid it in
cross-compilation.

Really disable running the tests.

Since that requires a complete autoreconf, the existing patch against
configure is turned into a patch against the m4 macro.

since we autoreconf, we slightly patch configure.ac to not emit git
errors on stderr because it is not in a git tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0000-silence-git-when-not-in-git-tree.patch    | 26 +++++++++++++++
 package/gnupg2/0001-fix-pth-config-usage.patch     | 29 ++++++++--------
 package/gnupg2/0003-dont-run-tests.patch           | 39 ++++++++++++++++++++++
 package/gnupg2/gnupg2.mk                           |  4 +++
 4 files changed, 82 insertions(+), 16 deletions(-)
 create mode 100644 package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
 create mode 100644 package/gnupg2/0003-dont-run-tests.patch

diff --git a/package/gnupg2/0000-silence-git-when-not-in-git-tree.patch b/package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
new file mode 100644
index 0000000..5eaefe4
--- /dev/null
+++ b/package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
@@ -0,0 +1,26 @@
+configure: silence autoreconf when not in a git tree
+
+When autoreconfiguring ourside of a git tree, the output is verbose
+with git errors.
+
+Silence that by consigning stderr to oblivion.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN gnupg2-2.0.29.orig/configure.ac gnupg2-2.0.29/configure.ac
+--- gnupg2-2.0.29.orig/configure.ac	2015-09-08 14:39:24.000000000 +0200
++++ gnupg2-2.0.29/configure.ac	2015-12-16 18:34:47.099493863 +0100
+@@ -33,11 +33,11 @@
+ # flag indicating a development version (mym4_isgit).  Note that the
+ # m4 processing is done by autoconf and not during the configure run.
+ m4_define([mym4_revision],
+-          m4_esyscmd([git rev-parse --short HEAD | tr -d '\n\r']))
++          m4_esyscmd([git rev-parse --short HEAD 2>/dev/null | tr -d '\n\r']))
+ m4_define([mym4_revision_dec],
+           m4_esyscmd_s([echo $((0x$(echo ]mym4_revision[|head -c 4)))]))
+ m4_define([mym4_betastring],
+-          m4_esyscmd_s([git describe --match 'gnupg-2.[0-9].*[0-9]' --long|\
++          m4_esyscmd_s([git describe --match 'gnupg-2.[0-9].*[0-9]' --long 2>/dev/null |\
+                         awk -F- '$3!=0{print"-beta"$3}']))
+ m4_define([mym4_isgit],m4_if(mym4_betastring,[],[no],[yes]))
+ m4_define([mym4_full_version],[mym4_version[]mym4_betastring])
diff --git a/package/gnupg2/0001-fix-pth-config-usage.patch b/package/gnupg2/0001-fix-pth-config-usage.patch
index e58aad3..756d351 100644
--- a/package/gnupg2/0001-fix-pth-config-usage.patch
+++ b/package/gnupg2/0001-fix-pth-config-usage.patch
@@ -6,22 +6,19 @@ original one when reporting the version number. This patch to gnupg2's
 configure script adjusts the version checking to support this
 difference, since Buildroot uses pth-config from pthsem.
 
-We patch directly the configure script, because triggering the entire
-autoreconf dance for just a one byte change in the configure script
-seems a bit silly.
-
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: adapt to patch m4 macro for autoreconfiguring]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-Index: b/configure
-===================================================================
---- a/configure
-+++ b/configure
-@@ -8346,7 +8346,7 @@
-   tmp=1.3.7
-   if test "$PTH_CONFIG" != "no"; then
+diff -durN gnupg2-2.0.29.orig/m4/gnupg-pth.m4 gnupg2-2.0.29/m4/gnupg-pth.m4
+--- gnupg2-2.0.29.orig/m4/gnupg-pth.m4	2015-09-08 14:39:24.000000000 +0200
++++ gnupg2-2.0.29/m4/gnupg-pth.m4	2015-12-16 18:30:54.336513493 +0100
+@@ -17,7 +17,7 @@
+ # Taken and modified from the m4 macros which come with Pth.
+ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
+   [
+-    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]3}'`
++    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]2}'`
+     _req_version="ifelse([$1],,1.2.0,$1)"
  
--    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print $3}'`
-+    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print $2}'`
-     _req_version="$tmp"
- 
-     { $as_echo "$as_me:${as_lineno-$LINENO}: checking for PTH - version >= $_req_version" >&5
+     AC_MSG_CHECKING(for PTH - version >= $_req_version)
diff --git a/package/gnupg2/0003-dont-run-tests.patch b/package/gnupg2/0003-dont-run-tests.patch
new file mode 100644
index 0000000..1858a0d
--- /dev/null
+++ b/package/gnupg2/0003-dont-run-tests.patch
@@ -0,0 +1,39 @@
+tests: really don't run tests in cross-compilation
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN gnupg2-2.0.29.orig/tests/Makefile.am gnupg2-2.0.29/tests/Makefile.am
+--- gnupg2-2.0.29.orig/tests/Makefile.am	2015-09-08 14:39:24.000000000 +0200
++++ gnupg2-2.0.29/tests/Makefile.am	2015-12-16 18:27:55.778227183 +0100
+@@ -64,6 +64,7 @@
+ asschk_SOURCES = asschk.c
+ 
+ 
++if RUN_GPG_TESTS
+ all-local: inittests.stamp
+ 
+ clean-local:
+@@ -72,4 +73,5 @@
+ inittests.stamp: inittests
+ 	srcdir=$(srcdir) $(TESTS_ENVIRONMENT) $(srcdir)/inittests
+ 	echo timestamp >./inittests.stamp
++endif # RUN_GPG_TESTS
+ 
+diff -durN gnupg2-2.0.29.orig/tests/pkits/Makefile.am gnupg2-2.0.29/tests/pkits/Makefile.am
+--- gnupg2-2.0.29.orig/tests/pkits/Makefile.am	2015-09-01 08:52:21.000000000 +0200
++++ gnupg2-2.0.29/tests/pkits/Makefile.am	2015-12-16 18:44:06.422655594 +0100
+@@ -52,6 +52,7 @@
+ 
+ DISTCLEANFILES = pubring.kbx~ random_seed
+ 
++if RUN_GPG_TESTS
+ all-local: inittests.stamp
+ 
+ clean-local:
+@@ -71,5 +72,5 @@
+            elif test $$? -eq 77; then echo "- SKIP $$tst"; \
+ 	   fi; \
+          done
+-
++endif # RUN_GPG_TESTS
+ 
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 6d279fd..2e1f067 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -11,6 +11,10 @@ GNUPG2_LICENSE = GPLv3+
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libpthsem \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+# Patching configure.ac and m4 macros, as well as Makefile.am
+GNUPG2_AUTORECONF = YES
+
 GNUPG2_CONF_OPTS = \
 	--disable-rpath --disable-regex --disable-doc \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
-- 
1.9.1
