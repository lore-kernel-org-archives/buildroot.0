From: =?UTF-8?q?R=C3=A9mi=20R=C3=A9rolle?= <remi.rerolle@gmail.com>
Date: Mon, 13 Apr 2015 11:16:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] libfreeimage: new package
Message-ID: <1428916598-16537-1-git-send-email-remi.rerolle@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FreeImage is an Open Source library project for developers who would like to
support popular graphics image formats like PNG, BMP, JPEG, TIFF and others as
needed by today's multimedia applications.

See: http://freeimage.sourceforge.net

Signed-off-by: R?mi R?rolle <remi.rerolle@gmail.com>
---
v2:
  - Add description and Signed-off-by statement to the upstream patch
  - Fix description formatting in Config.in, add link to upstream site
  - Fix licensing and cleanup Makefile, no more subdir, simpler rules
---
 package/Config.in                               |  1 +
 package/libfreeimage/0001-no-root-install.patch | 20 +++++++++++++++
 package/libfreeimage/Config.in                  |  9 +++++++
 package/libfreeimage/libfreeimage.mk            | 33 +++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/libfreeimage/0001-no-root-install.patch
 create mode 100644 package/libfreeimage/Config.in
 create mode 100644 package/libfreeimage/libfreeimage.mk

diff --git a/package/Config.in b/package/Config.in
index de8e856..acfc5b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -741,6 +741,7 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
diff --git a/package/libfreeimage/0001-no-root-install.patch b/package/libfreeimage/0001-no-root-install.patch
new file mode 100644
index 0000000..54756d8
--- /dev/null
+++ b/package/libfreeimage/0001-no-root-install.patch
@@ -0,0 +1,20 @@
+Makefile.gnu: allow non-root install by not enforcing root ownserhip
+
+Signed-off-by: R?mi R?rolle <remi.rerolle@gmail.com>
+
+diff -ruN a/Makefile.gnu b/Makefile.gnu
+--- a/Makefile.gnu	2015-04-09 16:34:02.315316841 +0200
++++ b/Makefile.gnu	2015-04-09 16:34:28.875483201 +0200
+@@ -71,9 +71,9 @@
+ 
+ install:
+ 	install -d $(INCDIR) $(INSTALLDIR)
+-	install -m 644 -o root -g root $(HEADER) $(INCDIR)
+-	install -m 644 -o root -g root $(STATICLIB) $(INSTALLDIR)
+-	install -m 755 -o root -g root $(SHAREDLIB) $(INSTALLDIR)
++	install -m 644 $(HEADER) $(INCDIR)
++	install -m 644 $(STATICLIB) $(INSTALLDIR)
++	install -m 755 $(SHAREDLIB) $(INSTALLDIR)
+ 	ln -sf $(SHAREDLIB) $(INSTALLDIR)/$(VERLIBNAME)
+ 	ln -sf $(VERLIBNAME) $(INSTALLDIR)/$(LIBNAME)	
+ #	ldconfig
diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
new file mode 100644
index 0000000..148e5ae
--- /dev/null
+++ b/package/libfreeimage/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBFREEIMAGE
+	bool "libfreeimage"
+	help
+	  FreeImage is an Open Source library project for developers who
+	  would like to support popular graphics image formats like PNG,
+	  BMP, JPEG, TIFF and others as needed by today's multimedia
+	  applications.
+
+	  http://freeimage.sourceforge.net
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
new file mode 100644
index 0000000..2849e94
--- /dev/null
+++ b/package/libfreeimage/libfreeimage.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libfreeimage
+#
+################################################################################
+
+LIBFREEIMAGE_VERSION = 3.17.0
+LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
+LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
+LIBFREEIMAGE_LICENSE = GPLv2 or GPLv3 or FreeImage Public License
+LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
+LIBFREEIMAGE_INSTALL_STAGING = YES
+
+define LIBFREEIMAGE_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(LIBFREEIMAGE_SOURCE) -d $(@D)
+	mv $(@D)/FreeImage/* $(@D)
+	rmdir $(@D)/FreeImage
+endef
+
+define LIBFREEIMAGE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define LIBFREEIMAGE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBFREEIMAGE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
+
-- 
2.1.0
