From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Wed, 21 Oct 2015 00:16:07 +0200
Subject: [Buildroot] [PATCH v2] python-ranger: new package
In-Reply-To: <87y4exjpl2.fsf@dell.be.48ers.dk>
References: <87y4exjpl2.fsf@dell.be.48ers.dk>
Message-ID: <1445379367-14585-1-git-send-email-thijsvermeir@gmail.com>
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
 package/python-ranger/Config.in                    | 11 ++++++++
 package/python-ranger/python-ranger.hash           |  1 +
 package/python-ranger/python-ranger.mk             | 25 +++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/python-ranger/0001-colorscheme-check-for-compiled-python-files.patch
 create mode 100644 package/python-ranger/Config.in
 create mode 100644 package/python-ranger/python-ranger.hash
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
diff --git a/package/python-ranger/0001-colorscheme-check-for-compiled-python-files.patch b/package/python-ranger/0001-colorscheme-check-for-compiled-python-files.patch
new file mode 100644
index 0000000..bde3fee
--- /dev/null
+++ b/package/python-ranger/0001-colorscheme-check-for-compiled-python-files.patch
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
diff --git a/package/python-ranger/Config.in b/package/python-ranger/Config.in
new file mode 100644
index 0000000..da0506b
--- /dev/null
+++ b/package/python-ranger/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_RANGER
+	bool "python-ranger"
+	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3
+	help
+	  ranger is a console file manager with VI key bindings. It provides a
+	  minimalistic and nice curses interface with a view on the directory hierarchy.
+	  It ships with "rifle", a file launcher that is good at automatically finding
+	  out which program to use for what file type.
+
+	  http://ranger.nongnu.org
diff --git a/package/python-ranger/python-ranger.hash b/package/python-ranger/python-ranger.hash
new file mode 100644
index 0000000..4eaf344
--- /dev/null
+++ b/package/python-ranger/python-ranger.hash
@@ -0,0 +1 @@
+sha256 80917c93396e46272b6de63816d925eb708291a9f7a559d49b24c571ea0eeeb3 python-ranger-1.7.2.tar.gz
diff --git a/package/python-ranger/python-ranger.mk b/package/python-ranger/python-ranger.mk
new file mode 100644
index 0000000..0b1c68d
--- /dev/null
+++ b/package/python-ranger/python-ranger.mk
@@ -0,0 +1,25 @@
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
+# The ranger script request python to be called with -O (optimize generated
+# bytecode slightly; also PYTHONOPTIMIZE=x). This implicitly requires the python
+# source files to be present. Therefore, the -O flag is removed when only the .pyc
+# files are installed.
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
-- 
2.1.0
