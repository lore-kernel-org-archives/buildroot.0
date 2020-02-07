From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 10:37:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/mupdf: new package.
In-Reply-To: <20200207093705.32687-1-raphael.melotte@essensium.com>
References: <20200207093705.32687-1-raphael.melotte@essensium.com>
Message-ID: <20200207093705.32687-2-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MuPDF is a lightweight PDF, XPS, and E-book viewer.

Note: some packages, like PyMuPDF, depend on mupdf's libraries, hence
the patch.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>
Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-Makefile-add-an-install_libs-target.patch | 41 ++++++++++++
 package/mupdf/Config.in                       | 15 +++++
 package/mupdf/mupdf.hash                      |  8 +++
 package/mupdf/mupdf.mk                        | 62 +++++++++++++++++++
 6 files changed, 128 insertions(+)
 create mode 100644 package/mupdf/0001-Makefile-add-an-install_libs-target.patch
 create mode 100644 package/mupdf/Config.in
 create mode 100644 package/mupdf/mupdf.hash
 create mode 100644 package/mupdf/mupdf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5f1e37a063..9c527c3625 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1930,6 +1930,7 @@ F:	package/paho-mqtt-cpp/
 
 N:	Rapha?l M?lotte <raphael.melotte@essensium.com>
 F:	package/jbig2dec/
+F:	package/mupdf/
 
 N:	R?mi R?rolle <remi.rerolle@gmail.com>
 F:	package/libfreeimage/
diff --git a/package/Config.in b/package/Config.in
index b2f315ae69..df29673221 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -351,6 +351,7 @@ comment "X applications"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/midori/Config.in"
+	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
 	source "package/qt-webkit-kiosk/Config.in"
diff --git a/package/mupdf/0001-Makefile-add-an-install_libs-target.patch b/package/mupdf/0001-Makefile-add-an-install_libs-target.patch
new file mode 100644
index 0000000000..9cb5a2fec9
--- /dev/null
+++ b/package/mupdf/0001-Makefile-add-an-install_libs-target.patch
@@ -0,0 +1,41 @@
+From 0989f13ecbc2155b05da0cb091801d32d750d2d4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?=
+ <raphael.melotte@essensium.com>
+Date: Thu, 29 Aug 2019 09:51:02 +0200
+Subject: [PATCH] Makefile: add an install_libs target.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows to install only the library files (if you need pymupdf but
+not mupdf binaries for example).
+
+Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c5bc541ac..e14f88526 100644
+--- a/Makefile
++++ b/Makefile
+@@ -322,7 +322,7 @@ libs: $(INSTALL_LIBS)
+ tools: $(TOOL_APPS)
+ apps: $(TOOL_APPS) $(VIEW_APPS)
+ 
+-install: libs apps
++install_libs:
+ 	install -d $(DESTDIR)$(incdir)/mupdf
+ 	install -d $(DESTDIR)$(incdir)/mupdf/fitz
+ 	install -d $(DESTDIR)$(incdir)/mupdf/pdf
+@@ -333,6 +333,7 @@ install: libs apps
+ 	install -d $(DESTDIR)$(libdir)
+ 	install -m 644 $(INSTALL_LIBS) $(DESTDIR)$(libdir)
+ 
++install: libs apps install_libs
+ 	install -d $(DESTDIR)$(bindir)
+ 	install -m 755 $(TOOL_APPS) $(VIEW_APPS) $(DESTDIR)$(bindir)
+ 
+-- 
+2.21.0
+
diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
new file mode 100644
index 0000000000..d66cd0edd4
--- /dev/null
+++ b/package/mupdf/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MUPDF
+	bool "mupdf"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_JBIG2DEC
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_OPENJPEG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_ZLIB
+	help
+	  MuPDF is a lightweight PDF, XPS, and E-book viewer.
+
+	  https://www.mupdf.com/index.html
diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
new file mode 100644
index 0000000000..27ae860cdd
--- /dev/null
+++ b/package/mupdf/mupdf.hash
@@ -0,0 +1,8 @@
+# From https://mupdf.com/downloads/index.html:
+sha1 18f069b7cc125e53f541163ac305c588c94dea97 mupdf-1.14.0-source.tar.gz
+
+# Locally computed:
+sha256 64d537895641b711737cc58fe762481b07ea71d1506e8bd8a13434e093b0068d  mupdf-1.16.0-source.tar.gz
+
+# Hash for license files:
+sha256 57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
new file mode 100644
index 0000000000..27cc9e5ed9
--- /dev/null
+++ b/package/mupdf/mupdf.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# mudpf
+#
+################################################################################
+
+MUPDF_VERSION = 1.16.0
+MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.gz
+MUPDF_SITE = https://mupdf.com/downloads/archive
+MUPDF_LICENSE = AGPL-3.0+
+MUPDF_LICENSE_FILES = COPYING
+MUPDF_INSTALL_STAGING = YES
+MUPDF_DEPENDENCIES = \
+	freetype \
+	harfbuzz \
+	host-pkgconf \
+	jbig2dec jpeg \
+	lcms2 openjpeg \
+	xlib_libX11 \
+	zlib
+
+MUPDF_PKG_CONFIG_PACKAGES = \
+	freetype2 \
+	harfbuzz \
+	libjpeg \
+	zlib
+
+MUPDF_CFLAGS = $(TARGET_CFLAGS)\
+	`$(PKG_CONFIG_HOST_BINARY) --cflags $(MUPDF_PKG_CONFIG_PACKAGES)`\
+	-fPIC # -fPIC is needed because the Makefile doesn't append it.
+
+MUPDF_LDFLAGS = $(TARGET_LDFLAGS)\
+	`$(PKG_CONFIG_HOST_BINARY) --libs $(MUPDF_PKG_CONFIG_PACKAGES)`
+
+# mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
+# with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
+MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	XCFLAGS="$(MUPDF_CFLAGS)" \
+	XLIBS="$(MUPDF_LDFLAGS)" \
+	USE_SYSTEM_LIBS=yes
+
+# Modern versions of mupdf depend on OpenGL,
+# we disable it because it may not be available:
+define MUPDF_DISABLE_OPENGL
+	sed -i 's/HAVE_GLUT := yes/HAVE_GLUT := no/g' $(@D)/Makerules
+endef
+
+MUPDF_POST_EXTRACT_HOOKS = MUPDF_DISABLE_OPENGL
+
+define MUPDF_BUILD_CMDS
+	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define MUPDF_INSTALL_STAGING_CMDS
+	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" prefix="/usr" install_libs
+endef
+
+define MUPDF_INSTALL_TARGET_CMDS
+	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" prefix="/usr" install
+endef
+
+$(eval $(generic-package))
-- 
2.23.0
