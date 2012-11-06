From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Tue,  6 Nov 2012 10:05:27 +0100
Subject: [Buildroot] [PATCH v2] package: add bcusdk
In-Reply-To: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1352192728-4816-2-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in        |    1 +
 package/bcusdk/Config.in |   11 +++++++++++
 package/bcusdk/bcusdk.mk |   20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/bcusdk/Config.in
 create mode 100644 package/bcusdk/bcusdk.mk

diff --git a/package/Config.in b/package/Config.in
index 941b458..1a545ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -555,6 +555,7 @@ source "package/argus/Config.in"
 source "package/arptables/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+source "package/bcusdk/Config.in"
 source "package/bluez_utils/Config.in"
 source "package/boa/Config.in"
 source "package/bind/Config.in"
diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
new file mode 100644
index 0000000..c7b1b95
--- /dev/null
+++ b/package/bcusdk/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BCUSDK
+	bool "bcusdk"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBPTHSEM
+	help
+	  A free development environment for BCU1 and BCU2
+
+	  http://www.auto.tuwien.ac.at/~mkoegler/eib/
+
+comment "bcusdk requires a toolchain with C++ "
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
new file mode 100644
index 0000000..18e3673
--- /dev/null
+++ b/package/bcusdk/bcusdk.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# bcusck
+#
+#############################################################
+
+BCUSDK_VERSION = 0.0.5
+BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
+BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib/
+BCUSDK_LICENSE = GPLv2+
+BCUSDK_LICENSE_FILES = COPYING
+BCUSDK_INSTALL_STAGING = YES
+BCUSDK_CONF_OPT =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
+		 --enable-eibnetip --enable-eibnetipserver \
+		 --enable-eibnetiptunnel --without-pth-test \
+		 --with-pth=$(STAGING_DIR)/usr 
+
+BCUSDK_DEPENDENCIES = libpthsem
+
+$(eval $(autotools-package))
-- 
1.7.9.5
