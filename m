From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Mar 2013 14:36:34 +0100
Subject: [Buildroot] [PATCHv3] linknx: new package
Message-ID: <1364477794-13840-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Hermant <gregory.hermant@calao-systems.com>

[Thomas: various fixes/improvements]
Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v2 -> v3:
 * Remove useless <pkg>_SOURCE line, noticed by Baruch. Thanks!
Changes v1 -> v2:
 * Add dependency on C++ support, as noted by Peter.
 * The support of log4cxx is not added, because linknx requires
   log4cxx >= 1.0 and we only have 0.10 has a package.
---
 package/Config.in        |    1 +
 package/linknx/Config.in |   12 ++++++++++++
 package/linknx/linknx.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/linknx/Config.in
 create mode 100644 package/linknx/linknx.mk

diff --git a/package/Config.in b/package/Config.in
index 5d8f4f6..302ad6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/lighttpd/Config.in"
+source "package/linknx/Config.in"
 source "package/links/Config.in"
 source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
new file mode 100644
index 0000000..18e9867
--- /dev/null
+++ b/package/linknx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LINKNX
+	bool "linknx"
+	select BR2_PACKAGE_LIBPTHSEM
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Linknx is an automation platform providing high level functionalities
+	  to EIB/KNX installation.
+
+	  http://linknx.sourceforge.net/
+
+comment "linknx requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
new file mode 100644
index 0000000..42700a7
--- /dev/null
+++ b/package/linknx/linknx.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# linknx
+#
+#############################################################
+
+LINKNX_VERSION = 0.0.1.30
+LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
+LINKNX_LICENSE = GPLv2+
+LINKNX_INSTALL_STAGING = YES
+LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
+		  --with-pth=$(STAGING_DIR)/usr
+
+LINKNX_DEPENDENCIES = libpthsem
+
+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+LINKNX_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+LINKNX_DEPENDENCIES = mysql_client
+else
+LINKNX_CONF_OPT += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LINKNX_CONF_OPT += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
+LINKNX_DEPENDENCIES += libcurl
+else
+LINKNX_CONF_OPT += --without-libcurl
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
