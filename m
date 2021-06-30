From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu,  1 Jul 2021 01:47:15 +0200
Subject: [Buildroot] [PATCH 3/4] package/mupdf: bump to version 1.18.0
In-Reply-To: <20210630234717.21742-1-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
Message-ID: <20210630234717.21742-3-raphael.melotte@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It turns out the patch version of python-pymupdf doesn't have to match
mupdf's version (i.e. python-pymupdf 1.18.14 is compatible with mupdf
1.18.*) so remove the word "exactly" from the comment.

mupdf now has a new dependency: gumbo-parser.

gumbo-parser is included when downloading the sources for mupdf, but
instead we use the version provided by Buildroot.

While at it, take the chance to (based on previous review comments):

- Fix indentation in the hash file (two spaces).
- Switch to using the ".xz" archive.
- Add a conditional on freeglut.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>
---
 package/mupdf/Config.in  |  1 +
 package/mupdf/mupdf.hash |  6 +++---
 package/mupdf/mupdf.mk   | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index dc296b3e8a..f796965751 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_OPENJPEG
+	select BR2_PACKAGE_GUMBO_PARSER
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index ec4893046d..934836e76a 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1 18f069b7cc125e53f541163ac305c588c94dea97 mupdf-1.16.0-source.tar.gz
+sha1  fc17bd01d5860e49b009f28a5ddb629e94af4510  mupdf-1.18.0-source.tar.xz
 
 # Locally computed:
-sha256 64d537895641b711737cc58fe762481b07ea71d1506e8bd8a13434e093b0068d  mupdf-1.16.0-source.tar.gz
+sha256 592d4f6c0fba41bb954eb1a41616661b62b134d5b383e33bd45a081af5d4a59a  mupdf-1.18.0-source.tar.xz
 
 # Hash for license files:
-sha256 57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
+sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 78dacd214c..9884b510c3 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# python-pymupdf's version must match exactly mupdf's version
-MUPDF_VERSION = 1.16.0
-MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.gz
+# python-pymupdf's version must match mupdf's version
+MUPDF_VERSION = 1.18.0
+MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.xz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
 MUPDF_LICENSE_FILES = COPYING
@@ -14,6 +14,7 @@ MUPDF_CPE_ID_VENDOR = artifex
 MUPDF_INSTALL_STAGING = YES
 MUPDF_DEPENDENCIES = \
 	freetype \
+	gumbo-parser \
 	harfbuzz \
 	host-pkgconf \
 	jbig2dec jpeg \
@@ -21,8 +22,10 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
+# The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
+	gumbo \
 	harfbuzz \
 	libjpeg \
 	zlib
@@ -43,13 +46,17 @@ MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	XLIBS="$(MUPDF_LDFLAGS)" \
 	USE_SYSTEM_LIBS=yes
 
-# Modern versions of mupdf depend on OpenGL,
-# we disable it because it may not be available:
+ifneq ($(BR2_PACKAGE_FREEGLUT),y)
+# Modern versions of mupdf depend on OpenGL.
+# We disable it unless FREEGLUT is selected:
 define MUPDF_DISABLE_OPENGL
 	sed -i 's/HAVE_GLUT := yes/HAVE_GLUT := no/g' $(@D)/Makerules
 endef
 
 MUPDF_POST_PATCH_HOOKS = MUPDF_DISABLE_OPENGL
+else
+MUPDF_DEPENDENCIES += libfreeglut
+endif
 
 define MUPDF_BUILD_CMDS
 	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) all
-- 
2.31.1
