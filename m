From: Pedro Aguilar <paguilar@paguilar.org>
Date: Wed,  5 Nov 2014 00:28:29 +0100
Subject: [Buildroot] [PATCH v3 4/4] guile: new package
In-Reply-To: <1415143709-10963-1-git-send-email-paguilar@paguilar.org>
References: <1415143709-10963-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1415143709-10963-5-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guile is an interpreter and compiler for the Scheme programming
language, a clean and elegant dialect of Lisp.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v2 -> v3:
- Improve patches
- Remove unused dependencies
- Fix patches formatting
(All changes suggested by Thomas Petazzoni)

Changes v1 -> v2:
- Add all needed dependencies
- Explain GUILE_CONF_ENV arguments
- Remove PKG_CONFIG_HOST_BINARY
- Fix patches formatting
- Add thread comments in Config.in
(All changes suggested by Yann Morin)

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/Config.in                                  |  1 +
 package/guile/Config.in                            | 15 +++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 25 +++++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 16 ++++++++++
 package/guile/guile-03-remove_unused_funcs.patch   | 36 ++++++++++++++++++++++
 package/guile/guile.mk                             | 26 ++++++++++++++++
 6 files changed, 119 insertions(+)
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-remove_unused_funcs.patch
 create mode 100644 package/guile/guile.mk

diff --git a/package/Config.in b/package/Config.in
index 1354c27..d45495d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
+	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
 	source "package/jimtcl/Config.in"
diff --git a/package/guile/Config.in b/package/guile/Config.in
new file mode 100644
index 0000000..85671e0
--- /dev/null
+++ b/package/guile/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GUILE
+	bool "guile"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
+comment "guile needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
new file mode 100644
index 0000000..a30a241
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
++           ((string-match "^arm.*el" cpu)
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
index 0000000..c8d81d2
--- /dev/null
+++ b/package/guile/guile.mk
@@ -0,0 +1,26 @@
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
+GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc
+
+HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-libtool
+
+# The HAVE_GC* CFLAGS specify that we wil use internal callbacks instead 
+# of the ones provided by bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies 
+# that we won't use bdwgc's GC_finalizer_notifier callback.
+# Trying to use these specific bdwgc's callbacks breaks guile's building.
+GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
+	CFLAGS="$(TARGET_CFLAGS) -DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND"
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
-- 
1.9.1
