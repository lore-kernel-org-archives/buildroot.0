From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 27 Jul 2017 09:48:09 -0400
Subject: [Buildroot] [PATCH 1/1] python-mysqlclient: new package
Message-ID: <20170727134809.32401-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mysqlclient is a fork of MySQL-python. It adds Python 3 support and fixes
many bugs.

MySQLdb is an interface to the popular MySQL database server for Python.
The design goals are:

  - Compliance with Python database API version 2.0 [PEP-0249]
  - Thread-safety
  - Thread-friendliness (threads will not block each other)

MySQL-5.1 through 5.7 and Python 2.7, 3.3+ are currently supported.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/python-mysqlclient/Config.in               | 18 ++++++++++++++++++
 package/python-mysqlclient/python-mysqlclient.hash |  3 +++
 package/python-mysqlclient/python-mysqlclient.mk   | 22 ++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/python-mysqlclient/Config.in
 create mode 100644 package/python-mysqlclient/python-mysqlclient.hash
 create mode 100644 package/python-mysqlclient/python-mysqlclient.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e01c1bade..2e4f45a80 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -41,6 +41,7 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/python-mysqlclient/
 F:	package/refpolicy/
 F:	package/sepolgen/
 F:	package/setools/
diff --git a/package/python-mysqlclient/Config.in b/package/python-mysqlclient/Config.in
new file mode 100644
index 000000000..2af8c5c27
--- /dev/null
+++ b/package/python-mysqlclient/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PYTHON_MYSQLCLIENT
+	bool "python-mysqlclient"
+	select BR2_PACKAGE_MYSQL
+	help
+	  Python interface to MySQL
+	  mysqlclient is a fork of MySQL-python. It adds Python 3
+	  support and fixes many bugs.
+
+	  MySQLdb is an interface to the popular MySQL database server
+	  for Python. The design goals are:
+	   - Compliance with Python database API version 2.0 [PEP-0249]
+	   - Thread-safety
+	   - Thread-friendliness (threads will not block each other)
+
+	  MySQL-5.1 through 5.7 and Python 2.7, 3.3+ are currently
+	  supported.
+
+	  https://pypi.python.org/pypi/mysqlclient/
diff --git a/package/python-mysqlclient/python-mysqlclient.hash b/package/python-mysqlclient/python-mysqlclient.hash
new file mode 100644
index 000000000..206736e39
--- /dev/null
+++ b/package/python-mysqlclient/python-mysqlclient.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/mysqlclient/json, sha256 locally computed
+md5 e7fb95c4055e2d8a3322db5c85ab6fc8 mysqlclient-1.3.10.tar.gz
+sha256 452aaf9d2ba1a4fb85c134c88f9b1857852deed63b3b13255d7a65d2c1297262 mysqlclient-1.3.10.tar.gz
diff --git a/package/python-mysqlclient/python-mysqlclient.mk b/package/python-mysqlclient/python-mysqlclient.mk
new file mode 100644
index 000000000..144931286
--- /dev/null
+++ b/package/python-mysqlclient/python-mysqlclient.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-mysqlclient
+#
+################################################################################
+
+PYTHON_MYSQLCLIENT_VERSION = 1.3.10
+PYTHON_MYSQLCLIENT_SOURCE = mysqlclient-$(PYTHON_MYSQLCLIENT_VERSION).tar.gz
+PYTHON_MYSQLCLIENT_SITE = https://pypi.python.org/packages/40/9b/0bc869f290b8f49a99b8d97927f57126a5d1befcf8bac92c60dc855f2523
+PYTHON_MYSQLCLIENT_LICENSE = MIT
+PYTHON_MYSQLCLIENT_LICENSE_FILES = LICENSE
+PYTHON_MYSQLCLIENT_SETUP_TYPE = setuptools
+PYTHON_MYSQLCLIENT_DEPENDENCIES = mysql
+
+define PYTHON_MYSQLCLIENT_POST_CONFIGURE
+	$(SED) 's^#mysql_config.*^mysql_config = $(STAGING_DIR)/usr/bin/mysql_config^' \
+		$(@D)/site.cfg
+endef
+
+PYTHON_MYSQLCLIENT_POST_PATCH_HOOKS += PYTHON_MYSQLCLIENT_POST_CONFIGURE
+
+$(eval $(python-package))
-- 
2.13.3
