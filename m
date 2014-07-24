From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Thu, 24 Jul 2014 15:08:49 -0400
Subject: [Buildroot] [PATCH] python-ipython: new package
Message-ID: <1406228929-32485-1-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/Config.in                                         |  1 +
 package/python-ipython/Config.in                          | 10 ++++++++++
 ...n-ipython-001-set-correct-python-executable-path.patch | 15 +++++++++++++++
 package/python-ipython/python-ipython.mk                  | 14 ++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/python-ipython/Config.in
 create mode 100644 package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch
 create mode 100644 package/python-ipython/python-ipython.mk

diff --git a/package/Config.in b/package/Config.in
index b232284..361db9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -475,6 +475,7 @@ menu "external python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
+	source "package/python-ipython/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
new file mode 100644
index 0000000..064f0c9
--- /dev/null
+++ b/package/python-ipython/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_IPYTHON
+	bool "python-ipython"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	help
+	  IPython is a command shell for interactive computing in multiple
+	  programming languages, originally developed for the Python
+	  programming language, that offers enhanced introspection, rich
+	  media, additional shell syntax, tab completion, and rich history.
+
+	  http://ipython.org/
diff --git a/package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch b/package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch
new file mode 100644
index 0000000..0fbd5a1
--- /dev/null
+++ b/package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch
@@ -0,0 +1,15 @@
+Set correct Python executable path
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+
+--- python-ipython-2.1.0/setupbase.py	2014-05-21 15:19:12.000000000 -0400
++++ python-ipython-2.1.0-new/setupbase.py	2014-07-23 23:34:32.892030423 -0400
+@@ -394,7 +394,7 @@ class build_scripts_entrypt(build_script
+ 
+             mod, func = entrypt.split(':')
+             with open(outfile, 'w') as f:
+-                f.write(script_src.format(executable=sys.executable,
++                f.write(script_src.format(executable='/usr/bin/env python',
+                                           mod=mod, func=func))
+ 
+         return outfiles, outfiles
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
new file mode 100644
index 0000000..d1daa7f
--- /dev/null
+++ b/package/python-ipython/python-ipython.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ipython
+#
+################################################################################
+
+PYTHON_IPYTHON_VERSION = 2.1.0
+PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
+PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/source/i/ipython/
+PYTHON_IPYTHON_LICENSE = BSD-3c
+PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
+PYTHON_IPYTHON_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.0.2
