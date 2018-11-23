From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:57:32 +0100
Subject: [Buildroot] [git commit] lldpd: update to version 1.0.1
Message-ID: <20181202071557.9F3B481409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43b45648b15249b406fc076d4cd92aae765cfaa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches for atom glue and remove CXX compiler check as they are
applied upstream.

Replace patch to disable libbsd with upstream patch to accomplish the
same thing using --without-libbsd.

Enable support for readline when that package is enabled.

Enable lldpd's systemd unit file.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ity-to-disable-libbsd-with-without-libbsd.patch | 106 +++++++++++++++++++++
 ...generation-of-atom-glue-compatible-with-o.patch |  43 ---------
 .../0002-configure-do-not-check-for-libbsd.patch   |  61 ------------
 ...03-configure-remove-check-on-CXX-compiler.patch |  35 -------
 package/lldpd/lldpd.hash                           |   2 +-
 package/lldpd/lldpd.mk                             |  11 ++-
 6 files changed, 116 insertions(+), 142 deletions(-)

diff --git a/package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch b/package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch
new file mode 100644
index 0000000000..7301ac636b
--- /dev/null
+++ b/package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch
@@ -0,0 +1,106 @@
+From ff3dcc4ad71c1105bd8ea11afe7e07efd48c038d Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 25 Sep 2018 10:57:49 +0200
+Subject: [PATCH] build: ability to disable libbsd with --without-libbsd
+
+This is useful when user wants to ensure reproducibility of the build
+whatever libbsd is present or not.
+
+Signed-off-by: Trent Piepho <tpiepho@impinj.com>
+---
+ configure.ac  | 59 +++++++++++++++++++++++++++++++++++++++--------------------
+ src/marshal.h |  1 +
+ 2 files changed, 40 insertions(+), 20 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9b40473..589cd96 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -173,26 +173,44 @@ AC_FUNC_REALLOC
+ AC_FUNC_FORK
+ 
+ # Some functions can be in libbsd
+-PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
+-  _save_CFLAGS="$CFLAGS"
+-  _save_LIBS="$LIBS"
+-  CFLAGS="$CFLAGS $libbsd_CFLAGS"
+-  LIBS="$LIBS $libbsd_LIBS"
+-  AC_MSG_CHECKING([if libbsd can be linked correctly])
+-  AC_TRY_LINK([
+-@%:@include <sys/time.h>
+-@%:@include <sys/types.h>
+-],[],
+-    [
+-      AC_MSG_RESULT(yes)
+-      LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
+-      LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
+-    ],[
+-      AC_MSG_RESULT(no)
+-      CFLAGS="$_save_CFLAGS"
+-      LIBS="$_save_LIBS"
+-    ])
+-], [:])
++AC_ARG_WITH([libbsd],
++  AS_HELP_STRING(
++    [--with-libbsd],
++    [Use libbsd @<:@default=auto@:>@]),
++  [],
++  [with_libbsd=auto])
++if test x"$with_libbsd" != x"no"; then
++  PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
++    _save_CFLAGS="$CFLAGS"
++    _save_LIBS="$LIBS"
++    CFLAGS="$CFLAGS $libbsd_CFLAGS"
++    LIBS="$LIBS $libbsd_LIBS"
++    AC_MSG_CHECKING([if libbsd can be linked correctly])
++    AC_TRY_LINK([
++  @%:@include <sys/time.h>
++  @%:@include <sys/types.h>
++  ],[],
++      [
++        AC_MSG_RESULT(yes)
++        LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
++        LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
++        with_libbsd=yes
++      ],[
++        AC_MSG_RESULT(no)
++        CFLAGS="$_save_CFLAGS"
++        LIBS="$_save_LIBS"
++        if test x"$with_libbsd" = x"yes"; then
++           AC_MSG_FAILURE([*** no libbsd support found])
++        fi
++        with_libbsd=no
++      ])
++  ], [
++    if test x"$with_libbsd" = x"yes"; then
++       AC_MSG_FAILURE([*** no libbsd support found])
++    fi
++    with_libbsd=no
++  ])
++fi
+ 
+ # setproctitle may have an _init function
+ AC_REPLACE_FUNCS([setproctitle])
+@@ -412,6 +430,7 @@ cat <<EOF
+   XML output.....: ${with_xml-no}
+   Oldies support.: $enable_oldies
+   seccomp........: ${with_seccomp-no}
++  libbsd.........: ${with_libbsd-no}
+ 
+  Privilege separation:
+   Enabled........: $enable_privsep
+diff --git a/src/marshal.h b/src/marshal.h
+index b0e8032..0a782d5 100644
+--- a/src/marshal.h
++++ b/src/marshal.h
+@@ -19,6 +19,7 @@
+ #define _MARSHAL_H
+ 
+ #include <stddef.h>
++#include <stdint.h>
+ #include <sys/types.h>
+ 
+ struct marshal_info;
+-- 
+2.14.4
+
diff --git a/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch b/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
deleted file mode 100644
index d5675d39af..0000000000
--- a/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 106aa50d4e5b336f7dd2d5cf4d882e692d205e91 Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.im>
-Date: Sat, 18 Jun 2016 22:18:41 +0200
-Subject: [PATCH] build: make generation of atom-glue compatible with older gcc
- versions
-
-With old versions, cpp doesn't accept several files as input. See #186.
-
-Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
----
- src/lib/Makefile.am | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
-index 250e32a..2a5cdb3 100644
---- a/src/lib/Makefile.am
-+++ b/src/lib/Makefile.am
-@@ -20,8 +20,9 @@ nodist_liblldpctl_la_SOURCES = atom-glue.c
- liblldpctl_la_LIBADD  = $(top_builddir)/src/libcommon-daemon-lib.la libfixedpoint.la
- 
- atom-glue.c: $(ATOM_FILES) Makefile
--	$(AM_V_GEN)($(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
--		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $(ATOM_FILES:%=$(srcdir)/%) | \
-+	$(AM_V_GEN)(for f in $(ATOM_FILES:%=$(srcdir)/%); do \
-+		$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $$f; done | \
- 		$(SED) -n 's+^void init_atom_builder_\([^(]*\)().*, \([0-9]*\)).*+\2 \1+p' | \
- 		sort | \
- 		$(AWK) '{ atoms[$$2] = 1 } \
-@@ -30,8 +31,9 @@ atom-glue.c: $(ATOM_FILES) Makefile
-                                print " static int init = 0; if (init) return; init++;"; \
- 			       for (atom in atoms) { print " init_atom_builder_"atom"();" } \
- 			       print "}"; }' && \
-+		for f in $(ATOM_FILES:%=$(srcdir)/%); do \
- 		$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
--		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $(ATOM_FILES:%=$(srcdir)/%) | \
-+		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $$f; done | \
- 		$(SED) -n 's+^void init_atom_map_\([^(]*\)().*, \([0-9]*\)).*+\2 \1+p' | \
- 		sort -n | \
- 		$(AWK) '{ atoms[$$2] = 1 } \
--- 
-2.9.0
-
diff --git a/package/lldpd/0002-configure-do-not-check-for-libbsd.patch b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
deleted file mode 100644
index 4d63274526..0000000000
--- a/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 0801a066cd4a24a858ddfa7c62c7802e0f5533a8 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 14 Aug 2016 12:15:17 +0200
-Subject: [PATCH] configure: do not check for libbsd
-
-libbsd causes build issues because its libbsd-overlay.pc file is borked:
-it contains -isystem in CFLAGS, which is not munged by pkgconf, so we
-end up using the headers of the build machine, causing all sorts of
-hard-to-debug trouble at build time.
-
-lldpd uses libbsd-overlay for a few helper functions, but has fallbacks
-in case it is not available. The only feature that is lost when not using
-it is that the neighbour name is no longer displayed in /proc/self/cmdline.
-As the author of lldpd said on IRC: "people should survive! ;-)"
-
-So we just remove the detection of libbsd altogether.
-
-Fixes:
-    http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
-    http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
-    http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
-    [...]
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure.ac | 19 -------------------
- 1 file changed, 19 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd723b0..45498ce 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -165,25 +165,6 @@ AC_FUNC_MALLOC
- AC_FUNC_REALLOC
- AC_FUNC_FORK
- 
--# Some functions can be in libbsd
--PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
--  _save_CFLAGS="$CFLAGS"
--  _save_LIBS="$LIBS"
--  CFLAGS="$CFLAGS $libbsd_CFLAGS"
--  LIBS="$LIBS $libbsd_LIBS"
--  AC_MSG_CHECKING([if libbsd can be linked correctly])
--  AC_LINK_IFELSE([AC_LANG_SOURCE([[int main() { return 0; }]])],
--    [
--      AC_MSG_RESULT(yes)
--      LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
--      LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
--    ],[
--      AC_MSG_RESULT(no)
--      CFLAGS="$_save_CFLAGS"
--      LIBS="$_save_LIBS"
--    ])
--], [:])
--
- # setproctitle may have an _init function
- AC_REPLACE_FUNCS([setproctitle])
- AC_CHECK_FUNCS([setproctitle_init])
--- 
-2.7.4
-
diff --git a/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch b/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
deleted file mode 100644
index 880f603f71..0000000000
--- a/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d28b3bfa1b224f7770004dddf4dfaf10ad7ad6c9 Mon Sep 17 00:00:00 2001
-From: Damien Riegel <damien.riegel@savoirfairelinux.com>
-Date: Mon, 18 Dec 2017 14:37:08 -0500
-Subject: [PATCH] configure: remove check on CXX compiler
-
-lldpd fails to build if the toolchain doesn't have a C++ compiler
-because configure fails with the following error:
-
-  checking how to run the C++ preprocessor... /lib/cpp
-  configure: error: in `/home/dkc/src/buildroot/build-zii/build/lldpd-0.9.4':
-  configure: error: C++ preprocessor "/lib/cpp" fails sanity check
-
-Since "8d92800b: build: cleaner way to not alter CFLAGS/CPPFLAGS/LDFLAGS",
-it seems that the dependency on C++ is not required anymore, so there
-is no reason to keep this restriction. Dropping AC_PROG_CXX allows to
-build with a toolchain that doesn't have C++ just fine.
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0edceb1..5afe8f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,7 +48,6 @@ AC_PROG_CC_C99
- if test x"$ac_cv_prog_cc_c99" = x"no"; then
-   AC_MSG_FAILURE([*** C99 support is mandatory])
- fi
--AC_PROG_CXX
- AM_PROG_CC_C_O
- AC_PROG_LIBTOOL
- AC_PROG_LN_S
--- 
-2.15.1
-
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index fc3d21f487..1785197737 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 eb1f5beff2ff5c13c5e0342b5b9da815ed4a63866262445e1168a79ee65c9079  lldpd-0.9.4.tar.gz
+sha256 450b622aac7ae1758f1ef82f3b7b94ec47f2ff33abfb0e6ac82555b9ee55f151  lldpd-1.0.1.tar.gz
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 2bdda0213e..939cd128fa 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 0.9.4
+LLDPD_VERSION = 1.0.1
 LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
@@ -28,14 +28,15 @@ endif
 LLDPD_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
 LLDPD_CONF_OPTS = \
-	--without-readline \
 	--without-embedded-libevent \
 	--without-snmp \
 	--without-xml \
 	--without-json \
 	--without-seccomp \
+	--without-libbsd \
 	--disable-hardening \
 	--disable-privsep \
+	$(if $(BR2_PACKAGE_READLINE),--with-readline,--without-readline) \
 	$(if $(BR2_PACKAGE_LLDPD_CDP),--enable-cdp,--disable-cdp) \
 	$(if $(BR2_PACKAGE_LLDPD_FDP),--enable-fdp,--disable-fdp) \
 	$(if $(BR2_PACKAGE_LLDPD_EDP),--enable-edp,--disable-edp) \
@@ -50,4 +51,10 @@ define LLDPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S60lldpd
 endef
 
+define LLDPD_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/lldpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lldpd.service
+endef
+
 $(eval $(autotools-package))
