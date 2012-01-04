From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  4 Jan 2012 12:30:00 +0100
Subject: [Buildroot] [PATCH v5 1/6] Python: add external modules option
In-Reply-To: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1325676605-31194-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

all external python packages/libraries should reside in
"external python modules" section.

Move existing modules python-serial and python-mad there

Move python-mad from package/multimedia to package

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                           |    7 ++++-
 package/multimedia/Config.in                |    1 -
 package/multimedia/python-mad/Config.in     |    9 ------
 package/multimedia/python-mad/python-mad.mk |   41 ---------------------------
 package/python-mad/Config.in                |    9 ++++++
 package/python-mad/python-mad.mk            |   41 +++++++++++++++++++++++++++
 6 files changed, 56 insertions(+), 52 deletions(-)
 delete mode 100644 package/multimedia/python-mad/Config.in
 delete mode 100644 package/multimedia/python-mad/python-mad.mk
 create mode 100644 package/python-mad/Config.in
 create mode 100644 package/python-mad/python-mad.mk

diff --git a/package/Config.in b/package/Config.in
index eb93b1c..6ab893f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -236,6 +236,12 @@ endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
+if BR2_PACKAGE_PYTHON
+menu "external python modules"
+source "package/python-mad/Config.in"
+source "package/python-serial/Config.in"
+endmenu
+endif
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 endmenu
@@ -312,7 +318,6 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
-source "package/python-serial/Config.in"
 endmenu
 
 if BROKEN
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index d50e4fc..a05d1d9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -40,7 +40,6 @@ source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
 source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
-source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/taglib/Config.in"
diff --git a/package/multimedia/python-mad/Config.in b/package/multimedia/python-mad/Config.in
deleted file mode 100644
index 2535421..0000000
--- a/package/multimedia/python-mad/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_MAD
-	bool "python-mad"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_LIBMAD
-	help
-	  python-mad is a Python binding for the MAD library, a
-	  high-quality integer-only MPEG decoder.
-
-	  http://spacepants.org/src/pymad/
diff --git a/package/multimedia/python-mad/python-mad.mk b/package/multimedia/python-mad/python-mad.mk
deleted file mode 100644
index 7d898ed..0000000
--- a/package/multimedia/python-mad/python-mad.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-#############################################################
-#
-# python-mad
-#
-#############################################################
-
-PYTHON_MAD_VERSION = 0.6
-PYTHON_MAD_SOURCE  = pymad-$(PYTHON_MAD_VERSION).tar.gz
-PYTHON_MAD_SITE    = http://spacepants.org/src/pymad/download/
-
-PYTHON_MAD_DEPENDENCIES = python libmad
-
-ifeq ($(BR2_ENDIAN),"LITTLE")
-PYTHON_MAD_ENDIAN=little
-else
-PYTHON_MAD_ENDIAN=big
-endif
-
-define PYTHON_MAD_CONFIGURE_CMDS
-	echo "endian = $(PYTHON_MAD_ENDIAN)" > $(@D)/Setup
-	echo "mad_libs = mad" >> $(@D)/Setup
-	echo "mad_lib_dir = $(STAGING_DIR)/usr/lib" >> $(@D)/Setup
-	echo "mad_include_dir = $(STAGING_DIR)/usr/include" >> $(@D)/Setup
-endef
-
-define PYTHON_MAD_BUILD_CMDS
-	(cd $(@D); \
-		CC="$(TARGET_CC)"		\
-		CFLAGS="$(TARGET_CFLAGS)" 	\
-		LDSHARED="$(TARGET_CC) -shared" \
-		LDFLAGS="$(TARGET_LDFLAGS)" 	\
-	$(HOST_DIR)/usr/bin/python setup.py build_ext \
-	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_MAD_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(call GENTARGETS))
diff --git a/package/python-mad/Config.in b/package/python-mad/Config.in
new file mode 100644
index 0000000..2535421
--- /dev/null
+++ b/package/python-mad/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_MAD
+	bool "python-mad"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LIBMAD
+	help
+	  python-mad is a Python binding for the MAD library, a
+	  high-quality integer-only MPEG decoder.
+
+	  http://spacepants.org/src/pymad/
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
new file mode 100644
index 0000000..7d898ed
--- /dev/null
+++ b/package/python-mad/python-mad.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# python-mad
+#
+#############################################################
+
+PYTHON_MAD_VERSION = 0.6
+PYTHON_MAD_SOURCE  = pymad-$(PYTHON_MAD_VERSION).tar.gz
+PYTHON_MAD_SITE    = http://spacepants.org/src/pymad/download/
+
+PYTHON_MAD_DEPENDENCIES = python libmad
+
+ifeq ($(BR2_ENDIAN),"LITTLE")
+PYTHON_MAD_ENDIAN=little
+else
+PYTHON_MAD_ENDIAN=big
+endif
+
+define PYTHON_MAD_CONFIGURE_CMDS
+	echo "endian = $(PYTHON_MAD_ENDIAN)" > $(@D)/Setup
+	echo "mad_libs = mad" >> $(@D)/Setup
+	echo "mad_lib_dir = $(STAGING_DIR)/usr/lib" >> $(@D)/Setup
+	echo "mad_include_dir = $(STAGING_DIR)/usr/include" >> $(@D)/Setup
+endef
+
+define PYTHON_MAD_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)"		\
+		CFLAGS="$(TARGET_CFLAGS)" 	\
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS)" 	\
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_MAD_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.1.1
