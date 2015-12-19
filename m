From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:46:55 +0100
Subject: [Buildroot] [git commit] package/libsoil: new package
Message-ID: <20151219134751.19E2F81DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e7eb1f25261bbe389d4d1f52ae806b77d14e7d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for these new Kodi addons:

kodi-screensaver-asterwave
kodi-screensaver-cpblobs
kodi-screensaver-matrixtrails
kodi-screensaver-planestate
kodi-visualisation-fountain

[Thomas:
 - don't pass LIBSOIL_CFLAGS since this variable no longer exists.
 - pass TARGET_CONFIGURE_OPTS on the right hand side of make for the
   install steps, like was done for the build step.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                       |  1 +
 package/libsoil/0001-fix-makefile.patch | 40 +++++++++++++++++++++++++++++++++
 package/libsoil/Config.in               | 12 ++++++++++
 package/libsoil/libsoil.hash            |  2 ++
 package/libsoil/libsoil.mk              | 40 +++++++++++++++++++++++++++++++++
 5 files changed, 95 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a0f44fb..bd07878 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -858,6 +858,7 @@ menu "Graphics"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
+	source "package/libsoil/Config.in"
 	source "package/libsvg/Config.in"
 	source "package/libsvg-cairo/Config.in"
 	source "package/libsvgtiny/Config.in"
diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
new file mode 100644
index 0000000..3b80048
--- /dev/null
+++ b/package/libsoil/0001-fix-makefile.patch
@@ -0,0 +1,40 @@
+Various makefile fixes to allow cross compilation
+
+Partly ported from
+http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking_correctly.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr "soil.org/projects/makefile/alternate Makefile.txt" "soil/projects/makefile/alternate Makefile.txt"
+--- "soil.org/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
++++ "soil/projects/makefile/alternate Makefile.txt"	2015-11-07 11:15:04.140106336 +0100
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
+@@ -23,13 +23,13 @@
+ all: $(OFILES) lib
+ 
+ %.o: %.c
+-	$(CC) $(CFLAGS) $< -o $@
++	$(CC) $(CFLAGS) -c -fPIC $< -o $@
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
index 0000000..eb8c2ce
--- /dev/null
+++ b/package/libsoil/libsoil.mk
@@ -0,0 +1,40 @@
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
+LIBSOIL_MAKEFILE = "../projects/makefile/alternate Makefile.txt"
+
+define LIBSOIL_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBSOIL_SOURCE)
+	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
+endef
+
+define LIBSOIL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
+		-C $(@D)/src
+endef
+
+define LIBSOIL_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
+		DESTDIR=$(STAGING_DIR) install \
+		INSTALL=$(INSTALL) \
+		-C $(@D)/src
+endef
+
+define LIBSOIL_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
+		DESTDIR=$(TARGET_DIR) install \
+		INSTALL=$(INSTALL) \
+		-C $(@D)/src
+endef
+
+$(eval $(generic-package))
