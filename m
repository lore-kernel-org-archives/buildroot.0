From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 17:01:34 +0100
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
	18.7.1
Message-ID: <20151212172408.370D480830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49ae39e27d2349c810413bfa8bf1e45d8f25c9dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also refresh patch (using git) and add an additional (stronger) sha256 hash.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-setuptools/0001-add-executable.patch    | 45 +++++++++++++++-------
 package/python-setuptools/python-setuptools.hash   |  6 ++-
 package/python-setuptools/python-setuptools.mk     |  2 +-
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index 502d099..1f8714e 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,16 +1,30 @@
+From 9b3d307f8f6a1af88f3f810f5a6cf0835830e1e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 7 Dec 2015 01:14:33 +0100
+Subject: [PATCH 1/1] add executable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Add a new --executable option to distribute so that we can
 force the shebang line in installed python scripts.
 
 [Thomas: refresh for setuptools 5.8.]
+[J??rg: refresh for setuptools 18.7.1]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ setuptools/command/install.py         | 2 ++
+ setuptools/command/install_scripts.py | 9 +++++++++
+ 2 files changed, 11 insertions(+)
 
-Index: b/setuptools/command/install.py
-===================================================================
+diff --git a/setuptools/command/install.py b/setuptools/command/install.py
+index d2bca2e..b60ef19 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -16,6 +16,7 @@
+@@ -16,6 +16,7 @@ class install(orig.install):
      """Use easy_install to install the package, w/dependencies"""
  
      user_options = orig.install.user_options + [
@@ -18,7 +32,7 @@ Index: b/setuptools/command/install.py
          ('old-and-unmanageable', None, "Try not to use this!"),
          ('single-version-externally-managed', None,
           "used by system package builders to create 'flat' eggs"),
-@@ -31,6 +32,7 @@
+@@ -31,6 +32,7 @@ class install(orig.install):
  
      def initialize_options(self):
          orig.install.initialize_options(self)
@@ -26,11 +40,11 @@ Index: b/setuptools/command/install.py
          self.old_and_unmanageable = None
          self.single_version_externally_managed = None
  
-Index: b/setuptools/command/install_scripts.py
-===================================================================
+diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
+index be66cb2..07afaf8 100755
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -11,6 +11,13 @@
+@@ -11,6 +11,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -43,13 +57,16 @@ Index: b/setuptools/command/install_scripts.py
 +        )
  
      def run(self):
-         from setuptools.command.easy_install import get_script_args
-@@ -32,6 +39,8 @@
+         import setuptools.command.easy_install as ei
+@@ -31,6 +38,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
-         executable = getattr(bs_cmd, 'executable', sys_executable)
+         exec_param = getattr(bs_cmd, 'executable', None)
 +        if self.executable is not None:
-+            executable = self.executable
-         is_wininst = getattr(
-             self.get_finalized_command("bdist_wininst"), '_is_running', False
-         )
++            exec_param = self.executable
+         bw_cmd = self.get_finalized_command("bdist_wininst")
+         is_wininst = getattr(bw_cmd, '_is_running', False)
+         writer = ei.ScriptWriter
+-- 
+2.6.3
+
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 80c526d..88113fa 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,2 +1,4 @@
-# From https://pypi.python.org/pypi/setuptools/5.8
-md5 356480fdf03590cfdf4210cf8366bcaf setuptools-5.8.tar.gz
+# From https://pypi.python.org/pypi/setuptools/18.7.1
+md5 a0984da9cd8d7b582e1fd7de67dfdbcc setuptools-18.7.1.tar.gz
+# Locally calculated
+sha256  aff36c95035e0b311eacb1434e3f7e85f5ccaad477773847e582978f8f45bd74  setuptools-18.7.1.tar.gz
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index fa90ed4..15edc6f 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 5.8
+PYTHON_SETUPTOOLS_VERSION = 18.7.1
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation or Zope Public License
