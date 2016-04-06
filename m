From: ray.kinsella at intel.com <ray.kinsella@intel.com>
Date: Wed,  6 Apr 2016 13:21:35 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/radlib: New package
Message-ID: <1459945297-29773-1-git-send-email-ray.kinsella@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ray Kinsella <ray.kinsella@intel.com>

radlib is a rapid application development library for unix
multi-process applications. It uses SYS V IPC facilities and
FIFOs to provide an RTOS-like, event-driven, distributed
framework. Processes may be run as daemons or have a controlling
terminal.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 package/Config.in          |  1 +
 package/radlib/Config.in   | 37 +++++++++++++++++++++++++++++++++++++
 package/radlib/radlib.hash |  2 ++
 package/radlib/radlib.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 package/radlib/Config.in
 create mode 100644 package/radlib/radlib.hash
 create mode 100644 package/radlib/radlib.mk

diff --git a/package/Config.in b/package/Config.in
index 64822bf..6c59556 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1262,6 +1262,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/radlib/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/radlib/Config.in b/package/radlib/Config.in
new file mode 100644
index 0000000..e77e03c
--- /dev/null
+++ b/package/radlib/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_RADLIB
+	bool "radlib"
+	help
+	  radlib is a rapid application development library for unix
+	  multi-process applications. It uses SYS V IPC facilities and
+	  FIFOs to provide an RTOS-like, event-driven, distributed framework.
+	  Processes may be run as daemons or have a controlling terminal.
+	  
+	  http://sourceforge.net/projects/radlib/
+
+choice
+	prompt "radlib database backend"
+	depends on BR2_PACKAGE_RADLIB
+	depends on BR2_PACKAGE_SQLITE \
+		|| BR2_PACKAGE_MYSQL \
+		|| BR2_PACKAGE_POSTGRESQL
+	help$
+		Selects the backend database: sqlite, mysql or postgresql
+
+config BR2_PACKAGE_RADLIB_SQLITE
+	bool "sqlite"
+	depends on BR2_PACKAGE_SQLITE
+	help
+		Configure radlib to use a sqlite database backend
+
+config BR2_PACKAGE_RADLIB_MYSQL
+	bool "mysql"
+	depends on BR2_PACKAGE_MYSQL
+	help
+		Configure radlib to use a mysql database backend
+
+config BR2_PACKAGE_RADLIB_POSTGRESQL
+	bool "postgresql"
+	depends on BR2_PACKAGE_POSTGRESQL
+	help
+		Configure radlib to use a postgresql database backend
+endchoice
diff --git a/package/radlib/radlib.hash b/package/radlib/radlib.hash
new file mode 100644
index 0000000..2fbfbba
--- /dev/null
+++ b/package/radlib/radlib.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/radlib/files/
+sha256  82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66  radlib-2.12.0.tar.gz
diff --git a/package/radlib/radlib.mk b/package/radlib/radlib.mk
new file mode 100644
index 0000000..5ff55ac
--- /dev/null
+++ b/package/radlib/radlib.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# radlib
+#
+################################################################################
+
+RADLIB_VERSION = 2.12.0
+RADLIB_SITE = http://downloads.sourceforge.net/radlib
+RADLIB_INSTALL_STAGING = YES
+RADLIB_LICENSE = BSD-2c
+RADLIB_LICENSE_FILES = COPYING
+RADLIB_AUTORECONF = YES
+RADLIB_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_RADLIB_SQLITE),y)
+	RADLIB_CONF_OPTS += --with-sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
+	RADLIB_CONF_ENV=ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
+	RADLIB_CONF_OPTS += --with-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_RADLIB_POSTGRESQL),y)
+	RADLIB_CONF_OPTS += --with-postgresql
+endif
+
+$(eval $(autotools-package))
-- 
2.4.11
