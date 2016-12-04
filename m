From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Dec 2016 11:59:37 +0100
Subject: [Buildroot] [PATCH] build/advanced: add option to check for use of
	cdefs.h
Message-ID: <1480849177-16847-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to catch programs that directly include sys/cdefs.h so that
we can fix them not to. So, we want to instrument sys/cdefs.h to emit
a warning when it is included.

However, there are two cases: musl and the other C libraries.

For musl, it is pretty trivial to do so, because we install our own
sys/cdefs.h header, so we are free to instrument it at will. Not content
to emit a warning when it is included, we can also instrument each macro
to emit its own warning on being used, so we can easily pinpoint what
macro is used and why cdefs.h is used at all.

This is made even easier because musl does not include sys/cdefs.h from
its own headers, so any inclusion of sys/cdefs.h is entirely due to an
explicit include by a package.

But for glibc and uClibc, the matter is a little bit different: there
are two problems we have to solve:

  - both glibc and uClibc install their own sys/cdefs.h, so we are not
    free to instrument it at will;

  - both include it from their own headers, so that the inclusion of it
    is not necessarily an explicit include by a package.

We solve these two problems in two ways:

  - the first point is solved by renaming the existing header, adding
    our own header that acts as a trampoline to the original one, after
    adding a #warning to warn about inclusion of sys/cdefs.h;

  - the second point is solved by changing all the headers installed by
    the toolchain to directly include the original, renamed header
    instead of our trampoline.

This way, we can catch direct inclusion of sys/cdefs.h and ignore
indirect inclusions that are internal to the C library headers.

This also means that we are limited in what we can catch. We can not
instrument each macro individually, so all we know is that sys/cdefs.h
was included; we don't know what is being used from it.

Because instrumenting sys/cdefs.h to emit even just a warning has the
potential to break packages the hard way (e.g. those using -Werror that
would normally not have any warning), we make that an advanced build
option that defaults to not instrumenting sys/cdefs.h.

When we are confident that the instrumentation of sys/cdefs.h has no
harmful side effects, we can change the default to emit the warning.

Beside no instrumentation and adding a warning, we add a third option,
to treat use of sys/cdefs.h as an error. This does break a lot of
things, so this is only available to actively track down the use of
sys/cdefs.h with the aim of removing its use from a pacakge.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in                                          | 52 ++++++++++++
 package/musl-compat-headers/cdefs.h                | 51 ------------
 package/musl-compat-headers/cdefs.h.in             | 94 ++++++++++++++++++++++
 package/musl-compat-headers/musl-compat-headers.mk |  8 +-
 toolchain/cdefs.h.in                               |  8 ++
 toolchain/toolchain.mk                             | 30 +++++++
 6 files changed, 191 insertions(+), 52 deletions(-)
 delete mode 100644 package/musl-compat-headers/cdefs.h
 create mode 100644 package/musl-compat-headers/cdefs.h.in
 create mode 100644 toolchain/cdefs.h.in

diff --git a/Config.in b/Config.in
index 98096df..c68b8b1 100644
--- a/Config.in
+++ b/Config.in
@@ -699,6 +699,58 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  toolchain (through the toolchain wrapper and binutils patches)
 	  and external toolchain backends (through the toolchain wrapper).
 
