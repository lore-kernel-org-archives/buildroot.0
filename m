From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 16:01:49 +0200
Subject: [Buildroot] [git commit] python-tornado: bump to version 5.0.2
Message-ID: <20180624140007.2CAA5821AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=960f58a2d8bf123ac91201d793bd033130b29dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tornado got a requirement on the SSL module in version 5.0.2
which is also checked in the setup.py script before installing.
Since the check in buildroot runs against the host-python which
is built without SSL support, these checks fail.

Adding OpenSSL support to host-python does not make sense since the
Python on the target will be a different one. Instead, remove the
checks (which, according to the source code comments essentially check
for Python >= 2.7.9 / Python3 >= 3.4 which is true for current
Buildroot) and select the SSL option of Python/Python3 when Tornado is
selected.

Signed-off-by: Jan Dohl <polygon@wh2.tu-dresden.de>
[Thomas: adjust commit title, convert patch to a Git formatted one.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-tornado/0001-Disable-SSL-checks.patch   | 45 ++++++++++++++++++++++
 package/python-tornado/Config.in                   |  2 +
 package/python-tornado/python-tornado.hash         |  6 +--
 package/python-tornado/python-tornado.mk           |  5 ++-
 4 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/package/python-tornado/0001-Disable-SSL-checks.patch b/package/python-tornado/0001-Disable-SSL-checks.patch
new file mode 100644
index 0000000000..272afd64fe
--- /dev/null
+++ b/package/python-tornado/0001-Disable-SSL-checks.patch
@@ -0,0 +1,45 @@
+From 82a3bbc2ac41b5a1b34a53f97459558efe131f14 Mon Sep 17 00:00:00 2001
+From: Jan Dohl <polygon@wh2.tu-dresden.de>
+Date: Sun, 24 Jun 2018 16:00:54 +0200
+Subject: [PATCH] Disable SSL checks
+
+Checking for SSL support in the Python used on the build system is not
+relevant, as we need SSL support in the Python on the target system.
+
+Signed-off-by: Jan Dohl <polygon@wh2.tu-dresden.de>
+---
+ setup.py | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 6fbb10a8..1a9220c7 100644
+--- a/setup.py
++++ b/setup.py
+@@ -15,7 +15,6 @@
+ 
+ import os
+ import platform
+-import ssl
+ import sys
+ import warnings
+ 
+@@ -137,16 +136,6 @@ if setuptools is not None:
+     python_requires = '>= 2.7, !=3.0.*, !=3.1.*, !=3.2.*, != 3.3.*'
+     kwargs['python_requires'] = python_requires
+ 
+-# Verify that the SSL module has all the modern upgrades. Check for several
+-# names individually since they were introduced at different versions,
+-# although they should all be present by Python 3.4 or 2.7.9.
+-if (not hasattr(ssl, 'SSLContext') or
+-        not hasattr(ssl, 'create_default_context') or
+-        not hasattr(ssl, 'match_hostname')):
+-    raise ImportError("Tornado requires an up-to-date SSL module. This means "
+-                      "Python 2.7.9+ or 3.4+ (although some distributions have "
+-                      "backported the necessary changes to older versions).")
+-
+ setup(
+     name="tornado",
+     version=version,
+-- 
+2.14.4
+
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index a0ee78fb7a..1afbdc5729 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI if BR2_PACKAGE_PYTHON # runtime
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 662db6f258..c64e537eed 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/tornado/json, sha256 locally computed
-md5	838687d20923360af5ab59f101e9e02e  tornado-4.5.1.tar.gz
-sha256	db0904a28253cfe53e7dedc765c71596f3c53bb8a866ae50123320ec1a7b73fd  tornado-4.5.1.tar.gz
+# md5, sha256 from https://pypi.python.org/pypi/tornado/json
+md5	e5e24ce1c8a4e6442dc38d470172f59e  tornado-5.0.2.tar.gz
+sha256	1b83d5c10550f2653380b4c77331d6f8850f287c4f67d7ce1e1c639d9222fbc7  tornado-5.0.2.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 6e6167564f..ed3a61fcf8 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.5.1
+PYTHON_TORNADO_VERSION = 5.0.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://pypi.python.org/packages/df/42/a180ee540e12e2ec1007ac82a42b09dd92e5461e09c98bf465e98646d187
+PYTHON_TORNADO_SITE = https://pypi.python.org/packages/cf/d1/3be271ae5eba9fb59df63c9891fdc7d8044b999e8ac145994cdbfd2ae66a
 PYTHON_TORNADO_LICENSE = Apache-2.0
+PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
