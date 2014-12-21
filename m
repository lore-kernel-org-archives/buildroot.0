From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:54:14 +0100
Subject: [Buildroot] [git commit] liblinear: new package
Message-ID: <20141221215726.A2D0C805B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f3a8f561d48368da58dac0cfa5b2ab1821067e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: add ability to build a static lib; handle
static-only and static+shared cases]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../0001-blas-don-t-overwrite-ar-options.patch     |   35 ++++++++++++++++
 package/liblinear/0002-build-static-lib.patch      |   18 ++++++++
 package/liblinear/Config.in                        |    7 +++
 package/liblinear/liblinear.mk                     |   44 ++++++++++++++++++++
 5 files changed, 105 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 808ecd2..e2b73dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -905,6 +905,7 @@ menu "Other"
 	source "package/libgc/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
+	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
new file mode 100644
index 0000000..5d1ef3f
--- /dev/null
+++ b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
@@ -0,0 +1,35 @@
+From cae4c3b80fee0f3637d70f6d33946888c8105637 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 13 Dec 2014 17:16:58 +0100
+Subject: [PATCH 1/1] blas: don't overwrite ar options
+
+ar's rcv options get lost when AR is passed on
+the command line.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ blas/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/blas/Makefile b/blas/Makefile
+index 895fd24..78cec9a 100644
+--- a/blas/Makefile
++++ b/blas/Makefile
+@@ -1,4 +1,4 @@
+-AR     = ar rcv
++AR     = ar
+ RANLIB = ranlib 
+ 
+ HEADERS = blas.h blasp.h
+@@ -8,7 +8,7 @@ CFLAGS = $(OPTFLAGS)
+ FFLAGS = $(OPTFLAGS)
+ 
+ blas: $(FILES) $(HEADERS)
+-	$(AR) blas.a $(FILES)  
++	$(AR) rcv blas.a $(FILES)  
+ 	$(RANLIB) blas.a
+ 
+ clean:
+-- 
+1.9.3
+
diff --git a/package/liblinear/0002-build-static-lib.patch b/package/liblinear/0002-build-static-lib.patch
new file mode 100644
index 0000000..98657d3
--- /dev/null
+++ b/package/liblinear/0002-build-static-lib.patch
@@ -0,0 +1,18 @@
+Makefile: add a rule to build a static library
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+diff -durN liblinear-1.96.orig/Makefile liblinear-1.96/Makefile
+--- liblinear-1.96.orig/Makefile	2014-11-15 07:50:23.000000000 +0100
++++ liblinear-1.96/Makefile	2014-12-14 00:23:00.135893956 +0100
+@@ -16,6 +16,11 @@
+ 	fi; \
+ 	$(CXX) $${SHARED_LIB_FLAG} linear.o tron.o blas/blas.a -o liblinear.so.$(SHVER)
+ 
++# Keeping blas/blas.a as a pre-requisite, to ensure all .o files are built
++static-lib: linear.o tron.o blas/blas.a
++	$(AR) rcv liblinear.a linear.o tron.o blas/*.o
++	$(RANLIB) liblinear.a
++
+ train: tron.o linear.o train.c blas/blas.a
+ 	$(CXX) $(CFLAGS) -o train train.c tron.o linear.o $(LIBS)
+ 
diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
new file mode 100644
index 0000000..08e8365
--- /dev/null
+++ b/package/liblinear/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBLINEAR
+	bool "liblinear"
+	help
+	  liblinear is a linear classifier for data with millions of instances and
+	  features.
+
+	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
new file mode 100644
index 0000000..296aa01
--- /dev/null
+++ b/package/liblinear/liblinear.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# liblinear
+#
+################################################################################
+
+LIBLINEAR_VERSION = 1.96
+LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear/$(LIBLINEAR_VERSION_MAJOR)
+LIBLINEAR_LICENSE = BSD-3c
+LIBLINEAR_LICENSE_FILES = COPYING
+LIBLINEAR_INSTALL_STAGING = YES
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+# $1: destination directory
+define LIBLINEAR_INSTALL_SHARED
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.2 $(1)/usr/lib/liblinear.so.2
+	ln -sf liblinear.so.2 $(1)/usr/lib/liblinear.so
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+# $1: destination directory
+define LIBLINEAR_INSTALL_STATIC
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.a $(1)/usr/lib/liblinear.a
+endef
+endif
+
+define LIBLINEAR_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),lib) \
+		$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),static-lib)
+endef
+
+define LIBLINEAR_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/linear.h $(STAGING_DIR)/usr/include/linear.h
+	$(call LIBLINEAR_INSTALL_SHARED,$(STAGING_DIR))
+	$(call LIBLINEAR_INSTALL_STATIC,$(STAGING_DIR))
+endef
+
+define LIBLINEAR_INSTALL_TARGET_CMDS
+	$(call LIBLINEAR_INSTALL_SHARED,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
