From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Oct 2015 22:52:33 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libsoil: new package
Message-ID: <1446241953-14139-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for these new Kodi addons:

kodi-screensaver-asterwave
kodi-screensaver-cpblobs
kodi-screensaver-matrixtrails
kodi-screensaver-planestate
kodi-visualisation-fountain

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: added various changes after a review by Peter
    - in comment for v2: s/tarball/zipfile/
    - moved -fPIC from 0001-fix-makefile.patch to LIBSOIL_CFLAGS
Because this library will be used in at least five packages I decided
against using the other upstream makefile providing a static-only
library.

v2: added various changes after a review by Thomas
    - not available as static library
    - used author's upstream tarball instead from Debian
    - added a Makefile fix to simplify the usage of variable CC

 package/Config.in                       |  1 +
 package/libsoil/0001-fix-makefile.patch | 35 +++++++++++++++++++++++++++
 package/libsoil/Config.in               | 12 +++++++++
 package/libsoil/libsoil.hash            |  2 ++
 package/libsoil/libsoil.mk              | 43 +++++++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+)
 create mode 100644 package/libsoil/0001-fix-makefile.patch
 create mode 100644 package/libsoil/Config.in
 create mode 100644 package/libsoil/libsoil.hash
 create mode 100644 package/libsoil/libsoil.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..780eb12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -833,6 +833,7 @@ menu "Graphics"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
+	source "package/libsoil/Config.in"
 	source "package/libsvg/Config.in"
 	source "package/libsvg-cairo/Config.in"
 	source "package/libsvgtiny/Config.in"
diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
new file mode 100644
index 0000000..43e81f2
--- /dev/null
+++ b/package/libsoil/0001-fix-makefile.patch
@@ -0,0 +1,35 @@
+Various makefile fixes to allow cross compilation
+
+Partly ported from
+http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking_correctly.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr "b/Simple OpenGL Image Library/projects/makefile/alternate Makefile.txt" "a/Simple OpenGL Image Library/projects/makefile/alternate Makefile.txt"
+--- "b/Simple OpenGL Image Library/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
++++ "a/Simple OpenGL Image Library/projects/makefile/alternate Makefile.txt"	2015-10-05 20:35:59.264517571 +0200
+@@ -1,8 +1,8 @@
+ MAKE = make
+-CC = gcc
+-INSTALL_FILE = install -p -o root -g root -m 644
+-INSTALL_DIR = install -p -o root -g root -d
+-LN = ln -s
++CC = $(GCC)
++INSTALL_FILE = $(INSTALL) -m 644
++INSTALL_DIR = $(INSTALL) -d
++LN = ln -sf
+ RM = rm -fv
+ CFLAGS += -c -O2 -Wall
+ LDFLAGS +=
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
index 0000000..aea0cc3
--- /dev/null
+++ b/package/libsoil/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBSOIL
+	bool "libsoil"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS
+	help
+	  SOIL is a tiny C library used primarily for uploading
+	  textures into OpenGL.
+
+	  http://www.lonesock.net/soil.html
+
+comment "libsoil needs an OpenGL backend and a toolchain w/ dynamic library"
+	depends on !BR2_PACKAGE_HAS_LIBGL || BR2_STATIC_LIBS
diff --git a/package/libsoil/libsoil.hash b/package/libsoil/libsoil.hash
new file mode 100644
index 0000000..175569b
--- /dev/null
+++ b/package/libsoil/libsoil.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701	soil.zip
diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
new file mode 100644
index 0000000..0ed8723
--- /dev/null
+++ b/package/libsoil/libsoil.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# libsoil
+#
+################################################################################
+
+LIBSOIL_VERSION = 20080707
+LIBSOIL_SOURCE = soil.zip
+LIBSOIL_SITE = http://www.lonesock.net/files
+LIBSOIL_INSTALL_STAGING = YES
+LIBSOIL_DEPENDENCIES = libgl
+LIBSOIL_LICENSE = Public Domain, MIT
+LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
+
+LIBSOIL_CFLAGS = "$(TARGET_CFLAGS) -c -fPIC"
+
+define LIBSOIL_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBSOIL_SOURCE)
+endef
+
+define LIBSOIL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS=$(LIBSOIL_CFLAGS) \
+		-f ../projects/makefile/alternate\ Makefile.txt \
+		-C $(@D)/Simple\ OpenGL\ Image\ Library/src
+endef
+
+define LIBSOIL_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-f ../projects/makefile/alternate\ Makefile.txt \
+		DESTDIR=$(STAGING_DIR) install \
+		INSTALL=$(INSTALL) \
+		-C $(@D)/Simple\ OpenGL\ Image\ Library/src
+endef
+
+define LIBSOIL_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-f ../projects/makefile/alternate\ Makefile.txt \
+		DESTDIR=$(TARGET_DIR) install \
+		INSTALL=$(INSTALL) \
+		-C $(@D)/Simple\ OpenGL\ Image\ Library/src
+endef
+
+$(eval $(generic-package))
-- 
2.6.1
