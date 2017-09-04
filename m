From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  4 Sep 2017 09:03:08 +0200
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version R-2.15.4
Message-ID: <1504508588-30424-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps web2py to the latest version R-2.15.4 and bumps
also the python-pydal dependency to the required latest version 17.8.
Starting with version R-2.15.x web2py supports also python 3, so
updating the package to support both versions.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pydal/python-pydal.hash   |  4 ++--
 package/python-pydal/python-pydal.mk     |  4 ++--
 package/python-web2py/Config.in          | 10 ++++++----
 package/python-web2py/python-web2py.hash |  2 +-
 package/python-web2py/python-web2py.mk   |  7 ++++---
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 8e20215..9a3fad3 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pydal/json, sha256 locally computed
-md5 f544da78cd4980d3a13024bc79065cf0 pyDAL-17.1.tar.gz
-sha256 ae33e903725133c051df3cd0712cc1967997f56fc480a90ab6a7c50df265f9d1 pyDAL-17.1.tar.gz
+md5 5a6ad0db15dc39987b4518247a9d0b4b pyDAL-17.8.tar.gz
+sha256 46abe2c978ec24013e29cf485a74c90309ebcd2f0d577687ff2d224547cebfc8  pyDAL-17.8.tar.gz
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 173fe6e..c8d4b44 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 17.1
+PYTHON_PYDAL_VERSION = 17.8
 PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://pypi.python.org/packages/64/9a/4fc08f6078b3a3019a9e33c8383bb023e064405dc5e16c273b8ec6d430cd
+PYTHON_PYDAL_SITE = https://pypi.python.org/packages/e3/bd/1d5ca8be486d845074161456637f7d73acc09dc6c8d69bf0e7ad55ce9027
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index 3b55153..bc2e605 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_PYTHON_WEB2PY
 	bool "python-web2py"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYDAL
-	select BR2_PACKAGE_PYTHON_ZLIB
-	select BR2_PACKAGE_PYTHON_PYEXPAT
-	select BR2_PACKAGE_PYTHON_SQLITE
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  web2py is a free open source full-stack framework for rapid
 	  development of fast, scalable, secure and portable
diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 9c1de90..adc7bc5 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 6079aeaa352ec51e0da5e6abc71fa74cdb3a781e06a311b5826618624362a7b2   python-web2py-R-2.14.6.tar.gz
+sha256 e432e051ebb826b77835bda03ddb16364b37d137b37ac33005b6ac0fd5d56280  python-web2py-R-2.15.4.tar.gz
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 887925b..9ad5a77 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.14.6
+PYTHON_WEB2PY_VERSION = R-2.15.4
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
+PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
+	python-pydal host-python-pydal
 
 PYTHON_WEB2PY_EXCLUSIONS = \
 	welcome.w2p \
@@ -30,7 +31,7 @@ PYTHON_WEB2PY_EXCLUSIONS = \
 	tox.ini
 
 define PYTHON_WEB2PY_GENERATE_PASSWORD
-	$(HOST_DIR)/bin/python2 -c 'import os; \
+	$(HOST_DIR)/bin/python -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
-- 
2.7.4
