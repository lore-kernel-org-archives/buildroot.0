From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:32:41 +0200
Subject: [Buildroot] [git commit] python-setuptools: bump to version 5.8
Message-ID: <20141005123249.AE927B08F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cc3f70e9b1db6e9b77a46b5201cf4442f44ebda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A refresh of the existing patch is needed, and the patch is also
renamed to use the correct patch file naming convention.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-setuptools-0001-add-executable.patch    |   55 ++++++++++++++++++++
 .../python-setuptools-add-executable.patch         |   50 ------------------
 package/python-setuptools/python-setuptools.mk     |    6 +-
 3 files changed, 58 insertions(+), 53 deletions(-)

diff --git a/package/python-setuptools/python-setuptools-0001-add-executable.patch b/package/python-setuptools/python-setuptools-0001-add-executable.patch
new file mode 100644
index 0000000..502d099
--- /dev/null
+++ b/package/python-setuptools/python-setuptools-0001-add-executable.patch
@@ -0,0 +1,55 @@
+Add a new --executable option to distribute so that we can
+force the shebang line in installed python scripts.
+
+[Thomas: refresh for setuptools 5.8.]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setuptools/command/install.py
+===================================================================
+--- a/setuptools/command/install.py
++++ b/setuptools/command/install.py
+@@ -16,6 +16,7 @@
+     """Use easy_install to install the package, w/dependencies"""
+ 
+     user_options = orig.install.user_options + [
++        ('executable=', 'e', "specify final destination interpreter path"),
+         ('old-and-unmanageable', None, "Try not to use this!"),
+         ('single-version-externally-managed', None,
+          "used by system package builders to create 'flat' eggs"),
+@@ -31,6 +32,7 @@
+ 
+     def initialize_options(self):
+         orig.install.initialize_options(self)
++        self.executable = None
+         self.old_and_unmanageable = None
+         self.single_version_externally_managed = None
+ 
+Index: b/setuptools/command/install_scripts.py
+===================================================================
+--- a/setuptools/command/install_scripts.py
++++ b/setuptools/command/install_scripts.py
+@@ -11,6 +11,13 @@
+     def initialize_options(self):
+         orig.install_scripts.initialize_options(self)
+         self.no_ep = False
++        self.executable = None
++
++    def finalize_options(self):
++        orig.install_scripts.finalize_options(self)
++        self.set_undefined_options('install',
++                ('executable','executable')
++        )
+ 
+     def run(self):
+         from setuptools.command.easy_install import get_script_args
+@@ -32,6 +39,8 @@
+         )
+         bs_cmd = self.get_finalized_command('build_scripts')
+         executable = getattr(bs_cmd, 'executable', sys_executable)
++        if self.executable is not None:
++            executable = self.executable
+         is_wininst = getattr(
+             self.get_finalized_command("bdist_wininst"), '_is_running', False
+         )
diff --git a/package/python-setuptools/python-setuptools-add-executable.patch b/package/python-setuptools/python-setuptools-add-executable.patch
deleted file mode 100644
index 7712709..0000000
--- a/package/python-setuptools/python-setuptools-add-executable.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Add a new --executable option to distribute so that we can
-force the shebang line in installed python scripts.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura distribute-0.6.36.orig/setuptools/command/install.py distribute-0.6.36/setuptools/command/install.py
---- distribute-0.6.36.orig/setuptools/command/install.py	2013-04-13 09:46:23.160823598 -0300
-+++ distribute-0.6.36/setuptools/command/install.py	2013-04-13 11:17:28.418841986 -0300
-@@ -6,6 +6,7 @@
-     """Use easy_install to install the package, w/dependencies"""
-
-     user_options = _install.user_options + [
-+        ('executable=', 'e', "specify final destination interpreter path"),
-         ('old-and-unmanageable', None, "Try not to use this!"),
-         ('single-version-externally-managed', None,
-             "used by system package builders to create 'flat' eggs"),
-@@ -21,6 +22,7 @@
-
-     def initialize_options(self):
-         _install.initialize_options(self)
-+        self.executable = None
-         self.old_and_unmanageable = None
-         self.single_version_externally_managed = None
-         self.no_compile = None  # make DISTUTILS_DEBUG work right!
-diff -Nura distribute-0.6.36.orig/setuptools/command/install_scripts.py distribute-0.6.36/setuptools/command/install_scripts.py
---- distribute-0.6.36.orig/setuptools/command/install_scripts.py	2013-04-13 09:46:23.160823598 -0300
-+++ distribute-0.6.36/setuptools/command/install_scripts.py	2013-04-13 11:24:32.305416400 -0300
-@@ -10,6 +10,13 @@
-     def initialize_options(self):
-         _install_scripts.initialize_options(self)
-         self.no_ep = False
-+        self.executable = None
-+
-+    def finalize_options(self):
-+        _install_scripts.finalize_options(self)
-+        self.set_undefined_options('install',
-+          ('executable','executable')
-+        )
-
-     def run(self):
-         from setuptools.command.easy_install import get_script_args
-@@ -31,6 +38,8 @@
-         )
-         bs_cmd = self.get_finalized_command('build_scripts')
-         executable = getattr(bs_cmd,'executable',sys_executable)
-+        if self.executable is not None:
-+          executable = self.executable
-         is_wininst = getattr(
-             self.get_finalized_command("bdist_wininst"), '_is_running', False
-         )
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 54a11c4..fa90ed4 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 2.1.2
-PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+PYTHON_SETUPTOOLS_VERSION = 5.8
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation or Zope Public License
 PYTHON_SETUPTOOLS_LICENSE_FILES = PKG-INFO
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
