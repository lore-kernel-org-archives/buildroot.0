From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:51:41 +0100
Subject: [Buildroot] [git commit branch/next] guile: Add new package
Message-ID: <20141126205154.A8B9B7FF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6322f25e1fe6945cc696b08a39665f15ea3c1900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Guile is an interpreter and compiler for the Scheme programming
language, a clean and elegant dialect of Lisp.

The patch guile-01-fix_arm_endianness.patch is based on guile's
git commit ^ffd3e55cfd

[Thomas:
 - rewrap comments and help text.
 - add missing host-gettext dependency, since gettext.m4 is needed for
   the package to autoreconf.
 - add missing host-pkgconf dependency.
 - add dependency on wchar, inherited from libunistring.]

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/guile/Config.in                            |   18 ++++++++++
 package/guile/guile-01-fix_arm_endianness.patch    |   25 ++++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  |   16 +++++++++
 package/guile/guile-03-remove_unused_funcs.patch   |   36 ++++++++++++++++++++
 package/guile/guile.mk                             |   33 ++++++++++++++++++
 6 files changed, 129 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5d6d62d..f3b189b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -392,6 +392,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
+	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
 	source "package/jimtcl/Config.in"
diff --git a/package/guile/Config.in b/package/guile/Config.in
new file mode 100644
index 0000000..009dbdf
--- /dev/null
+++ b/package/guile/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GUILE
+	bool "guile"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
+	depends on BR2_USE_WCHAR # libunistring
+	select BR2_PACKAGE_LIBUNISTRING
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_BDWGC
+	help
+	  Guile is an interpreter and compiler for the Scheme
+	  programming language, a clean and elegant dialect of Lisp.
+
+	  http://www.gnu.org/software/guile
+
+comment "guile needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
new file mode 100644
index 0000000..67c0b60
--- /dev/null
+++ b/package/guile/guile-01-fix_arm_endianness.patch
@@ -0,0 +1,25 @@
+Fix support for ARM endianness, otherwise it gives the error
+"unknown CPU endianness"
+
+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
+
+diff -Nau guile-2.0.11.orig/module/system/base/target.scm guile-2.0.11/module/system/base/target.scm
+--- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
++++ guile-2.0.11/module/system/base/target.scm	2014-11-03 23:05:01.789338997 +0100
+@@ -70,7 +70,15 @@
+             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
+                            "mips" "mips64"))
+              (endianness big))
+-            ((string-match "^arm.*el" cpu)
++            ((string-match "^arm.*el" cpu)
++             (endianness little))
++            ((string-match "^arm.*eb" cpu)
++             (endianness big))
++            ((string-prefix? "arm" cpu)          ;ARMs are LE by default
++             (endianness little))
++            ((string-match "^aarch64.*be" cpu)
++             (endianness big))
++            ((string=? "aarch64" cpu)
+              (endianness little))
+             (else
+              (error "unknown CPU endianness" cpu)))))
diff --git a/package/guile/guile-02-calculate-csqrt_manually.patch b/package/guile/guile-02-calculate-csqrt_manually.patch
new file mode 100644
index 0000000..98bb0b6
--- /dev/null
+++ b/package/guile/guile-02-calculate-csqrt_manually.patch
@@ -0,0 +1,16 @@
+Avoid using scm_from_complex_double(csqrt()) when building with uclibc.
+
+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
+
+diff -Nau guile-2.0.11.orig/configure.ac guile-2.0.11/configure.ac
+--- guile-2.0.11.orig/configure.ac	2014-03-12 14:36:02.000000000 +0100
++++ guile-2.0.11/configure.ac	2014-11-03 23:59:51.897267207 +0100
+@@ -862,7 +862,7 @@
+ }]])],
+     [guile_cv_use_csqrt=yes],
+     [guile_cv_use_csqrt="no, glibc 2.3 bug"],
+-    [guile_cv_use_csqrt="yes, hopefully (cross-compiling)"])])
++    [guile_cv_use_csqrt="no (cross-compiling)"])])
+   case $guile_cv_use_csqrt in
+     yes*)
+       AC_DEFINE([HAVE_USABLE_CSQRT], 1, [Define to 1 if csqrt is bug-free])
diff --git a/package/guile/guile-03-remove_unused_funcs.patch b/package/guile/guile-03-remove_unused_funcs.patch
new file mode 100644
index 0000000..3d70ee9
--- /dev/null
+++ b/package/guile/guile-03-remove_unused_funcs.patch
@@ -0,0 +1,36 @@
+Remove unused static inline functions str_upcase_l() and 
+str_downcase_l() that cause the compilation error:
+'dereferencing pointer to incomplete type'.
+
+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
+
+diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
+--- guile-2.0.11.orig/libguile/i18n.c	2014-01-21 22:25:11.000000000 +0100
++++ guile-2.0.11/libguile/i18n.c	2014-11-04 23:18:52.675435613 +0100
+@@ -851,26 +851,6 @@
+   *dst = '\0';
+ }
+ 
+-#ifdef USE_GNU_LOCALE_API
+-static inline void
+-str_upcase_l (register char *dst, register const char *src,
+-	      scm_t_locale locale)
+-{
+-  for (; *src != '\0'; src++, dst++)
+-    *dst = toupper_l (*src, locale);
+-  *dst = '\0';
+-}
+-
+-static inline void
+-str_downcase_l (register char *dst, register const char *src,
+-		scm_t_locale locale)
+-{
+-  for (; *src != '\0'; src++, dst++)
+-    *dst = tolower_l (*src, locale);
+-  *dst = '\0';
+-}
+-#endif
+-
+ 
+ SCM_DEFINE (scm_string_locale_lt, "string-locale<?", 2, 1, 0,
+ 	    (SCM s1, SCM s2, SCM locale),
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
new file mode 100644
index 0000000..30af11d
--- /dev/null
+++ b/package/guile/guile.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# guile
+#
+################################################################################
+
+GUILE_VERSION = 2.0.11
+GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
+GUILE_SITE = $(BR2_GNU_MIRROR)/guile
+GUILE_INSTALL_STAGING = YES
+GUILE_LICENSE = LGPLv3+
+GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
+
+# libtool dependency is needed because guile uses libltdl
+GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
+HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
+
+# The HAVE_GC* CFLAGS specify that we will use internal callbacks
+# instead of the ones provided by
+# bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
+# use bdwgc's GC_finalizer_notifier callback.  Trying to use these
+# specific bdwgc's callbacks breaks guile's building.
+GUILE_CFLAGS = \
+	-DHAVE_GC_SET_FINALIZER_NOTIFIER \
+	-DHAVE_GC_GET_HEAP_USAGE_SAFE \
+	-DHAVE_GC_GET_FREE_SPACE_DIVISOR \
+	-DHAVE_GC_SET_FINALIZE_ON_DEMAND
+
+GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
+	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
