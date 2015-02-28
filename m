From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Feb 2015 11:58:10 +0100
Subject: [Buildroot] [PATCH next 1/3] package/unixodbc: new package
Message-ID: <1425121092-10878-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in              |    1 +
 package/unixodbc/Config.in     |    7 +++++++
 package/unixodbc/unixodbc.hash |    2 ++
 package/unixodbc/unixodbc.mk   |   26 ++++++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/unixodbc/Config.in
 create mode 100644 package/unixodbc/unixodbc.hash
 create mode 100644 package/unixodbc/unixodbc.mk

diff --git a/package/Config.in b/package/Config.in
index 6af92e8..f31c959 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ menu "Database"
 	source "package/redis/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
+	source "package/unixodbc/Config.in"
 endmenu
 
 menu "Filesystem"
diff --git a/package/unixodbc/Config.in b/package/unixodbc/Config.in
new file mode 100644
index 0000000..c23e0a5
--- /dev/null
+++ b/package/unixodbc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UNIXODBC
+	bool "unixodbc"
+	help
+	  The unixODBC Project goals are to develop and promote unixODBC
+	  to be the definitive standard for ODBC on non MS Windows platforms.
+
+	  http://www.unixodbc.org
diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
new file mode 100644
index 0000000..a5c2d11
--- /dev/null
+++ b/package/unixodbc/unixodbc.hash
@@ -0,0 +1,2 @@
+# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.2.tar.gz.md5
+md5	5e4528851eda5d3d4aed249b669bd05b	unixODBC-2.3.2.tar.gz
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
new file mode 100644
index 0000000..bd4db70
--- /dev/null
+++ b/package/unixodbc/unixodbc.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# unixodbc
+#
+################################################################################
+
+UNIXODBC_VERSION = 2.3.2
+UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
+UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
+UNIXODBC_INSTALL_STAGING = YES
+UNIXODBC_LICENSE = LGPLv2.1+
+UNIXODBC_LICENSE_FILES = COPYING
+
+UNIXODBC_CONF_OPTS += --enable-drivers --enable-driver-conf
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+	UNIXODBC_CONF_OPTS += --enable-iconv
+	UNIXODBC_DEPENDENCIES += libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	UNIXODBC_CONF_OPTS += --enable-readline
+	UNIXODBC_DEPENDENCIES += readline
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
