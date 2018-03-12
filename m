From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 06:12:31 -0400
Subject: [Buildroot] [PATCH v3 2/2] python-psycopg2: new package
In-Reply-To: <20180312101231.2280-1-aduskett@gmail.com>
References: <20180312101231.2280-1-aduskett@gmail.com>
Message-ID: <20180312101231.2280-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Psycopg is the most popular PostgreSQL database adapter for the Python
programming language. Its main features are the complete implementation of the
Python DB API 2.0 specification and the thread safety (several threads can
share the same connection). It was designed for heavily multi-threaded
applications that create and destroy lots of cursors and make a large number of
concurrent INSERTs or UPDATEs.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None

Changes v2 -> v3:
  - Removed python-psycopg2/0001-don-t-use-pg_config.patch
  - Added PYTHON_PSYCOPG2_BUILD_OPTS and PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS
    to point towards Buildroots own pg_config file. (Thomas)
  - Updated to 2.7.4

 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-psycopg2/Config.in            | 22 ++++++++++++++++++++++
 package/python-psycopg2/python-psycopg2.hash |  4 ++++
 package/python-psycopg2/python-psycopg2.mk   | 21 +++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/python-psycopg2/Config.in
 create mode 100644 package/python-psycopg2/python-psycopg2.hash
 create mode 100644 package/python-psycopg2/python-psycopg2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e712..6329bcde2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -53,6 +53,7 @@ F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
+F:	package/python-psycopg2/
 F:	package/python-sqlalchemy/
 F:	package/restorecond/
 F:	package/refpolicy/
diff --git a/package/Config.in b/package/Config.in
index 449ffcc47b..d40170ccf9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -856,6 +856,7 @@ menu "External python modules"
 	source "package/python-prompt-toolkit/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
+	source "package/python-psycopg2/Config.in"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
 	source "package/python-pyasn/Config.in"
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
new file mode 100644
index 0000000000..ec852bb49e
--- /dev/null
+++ b/package/python-psycopg2/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_PSYCOPG2
+	bool "python-psycopg2"
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Psycopg is the most popular PostgreSQL database adapter for
+	  the Python programming language. Its main features are the
+	  complete implementation of the Python DB API 2.0 specification
+	  and the thread safety (several threads can share the same
+	  connection). It was designed for heavily multi-threaded
+	  applications that create and destroy lots of cursors and make
+	  a large number of concurrent INSERTs or UPDATEs.
+
+	  Psycopg 2 is mostly implemented in C as a libpq wrapper,
+	  resulting in being both efficient and secure. It features
+	  client-side and server-side cursors, asynchronous
+	  communication and notifications, COPY support. Many Python
+	  types are supported out-of-the-box and adapted to matching
+	  PostgreSQL data types; adaptation can be extended and
+	  customized thanks to a flexible objects adaptation system.
+	  Psycopg 2 is both Unicode and Python 3 friendly.
+
+	  http://initd.org/psycopg/
diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
new file mode 100644
index 0000000000..ea4a07697b
--- /dev/null
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/psycopg2/json, sha256 locally computed
+md5    70fc57072e084565a42689d416cf2c5c  psycopg2-2.7.4.tar.gz
+sha256 8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209  psycopg2-2.7.4.tar.gz
+sha256 1752db3c786e12b62ca804178dca033adce8bff4c4b3d98d3449d407fe45210d  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
new file mode 100644
index 0000000000..3cb8c85778
--- /dev/null
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-psycopg2
+#
+################################################################################
+
+PYTHON_PSYCOPG2_VERSION = 2.7.4
+PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
+PYTHON_PSYCOPG2_SITE = https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462
+PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
+PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
+PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
+PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
+
+# Force psycopg2 to use the BuildRoot provided postgresql version instead of
+# The host machines
+PYTHON_PSYCOPG2_BUILD_OPTS += build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
+
+PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS += build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
+
+$(eval $(python-package))
-- 
2.14.3
