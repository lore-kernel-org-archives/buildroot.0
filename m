From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:26:28 +0200
Subject: [Buildroot] [git commit] package/python-web2py: bump version to
 2.20.4
Message-ID: <20200610212525.73E708164C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a0257e3d974dd42fa70df1153969036cc7853ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps ptyhon-web2py to version 2.20.4

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ages.py-import-escape-from-html-instead-o.patch | 49 ----------------------
 package/python-web2py/python-web2py.hash           |  2 +-
 package/python-web2py/python-web2py.mk             |  4 +-
 3 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch b/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
deleted file mode 100644
index d6321e5592..0000000000
--- a/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From cf3c8e6ac8c428151dc191510554b4ee2705958d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 30 Oct 2019 10:08:35 +0100
-Subject: [PATCH] gluon/languages.py: import escape from html instead of cgi
-
-import escape from html and fallback on current import from cgi to fix
-the following build failure with python 3.8:
-
-/home/buildroot/autobuild/run/instance-2/output-1/host/bin/python -c 'import os; os.chdir("/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2"); from gluon.main import save_password; save_password("web2py",8000)'
-Traceback (most recent call last):
-  File "<string>", line 1, in <module>
-  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/__init__.py", line 34, in <module>
-    from .globals import current
-  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/globals.py", line 24, in <module>
-    from gluon.serializers import json, custom_json
-  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/serializers.py", line 10, in <module>
-    from gluon.languages import lazyT
-  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/languages.py", line 19, in <module>
-    from cgi import escape
-ImportError: cannot import name 'escape' from 'cgi' (/home/buildroot/autobuild/run/instance-2/output-1/host/lib/python3.8/cgi.py)
-
-Fixes:
- - http://autobuild.buildroot.org/results/fa515627ae888d08fc10074e8d9f6e9dbede91a7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/web2py/web2py/pull/2272]
----
- gluon/languages.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/gluon/languages.py b/gluon/languages.py
-index 9ed60f9c..554d7339 100644
---- a/gluon/languages.py
-+++ b/gluon/languages.py
-@@ -16,7 +16,10 @@ import re
- import sys
- import pkgutil
- import logging
--from cgi import escape
-+try:
-+    from html import escape
-+except ImportError:
-+    from cgi import escape
- from threading import RLock
- 
- from pydal._compat import copyreg, PY2, maketrans, iterkeys, unicodeT, to_unicode, to_bytes, iteritems, to_native, pjoin
--- 
-2.23.0
-
diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 57ac02c2a9..4ff85668a1 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 8205a7a08595ca1a41919750a8dc4e431258966cb46c8021564b25003cf90863  python-web2py-2.17.2.tar.gz
+sha256 e3f05266b4b97650b76bfb85028df5e2194955674c9b98cfc065c72ed5791690  python-web2py-2.20.4.tar.gz
 sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 8706c87968..9aebf4d19d 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.17.2
-PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,R-$(PYTHON_WEB2PY_VERSION))
+PYTHON_WEB2PY_VERSION = 2.20.4
+PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
