From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 21:07:41 -0700
Subject: [Buildroot] [PATCH 1/1] package/python3-setuptools: bump to version
 45.2.0
Message-ID: <20200213040741.119382-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased add executable patch.

We can no longer keep the python3 and python2 versions in sync as
python2 support was dropped in setuptools version 45.0.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-setuptools/python-setuptools.mk    |  2 -
 .../0001-add-executable.patch                 | 75 ++++++++++++++++++-
 .../python3-setuptools.hash                   |  4 +-
 .../python3-setuptools/python3-setuptools.mk  |  6 +-
 4 files changed, 79 insertions(+), 8 deletions(-)
 mode change 120000 => 100644 package/python3-setuptools/0001-add-executable.patch
 mode change 120000 => 100644 package/python3-setuptools/python3-setuptools.hash

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 163ba869ca..d1e724e6ca 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with
-# package/python3-setuptools/python3-setuptools.mk
 PYTHON_SETUPTOOLS_VERSION = 41.4.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/f4/d5/a6c19dcbcbc267aca376558797f036d9bcdff344c9f785fe7d0fe9a5f2a7
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
deleted file mode 120000
index 5bab3d96a1..0000000000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ /dev/null
@@ -1 +0,0 @@
-../python-setuptools/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
new file mode 100644
index 0000000000..56d9a7a0a3
--- /dev/null
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -0,0 +1,74 @@
+From 3c0f7caa8fed97f8211419adbf6bd64cf6123774 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 7 Dec 2015 01:14:33 +0100
+Subject: [PATCH] add executable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add a new --executable option to distribute so that we can
+force the shebang line in installed python scripts.
+
+[Thomas: refresh for setuptools 5.8.]
+[J?rg: refresh for setuptools 18.7.1]
+[James: refresh for setuptools 45.2.0]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ setuptools/command/install.py         | 2 ++
+ setuptools/command/install_scripts.py | 9 +++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/setuptools/command/install.py b/setuptools/command/install.py
+index 72b9a3e4..6781d2bc 100644
+--- a/setuptools/command/install.py
++++ b/setuptools/command/install.py
+@@ -16,6 +16,7 @@ class install(orig.install):
+     """Use easy_install to install the package, w/dependencies"""
+ 
+     user_options = orig.install.user_options + [
++        ('executable=', 'e', "specify final destination interpreter path"),
+         ('old-and-unmanageable', None, "Try not to use this!"),
+         ('single-version-externally-managed', None,
+          "used by system package builders to create 'flat' eggs"),
+@@ -31,6 +32,7 @@ class install(orig.install):
+ 
+     def initialize_options(self):
+         orig.install.initialize_options(self)
++        self.executable = None
+         self.old_and_unmanageable = None
+         self.single_version_externally_managed = None
+ 
+diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
+index 8c9a15e2..bf0417b6 100644
+--- a/setuptools/command/install_scripts.py
++++ b/setuptools/command/install_scripts.py
+@@ -12,6 +12,13 @@ class install_scripts(orig.install_scripts):
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
+         import setuptools.command.easy_install as ei
+@@ -32,6 +39,8 @@ class install_scripts(orig.install_scripts):
+         )
+         bs_cmd = self.get_finalized_command('build_scripts')
+         exec_param = getattr(bs_cmd, 'executable', None)
++        if self.executable is not None:
++            exec_param = self.executable
+         try:
+             bw_cmd = self.get_finalized_command("bdist_wininst")
+             is_wininst = getattr(bw_cmd, '_is_running', False)
+-- 
+2.20.1
+
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
deleted file mode 120000
index a3af7f0fb1..0000000000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-setuptools/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
new file mode 100644
index 0000000000..a3049a4a7f
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  0c956eea142af9c2b02d72e3c042af30  setuptools-45.2.0.zip
+sha256  89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992ae3397f  setuptools-45.2.0.zip
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 078cd9b072..1b7c7488b1 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# Please keep in sync with
-# package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 41.4.0
+PYTHON3_SETUPTOOLS_VERSION = 45.2.0
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/f4/d5/a6c19dcbcbc267aca376558797f036d9bcdff344c9f785fe7d0fe9a5f2a7
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/68/75/d1d7b7340b9eb6e0388bf95729e63c410b381eb71fe8875cdfd949d8f9ce
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
-- 
2.20.1
