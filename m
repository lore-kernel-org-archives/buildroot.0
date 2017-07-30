From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jul 2017 18:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/lldpd: bump version to 0.9.7
Message-ID: <20170730163258.28200-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Removed 0001-build-make-generation-of-atom-glue-compatible-with-o.patch,
applied upstream:
https://github.com/vincentbernat/lldpd/commit/106aa50d4e5b336f7dd2d5cf4d882e692d205e91

Removed 0002-configure-do-not-check-for-libbsd.patch, included in
https://github.com/vincentbernat/lldpd/commit/cbe8bbd6b60fdc0fa83ddb10d2f771ed26810304
Autoreconf is not needed anymore after removing this patch.

--without-json is not needed anymore after
https://github.com/vincentbernat/lldpd/commit/06987a24ce053cbb57f8853bbf544bc7c067c8aa

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...generation-of-atom-glue-compatible-with-o.patch | 43 ---------------
 .../0002-configure-do-not-check-for-libbsd.patch   | 61 ----------------------
 package/lldpd/lldpd.hash                           |  2 +-
 package/lldpd/lldpd.mk                             |  7 +--
 4 files changed, 3 insertions(+), 110 deletions(-)
 delete mode 100644 package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
 delete mode 100644 package/lldpd/0002-configure-do-not-check-for-libbsd.patch

diff --git a/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch b/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
deleted file mode 100644
index d5675d39a..000000000
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
index 4d6327452..000000000
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
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index fc3d21f48..54c0dbe33 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 eb1f5beff2ff5c13c5e0342b5b9da815ed4a63866262445e1168a79ee65c9079  lldpd-0.9.4.tar.gz
+sha256 b9360355c30a3c06fd5c0a6e658f2ad8bf77037d5a17c6fcabf20e62882e0db8  lldpd-0.9.7.tar.gz
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 349c556c1..f9c9b5292 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 0.9.4
-LLDPD_SITE = http://media.luffy.cx/files/lldpd
+LLDPD_VERSION = 0.9.7
+LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = README.md
-# 0002-configure-do-not-check-for-libbsd.patch
-LLDPD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_CHECK),y)
 LLDPD_DEPENDENCIES += check
@@ -32,7 +30,6 @@ LLDPD_CONF_OPTS = \
 	--without-embedded-libevent \
 	--without-snmp \
 	--without-xml \
-	--without-json \
 	--without-seccomp \
 	--disable-hardening \
 	--disable-privsep \
-- 
2.11.0
