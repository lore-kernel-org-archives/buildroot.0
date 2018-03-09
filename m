From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:55 +0100
Subject: [Buildroot] [PATCH 04/10] package: add python-docker
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python library for the Docker Engine API.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-setup.py-make-pip-optional.patch          | 50 ++++++++++++++++++++++
 package/python-docker/Config.in                    | 15 +++++++
 package/python-docker/python-docker.hash           |  4 ++
 package/python-docker/python-docker.mk             | 14 ++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/python-docker/0001-setup.py-make-pip-optional.patch
 create mode 100644 package/python-docker/Config.in
 create mode 100644 package/python-docker/python-docker.hash
 create mode 100644 package/python-docker/python-docker.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 34ecfeeb02..9b68652b5f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1385,6 +1385,7 @@ F:	package/memtool/
 F:	package/mosquitto/
 F:	package/python-alsaaudio/
 F:	package/python-backports-ssl-match-hostname/
+F:	package/python-docker/
 F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
diff --git a/package/Config.in b/package/Config.in
index d3018aee47..c1bf7067aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -766,6 +766,7 @@ menu "External python modules"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
+	source "package/python-docker/Config.in"
 	source "package/python-docker-pycreds/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-docutils/Config.in"
diff --git a/package/python-docker/0001-setup.py-make-pip-optional.patch b/package/python-docker/0001-setup.py-make-pip-optional.patch
new file mode 100644
index 0000000000..d9c958311d
--- /dev/null
+++ b/package/python-docker/0001-setup.py-make-pip-optional.patch
@@ -0,0 +1,50 @@
+From 978643b7222db66837d39037f884be01fb9af234 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 9 Mar 2018 18:40:16 +0100
+Subject: [PATCH] setup.py: make pip optional
+
+pip may not be available on the build host, and it is only used to check if
+docker-py is already installed, so skip the check if pip isn't available.
+
+[Upstream-status: submitted (https://github.com/docker/docker-py/pull/1948)]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ setup.py | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 271d94f..c9b91a3 100644
+--- a/setup.py
++++ b/setup.py
+@@ -5,16 +5,20 @@ import codecs
+ import os
+ import sys
+ 
+-import pip
+-
+ from setuptools import setup, find_packages
+ 
+-if 'docker-py' in [x.project_name for x in pip.get_installed_distributions()]:
+-    print(
+-        'ERROR: "docker-py" needs to be uninstalled before installing this'
+-        ' package:\npip uninstall docker-py', file=sys.stderr
+-    )
+-    sys.exit(1)
++try:
++    import pip
++
++    if 'docker-py' in \
++            [x.project_name for x in pip.get_installed_distributions()]:
++        print(
++            'ERROR: "docker-py" needs to be uninstalled before installing this'
++            ' package:\npip uninstall docker-py', file=sys.stderr
++        )
++        sys.exit(1)
++except ImportError:
++    pass
+ 
+ ROOT_DIR = os.path.dirname(__file__)
+ SOURCE_DIR = os.path.join(ROOT_DIR)
+-- 
+2.11.0
+
diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
new file mode 100644
index 0000000000..35f7666f19
--- /dev/null
+++ b/package/python-docker/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_DOCKER
+	bool "python-docker"
+	# docker-engine may be running on another host, so no dependency
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
+	       if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
+	select BR2_PACKAGE_PYTHON_DOCKER_PYCREDS # runtime
+	help
+	  A Python library for the Docker Engine API.
+
+	  https://github.com/docker/docker-py
diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
new file mode 100644
index 0000000000..c09ccc3859
--- /dev/null
+++ b/package/python-docker/python-docker.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/docker/json, sha256 locally computed
+md5	71e97726a8bdc56effa7df8321c47af1  docker-3.1.1.tar.gz
+sha256	462165ca6367f802280684ab44e581cd2efba8995d78d07ea994e42194927c3b  docker-3.1.1.tar.gz
+sha256	f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
new file mode 100644
index 0000000000..fb9b32a603
--- /dev/null
+++ b/package/python-docker/python-docker.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-docker
+#
+################################################################################
+
+PYTHON_DOCKER_VERSION = 3.1.1
+PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
+PYTHON_DOCKER_SITE = https://pypi.python.org/packages/0d/17/ad98e025e5528337c4dc5835a5874898eb226da17e4ffed732c894cb1938
+PYTHON_DOCKER_SETUP_TYPE = setuptools
+PYTHON_DOCKER_LICENSE = Apache-2.0
+PYTHON_DOCKER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
