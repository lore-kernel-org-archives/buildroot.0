From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:01:46 +0200
Subject: [Buildroot] [git commit] package/python-libconfig: fix build with
 python 3.8
Message-ID: <20191026135822.36C6E88537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=177013b86ec9d9820c8bbf98d66add3b6e51fda8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/edf32c178b7912a987e119f776a51f464424dceb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oost_python-name-depending-on-current-Pyt.patch | 44 ----------------------
 package/python-libconfig/python-libconfig.mk       | 12 ++++++
 2 files changed, 12 insertions(+), 44 deletions(-)

diff --git a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
deleted file mode 100644
index ec7aec4072..0000000000
--- a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 3bc4b9c0d60a735b1d63e52f74492ace39f02824 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 27 Jul 2017 09:46:07 +0200
-Subject: [PATCH] Determine boost_python name depending on current Python
- version
-
-Python2 requires boost_python27 and Python3 requires boost_python37
-(since boost 1.67).
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Bernd: adapted for python-3.7]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- setup.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index fdf5c27..4b38569 100644
---- a/setup.py
-+++ b/setup.py
-@@ -3,6 +3,10 @@
- from setuptools import setup, find_packages, Extension
- import sys, os
- 
-+boostlib = "boost_python37"
-+if sys.version_info < (3, 0):
-+    boostlib = "boost_python27"
-+
- setup(
-     name				= 'pylibconfig',
-     description			= "libconfig bindings for Python",
-@@ -19,7 +23,7 @@ setup(
-         Extension(
-             "pylibconfig",
-             ["src/pylibconfig.cc"],
--            libraries=["boost_python", "config++"]
-+            libraries=[boostlib, "config++"]
-             #include_dirs=includes,
-             #extra_link_args=lflags
-                  )
--- 
-2.11.0
-
diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
index 3f5984b665..2db7e99cf3 100644
--- a/package/python-libconfig/python-libconfig.mk
+++ b/package/python-libconfig/python-libconfig.mk
@@ -14,4 +14,16 @@ PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
 
 PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_LIBCONFIG_PYVER = $(PYTHON_VERSION_MAJOR)
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_LIBCONFIG_PYVER = $(PYTHON3_VERSION_MAJOR)
+endif
+
+define PYTHON_LIBCONFIG_FIX_SETUP
+	$(SED) 's/boost_python/boost_python$(subst .,,$(PYTHON_LIBCONFIG_PYVER))/g' \
+		$(@D)/setup.py
+endef
+PYTHON_LIBCONFIG_POST_PATCH_HOOKS += PYTHON_LIBCONFIG_FIX_SETUP
+
 $(eval $(python-package))
