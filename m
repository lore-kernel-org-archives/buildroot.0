From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Oct 2019 10:36:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: fix build with
 python 3.8
Message-ID: <20191030093605.4210-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/fa515627ae888d08fc10074e8d9f6e9dbede91a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...py-import-escape-from-html-instead-o.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch

diff --git a/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch b/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
new file mode 100644
index 0000000000..4c9b43a146
--- /dev/null
+++ b/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
@@ -0,0 +1,46 @@
+From 4a5204f7847e6b83d7d2f4fe54244e2087117d9e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 30 Oct 2019 10:08:35 +0100
+Subject: [PATCH] gluon/languages.py: import escape from html instead of cgi
+
+import escape from html instead of cgi to fix the following build
+failure with python 3.8:
+
+/home/buildroot/autobuild/run/instance-2/output-1/host/bin/python -c 'import os; os.chdir("/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2"); from gluon.main import save_password; save_password("web2py",8000)'
+Traceback (most recent call last):
+  File "<string>", line 1, in <module>
+  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/__init__.py", line 34, in <module>
+    from .globals import current
+  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/globals.py", line 24, in <module>
+    from gluon.serializers import json, custom_json
+  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/serializers.py", line 10, in <module>
+    from gluon.languages import lazyT
+  File "/home/buildroot/autobuild/run/instance-2/output-1/build/python-web2py-2.17.2/gluon/languages.py", line 19, in <module>
+    from cgi import escape
+ImportError: cannot import name 'escape' from 'cgi' (/home/buildroot/autobuild/run/instance-2/output-1/host/lib/python3.8/cgi.py)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fa515627ae888d08fc10074e8d9f6e9dbede91a7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/web2py/web2py/pull/2272]
+---
+ gluon/languages.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gluon/languages.py b/gluon/languages.py
+index 9ed60f9c..b6d8d57a 100644
+--- a/gluon/languages.py
++++ b/gluon/languages.py
+@@ -16,7 +16,7 @@ import re
+ import sys
+ import pkgutil
+ import logging
+-from cgi import escape
++from html import escape
+ from threading import RLock
+ 
+ from pydal._compat import copyreg, PY2, maketrans, iterkeys, unicodeT, to_unicode, to_bytes, iteritems, to_native, pjoin
+-- 
+2.23.0
+
-- 
2.23.0
