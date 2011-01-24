From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:38 +0100
Subject: [Buildroot] [PATCH 10/10] python-mad: new package
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4202ec9552c58af1c5ba12aac109b6c563ac6ef0.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-mad is a Python binding for the MAD library, a high-quality
integer-only MPEG decoder.

This package has been introduced as a test to make sure that
third-party Python modules that rely on a C extension can properly be
built against the Python infrastructure of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/python-mad/Config.in     |    7 ++++
 package/multimedia/python-mad/python-mad.mk |   41 +++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/python-mad/Config.in
 create mode 100644 package/multimedia/python-mad/python-mad.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index da50dbb..ae685cf 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -25,6 +25,7 @@ source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
+source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
 source "package/multimedia/festival/Config.in"
diff --git a/package/multimedia/python-mad/Config.in b/package/multimedia/python-mad/Config.in
new file mode 100644
index 0000000..d25f2b8
--- /dev/null
+++ b/package/multimedia/python-mad/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MAD
+	bool "python-mad"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LIBMAD
+	help
+	  python-mad is a Python binding for the MAD library, a
+	  high-quality integer-only MPEG decoder.
\ No newline at end of file
diff --git a/package/multimedia/python-mad/python-mad.mk b/package/multimedia/python-mad/python-mad.mk
new file mode 100644
index 0000000..52d13a6
--- /dev/null
+++ b/package/multimedia/python-mad/python-mad.mk
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
+$(eval $(call GENTARGETS,package,python-mad))
-- 
1.7.0.4
