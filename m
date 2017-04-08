From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Apr 2017 17:18:03 +0200
Subject: [Buildroot] [PATCH 2/3] package/pngquant: new package
In-Reply-To: <20170408151804.11102-1-bernd.kuhls@t-online.de>
References: <20170408151804.11102-1-bernd.kuhls@t-online.de>
Message-ID: <20170408151804.11102-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host package will be needed by tvheadend.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pngquant/Config.in     |  9 +++++++
 package/pngquant/pngquant.hash |  4 ++++
 package/pngquant/pngquant.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 package/pngquant/Config.in
 create mode 100644 package/pngquant/pngquant.hash
 create mode 100644 package/pngquant/pngquant.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c00417ce6..8067c316a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -251,6 +251,7 @@ F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
 F:	package/pixman/
+F:	package/pngquant/
 F:	package/pound/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
diff --git a/package/Config.in b/package/Config.in
index 7641fc9de..35305d798 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,6 +246,7 @@ comment "Graphic applications"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
+	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/tesseract-ocr/Config.in"
diff --git a/package/pngquant/Config.in b/package/pngquant/Config.in
new file mode 100644
index 000000000..c63f0f9d0
--- /dev/null
+++ b/package/pngquant/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PNGQUANT
+	bool "pngquant"
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	help
+	  Lossy PNG compressor ? pngquant command and libimagequant
+	  library
+
+	  https://pngquant.org
diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
new file mode 100644
index 000000000..c9f449eb4
--- /dev/null
+++ b/package/pngquant/pngquant.hash
@@ -0,0 +1,4 @@
+# From https://pngquant.org/releases.html
+sha1 08ed436e21429d4983bee0fe069681c458f95209  pngquant-2.9.1-src.tar.gz
+# Locally computed
+sha256 ac2138207ef40acd4e5fdae18798139a9d75dae4f1d0837aea918a2a8c433481  pngquant-2.9.1-src.tar.gz
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
new file mode 100644
index 000000000..ae681d68d
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
+define HOST_PNGQUANT_CONFIGURE_CMDS
+	(cd $(@D) && \
+		$(HOST_CONFIGURE_OPTS) \
+		./configure --prefix=/usr \
+		--without-lcms2 \
+	)
+endef
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
+define HOST_PNGQUANT_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define PNGQUANT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_PNGQUANT_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)/usr" -C $(@D) install
+endef
+
+define PNGQUANT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.11.0
