From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Jun 2020 13:28:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: fix build with uclibc
Message-ID: <20200611112820.952960-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/92b3dd7c984d2b843ac9aacacd69eec99f28743e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...when-crypt-does-not-require-libcrypt.patch | 37 +++++++++++++++++++
 package/linux-pam/linux-pam.mk                |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 package/linux-pam/0001-configure-ac-fix-build-failure-when-crypt-does-not-require-libcrypt.patch

diff --git a/package/linux-pam/0001-configure-ac-fix-build-failure-when-crypt-does-not-require-libcrypt.patch b/package/linux-pam/0001-configure-ac-fix-build-failure-when-crypt-does-not-require-libcrypt.patch
new file mode 100644
index 0000000000..ebcb81aa91
--- /dev/null
+++ b/package/linux-pam/0001-configure-ac-fix-build-failure-when-crypt-does-not-require-libcrypt.patch
@@ -0,0 +1,37 @@
+From aef363c7e8e942224e6cffc4398366c6e5d31749 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Jun 2020 00:04:32 +0200
+Subject: [PATCH] configure.ac: fix build failure when crypt() does not require
+ libcrypt
+
+Since commit 522246d20e4cd92fadc2d760228cb7e78cbeb4c5, the build fails
+if "none required" is returned by AC_SEARCH_LIBS for libcrypt.
+
+Resolves: https://github.com/linux-pam/linux-pam/pull/235
+Fixes: http://autobuild.buildroot.org/results/92b3dd7c984d2b843ac9aacacd69eec99f28743e
+Fixes: v1.4.0~228 ("Use cached 'crypt' library result correctly")
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/aef363c7e8e942224e6cffc4398366c6e5d31749]
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ea08a7a3..c1862ea7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -428,7 +428,11 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" = "xyes"],
+   [crypt_libs="crypt"])
+ 
+ BACKUP_LIBS=$LIBS
+-AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="${ac_cv_search_crypt}", LIBCRYPT="")
++AC_SEARCH_LIBS([crypt],[$crypt_libs])
++case "$ac_cv_search_crypt" in
++	-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
++	*) LIBCRYPT="" ;;
++esac
+ AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 8f8d575102..57fb2c9cfd 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -20,6 +20,8 @@ LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
+# We're patching configure.ac
+LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.26.2
