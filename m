From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Tue, 20 Oct 2015 21:01:39 +0200
Subject: [Buildroot] [PATCH] python-ranger: new package
Message-ID: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ranger is a console file manager with VI key bindings. It provides a
minimalistic and nice curses interface with a view on the directory hierarchy.
It ships with "rifle", a file launcher that is good at automatically finding
out which program to use for what file type.

http://ranger.nongnu.org
---
 package/Config.in                                 |  1 +
 package/python-ranger/0001-colorschemes-pyc.patch | 13 +++++++++++++
 package/python-ranger/Config.in                   | 13 +++++++++++++
 package/python-ranger/python-ranger.mk            | 21 +++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/python-ranger/0001-colorschemes-pyc.patch
 create mode 100644 package/python-ranger/Config.in
 create mode 100644 package/python-ranger/python-ranger.mk

diff --git a/package/Config.in b/package/Config.in
index 7392363..578ba1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -659,6 +659,7 @@ menu "External python modules"
 	source "package/python-pyxml/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-ranger/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
diff --git a/package/python-ranger/0001-colorschemes-pyc.patch b/package/python-ranger/0001-colorschemes-pyc.patch
new file mode 100644
index 0000000..6752cb4
--- /dev/null
+++ b/package/python-ranger/0001-colorschemes-pyc.patch
@@ -0,0 +1,13 @@
+Index: python-ranger-1.7.2/ranger/gui/colorscheme.py
+===================================================================
+--- python-ranger-1.7.2.orig/ranger/gui/colorscheme.py
++++ python-ranger-1.7.2/ranger/gui/colorscheme.py
+@@ -86,7 +86,7 @@ def _colorscheme_name_to_class(signal):
+     usecustom = not ranger.arg.clean
+ 
+     def exists(colorscheme):
+-        return os.path.exists(colorscheme + '.py')
++        return os.path.exists(colorscheme + '.py') or os.path.exists(colorscheme + '.pyc')
+ 
+     def is_scheme(x):
+         try:
diff --git a/package/python-ranger/Config.in b/package/python-ranger/Config.in
new file mode 100644
index 0000000..4ded82e
--- /dev/null
+++ b/package/python-ranger/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_RANGER
+	bool "python-ranger"
+	depends on BR2_PACKAGE_PYTHON3_CURSES || BR2_PACKAGE_PYTHON_CURSES
+	help
+	  ranger is a console file manager with VI key bindings. It provides a
+	  minimalistic and nice curses interface with a view on the directory hierarchy.
+	  It ships with "rifle", a file launcher that is good at automatically finding
+	  out which program to use for what file type.
+
+	  http://ranger.nongnu.org
+
+comment "python-ranger needs the curses python or python3 library"
+	depends on !BR2_PACKAGE_PYTHON3_CURSES && !BR2_PACKAGE_PYTHON_CURSES
diff --git a/package/python-ranger/python-ranger.mk b/package/python-ranger/python-ranger.mk
new file mode 100644
index 0000000..7272fbb
--- /dev/null
+++ b/package/python-ranger/python-ranger.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-ranger
+#
+################################################################################
+
+PYTHON_RANGER_VERSION = 1.7.2
+PYTHON_RANGER_SITE = $(call github,hut,ranger,v$(PYTHON_RANGER_VERSION))
+PYTHON_RANGER_SETUP_TYPE = distutils
+PYTHON_RANGER_LICENSE = GPLv3
+
+define PYTHON_RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
+	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+PYTHON_RANGER_POST_PATCH_HOOKS += PYTHON_RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
+endif
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.1.0
