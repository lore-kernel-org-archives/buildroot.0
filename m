From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  5 Feb 2018 07:33:04 -0500
Subject: [Buildroot] [PATCH 1/5] python-psycopg2: new package
Message-ID: <20180205123308.22479-1-aduskett@gmail.com>
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
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../python-psycopg2/0001-don-t-use-pg_config.patch | 49 ++++++++++++++++++++++
 package/python-psycopg2/Config.in                  | 23 ++++++++++
 package/python-psycopg2/python-psycopg2.hash       |  4 ++
 package/python-psycopg2/python-psycopg2.mk         | 20 +++++++++
 6 files changed, 98 insertions(+)
 create mode 100644 package/python-psycopg2/0001-don-t-use-pg_config.patch
 create mode 100644 package/python-psycopg2/Config.in
 create mode 100644 package/python-psycopg2/python-psycopg2.hash
 create mode 100644 package/python-psycopg2/python-psycopg2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4f2c84758e..c07f4fa6fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -52,6 +52,7 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/python-psycopg2/
 F:	package/restorecond/
 F:	package/refpolicy/
 F:	package/selinux-python/
diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..b039dea58f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -844,6 +844,7 @@ menu "External python modules"
 	source "package/python-prompt-toolkit/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
+	source "package/python-psycopg2/Config.in"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
 	source "package/python-pyasn/Config.in"
diff --git a/package/python-psycopg2/0001-don-t-use-pg_config.patch b/package/python-psycopg2/0001-don-t-use-pg_config.patch
new file mode 100644
index 0000000000..5f7c4eec5e
--- /dev/null
+++ b/package/python-psycopg2/0001-don-t-use-pg_config.patch
@@ -0,0 +1,49 @@
+From 92d42775735d1555449b860c214ca7265d7ad75b Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 24 Jan 2017 00:43:35 +0900
+Subject: [PATCH] setup: don't use pg_config
+
+pg_config is used to get library and include directories, and the postgresql
+version. All of which is not available in the cross compiled version.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+[aduskett at gmail.com: Update for psycopg2 2.7.3.2]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ setup.py | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 86f32d2..05b8eeb 100644
+--- a/setup.py
++++ b/setup.py
+@@ -404,16 +404,13 @@ class psycopg_build_ext(build_ext):
+             self.libraries.append("pq")
+ 
+         try:
+-            self.library_dirs.append(pg_config_helper.query("libdir"))
+-            self.include_dirs.append(pg_config_helper.query("includedir"))
+-            self.include_dirs.append(pg_config_helper.query("includedir-server"))
+             try:
+                 # Here we take a conservative approach: we suppose that
+                 # *at least* PostgreSQL 7.4 is available (this is the only
+                 # 7.x series supported by psycopg 2)
+                 pgversion = pg_config_helper.query("version").split()[1]
+             except:
+-                pgversion = "7.4.0"
++                pgversion = str(os.environ['PSYCOPG2_POSTGRESQL_VERSION'])
+ 
+             verre = re.compile(
+                 r"(\d+)(?:\.(\d+))?(?:(?:\.(\d+))|(devel|(?:alpha|beta|rc)\d+))?")
+@@ -525,6 +522,7 @@ parser.read('setup.cfg')
+ # Choose a datetime module
+ have_pydatetime = True
+ have_mxdatetime = False
++pg_config="/bin/true"
+ use_pydatetime = int(parser.get('build_ext', 'use_pydatetime'))
+ 
+ # check for mx package
+-- 
+2.14.3
+
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
new file mode 100644
index 0000000000..8240c8e027
--- /dev/null
+++ b/package/python-psycopg2/Config.in
@@ -0,0 +1,23 @@
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
+
+	  Psycopg 2 is both Unicode and Python 3 friendly.
+
+	  http://initd.org/psycopg/
diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
new file mode 100644
index 0000000000..4b20b96f35
--- /dev/null
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/psycopg2/json, sha256 locally computed
+md5	8114e672d5f23fa5329874a4314fbd6f  psycopg2-2.7.3.2.tar.gz
+sha256	5c3213be557d0468f9df8fe2487eaf2990d9799202c5ff5cb8d394d09fad9b2a  psycopg2-2.7.3.2.tar.gz
+sha256	1752db3c786e12b62ca804178dca033adce8bff4c4b3d98d3449d407fe45210d  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
new file mode 100644
index 0000000000..9c4657d2d5
--- /dev/null
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-psycopg2
+#
+################################################################################
+
+PYTHON_PSYCOPG2_VERSION = 2.7.3.2
+PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
+PYTHON_PSYCOPG2_SITE = https://pypi.python.org/packages/dd/47/000b405d73ca22980684fd7bd3318690cc03cfa3b2ae1c5b7fff8050b28a
+PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
+PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
+PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
+PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
+
+# Force psycopg2 to use the BuildRoot provided postgresql version instead of
+# The host machines
+PYTHON_PSYCOPG2_ENV += \
+	PSYCOPG2_POSTGRESQL_VERSION=$(POSTGRESQL_VERSION)
+
+$(eval $(python-package))
-- 
2.14.3
