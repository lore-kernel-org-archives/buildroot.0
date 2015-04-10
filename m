From: =?UTF-8?q?R=C3=A9mi=20R=C3=A9rolle?= <remi.rerolle@gmail.com>
Date: Fri, 10 Apr 2015 09:49:55 +0200
Subject: [Buildroot] [PATCH 1/1] libfreeimage: new package
Message-ID: <1428652195-7775-1-git-send-email-remi.rerolle@gmail.com>
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
 package/Config.in                               |  1 +
 package/libfreeimage/0001-no-root-install.patch | 16 +++++++++++
 package/libfreeimage/Config.in                  |  7 +++++
 package/libfreeimage/libfreeimage.mk            | 37 +++++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/libfreeimage/0001-no-root-install.patch
 create mode 100644 package/libfreeimage/Config.in
 create mode 100644 package/libfreeimage/libfreeimage.mk

diff --git a/package/Config.in b/package/Config.in
index 262a7fb..2d3cd46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
diff --git a/package/libfreeimage/0001-no-root-install.patch b/package/libfreeimage/0001-no-root-install.patch
new file mode 100644
index 0000000..5c3ee71
--- /dev/null
+++ b/package/libfreeimage/0001-no-root-install.patch
@@ -0,0 +1,16 @@
+diff -ruN a/FreeImage/Makefile.gnu b/FreeImage/Makefile.gnu
+--- a/FreeImage/Makefile.gnu	2015-04-09 16:34:02.315316841 +0200
++++ b/FreeImage/Makefile.gnu	2015-04-09 16:34:28.875483201 +0200
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
index 0000000..82ad4e2
--- /dev/null
+++ b/package/libfreeimage/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBFREEIMAGE
+	bool "libfreeimage"
+	help
+          FreeImage is an Open Source library project for developers who would
+          like to support popular graphics image formats like PNG, BMP, JPEG,
+          TIFF and others as needed by today's multimedia applications.
+
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
new file mode 100644
index 0000000..dfaa1a5
--- /dev/null
+++ b/package/libfreeimage/libfreeimage.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# libfreeimage
+#
+################################################################################
+
+LIBFREEIMAGE_VERSION = 3.17.0
+LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
+LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
+LIBFREEIMAGE_LICENSE = GPLv2+
+LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt
+LIBFREEIMAGE_INSTALL_STAGING = YES
+
+define LIBFREEIMAGE_EXTRACT_CMDS
+	$(UNZIP) -d $(BUILD_DIR)/libfreeimage-$(LIBFREEIMAGE_VERSION) \
+		$(DL_DIR)/$(LIBFREEIMAGE_SOURCE)
+endef
+
+
+define LIBFREEIMAGE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/FreeImage \
+		-j$(PARALLEL_JOBS) \
+		CC="$(TARGET_CC)" \
+		CXX="$(TARGET_CXX)"
+endef
+
+define LIBFREEIMAGE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/FreeImage DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBFREEIMAGE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
+		$(STAGING_DIR)/usr/lib/libfreeimage*.so*
+endef
+
+$(eval $(generic-package))
+
-- 
2.1.0
