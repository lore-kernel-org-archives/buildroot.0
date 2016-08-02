From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue,  2 Aug 2016 12:25:17 -0400
Subject: [Buildroot] [PATCH] lldpd: bump version to 0.9.4
Message-ID: <20160802162517.19853-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this new version, the generation of atom-glue fails with the
following error:

    Making all in src/lib
    make[3]: Entering directory '/mnt/data/src/sfl/zodiac/buildroot/output/build/lldpd-0.9.4/src/lib'
      GEN      atom-glue.c
    arm-buildroot-linux-uclibcgnueabi-cpp.br_real: fatal error: too many input files
    compilation terminated.
    arm-buildroot-linux-uclibcgnueabi-cpp.br_real: fatal error: too many input files
    compilation terminated.
    make[3]: *** [Makefile:899: atom-glue.c] Error 1

There is an upstream patch pushed after 0.9.4 which fixes the
corresponding Makefile.am, included in this commit.

Note that since the provided tarball ships the related Makefile.in file,
we need to tell Buildroot to autoreconfigure the package.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 ...generation-of-atom-glue-compatible-with-o.patch | 41 ++++++++++++++++++++++
 package/lldpd/lldpd.hash                           |  2 +-
 package/lldpd/lldpd.mk                             |  3 +-
 3 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch

diff --git a/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch b/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
new file mode 100644
index 0000000..b3afcf2
--- /dev/null
+++ b/package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
@@ -0,0 +1,41 @@
+From 106aa50d4e5b336f7dd2d5cf4d882e692d205e91 Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.im>
+Date: Sat, 18 Jun 2016 22:18:41 +0200
+Subject: [PATCH] build: make generation of atom-glue compatible with older gcc
+ versions
+
+With old versions, cpp doesn't accept several files as input. See #186.
+---
+ src/lib/Makefile.am | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
+index 250e32a..2a5cdb3 100644
+--- a/src/lib/Makefile.am
++++ b/src/lib/Makefile.am
+@@ -20,8 +20,9 @@ nodist_liblldpctl_la_SOURCES = atom-glue.c
+ liblldpctl_la_LIBADD  = $(top_builddir)/src/libcommon-daemon-lib.la libfixedpoint.la
+ 
+ atom-glue.c: $(ATOM_FILES) Makefile
+-	$(AM_V_GEN)($(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $(ATOM_FILES:%=$(srcdir)/%) | \
++	$(AM_V_GEN)(for f in $(ATOM_FILES:%=$(srcdir)/%); do \
++		$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $$f; done | \
+ 		$(SED) -n 's+^void init_atom_builder_\([^(]*\)().*, \([0-9]*\)).*+\2 \1+p' | \
+ 		sort | \
+ 		$(AWK) '{ atoms[$$2] = 1 } \
+@@ -30,8 +31,9 @@ atom-glue.c: $(ATOM_FILES) Makefile
+                                print " static int init = 0; if (init) return; init++;"; \
+ 			       for (atom in atoms) { print " init_atom_builder_"atom"();" } \
+ 			       print "}"; }' && \
++		for f in $(ATOM_FILES:%=$(srcdir)/%); do \
+ 		$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $(ATOM_FILES:%=$(srcdir)/%) | \
++		$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) $$f; done | \
+ 		$(SED) -n 's+^void init_atom_map_\([^(]*\)().*, \([0-9]*\)).*+\2 \1+p' | \
+ 		sort -n | \
+ 		$(AWK) '{ atoms[$$2] = 1 } \
+-- 
+2.9.0
+
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index a6d905b..fc3d21f 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 aac11cb1fdc037709517372c70c9bf89c752ab8e5eaab9ce140b84ed5a0507c8  lldpd-0.7.19.tar.gz
+sha256 eb1f5beff2ff5c13c5e0342b5b9da815ed4a63866262445e1168a79ee65c9079  lldpd-0.9.4.tar.gz
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 6c7bf80..d8e7515 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 0.7.19
+LLDPD_VERSION = 0.9.4
 LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = README.md
+LLDPD_AUTORECONF = YES
 
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
-- 
2.9.2
