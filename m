From: Dagg <daggs@gmx.com>
Date: Wed,  1 Jun 2016 13:27:18 +0300
Subject: [Buildroot] [PATCH 1/3] libamcodec: new Package
Message-ID: <20160601102720.3929-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg <daggs@gmx.com>
---
 package/Config.in                |  1 +
 package/libamcodec/Config.in     |  5 +++++
 package/libamcodec/libamcodec.mk | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/libamcodec/Config.in
 create mode 100644 package/libamcodec/libamcodec.mk

diff --git a/package/Config.in b/package/Config.in
index 6c6a562..0a56070 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
new file mode 100644
index 0000000..bb2d924
--- /dev/null
+++ b/package/libamcodec/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBAMCODEC
+	bool "libamcodec"
+	depends on BR2_arm || BR2_aarch64
+	help
+	    Interface library for Amlogic media codecs
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
new file mode 100644
index 0000000..e983192
--- /dev/null
+++ b/package/libamcodec/libamcodec.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libamcodec
+#
+################################################################################
+
+LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
+LIBAMCODEC_SITE = https://github.com/mdrjr/c2_aml_libs.git
+LIBAMCODEC_SITE_METHOD = git
+LIBAMCODEC_LICENSE = GPL
+
+define LIBAMCODEC_BUILD_CMDS
+	$(MAKE) -C $(@D)/amavutils CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
+	$(MAKE) -C $(@D)/amadec CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
+ 	$(MAKE) -C $(@D)/amcodec CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
+endef
+
+define LIBAMCODEC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib
+
+	mkdir -p $(STAGING_DIR)/usr/include/amcodec
+	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
+endef
+
+define LIBAMCODEC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib
+endef
+									    
+$(eval $(generic-package))
-- 
2.8.3
