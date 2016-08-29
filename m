From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 22:18:37 +0200
Subject: [Buildroot] [PATCH] libaio: allow building on static-only
	configurations
Message-ID: <1472501917-28520-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a simple patch to the libaio build system that allows
it to be used on static-only configurations. It is probably easier to
fix this than to propagate the !BR2_STATIC_LIBS dependency.

Fixes:

  http://autobuild.buildroot.net/results/8c86402bd14a0af1b82e6e07c06531a856dd37c6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-add-ENABLE_SHARED-boolean-to-allow-stat.patch | 56 ++++++++++++++++++++++
 package/libaio/libaio.mk                           |  4 ++
 2 files changed, 60 insertions(+)
 create mode 100644 package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch

diff --git a/package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch b/package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
new file mode 100644
index 0000000..50703c3
--- /dev/null
+++ b/package/libaio/0002-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
@@ -0,0 +1,56 @@
+From 14dee5707716629b1bc8d06b93cdfe9ea1a3b813 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Aug 2016 22:14:26 +0200
+Subject: [PATCH] src/Makefile: add ENABLE_SHARED boolean to allow static-only
+ build
+
+Currently, the libaio builds sytem builds a shared library
+unconditionally. In some environments, this is not possible or
+desirable. This commit adds a new Makefile variable, ENABLE_SHARED,
+which defaults to "1" (i.e shared library enabled) and that allows to
+override this behavior, and therefore to disable the build and
+installation of the shared library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Makefile | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index eadb336..cfab240 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -8,12 +8,17 @@ SO_CFLAGS=-shared $(CFLAGS)
+ L_CFLAGS=$(CFLAGS)
+ LINK_FLAGS=
+ LINK_FLAGS+=$(LDFLAGS)
++ENABLE_SHARED ?= 1
+ 
+ soname=libaio.so.1
+ minor=0
+ micro=1
+ libname=$(soname).$(minor).$(micro)
+-all_targets += libaio.a $(libname)
++all_targets += libaio.a
++
++ifeq ($(ENABLE_SHARED),1)
++all_targets += $(libname)
++endif
+ 
+ all: $(all_targets)
+ 
+@@ -55,9 +60,11 @@ $(libname): $(libaio_sobjs) libaio.map
+ install: $(all_targets)
+ 	install -D -m 644 libaio.h $(includedir)/libaio.h
+ 	install -D -m 644 libaio.a $(libdir)/libaio.a
++ifeq ($(ENABLE_SHARED),1)
+ 	install -D -m 755 $(libname) $(libdir)/$(libname)
+ 	ln -sf $(libname) $(libdir)/$(soname)
+ 	ln -sf $(libname) $(libdir)/libaio.so
++endif
+ 
+ $(libaio_objs): libaio.h
+ 
+-- 
+2.7.4
+
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 0854fc5..5ebe1b7 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -13,6 +13,10 @@ LIBAIO_LICENSE_FILES = COPYING
 
 LIBAIO_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBAIO_CONFIGURE_OPTS += ENABLE_SHARED=0
+endif
+
 # On PowerPC, a weird toolchain issue causes -Os builds to produce
 # references to hidden symbols, so we're forcing -O2
 ifeq ($(BR2_powerpc),y)
-- 
2.7.4
