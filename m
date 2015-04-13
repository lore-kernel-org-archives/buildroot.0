From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:35:27 +0200
Subject: [Buildroot] [git commit] libfreeimage: new package
Message-ID: <20150413203652.158F07FA6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbb5177a184e7a5dd103d6a913da00051ec4a663
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeImage is an Open Source library project for developers who would like to
support popular graphics image formats like PNG, BMP, JPEG, TIFF and others as
needed by today's multimedia applications.

See: http://freeimage.sourceforge.net

[Thomas:
  - add hash file
  - add dependency on !BR2_STATIC_LIBS, since the build system of
    libfreeimage always tries to build a shared library.]

Signed-off-by: R??mi R??rolle <remi.rerolle@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                               |    1 +
 package/libfreeimage/0001-no-root-install.patch |   20 ++++++++++++++
 package/libfreeimage/Config.in                  |   13 +++++++++
 package/libfreeimage/libfreeimage.hash          |    2 +
 package/libfreeimage/libfreeimage.mk            |   33 +++++++++++++++++++++++
 5 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 248e18b..34b6017 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -743,6 +743,7 @@ menu "Graphics"
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
+Signed-off-by: R??mi R??rolle <remi.rerolle@gmail.com>
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
index 0000000..546593b
--- /dev/null
+++ b/package/libfreeimage/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBFREEIMAGE
+	bool "libfreeimage"
+	depends on !BR2_STATIC_LIBS
+	help
+	  FreeImage is an Open Source library project for developers who
+	  would like to support popular graphics image formats like PNG,
+	  BMP, JPEG, TIFF and others as needed by today's multimedia
+	  applications.
+
+	  http://freeimage.sourceforge.net
+
+comment "libfreeimage needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libfreeimage/libfreeimage.hash b/package/libfreeimage/libfreeimage.hash
new file mode 100644
index 0000000..4e69508
--- /dev/null
+++ b/package/libfreeimage/libfreeimage.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 fbfc65e39b3d4e2cb108c4ffa8c41fd02c07d4d436c594fff8dab1a6d5297f89 FreeImage3170.zip
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
