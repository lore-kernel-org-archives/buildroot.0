From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:28:20 +0200
Subject: [Buildroot] [git commit] package/gcr: bump to version 3.40.0
Message-ID: <20210716205443.1F64B9119D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a7ee98cec7b94a8200e7a3a83119f457ce4b5a68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Update indention in hash file (two spaces)

https://gitlab.gnome.org/GNOME/gcr/-/blob/3.40.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcr/gcr.hash |  6 +++---
 package/gcr/gcr.mk   | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index 7d5786db9e..e6074a9991 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,3 +1,3 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.34/gcr-3.34.0.sha256sum
-sha256	29df50974a90987af694c0fb8926a6b366e68cacd8abd813817cfe1eb5d54524	gcr-3.34.0.tar.xz
-sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING
+# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.40/gcr-3.40.0.sha256sum
+sha256  b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5  gcr-3.40.0.tar.xz
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 7f71614bca..d51e853f3f 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.34
+GCR_VERSION_MAJOR = 3.40
 GCR_VERSION = $(GCR_VERSION_MAJOR).0
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
@@ -15,27 +15,27 @@ GCR_DEPENDENCIES = \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
-GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
 GCR_CONF_OPTS = \
-	--disable-gtk-doc \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+	-Dgpg_path=/usr/bin/gpg2 \
+	-Dgtk_doc=false
 # Even though COPYING is v2 the code states v2.1+
 GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
+GCR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GCR_DEPENDENCIES += gobject-introspection host-libxslt
-GCR_CONF_OPTS += --enable-introspection
+GCR_DEPENDENCIES += gobject-introspection host-libxslt host-vala
+GCR_CONF_OPTS += -Dintrospection=true
 else
-GCR_CONF_OPTS += --disable-introspection
+GCR_CONF_OPTS += -Dintrospection=false
 endif
 
 # Only the X11 backend is supported for the simple GUI
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 GCR_DEPENDENCIES += libgtk3
-GCR_CONF_OPTS += --with-gtk
+GCR_CONF_OPTS += -Dgtk=true
 else
-GCR_CONF_OPTS += --without-gtk
+GCR_CONF_OPTS += -Dgtk=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
