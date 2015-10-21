From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Wed, 21 Oct 2015 21:09:18 +0200
Subject: [Buildroot] [PATCH v4] python-ranger: new package
Message-ID: <1445454558-16326-1-git-send-email-thijsvermeir@gmail.com>
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

Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>

---
Changes v3 -> v4:
- rename python-ranger -> ranger
- move to Shell and Utilities
- select python3 if needed

Changes v2 -> v3:
- add LICENSE_FILES

Changes v1 -> v2:
- use upstream documented patch for detecting .pyc files
- signed-off patches
- select curses package depending on python version
- documented post patch hook
- remove host-python-package
- add sha256 hash
---
 package/Config.in                                  |  1 +
 ...lorscheme-check-for-compiled-python-files.patch | 31 ++++++++++++++++++++++
 package/ranger/Config.in                           | 15 +++++++++++
 package/ranger/ranger.hash                         |  1 +
 package/ranger/ranger.mk                           | 26 ++++++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
 create mode 100644 package/ranger/Config.in
 create mode 100644 package/ranger/ranger.hash
 create mode 100644 package/ranger/ranger.mk

diff --git a/package/Config.in b/package/Config.in
index 7392363..0e9c30c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1456,6 +1456,7 @@ comment "Utilities"
 	source "package/logrotate/Config.in"
 	source "package/logsurfer/Config.in"
 	source "package/pinentry/Config.in"
+	source "package/ranger/Config.in"
 	source "package/screen/Config.in"
 	source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch b/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
new file mode 100644
index 0000000..bde3fee
--- /dev/null
+++ b/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
@@ -0,0 +1,31 @@
+From 654e3116825c4d12340613196279fb13a5662113 Mon Sep 17 00:00:00 2001
+From: Thijs Vermeir <thijsvermeir@gmail.com>
+Date: Tue, 20 Oct 2015 18:13:36 +0200
+Subject: [PATCH] colorscheme: check for compiled python files
+
+Some systems only provide *.pyc files
+
+Patch accepted upstream:
+https://github.com/hut/ranger/commit/d69f1ed3207c785d1a39ddd2992f6abb021b7540
+
+Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
+---
+ ranger/gui/colorscheme.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ranger/gui/colorscheme.py b/ranger/gui/colorscheme.py
+index d6afcac..d2b3b2d 100644
+--- a/ranger/gui/colorscheme.py
++++ b/ranger/gui/colorscheme.py
+@@ -86,7 +86,7 @@ def _colorscheme_name_to_class(signal):
+     usecustom = not ranger.arg.clean
+ 
+     def exists(colorscheme):
+-        return os.path.exists(colorscheme + '.py')
++        return os.path.exists(colorscheme + '.py') or os.path.exists(colorscheme + '.pyc')
+ 
+     def is_scheme(x):
+         try:
+-- 
+2.6.1
+
diff --git a/package/ranger/Config.in b/package/ranger/Config.in
new file mode 100644
index 0000000..9a2c60c
--- /dev/null
+++ b/package/ranger/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_RANGER
+	bool "ranger"
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3
+	help
+	  ranger is a console file manager with VI key bindings. It provides a
+	  minimalistic and nice curses interface with a view on the directory hierarchy.
+	  It ships with "rifle", a file launcher that is good at automatically finding
+	  out which program to use for what file type.
+
+	  http://ranger.nongnu.org
diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
new file mode 100644
index 0000000..989d76e
--- /dev/null
+++ b/package/ranger/ranger.hash
@@ -0,0 +1 @@
+sha256 80917c93396e46272b6de63816d925eb708291a9f7a559d49b24c571ea0eeeb3 ranger-1.7.2.tar.gz
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
new file mode 100644
index 0000000..46f318b
--- /dev/null
+++ b/package/ranger/ranger.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# ranger
+#
+################################################################################
+
+RANGER_VERSION = 1.7.2
+RANGER_SITE = $(call github,hut,ranger,v$(RANGER_VERSION))
+RANGER_SETUP_TYPE = distutils
+RANGER_LICENSE = GPLv3
+RANGER_LICENSE_FILES = AUTHORS
+
+# The ranger script request python to be called with -O (optimize generated
+# bytecode slightly; also PYTHONOPTIMIZE=x). This implicitly requires the python
+# source files to be present. Therefore, the -O flag is removed when only the .pyc
+# files are installed.
+
+define RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
+	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+RANGER_POST_PATCH_HOOKS += RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
+endif
+
+$(eval $(python-package))
-- 
2.1.0