+choice
+	bool "paranoid check for use of cdefs.h"
+	default BR2_LEGACY_CDEFS_H_NO_CHECK
+	help
+	  sys/cdefs.h is a non-standard header, originating from glibc,
+	  that defines non-standard and legacy macros. This header is not
+	  always available (e.g. musl does not provide it, but Buildroot
+	  installs a surrogate, minimalist one in this case).
+
+	  Some packages use this header, which is wrong, as that makes
+	  then non-portable.
+
+	  By default, Buildroot does not detect the use of that header.
+	  In the future, this default may change to warning, or even to
+	  erroring out.
+
+config BR2_LEGACY_CDEFS_H_NO_CHECK
+	bool "don't check"
+	help
+	  Do not detect any use of sys/cdefs.h.
+
+config BR2_LEGACY_CDEFS_H_WARN
+	bool "check and emit warnings"
+	help
+	  Detect and warn about the use of sys/cdefs.h.
+
+	  When using the musl C library, this also warns for each of the
+	  legacy macros being used:
+		__P()
+		__BEGIN_DECLS
+		__END_DECLS
+		__THROW
+		__NTH()
+
+config BR2_LEGACY_CDEFS_H_ERROR
+	bool "check and exit in error"
+	help
+	  Same as BR2_LEGACY_CDEFS_H_WARN, above, but treated as
+	  an error.
+
+endchoice
+
+config BR2_LEGACY_CDEFS_H_PRAGMA_COND
+	int
+	default 0 if BR2_LEGACY_CDEFS_H_NO_CHECK
+	default 1
+
+config BR2_LEGACY_CDEFS_H_PRAGMA
+	string
+	default "warning" if BR2_LEGACY_CDEFS_H_WARN
+	default "error"   if BR2_LEGACY_CDEFS_H_ERROR
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	help
diff --git a/package/musl-compat-headers/cdefs.h b/package/musl-compat-headers/cdefs.h
deleted file mode 100644
index 6fe7aa4..0000000
--- a/package/musl-compat-headers/cdefs.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* Copyright (C) 2016 Yann E. MORIN <yann.morin.1998@free.fr>
- *
- * This file is in the Public Domain.
- *
- * For jurisdictions in which the Public Domain does not exist
- * or it is not otherwise applicable, this file is licensed CC0
- * (Creative Commons Zero).
- */
-
-/* This file contains definitions for non-standard macros defined by
- * glibc, but quite commonly used in packages.
- *
- * Because they are non-standard, musl does not define those macros.
- * It does not provide cdefs.h either.
- *
- * This file is a compatibility header written from scratch, to be
- * installed when the C library is musl.
- *
- * Not all macros from the glibc's cdefs.h are available, only the
- * most commonly used ones.
- *
- * Please refer to the glibc documentation and source code for
- * explanations about those macros.
- */
-
-#ifndef BUILDROOT_SYS_CDEFS_H
-#define BUILDROOT_SYS_CDEFS_H
-
-/* Function prototypes. */
-#undef __P
-#define __P(arg) arg
-
-/* C declarations in C++ mode. */
-#ifdef __cplusplus
-# define __BEGIN_DECLS extern "C" {
-# define __END_DECLS   }
-#else
-# define __BEGIN_DECLS
-# define __END_DECLS
-#endif
-
-/* Don't throw exceptions in C functions. */
-#ifndef __cplusplus
-# define __THROW  __attribute__ ((__nothrow__))
-# define __NTH(f) __attribute__ ((__nothrow__)) f
-#else
-# define __THROW
-# define __NTH(f) f
-#endif
-
-#endif /* ifndef BUILDROOT_SYS_CDEFS_H */
diff --git a/package/musl-compat-headers/cdefs.h.in b/package/musl-compat-headers/cdefs.h.in
new file mode 100644
index 0000000..91b6a1c
--- /dev/null
+++ b/package/musl-compat-headers/cdefs.h.in
@@ -0,0 +1,94 @@
+/* Copyright (C) 2016 Yann E. MORIN <yann.morin.1998@free.fr>
+ *
+ * This file is in the Public Domain.
+ *
+ * For jurisdictions in which the Public Domain does not exist
+ * or it is not otherwise applicable, this file is licensed CC0
+ * (Creative Commons Zero).
+ */
+
+/* This file contains definitions for non-standard macros defined by
+ * glibc, but quite commonly used in packages.
+ *
+ * Because they are non-standard, musl does not define those macros.
+ * It does not provide cdefs.h either.
+ *
+ * This file is a compatibility header written from scratch, to be
+ * installed when the C library is musl.
+ *
+ * Not all macros from the glibc's cdefs.h are available, only the
+ * most commonly used ones.
+ *
+ * Please refer to the glibc documentation and source code for
+ * explanations about those macros.
+ */
+
+#ifndef BUILDROOT_SYS_CDEFS_H
+#define BUILDROOT_SYS_CDEFS_H
+
+/* _Pragma() is a standard POSIX macro that allows one to embed pragmas
+ * in macro definitions (#pragma can't be used in a macro definition,
+ * because it contains a #).
+ *
+ * However, the gcc manual states (quoting):
+ *
+ *   The standard is unclear on where a _Pragma operator can appear. The
+ *   preprocessor does not accept it within a preprocessing conditional
+ *   directive like ?#if?. To be safe, you are probably best keeping it
+ *   out of directives other than ?#define?, and putting it on a line of
+ *   its own.
+ *
+ * https://gcc.gnu.org/onlinedocs/cpp/Pragmas.html
+ *
+ * So we abide by this suggestion.
+ *
+ * _Pragma expects a single quoted string, so we use an intermediate
+ * macro to simplify calls and stringification.
+ */
+
+#if @pragma_cond@
+#@pragma@ Use of deprecated <sys/cdefs.h> header.
+#define BR_PRAGMA_(x) _Pragma(#x)
+#define BR_PRAGMA(x) BR_PRAGMA_(GCC @pragma@ x)
+#else
+#define BR_PRAGMA(x)
+#endif
+
+/* Function prototypes. */
+#undef __P
+#define __P(arg) \
+            BR_PRAGMA("Use of deprecated macro __P().") \
+            arg
+
+/* C declarations in C++ mode. */
+#ifdef __cplusplus
+# define __BEGIN_DECLS \
+            BR_PRAGMA("Use of deprecated macro __BEGIN_DECLS.") \
+            extern "C" {
+# define __END_DECLS \
+            BR_PRAGMA("Use of deprecated macro __END_DECLS.") \
+            }
+#else
+# define __BEGIN_DECLS \
+            BR_PRAGMA("Use of deprecated macro __BEGIN_DECLS.")
+# define __END_DECLS \
+            BR_PRAGMA("Use of deprecated macro __END_DECLS.")
+#endif
+
+/* Don't throw exceptions in C functions. */
+#ifndef __cplusplus
+# define __THROW \
+            BR_PRAGMA("Use of deprecated macro __THROW.") \
+            __attribute__ ((__nothrow__))
+# define __NTH(f) \
+            BR_PRAGMA("Use of deprecated macro __NTH().") \
+            __attribute__ ((__nothrow__)) f
+#else
+# define __THROW \
+            BR_PRAGMA("Use of deprecated macro __THROW.")
+# define __NTH(f) \
+            BR_PRAGMA("Use of deprecated macro __NTH().") \
+            f
+#endif
+
+#endif /* ifndef BUILDROOT_SYS_CDEFS_H */
diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
index 25e032c..7879123 100644
--- a/package/musl-compat-headers/musl-compat-headers.mk
+++ b/package/musl-compat-headers/musl-compat-headers.mk
@@ -21,7 +21,13 @@ MUSL_COMPAT_HEADERS_INSTALL_STAGING = YES
 # Copying both headers so legal-info finds them (they are _LICENSE_FILES)
 define MUSL_COMPAT_HEADERS_EXTRACT_CMDS
 	$(INSTALL) -m 0644 -D $(DL_DIR)/$(notdir $(MUSL_COMPAT_HEADERS_QUEUE_H)) $(@D)/queue.h
