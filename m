From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 19:23:18 +0100
Subject: [Buildroot] [git commit] package/python-docker: bump version to
 3.5.1
Message-ID: <20190204182438.ABB1B7FF32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aee3c9ee9e624aa78a5b62e41bcc10af7daab19f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pypi now proves a sha256 hash as well.

Drop 0001-setup.py-make-pip-optional.patch as upstream has now completely
removed the docker-py checks:

https://github.com/docker/docker-py/commit/accb9de52f6e383ad0335807f73c8c35bd6e7426

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-setup.py-make-pip-optional.patch          | 50 ----------------------
 package/python-docker/python-docker.hash           |  6 +--
 package/python-docker/python-docker.mk             |  4 +-
 3 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/package/python-docker/0001-setup.py-make-pip-optional.patch b/package/python-docker/0001-setup.py-make-pip-optional.patch
deleted file mode 100644
index d9c958311d..0000000000
--- a/package/python-docker/0001-setup.py-make-pip-optional.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 978643b7222db66837d39037f884be01fb9af234 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 9 Mar 2018 18:40:16 +0100
-Subject: [PATCH] setup.py: make pip optional
-
-pip may not be available on the build host, and it is only used to check if
-docker-py is already installed, so skip the check if pip isn't available.
-
-[Upstream-status: submitted (https://github.com/docker/docker-py/pull/1948)]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- setup.py | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 271d94f..c9b91a3 100644
---- a/setup.py
-+++ b/setup.py
-@@ -5,16 +5,20 @@ import codecs
- import os
- import sys
- 
--import pip
--
- from setuptools import setup, find_packages
- 
--if 'docker-py' in [x.project_name for x in pip.get_installed_distributions()]:
--    print(
--        'ERROR: "docker-py" needs to be uninstalled before installing this'
--        ' package:\npip uninstall docker-py', file=sys.stderr
--    )
--    sys.exit(1)
-+try:
-+    import pip
-+
-+    if 'docker-py' in \
-+            [x.project_name for x in pip.get_installed_distributions()]:
-+        print(
-+            'ERROR: "docker-py" needs to be uninstalled before installing this'
-+            ' package:\npip uninstall docker-py', file=sys.stderr
-+        )
-+        sys.exit(1)
-+except ImportError:
-+    pass
- 
- ROOT_DIR = os.path.dirname(__file__)
- SOURCE_DIR = os.path.join(ROOT_DIR)
--- 
-2.11.0
-
diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index e811d3a8ac..37fda94f0b 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,4 +1,4 @@
-# md5 from https://pypi.python.org/pypi/docker/json, sha256 locally computed
-md5	981b23b41fd2346efcae977244b7188e  docker-3.1.4.tar.gz
-sha256	753251b142d56f243fba53ba321a37740a6b6583c528437f45df4d28ba3d4d5d  docker-3.1.4.tar.gz
+# md5 and sha256 from https://pypi.python.org/pypi/docker/json
+md5	496237b9e0826eff8436b1a786943a86  docker-3.5.1.tar.gz
+sha256	fbe82af9b94ccced752527c8de07fa20267f9634b48674ba478a0bb4000a0b1e  docker-3.5.1.tar.gz
 sha256	f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 6a818ebaed..01ae2da9be 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 3.1.4
+PYTHON_DOCKER_VERSION = 3.5.1
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://pypi.python.org/packages/7f/22/fd6e97c99a512f74d46dab2b450fe370eb2f83404ef790298e3fd012cd5c
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/b1/4f/d4f646843335430701d459fea08b0285a2c0a364150dd5b9c5f27f723121
 PYTHON_DOCKER_SETUP_TYPE = setuptools
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
