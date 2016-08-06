From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Aug 2016 09:41:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/vdr-plugin-vnsiserver: new package
In-Reply-To: <1470469319-11791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470469319-11791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1470469319-11791-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |  1 +
 package/vdr-plugin-vnsiserver/Config.in            |  9 ++++++++
 .../vdr-plugin-vnsiserver.hash                     |  2 ++
 .../vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 25 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/vdr-plugin-vnsiserver/Config.in
 create mode 100644 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
 create mode 100644 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk

diff --git a/package/Config.in b/package/Config.in
index a8b9d10..f3ac078 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1598,6 +1598,7 @@ endif
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
 	source "package/vdr/Config.in"
+	source "package/vdr-plugin-vnsiserver/Config.in"
 	source "package/vnstat/Config.in"
 	source "package/vpnc/Config.in"
 	source "package/vsftpd/Config.in"
diff --git a/package/vdr-plugin-vnsiserver/Config.in b/package/vdr-plugin-vnsiserver/Config.in
new file mode 100644
index 0000000..0a0ab8d
--- /dev/null
+++ b/package/vdr-plugin-vnsiserver/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_VDR_PLUGIN_VNSISERVER
+	bool "vdr-plugin-vnsiserver"
+	depends on BR2_PACKAGE_VDR
+	help
+	  VDR plugin to handle KODI clients.
+	  The vdr-plugin-vnsiserver is able to handle serveral KODI
+	  clients connecting via the VNSI addon.
+
+	  https://github.com/FernetMenta/vdr-plugin-vnsiserver
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
new file mode 100644
index 0000000..cf403f5
--- /dev/null
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 fd00fb6d833cad6a32a0d8259bb125abdf1716680650ba24b34bca2201745877  vdr-plugin-vnsiserver-v1.5.0.tar.gz
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
new file mode 100644
index 0000000..aaa0859
--- /dev/null
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# vdr-plugin-vnsiserver
+#
+################################################################################
+
+VDR_PLUGIN_VNSISERVER_VERSION = v1.5.0
+VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
+VDR_PLUGIN_VNSISERVER_LICENSE = GPLv2+
+VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
+VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr
+
+VDR_PLUGIN_VNSISERVER_CXXFLAGS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC"
+
+define VDR_PLUGIN_VNSISERVER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(VDR_PLUGIN_VNSISERVER_CXXFLAGS)
+endef
+
+define VDR_PLUGIN_VNSISERVER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		install DESTDIR=$(TARGET_DIR) LIBDIR=/usr/lib/vdr
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
