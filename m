From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 6 Aug 2011 03:46:17 +0300
Subject: [Buildroot] [PATCH v2] add QWT library: Qt Widgets for Technical
	Applications
In-Reply-To: <4E3C283A.7070406@promwad.com>
References: <4E3C283A.7070406@promwad.com>
Message-ID: <1312591577-30383-1-git-send-email-ivan.kuten@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ivan Kuten <ivan.kuten@promwad.com>
---
:100644 100644 7112e05... e442e09... M	package/Config.in
:000000 100644 0000000... c927a7b... A	package/qwt/Config.in
:000000 100644 0000000... 2f25cc4... A	package/qwt/qwt.mk
 package/Config.in     |    1 +
 package/qwt/Config.in |   10 ++++++++++
 package/qwt/qwt.mk    |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7112e05..e442e09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -293,6 +293,7 @@ source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
+source "package/qwt/Config.in"
 source "package/tiff/Config.in"
 source "package/webkit/Config.in"
 endmenu
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
new file mode 100644
index 0000000..c927a7b
--- /dev/null
+++ b/package/qwt/Config.in
@@ -0,0 +1,10 @@
+comment "Qwt requires Qt to be installed"
+	depends on !BR2_PACKAGE_QT
+
+menuconfig BR2_PACKAGE_QWT
+	bool "qwt"
+	depends on BR2_PACKAGE_QT
+	help
+	  Qt Widgets for Technical Applications
+
+	  http://qwt.sourceforge.net/
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
new file mode 100644
index 0000000..2f25cc4
--- /dev/null
+++ b/package/qwt/qwt.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# QWT
+#
+#############################################################
+QWT_VERSION = 6.0.0
+QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
+QWT_SITE = https://sourceforge.net/projects/qwt/files/qwt/$(QWT_VERSION)/
+QWT_INSTALL_STAGING = YES
+QWT_DEPENDENCIES = qt
+QWT_CONFIG_FILE = qwt.pro
+
+define QWT_CONFIGURE_CMDS
+     $(QT_QMAKE) $(@D)/$(QWT_CONFIG_FILE)
+     $(SED) 's/+= QwtSvg/-= QwtSvg/' $(@D)/qwtconfig.pri
+     $(SED) 's/+= QwtDesigner/-= QwtDesigner/' $(@D)/qwtconfig.pri
+     $(SED) 's/+= QwtMathML/-= QwtMathML/' $(@D)/qwtconfig.pri
+endef
+
+define QWT_BUILD_CMDS
+      $(MAKE) -C $(@D) all
+endef
+
+define QWT_INSTALL_STAGING_CMDS
+     (export INSTALL_ROOT=$(STAGING_DIR); $(MAKE) -C $(@D) install)
+endef
+
+define QWT_INSTALL_TARGET_CMDS
+     cp -dpf $(STAGING_DIR)/usr/local/qwt-$(QWT_VERSION)/lib/libqwt.so* $(TARGET_DIR)/usr/lib
+endef
+
+define QT_CLEAN_CMDS
+      $(MAKE) -C $(@D) clean
+endef
+
+define QT_UNINSTALL_TARGET_CMDS
+     rm $(TARGET_DIR)/usr/lib/libqwt.so.*
+endef
+
+define QT_UNINSTALL_STAGING_CMDS
+     (export INSTALL_ROOT=$(STAGING_DIR); $(MAKE) -C $(@D) uninstall)
+endef
+
+$(eval $(call GENTARGETS,package,qwt))
-- 
1.7.2.5
