From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 22:34:07 +0100
Subject: [Buildroot] [PATCH 3/4] linknx: new package
In-Reply-To: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364160848-15168-4-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/Config.in        |    1 +
 package/linknx/Config.in |    8 ++++++++
 package/linknx/linknx.mk |   31 +++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 package/linknx/Config.in
 create mode 100644 package/linknx/linknx.mk

diff --git a/package/Config.in b/package/Config.in
index be1aa99..97aab31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -672,6 +672,7 @@ source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/lighttpd/Config.in"
+source "package/linknx/Config.in"
 source "package/links/Config.in"
 source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
new file mode 100644
index 0000000..70942fc
--- /dev/null
+++ b/package/linknx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LINKNX
+	bool "linknx"
+	select BR2_PACKAGE_LIBPTHSEM
+	help
+	  Linknx is an automation platform providing high level functionalities
+	  to EIB/KNX installation.
+
+	  http://linknx.sourceforge.net/
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
new file mode 100644
index 0000000..2520382
--- /dev/null
+++ b/package/linknx/linknx.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# linknx
+#
+#############################################################
+
+LINKNX_VERSION = 0.0.1.30
+LINKNX_SOURCE = linknx-${LINKNX_VERSION}.tar.gz
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