-	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_PKGDIR)/cdefs.h $(@D)/cdefs.h
+	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_PKGDIR)/cdefs.h.in $(@D)/cdefs.h.in
+endef
+
+define MUSL_COMPAT_HEADERS_BUILD_CMDS
+	sed -r -e 's/@pragma_cond@/$(BR2_LEGACY_CDEFS_H_PRAGMA_COND)/' \
+	       -e 's/@pragma@/$(call qstrip,$(BR2_LEGACY_CDEFS_H_PRAGMA))/' \
+	       $(@D)/cdefs.h.in >$(@D)/cdefs.h
 endef
 
 define MUSL_COMPAT_HEADERS_INSTALL_STAGING_CMDS
diff --git a/toolchain/cdefs.h.in b/toolchain/cdefs.h.in
new file mode 100644
index 0000000..23bd3e8
--- /dev/null
+++ b/toolchain/cdefs.h.in
@@ -0,0 +1,8 @@
+#ifndef BUILDROOT_SYS_CDEFS_H_WRAPPER
+#define BUILDROOT_SYS_CDEFS_H_WRAPPER
+
+#@pragma@ Use of deprecated <sys/cdefs.h> header.
+
+#include <sys/cdefs.h.wrapped>
+
+#endif /* BUILDROOT_SYS_CDEFS_H_WRAPPER */
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 59fc905..13109a9 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -54,3 +54,33 @@ define COPY_GCONV_LIBS
 endef
 TOOLCHAIN_TARGET_FINALIZE_HOOKS += COPY_GCONV_LIBS
 endif
+
+# For non-musl toolchain, install our wrapper to sys/cdefs.h and
+# set the proper checking level. Also `fix' toolchain headers to
+# directly include the real sys/cdefs.h instead of our wrapper.
+#
+# This is a target post install hook, because the virtual package
+# "toolchain" is not `installed' to staging.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),)
+ifneq ($(BR2_LEGACY_CDEFS_H_NO_CHECK),y)
+define TOOLCHAIN_WRAP_CDEFS_H
+	cdefs_h=$(STAGING_DIR)/usr/include/sys/cdefs.h; \
+	if [ ! -f $${cdefs_h} ]; then \
+		echo "*** Error: toolchain does not have <sys/cdefs.h>" >&2; \
+		exit 1; \
+	fi; \
+	if [ ! -f $${cdefs_h}.wrapped ]; then \
+		mv $${cdefs_h} $${cdefs_h}.wrapped || exit 1; \
+		$(INSTALL) -m 0644 -D toolchain/cdefs.h.in \
+			$${cdefs_h} || exit 1; \
+		$(SED) 's/@pragma_cond@/$(BR2_LEGACY_CDEFS_H_PRAGMA_COND)/' \
+			-e 's/@pragma@/$(call qstrip,$(BR2_LEGACY_CDEFS_H_PRAGMA))/' \
+			$${cdefs_h} || exit 1; \
+		find $(STAGING_DIR)/usr/include/ -type f -name '*.h' -exec \
+			sed -r -i -e 's:^(#[[:space:]]*include[[:space:]]+<sys/cdefs\.h)(>)$$:\1.wrapped\2 /* Redirected by Buildroot */:' \
+				{} + || exit 1; \
+	fi
+endef
+TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_WRAP_CDEFS_H
+endif # CDEFS_H_NONE
+endif # USES_MUSL
-- 
2.7.4
