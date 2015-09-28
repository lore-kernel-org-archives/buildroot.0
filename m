From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Sep 2015 21:25:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoil: new package
Message-ID: <1443468339-24028-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for these new Kodi addons, to be included in upcoming 16.x-Jarvis
version bump:

kodi-screensaver-asterwave
kodi-screensaver-cpblobs
kodi-screensaver-matrixtrails
kodi-screensaver-planestate
kodi-visualisation-fountain

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                       |  1 +
 package/libsoil/0001-fix-makefile.patch | 37 ++++++++++++++++++++++++++++++++
 package/libsoil/Config.in               | 11 ++++++++++
 package/libsoil/libsoil.mk              | 38 +++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 package/libsoil/0001-fix-makefile.patch
 create mode 100644 package/libsoil/Config.in
 create mode 100644 package/libsoil/libsoil.mk

diff --git a/package/Config.in b/package/Config.in
index 0e0c5cd..72b55c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -831,6 +831,7 @@ menu "Graphics"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
+	source "package/libsoil/Config.in"
 	source "package/libsvg/Config.in"
 	source "package/libsvg-cairo/Config.in"
 	source "package/libsvgtiny/Config.in"
diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
new file mode 100644
index 0000000..80afd8a
--- /dev/null
+++ b/package/libsoil/0001-fix-makefile.patch
@@ -0,0 +1,37 @@
+Various makefile fixes to allow cross compilation
+
+Partly ported from
+http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking_correctly.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr "libsoil-1.07~20080707.dfsg.org/projects/makefile/alternate Makefile.txt" "libsoil-1.07~20080707.dfsg/projects/makefile/alternate Makefile.txt"
+--- "libsoil-1.07~20080707.dfsg.org/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
++++ "libsoil-1.07~20080707.dfsg/projects/makefile/alternate Makefile.txt"	2015-09-26 17:48:08.591597216 +0200
+@@ -1,10 +1,10 @@
+ MAKE = make
+ CC = gcc
+-INSTALL_FILE = install -p -o root -g root -m 644
+-INSTALL_DIR = install -p -o root -g root -d
+-LN = ln -s
++INSTALL_FILE = $(INSTALL) -m 644
++INSTALL_DIR = $(INSTALL) -d
++LN = ln -sf
+ RM = rm -fv
+-CFLAGS += -c -O2 -Wall
++CFLAGS += -c -O2 -Wall -fPIC
+ LDFLAGS +=
+ 
+ CFILES = image_DXT.c image_helper.c SOIL.c stb_image_aug.c
+@@ -27,9 +27,9 @@
+ 
+ lib: $(OFILES)
+ 	# create static library
+-	ar -cvq $(LIBNAME).a $(OFILES)
++	$(AR) -cvq $(LIBNAME).a $(OFILES)
+ 	# create shared library
+-	gcc -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES)
++	$(CC) -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES) -lGL -lm
+ 
+ install:
+ 	$(INSTALL_DIR) $(DESTDIR)/$(INCLUDEDIR)
diff --git a/package/libsoil/Config.in b/package/libsoil/Config.in
new file mode 100644
index 0000000..619fd9d
--- /dev/null
+++ b/package/libsoil/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSOIL
+	bool "libsoil"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  SOIL is a tiny C library used primarily for uploading
+	  textures into OpenGL.
+
+	  http://www.lonesock.net/soil.html
+
+comment "libsoil needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
new file mode 100644
index 0000000..664f4e6
--- /dev/null
+++ b/package/libsoil/libsoil.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# libsoil
+#
+################################################################################
+
+LIBSOIL_VERSION = 1.07~20080707
+LIBSOIL_SOURCE = libsoil_$(LIBSOIL_VERSION).dfsg.orig.tar.gz
+LIBSOIL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libs/libsoil
+LIBSOIL_INSTALL_STAGING = YES
+LIBSOIL_DEPENDENCIES = libgl
+LIBSOIL_LICENSE = Public Domain, MIT
+LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
+
+define LIBSOIL_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		CC=$(TARGET_CC) \
+		-f ../projects/makefile/alternate\ Makefile.txt \
+		-C $(@D)/src
+endef
+
+define LIBSOIL_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-f ../projects/makefile/alternate\ Makefile.txt \
+		DESTDIR=$(STAGING_DIR) install \
+		INSTALL=$(INSTALL) \
+		-C $(@D)/src
+endef
+
+define LIBSOIL_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-f ../projects/makefile/alternate\ Makefile.txt \
+		DESTDIR=$(STAGING_DIR) install \
+		INSTALL=$(INSTALL) \
+		-C $(@D)/src
+endef
+
+$(eval $(generic-package))
-- 
2.5.3
