From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:40:05 +0200
Subject: [Buildroot] [git commit] package/vdr-plugin-vnsiserver: new package
Message-ID: <20161025204939.12AFA81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=700b729dccaad20fe24a223d0e5e21b5de323e9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/vdr-plugin-vnsiserver/Config.in            |  9 ++++++++
 .../vdr-plugin-vnsiserver.hash                     |  2 ++
 .../vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 25 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0a0cd6d..0f6260b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1619,6 +1619,7 @@ endif
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
