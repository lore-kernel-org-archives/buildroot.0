From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 18:01:29 +0100
Subject: [Buildroot] [PATCH 1/3] package/python3-setuptools: new package
In-Reply-To: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
References: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181228170132.13049-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package allows to install the host version of setuptools for
python3, regardless of what the default Python version is. It will be
used by the python-package infrastructure to make sure that host
Python packages that need python3 and setuptools have setuptools
installed for Python 3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-add-executable.patch                 | 72 +++++++++++++++++++
 .../python3-setuptools.hash                   |  1 +
 .../python3-setuptools/python3-setuptools.mk  | 24 +++++++
 3 files changed, 97 insertions(+)
 create mode 100644 package/python3-setuptools/0001-add-executable.patch
 create mode 120000 package/python3-setuptools/python3-setuptools.hash
 create mode 100644 package/python3-setuptools/python3-setuptools.mk

diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
new file mode 100644
index 0000000000..1f8714eaeb
--- /dev/null
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -0,0 +1,72 @@
+From 9b3d307f8f6a1af88f3f810f5a6cf0835830e1e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 7 Dec 2015 01:14:33 +0100
+Subject: [PATCH 1/1] add executable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add a new --executable option to distribute so that we can
+force the shebang line in installed python scripts.
+
+[Thomas: refresh for setuptools 5.8.]
+[J?rg: refresh for setuptools 18.7.1]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ setuptools/command/install.py         | 2 ++
+ setuptools/command/install_scripts.py | 9 +++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/setuptools/command/install.py b/setuptools/command/install.py
+index d2bca2e..b60ef19 100644
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
+index be66cb2..07afaf8 100755
+--- a/setuptools/command/install_scripts.py
++++ b/setuptools/command/install_scripts.py
+@@ -11,6 +11,13 @@ class install_scripts(orig.install_scripts):
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
+@@ -31,6 +38,8 @@ class install_scripts(orig.install_scripts):
+         )
+         bs_cmd = self.get_finalized_command('build_scripts')
+         exec_param = getattr(bs_cmd, 'executable', None)
++        if self.executable is not None:
++            exec_param = self.executable
+         bw_cmd = self.get_finalized_command("bdist_wininst")
+         is_wininst = getattr(bw_cmd, '_is_running', False)
+         writer = ei.ScriptWriter
+-- 
+2.6.3
+
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
new file mode 120000
index 0000000000..a3af7f0fb1
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -0,0 +1 @@
+../python-setuptools/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
new file mode 100644
index 0000000000..b6de5d4b25
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# python3-setuptools
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-setuptools/python-setuptools.mk
+PYTHON3_SETUPTOOLS_VERSION = 40.6.3
+PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
+PYTHON3_SETUPTOOLS_LICENSE = MIT
+PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
+PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
+HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
+HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
+
+define HOST_PYTHON3_SETUPTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(HOST_PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
+endef
+
+$(eval $(host-python-package))
-- 
2.20.1
