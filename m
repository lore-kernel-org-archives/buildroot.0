From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Mar 2015 17:49:41 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/unixodbc: new package
Message-ID: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: various changes suggested by Thomas
    - added license stuff
    - added --disable- options, removed indentions
    - removed UNIXODBC_REMOVE_TARGET_BINS_FROM_STAGING
      originally needed by apr-util because its configure script tries to
      call bin/odbc_config from staging dir which fails because this file
      is compiled for target. A fix was added to the apr-util package.

 package/Config.in              |    1 +
 package/unixodbc/Config.in     |    7 +++++++
 package/unixodbc/unixodbc.hash |    2 ++
 package/unixodbc/unixodbc.mk   |   30 ++++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/unixodbc/Config.in
 create mode 100644 package/unixodbc/unixodbc.hash
 create mode 100644 package/unixodbc/unixodbc.mk

diff --git a/package/Config.in b/package/Config.in
index 584887b..03edca9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -672,6 +672,7 @@ menu "Database"
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
index 0000000..067c1ca
--- /dev/null
+++ b/package/unixodbc/unixodbc.mk
@@ -0,0 +1,30 @@
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
+UNIXODBC_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
+UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
+
+UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+UNIXODBC_CONF_OPTS += --enable-iconv
+UNIXODBC_DEPENDENCIES += libiconv
+else
+UNIXODBC_CONF_OPTS += --disable-iconv
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+UNIXODBC_CONF_OPTS += --enable-readline
+UNIXODBC_DEPENDENCIES += readline
+else
+UNIXODBC_CONF_OPTS += --disable-readline
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
