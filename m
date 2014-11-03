From: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon,  3 Nov 2014 01:34:11 +0100
Subject: [Buildroot] [PATCH v2 4/4] guile: new package
In-Reply-To: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
References: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1414974851-4819-5-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guile is an interpreter and compiler for the Scheme programming
language, a clean and elegant dialect of Lisp.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
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
 package/guile/Config.in                            | 17 ++++++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 19 +++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 17 ++++++++++++
 .../guile-03-undef_use_gnu_local_locale_api.patch  | 16 +++++++++++
 package/guile/guile.mk                             | 32 ++++++++++++++++++++++
 6 files changed, 102 insertions(+)
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-undef_use_gnu_local_locale_api.patch
 create mode 100644 package/guile/guile.mk

diff --git a/package/Config.in b/package/Config.in
index bb158b4..d16c155 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -393,6 +393,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
+	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
 	source "package/jimtcl/Config.in"
diff --git a/package/guile/Config.in b/package/guile/Config.in
new file mode 100644
index 0000000..018fbab
--- /dev/null
+++ b/package/guile/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GUILE
+	bool "guile"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUNISTRING
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_LIBTOOL
+	help
+	  Guile is an interpreter and compiler for the Scheme 
+	  programming language, a clean and elegant dialect of Lisp.
+
+	  http://www.gnu.org/software/guile
+
+	comment "guile needs a toolchain w/ threads"
+	  depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
new file mode 100644
index 0000000..f3a2092
--- /dev/null
+++ b/package/guile/guile-01-fix_arm_endianness.patch
@@ -0,0 +1,19 @@
+Fix support for ARM endianness, otherwise it gives the error 
+"unknown CPU endianness"
+
+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
+
+diff -Nau guile-2.0.11.orig/module/system/base/target.scm guile-2.0.11/module/system/base/target.scm
+--- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
++++ guile-2.0.11/module/system/base/target.scm	2014-11-01 21:23:15.301242749 +0100
+@@ -70,7 +70,9 @@
+             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
+                            "mips" "mips64"))
+              (endianness big))
+-            ((string-match "^arm.*el" cpu)
++            ((string-match "^arm.*eb" cpu)
++             (endianness big))
++            ((string-match "^arm.*" cpu)
+              (endianness little))
+             (else
+              (error "unknown CPU endianness" cpu)))))
diff --git a/package/guile/guile-02-calculate-csqrt_manually.patch b/package/guile/guile-02-calculate-csqrt_manually.patch
new file mode 100644
index 0000000..c56963b
--- /dev/null
+++ b/package/guile/guile-02-calculate-csqrt_manually.patch
@@ -0,0 +1,17 @@
+Calculate manually the sqrt() since scm_from_complex_double() gives an error
+on ARM using uclibc.
+
+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
+
+diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
+--- guile-2.0.11.orig/libguile/numbers.c	2014-03-12 14:24:54.000000000 +0100
++++ guile-2.0.11/libguile/numbers.c	2014-11-01 21:07:20.301263587 +0100
+@@ -10260,8 +10260,6 @@
+     {
+ #if defined HAVE_COMPLEX_DOUBLE && defined HAVE_USABLE_CSQRT	\
+       && defined SCM_COMPLEX_VALUE
+-      return scm_from_complex_double (csqrt (SCM_COMPLEX_VALUE (z)));
+-#else
+       double re = SCM_COMPLEX_REAL (z);
+       double im = SCM_COMPLEX_IMAG (z);
+       return scm_c_make_polar (sqrt (hypot (re, im)),
diff --git a/package/guile/guile-03-undef_use_gnu_local_locale_api.patch b/package/guile/guile-03-undef_use_gnu_local_locale_api.patch
new file mode 100644
index 0000000..b8ac7c3
--- /dev/null
+++ b/package/guile/guile-03-undef_use_gnu_local_locale_api.patch
@@ -0,0 +1,16 @@
+Undef USE_GNU_LOCALE_API since it's not mandatory.
+
+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
+
+diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
+--- guile-2.0.11.orig/libguile/i18n.c	2014-01-21 22:25:11.000000000 +0100
++++ guile-2.0.11/libguile/i18n.c	2014-11-01 21:59:29.001195319 +0100
+@@ -54,7 +54,7 @@
+    Specifications Issue 7'' (aka. "POSIX 2008"):
+ 
+      http://www.opengroup.org/onlinepubs/9699919799/basedefs/locale.h.html  */
+-# define USE_GNU_LOCALE_API
++# undef USE_GNU_LOCALE_API
+ #endif
+ 
+ #include "libguile/posix.h"  /* for `scm_i_locale_mutex' */
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
new file mode 100644
index 0000000..1cc9f2f
--- /dev/null
+++ b/package/guile/guile.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# guile
+#
+################################################################################
+
+GUILE_VERSION = 2.0.11
+GUILE_SOURCE  = guile-$(GUILE_VERSION).tar.xz
+GUILE_SITE    = ftp://ftp.gnu.org/pub/gnu/guile
+GUILE_INSTALL_STAGING = YES
+GUILE_LICENSE = LGPLv3+
+GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
+GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc flex libtool
+
+HOST_GUILE_DEPENDENCIES = host-intltool host-libunistring host-libffi host-gmp host-bdwgc host-flex host-libtool
+
+# We need to specify libffi and bdwgc CFLAGS and LIBS since guile's configure
+# script does not find them.
+# The HAVE_GC* CFLAGS specify that we wil use internal callbacks instead 
+# of the ones provided by bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies 
+# that we won't use bdwgc's GC_finalizer_notifier callback.
+# Trying to use these specific bdwgc's callbacks breaks guile's building.
+GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
+	LIBFFI_CFLAGS="-I$(TARGET_DIR)/usr/include" \
+	LIBFFI_LIBS="-L$(TARGET_DIR)/usr/lib -lffi" \
+	BDW_GC_CFLAGS="-I$(TARGET_DIR)/usr/include" \
+	BDW_GC_LIBS="-L$(TARGET_DIR)/usr/lib -lgc" \
+	CFLAGS+="-DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND"
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
-- 
1.9.1
