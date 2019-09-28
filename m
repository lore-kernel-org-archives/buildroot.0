From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:40:49 +0200
Subject: [Buildroot] [git commit] package/udftools: bump to version 2.0.1
Message-ID: <20190928203759.6E8BA825E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d71e23b53b78543e8be3f3933db1a6eca98cedc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first and third patches (already in version)
- Add two upstream patches and refresh second one so that it applies
  cleanly

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-configure-Use-AS_IF-macro-for-C99-check.patch | 27 ++++++++
 ...up-pktsetup.c-do-not-include-bits-types.h.patch | 32 ---------
 ...-all-Allow-to-build-udftools-without-udev.patch | 49 +++++++++++++
 ...c-detect-readline-via-pkg-config-when-pos.patch | 60 ----------------
 ...to-prevent-build-breakage-with-glibc-2-25.patch | 38 ----------
 ...c-detect-readline-via-pkg-config-when-pos.patch | 81 ++++++++++++++++++++++
 package/udftools/udftools.hash                     |  2 +-
 package/udftools/udftools.mk                       |  2 +-
 8 files changed, 159 insertions(+), 132 deletions(-)

diff --git a/package/udftools/0001-configure-Use-AS_IF-macro-for-C99-check.patch b/package/udftools/0001-configure-Use-AS_IF-macro-for-C99-check.patch
new file mode 100644
index 0000000000..b4770f7df2
--- /dev/null
+++ b/package/udftools/0001-configure-Use-AS_IF-macro-for-C99-check.patch
@@ -0,0 +1,27 @@
+From 02a32d8827e884730d22ddee4c479577cd1e90ac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
+Date: Wed, 26 Jun 2019 17:41:54 +0200
+Subject: [PATCH] configure: Use AS_IF macro for C99 check
+
+[Retrieved from:
+https://github.com/pali/udftools/commit/02a32d8827e884730d22ddee4c479577cd1e90ac]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2db31d0..315fb26 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,9 +10,7 @@ AC_PROG_CC_C99
+ AC_DISABLE_SHARED
+ AM_PROG_LIBTOOL
+ 
+-if test "$ac_cv_prog_cc_c99" = "no"; then
+-	AC_MSG_ERROR([Your C compiler does not support ISO C99.])
+-fi
++AS_IF([test "$ac_cv_prog_cc_c99" = "no"], [AC_MSG_ERROR([Your C compiler does not support ISO C99.])])
+ 
+ dnl Checks for libraries.
+ AC_CHECK_LIB(readline, readline, [ ])
diff --git a/package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch b/package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch
deleted file mode 100644
index 4d842821aa..0000000000
--- a/package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8da4dde42cc25294819ad078432d85437e4a12ee Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 22 Apr 2018 15:05:46 +0200
-Subject: [PATCH] pktsetup/pktsetup.c: do not include <bits/types.h>
-
-This header is not a standard header, and is for example not provided
-by the musl C library.
-
-This change has been tested by building udftools against glibc, uClibc
-and musl.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/pali/udftools/pull/16
----
- pktsetup/pktsetup.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/pktsetup/pktsetup.c b/pktsetup/pktsetup.c
-index 8b3df51..81ed142 100644
---- a/pktsetup/pktsetup.c
-+++ b/pktsetup/pktsetup.c
-@@ -27,7 +27,6 @@
- #include <sys/stat.h>
- #include <unistd.h>
- #include <getopt.h>
--#include <bits/types.h>
- #include <sys/types.h>
- #include <string.h>
- #include <limits.h>
--- 
-2.14.3
-
diff --git a/package/udftools/0002-all-Allow-to-build-udftools-without-udev.patch b/package/udftools/0002-all-Allow-to-build-udftools-without-udev.patch
new file mode 100644
index 0000000000..3a3c4efe8e
--- /dev/null
+++ b/package/udftools/0002-all-Allow-to-build-udftools-without-udev.patch
@@ -0,0 +1,49 @@
+From 2fbd6e8d0cb42507831847982ea3937e2c13ace0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
+Date: Tue, 13 Aug 2019 00:49:17 +0200
+Subject: [PATCH] all: Allow to build udftools without udev
+
+If udev is not found during configure phase then do not install pktsetup
+udev rules file. udev itself is not used for anything else.
+
+Fixes: https://github.com/pali/udftools/issues/30
+[Retrieved from:
+https://github.com/pali/udftools/commit/2fbd6e8d0cb42507831847982ea3937e2c13ace0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac         | 3 ++-
+ pktsetup/Makefile.am | 4 ++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 63bef62..d71fee8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,7 +25,8 @@ AC_C_BIGENDIAN
+ AC_SYS_LARGEFILE
+ 
+ PKG_PROG_PKG_CONFIG
+-PKG_CHECK_MODULES(UDEV, [udev], [ac_cv_udevdir=`$PKG_CONFIG --variable=udevdir udev`])
++PKG_CHECK_MODULES(UDEV, [udev], [ac_cv_udevdir=`$PKG_CONFIG --variable=udevdir udev`], [ac_cv_udevdir=""])
++AM_CONDITIONAL(UDEVDIR, [test "$ac_cv_udevdir" != ""])
+ AC_SUBST(UDEVDIR, $ac_cv_udevdir)
+ 
+ dnl Checks for library functions.
+diff --git a/pktsetup/Makefile.am b/pktsetup/Makefile.am
+index 0c5fd1c..33da370 100644
+--- a/pktsetup/Makefile.am
++++ b/pktsetup/Makefile.am
+@@ -2,9 +2,13 @@ sbin_PROGRAMS = pktsetup
+ pktsetup_SOURCES = pktsetup.c
+ EXTRA_DIST = pktsetup.rules
+ 
++if UDEVDIR
++
+ install-data-local:
+ 	mkdir -p "$(DESTDIR)$(UDEVDIR)/rules.d"
+ 	$(INSTALL_DATA) "$(srcdir)/pktsetup.rules" "$(DESTDIR)$(UDEVDIR)/rules.d/80-pktsetup.rules"
+ 
+ uninstall-local:
+ 	rm -f "$(DESTDIR)$(UDEVDIR)/rules.d/80-pktsetup.rules"
++
++endif
diff --git a/package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch b/package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch
deleted file mode 100644
index f73db99ca2..0000000000
--- a/package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From bdacf0101fea1dad2c89996b27cb4b9caee9109c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 22 Apr 2018 22:28:09 +0200
-Subject: [PATCH] configure.ac: detect readline via pkg-config when possible
-
-pkg-config automatically handles static linking situations, where for
-example readline is linked against ncurses, and therefore -lncurses
-needs to be passed in addition to -lreadline.
-
-This proposal uses pkg-config when available. If pkg-config is not
-found, or readline is not found via pkg-config, we fallback to the
-existing AC_CHECK_LIB(). This AC_CHECK_LIB() test is modified to set
-READLINE_LIBS, like PKG_CHECK_MODULES() does. The Makefile.am
-consequently uses READLINE_LIBS instead of hardcoding -lreadline.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac      | 14 ++++++++++++--
- wrudf/Makefile.am |  2 +-
- 2 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 95fbba3..62b1caa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -9,8 +9,18 @@ AC_PROG_CC
- AC_DISABLE_SHARED
- AM_PROG_LIBTOOL
- 
--dnl Checks for libraries.
--AC_CHECK_LIB(readline, readline, [ ], AC_MSG_ERROR([cannot find -lreadline.]))
-+PKG_PROG_PKG_CONFIG
-+
-+dnl Checks for libraries, by using pkg-config when available
-+if test -n "${PKG_CONFIG}" ; then
-+  PKG_CHECK_MODULES([READLINE], [readline], [readline_found=yes], [readline_found=no])
-+fi
-+
-+if test "${readline_found}" != "yes" ; then
-+  AC_CHECK_LIB(readline, readline,
-+               [AC_SUBST([READLINE_LIBS], [-lreadline])],
-+               AC_MSG_ERROR([cannot find -lreadline.]))
-+fi
- 
- dnl Checks for header files.
- AC_HEADER_STDC
-diff --git a/wrudf/Makefile.am b/wrudf/Makefile.am
-index fe1c269..e3ab85b 100644
---- a/wrudf/Makefile.am
-+++ b/wrudf/Makefile.am
-@@ -1,5 +1,5 @@
- bin_PROGRAMS = wrudf
--wrudf_LDADD = $(top_builddir)/libudffs/libudffs.la -lreadline
-+wrudf_LDADD = $(top_builddir)/libudffs/libudffs.la $(READLINE_LIBS)
- wrudf_SOURCES = wrudf.c wrudf-cmnd.c wrudf-desc.c wrudf-cdrw.c wrudf-cdr.c ide-pc.c wrudf.h ide-pc.h ../include/ecma_167.h ../include/osta_udf.h ../include/bswap.h
- 
- AM_CPPFLAGS = -I$(top_srcdir)/include -D_GNU_SOURCE -DDEBUG
--- 
-2.14.3
-
diff --git a/package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch b/package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch
deleted file mode 100644
index ac56715d62..0000000000
--- a/package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From cca194f17fe2892c929acab2f1d5016ad38aa305 Mon Sep 17 00:00:00 2001
-From: Lars Wendler <polynomial-c@gentoo.org>
-Date: Tue, 2 Jan 2018 15:10:34 +0100
-Subject: [PATCH] Include <sys/sysmacros.h> to prevent build breakage with
- >=glibc-2.25
-
-libtool: link: x86_64-pc-linux-gnu-gcc -march=native -mtune=native -O2
--pipe -Wl,-O1 -Wl,--hash-style=gnu -Wl,--sort-common -Wl,--as-needed -o
-mkudffs main.o mkudffs.o defaults.o file.o options.o
-../libudffs/.libs/libudffs.a
-main.o: In function `is_whole_disk':
-main.c:(.text+0x2ce): undefined reference to `major'
-main.c:(.text+0x2dd): undefined reference to `minor'
-main.o: In function `main':
-main.c:(.text.startup+0x72f): undefined reference to `minor'
-main.c:(.text.startup+0x741): undefined reference to `major'
-collect2: error: ld returned 1 exit status
-make[1]: *** [Makefile:378: mkudffs] Error 1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from
-https://github.com/pali/udftools/commit/cca194f17fe2892c929acab2f1d5016ad38aa305]
----
- mkudffs/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mkudffs/main.c b/mkudffs/main.c
-index 066afac..3e306ac 100644
---- a/mkudffs/main.c
-+++ b/mkudffs/main.c
-@@ -43,6 +43,7 @@
- #include <sys/ioctl.h>
- #include <linux/fs.h>
- #include <linux/fd.h>
-+#include <sys/sysmacros.h>
- 
- #include "mkudffs.h"
- #include "defaults.h"
diff --git a/package/udftools/0003-configure.ac-detect-readline-via-pkg-config-when-pos.patch b/package/udftools/0003-configure.ac-detect-readline-via-pkg-config-when-pos.patch
new file mode 100644
index 0000000000..4f7e222697
--- /dev/null
+++ b/package/udftools/0003-configure.ac-detect-readline-via-pkg-config-when-pos.patch
@@ -0,0 +1,81 @@
+From da044aa346fac63571d3d0cff8f8838263acab40 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Aug 2019 18:19:05 +0200
+Subject: [PATCH] configure.ac: detect readline via pkg-config when possible
+
+pkg-config automatically handles static linking situations, where for
+example readline is linked against ncurses, and therefore -lncurses
+needs to be passed in addition to -lreadline.
+
+This proposal uses pkg-config when available. If pkg-config is not
+found, or readline is not found via pkg-config, we fallback to the
+existing AC_CHECK_LIB(). This AC_CHECK_LIB() test is modified to set
+READLINE_LIBS, like PKG_CHECK_MODULES() does. The Makefile.am
+consequently uses READLINE_LIBS instead of hardcoding -lreadline.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Retrieved (and slightly updated) from:
+https://git.buildroot.net/buildroot/tree/package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/pali/udftools/commit/da044aa346fac63571d3d0cff8f8838263acab40]
+---
+ configure.ac      | 18 ++++++++++++------
+ wrudf/Makefile.am |  2 +-
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0404e50..9329d69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,18 +14,24 @@ AC_PROG_MKDIR_P
+ 
+ AS_IF([test "$ac_cv_prog_cc_c99" = "no"], [AC_MSG_ERROR([Your C compiler does not support ISO C99.])])
+ 
+-dnl Checks for libraries.
+-AC_CHECK_LIB(readline, readline, [ ])
++dnl Checks for libraries, by using pkg-config when available
++PKG_PROG_PKG_CONFIG
++AS_IF([test -n "${PKG_CONFIG}"], [PKG_CHECK_MODULES([READLINE], [readline], [readline_found=yes], [readline_found=no])])
+ 
+-dnl Checks for header files.
+-AC_CHECK_HEADERS(readline/readline.h)
++AS_IF([test "${readline_found}" != "yes"],
++  [AC_CHECK_LIB(readline, readline,
++               [AC_CHECK_HEADERS(readline/readline.h,
++		                 [AC_SUBST([READLINE_LIBS], [-lreadline])
++				 readline_found=yes],
++				 [readline_found=no])],
++               [readline_found=no])
++  ])
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_INLINE
+ AC_C_BIGENDIAN
+ AC_SYS_LARGEFILE
+ 
+-PKG_PROG_PKG_CONFIG
+ PKG_CHECK_MODULES(UDEV, [udev], [ac_cv_udevdir=`$PKG_CONFIG --variable=udevdir udev`], [ac_cv_udevdir=""])
+ AM_CONDITIONAL(UDEVDIR, [test "$ac_cv_udevdir" != ""])
+ AC_SUBST(UDEVDIR, $ac_cv_udevdir)
+@@ -33,7 +39,7 @@ AC_SUBST(UDEVDIR, $ac_cv_udevdir)
+ dnl Checks for library functions.
+ AC_SUBST(LTLIBOBJS)
+ 
+-AM_CONDITIONAL(USE_READLINE, test "$ac_cv_lib_readline_readline" = "yes" -a "$ac_cv_header_readline_readline_h" = "yes")
++AM_CONDITIONAL(USE_READLINE, test "$readline_found" = "yes")
+ 
+ AC_CONFIG_FILES(Makefile libudffs/Makefile mkudffs/Makefile cdrwtool/Makefile pktsetup/Makefile udffsck/Makefile udfinfo/Makefile udflabel/Makefile wrudf/Makefile doc/Makefile)
+ 
+diff --git a/wrudf/Makefile.am b/wrudf/Makefile.am
+index 4224b13..9f6b33d 100644
+--- a/wrudf/Makefile.am
++++ b/wrudf/Makefile.am
+@@ -5,6 +5,6 @@ wrudf_SOURCES = wrudf.c wrudf-cmnd.c wrudf-desc.c wrudf-cdrw.c wrudf-cdr.c ide-p
+ AM_CPPFLAGS = -I$(top_srcdir)/include
+ 
+ if USE_READLINE
+-wrudf_LDADD += -lreadline
++wrudf_LDADD += $(READLINE_LIBS)
+ AM_CPPFLAGS += -DUSE_READLINE
+ endif
diff --git a/package/udftools/udftools.hash b/package/udftools/udftools.hash
index 837a515726..4b3a6288d1 100644
--- a/package/udftools/udftools.hash
+++ b/package/udftools/udftools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	67fe428d452901215cfad8049d250540c97114b1a20dd63277b91c2c4fae8292	udftools-2.0.tar.gz
+sha256	783221bcc2518ea480cee01ceeb8825db7a089f4e986b557f6460f89636142b6	udftools-2.1.tar.gz
 sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
index e5bf59137e..ca2ec32065 100644
--- a/package/udftools/udftools.mk
+++ b/package/udftools/udftools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDFTOOLS_VERSION = 2.0
+UDFTOOLS_VERSION = 2.1
 UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
 UDFTOOLS_LICENSE = GPL-2.0+
 UDFTOOLS_LICENSE_FILES = COPYING
