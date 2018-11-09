From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Nov 2018 18:26:48 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] libv4l: add an option for IR BPF based decoders
Message-ID: <20181109172648.10289-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.61.1 added BPF based protocols support:
https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80

However, this dependency needs BPF support in kernel. On old kernels
(before 3.18), __NR_BPF is not defined for all architectures.
So retrieve upstream patch and add an option to enable BPF only if
headers are above 3.18.

Also drop patch to add bpf_common.h on old kernels (not needed anymore)

Fixes:
 - http://autobuild.buildroot.org/results/442de57cb76a7b38d71d690490faadc641036374

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Seiderer):
 - Add an option to enable BPF if headers >= 3.18 instead of disabling
   it as it seems that risc-v support BPF
 - Drop patch to add bpf_common.h

 ...d-without-BPF-support-in-ir-keytable.patch | 124 ++++++++++++++++++
 .../0005-Add-missing-linux-bpf_common.h.patch |  80 -----------
 package/libv4l/Config.in                      |  15 +++
 package/libv4l/libv4l.mk                      |   7 +
 4 files changed, 146 insertions(+), 80 deletions(-)
 create mode 100644 package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch
 delete mode 100644 package/libv4l/0005-Add-missing-linux-bpf_common.h.patch

diff --git a/package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch b/package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch
new file mode 100644
index 0000000000..dcb724868a
--- /dev/null
+++ b/package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch
@@ -0,0 +1,124 @@
+From 5c213ee065ebd7a388f153a402851be8dfcfc960 Mon Sep 17 00:00:00 2001
+From: Sean Young <sean@mess.org>
+Date: Tue, 6 Nov 2018 09:58:32 +0000
+Subject: configure: build without BPF support in ir-keytable
+
+It currently does not build on mips and some platforms do not have
+BPF support yet (risc-v, for example).
+
+Signed-off-by: Sean Young <sean@mess.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=5c213ee065ebd7a388f153a402851be8dfcfc960]
+
+diff --git a/configure.ac b/configure.ac
+index 387f853..5cc34c2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -173,16 +173,12 @@ AM_CONDITIONAL([HAVE_X11], [test x$x11_pkgconfig = xyes])
+ PKG_CHECK_MODULES([LIBELF], [libelf], [libelf_pkgconfig=yes], [libelf_pkgconfig=no])
+ AC_SUBST([LIBELF_CFLAGS])
+ AC_SUBST([LIBELF_LIBS])
+-AM_CONDITIONAL([HAVE_LIBELF], [test x$libelf_pkgconfig = xyes])
+ if test "x$libelf_pkgconfig" = "xyes"; then
+   AC_CHECK_PROG([CLANG], clang, clang)
+-  AC_DEFINE([HAVE_LIBELF], [1], [libelf library is present])
+ else
+   AC_MSG_WARN(libelf library not available)
+ fi
+ 
+-AM_CONDITIONAL([BPF_PROTOCOLS], [test x$CLANG = xclang])
+-
+ AS_IF([test "x$x11_pkgconfig" = xyes],
+       [PKG_CHECK_MODULES(GL, [gl], [gl_pkgconfig=yes], [gl_pkgconfig=no])], [gl_pkgconfig=no])
+ AC_SUBST([GL_CFLAGS])
+@@ -453,6 +449,14 @@ AC_ARG_ENABLE(gconv,
+    esac]
+ )
+ 
++AC_ARG_ENABLE(bpf,
++  AS_HELP_STRING([--disable-bpf], [disable IR BPF decoders]),
++  [case "${enableval}" in
++    yes | no ) ;;
++    *) AC_MSG_ERROR(bad value ${enableval} for --enable-bpf) ;;
++   esac]
++)
++
+ PKG_CHECK_MODULES([SDL2], [sdl2 SDL2_image], [sdl_pc=yes], [sdl_pc=no])
+ AM_CONDITIONAL([HAVE_SDL], [test x$sdl_pc = xyes])
+ 
+@@ -475,6 +479,7 @@ AM_CONDITIONAL([WITH_GCONV],        [test x$enable_gconv = xyes -a x$enable_shar
+ AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
+ AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test x${enable_v4l2_ctl_stream_to} != xno])
+ AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x${enable_v4l2_compliance_libv4l} != xno])
++AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang])
+ 
+ # append -static to libtool compile and link command to enforce static libs
+ AS_IF([test x$enable_libdvbv5 = xno], [AC_SUBST([ENFORCE_LIBDVBV5_STATIC], ["-static"])])
+@@ -505,6 +510,9 @@ AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"
+ AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
+ AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
+ AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
++AM_COND_IF([WITH_BPF],         [USE_BPF="yes"
++                                AC_DEFINE([HAVE_BPF], [1], [BPF IR decoder support enabled])],
++				[USE_BPF="no"])
+ AS_IF([test "x$alsa_pkgconfig" = "xtrue"], [USE_ALSA="yes"], [USE_ALSA="no"])
+ 
+ AC_OUTPUT
+@@ -549,4 +557,5 @@ compile time options summary
+     qvidcap                    : $USE_QVIDCAP
+     v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
+     v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
++    BPF IR Decoders:           : $USE_BPF
+ EOF
+diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
+index 90e4c8c..ddbab0f 100644
+--- a/utils/keytable/Makefile.am
++++ b/utils/keytable/Makefile.am
+@@ -6,14 +6,15 @@ udevrules_DATA = 70-infrared.rules
+ 
+ ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h
+ 
+-if HAVE_LIBELF
++if WITH_BPF
+ ir_keytable_SOURCES += bpf.c bpf_load.c bpf.h bpf_load.h
+ endif
+ 
+ ir_keytable_LDADD = @LIBINTL@
+-ir_keytable_LDFLAGS = $(ARGP_LIBS) $(LIBELF_LIBS)
++ir_keytable_LDFLAGS = $(ARGP_LIBS)
+ 
+-if BPF_PROTOCOLS
++if WITH_BPF
++ir_keytable_LDFLAGS += $(LIBELF_LIBS)
+ SUBDIRS = bpf_protocols
+ endif
+ 
+diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
+index a7ed436..6fc2235 100644
+--- a/utils/keytable/keytable.c
++++ b/utils/keytable/keytable.c
+@@ -34,8 +34,11 @@
+ #include "ir-encode.h"
+ #include "parse.h"
+ #include "toml.h"
++
++#ifdef HAVE_BPF
+ #include "bpf.h"
+ #include "bpf_load.h"
++#endif
+ 
+ #ifdef ENABLE_NLS
+ # define _(string) gettext(string)
+@@ -1847,7 +1850,7 @@ static void device_info(int fd, char *prepend)
+ 		perror ("EVIOCGID");
+ }
+ 
+-#ifdef HAVE_LIBELF
++#ifdef HAVE_BPF
+ #define MAX_PROGS 64
+ static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
+ {
+-- 
+cgit v0.10.2
+
diff --git a/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch b/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch
deleted file mode 100644
index d43ea70027..0000000000
--- a/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 311e344039d58cfde09dd34f14804db8ac0513c9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 2 Nov 2018 18:58:53 +0100
-Subject: [PATCH] Add missing linux/bpf_common.h
-
-Copy from [1], needed by bpf.h.
-
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/include/uapi/linux/bpf_common.h?h=v4.19
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- include/linux/bpf_common.h | 57 ++++++++++++++++++++++++++++++++++++++
- 1 file changed, 57 insertions(+)
- create mode 100644 include/linux/bpf_common.h
-
-diff --git a/include/linux/bpf_common.h b/include/linux/bpf_common.h
-new file mode 100644
-index 00000000..ee97668b
---- /dev/null
-+++ b/include/linux/bpf_common.h
-@@ -0,0 +1,57 @@
-+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-+#ifndef _UAPI__LINUX_BPF_COMMON_H__
-+#define _UAPI__LINUX_BPF_COMMON_H__
-+
-+/* Instruction classes */
-+#define BPF_CLASS(code) ((code) & 0x07)
-+#define		BPF_LD		0x00
-+#define		BPF_LDX		0x01
-+#define		BPF_ST		0x02
-+#define		BPF_STX		0x03
-+#define		BPF_ALU		0x04
-+#define		BPF_JMP		0x05
-+#define		BPF_RET		0x06
-+#define		BPF_MISC        0x07
-+
-+/* ld/ldx fields */
-+#define BPF_SIZE(code)  ((code) & 0x18)
-+#define		BPF_W		0x00 /* 32-bit */
-+#define		BPF_H		0x08 /* 16-bit */
-+#define		BPF_B		0x10 /*  8-bit */
-+/* eBPF		BPF_DW		0x18    64-bit */
-+#define BPF_MODE(code)  ((code) & 0xe0)
-+#define		BPF_IMM		0x00
-+#define		BPF_ABS		0x20
-+#define		BPF_IND		0x40
-+#define		BPF_MEM		0x60
-+#define		BPF_LEN		0x80
-+#define		BPF_MSH		0xa0
-+
-+/* alu/jmp fields */
-+#define BPF_OP(code)    ((code) & 0xf0)
-+#define		BPF_ADD		0x00
-+#define		BPF_SUB		0x10
-+#define		BPF_MUL		0x20
-+#define		BPF_DIV		0x30
-+#define		BPF_OR		0x40
-+#define		BPF_AND		0x50
-+#define		BPF_LSH		0x60
-+#define		BPF_RSH		0x70
-+#define		BPF_NEG		0x80
-+#define		BPF_MOD		0x90
-+#define		BPF_XOR		0xa0
-+
-+#define		BPF_JA		0x00
-+#define		BPF_JEQ		0x10
-+#define		BPF_JGT		0x20
-+#define		BPF_JGE		0x30
-+#define		BPF_JSET        0x40
-+#define BPF_SRC(code)   ((code) & 0x08)
-+#define		BPF_K		0x00
-+#define		BPF_X		0x08
-+
-+#ifndef BPF_MAXINSNS
-+#define BPF_MAXINSNS 4096
-+#endif
-+
-+#endif /* _UAPI__LINUX_BPF_COMMON_H__ */
--- 
-2.19.1
-
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 57ddde1dfb..041f8904a6 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -35,6 +35,21 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
+config BR2_PACKAGE_LIBV4L_UTILS_IR_BPF_BASED_DECODERS
+	bool "IR BPF based decoders"
+	depends on BR2_PACKAGE_LIBV4L_UTILS
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	select BR2_PACKAGE_ELFUTILS
+
+comment "IR BPF based decoders needs a uclibc or glibc toolchain w/ dynamic library, wchar, headers >= 3.18"
+	depends on BR2_PACKAGE_LIBV4L_UTILS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 endif
 
 comment "libv4l needs a toolchain w/ threads, C++ and headers >= 3.0"
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f473c03806..09d4478788 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -56,8 +56,15 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_LIBV4L_UTILS_IR_BPF_BASED_DECODERS),y)
+LIBV4L_CONF_OPTS += --enable-bpf
+LIBV4L_DEPENDENCIES += elfutils
+
 # Disable clang that is used to build BPF (in-kernel bytecode machine) protocols
 LIBV4L_CONF_ENV += ac_cv_prog_CLANG=""
+else
+LIBV4L_CONF_OPTS += --disable-bpf
+endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
-- 
2.17.1
