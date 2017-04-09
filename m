From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 16:02:49 +0200
Subject: [Buildroot] [git commit] package/pngquant: new package
Message-ID: <20170409140413.D60C882561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f070403948d7f94db731b1e4d43be60edbeb25b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host package will be needed by tvheadend.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - group the host commands together and the target commands together
 - use --prefix=$(HOST_DIR)/usr for host configuration, and do not
   override PREFIX= at host install time
 - use DESTDIR=$(TARGET_DIR) instead of overriding PREFIX= at target
   install time.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pngquant/Config.in     |  9 +++++++
 package/pngquant/pngquant.hash |  4 ++++
 package/pngquant/pngquant.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 81c6be1..a298669 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -250,6 +250,7 @@ F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
 F:	package/pixman/
+F:	package/pngquant/
 F:	package/pound/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
diff --git a/package/Config.in b/package/Config.in
index 9d6a54e..c12e5b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,6 +245,7 @@ comment "Graphic applications"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
 	source "package/mesa3d-demos/Config.in"
+	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/tesseract-ocr/Config.in"
diff --git a/package/pngquant/Config.in b/package/pngquant/Config.in
new file mode 100644
index 0000000..c63f0f9
--- /dev/null
+++ b/package/pngquant/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PNGQUANT
+	bool "pngquant"
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	help
+	  Lossy PNG compressor ??? pngquant command and libimagequant
+	  library
+
+	  https://pngquant.org
diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
new file mode 100644
index 0000000..c9f449e
--- /dev/null
+++ b/package/pngquant/pngquant.hash
@@ -0,0 +1,4 @@
+# From https://pngquant.org/releases.html
+sha1 08ed436e21429d4983bee0fe069681c458f95209  pngquant-2.9.1-src.tar.gz
+# Locally computed
+sha256 ac2138207ef40acd4e5fdae18798139a9d75dae4f1d0837aea918a2a8c433481  pngquant-2.9.1-src.tar.gz
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
new file mode 100644
index 0000000..4a6f32f
--- /dev/null
+++ b/package/pngquant/pngquant.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# pngquant
+#
+################################################################################
+
+PNGQUANT_VERSION = 2.9.1
+PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
+PNGQUANT_SITE = https://pngquant.org
+PNGQUANT_LICENSE = GPL-3.0+
+PNGQUANT_LICENSE_FILES = COPYRIGHT
+HOST_PNGQUANT_DEPENDENCIES = host-libpng
+PNGQUANT_DEPENDENCIES = libpng
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+PNGQUANT_DEPENDENCIES += lcms2
+endif
+
+define PNGQUANT_CONFIGURE_CMDS
+	(cd $(@D) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure --prefix=/usr \
+		$(if $(BR2_PACKAGE_LCMS2),--with-lcms2,--without-lcms2) \
+		$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
+	)
+endef
+
+define PNGQUANT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define PNGQUANT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+define HOST_PNGQUANT_CONFIGURE_CMDS
+	(cd $(@D) && \
+		$(HOST_CONFIGURE_OPTS) \
+		./configure --prefix=$(HOST_DIR)/usr \
+		--without-lcms2 \
+	)
+endef
+
+define HOST_PNGQUANT_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_PNGQUANT_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
+$(eval $(generic-package))
