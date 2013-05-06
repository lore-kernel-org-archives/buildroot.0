From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 10:15:22 -0300
Subject: [Buildroot] [PATCHv2] python-setuptools: forkbump and add
	workaround for shebangs
Message-ID: <1367846122-26209-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to distribute fork since it's maintained and fixes a few issues
while bumping to version 0.6.36.
There's work upstream in re-merging with setuptools which is now
supposedly maintained, see
http://mail.python.org/pipermail/distutils-sig/2013-March/020126.html

Buildroot python packages should use --single-version-externally-managed
and --root=/ in the install phase even if they're not setuptools-based.
This is because the default is to build egg files (zip files) for
packages to support multiple target versions, and since the packages
should be handled by buildroot infrastructure that's not needed.
Also potentially doing double-compression is time-wasting (i.e. egg
file and target filesystem) when running on slow targets.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../python-setuptools-add-executable.patch         | 50 ++++++++++++++++++++++
 package/python-setuptools/python-setuptools.mk     | 25 +++++++----
 2 files changed, 67 insertions(+), 8 deletions(-)
 create mode 100644 package/python-setuptools/python-setuptools-add-executable.patch

diff --git a/package/python-setuptools/python-setuptools-add-executable.patch b/package/python-setuptools/python-setuptools-add-executable.patch
new file mode 100644
index 0000000..7712709
--- /dev/null
+++ b/package/python-setuptools/python-setuptools-add-executable.patch
@@ -0,0 +1,50 @@
+Add a new --executable option to distribute so that we can
+force the shebang line in installed python scripts.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura distribute-0.6.36.orig/setuptools/command/install.py distribute-0.6.36/setuptools/command/install.py
+--- distribute-0.6.36.orig/setuptools/command/install.py	2013-04-13 09:46:23.160823598 -0300
++++ distribute-0.6.36/setuptools/command/install.py	2013-04-13 11:17:28.418841986 -0300
+@@ -6,6 +6,7 @@
+     """Use easy_install to install the package, w/dependencies"""
+
+     user_options = _install.user_options + [
++        ('executable=', 'e', "specify final destination interpreter path"),
+         ('old-and-unmanageable', None, "Try not to use this!"),
+         ('single-version-externally-managed', None,
+             "used by system package builders to create 'flat' eggs"),
+@@ -21,6 +22,7 @@
+
+     def initialize_options(self):
+         _install.initialize_options(self)
++        self.executable = None
+         self.old_and_unmanageable = None
+         self.single_version_externally_managed = None
+         self.no_compile = None  # make DISTUTILS_DEBUG work right!
+diff -Nura distribute-0.6.36.orig/setuptools/command/install_scripts.py distribute-0.6.36/setuptools/command/install_scripts.py
+--- distribute-0.6.36.orig/setuptools/command/install_scripts.py	2013-04-13 09:46:23.160823598 -0300
++++ distribute-0.6.36/setuptools/command/install_scripts.py	2013-04-13 11:24:32.305416400 -0300
+@@ -10,6 +10,13 @@
+     def initialize_options(self):
+         _install_scripts.initialize_options(self)
+         self.no_ep = False
++        self.executable = None
++
++    def finalize_options(self):
++        _install_scripts.finalize_options(self)
++        self.set_undefined_options('install',
++          ('executable','executable')
++        )
+
+     def run(self):
+         from setuptools.command.easy_install import get_script_args
+@@ -31,6 +38,8 @@
+         )
+         bs_cmd = self.get_finalized_command('build_scripts')
+         executable = getattr(bs_cmd,'executable',sys_executable)
++        if self.executable is not None:
++          executable = self.executable
+         is_wininst = getattr(
+             self.get_finalized_command("bdist_wininst"), '_is_running', False
+         )
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 25fddb9..1ff9f89 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,14 @@
 #
 #############################################################

-PYTHON_SETUPTOOLS_VERSION = 0.6c11
-PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+# "distribute" is a fork of the unmaintained setuptools package. There
+# are plans to re-merge it into setuptools; if this happens, we can
+# switch back to it.
+# See http://pypi.python.org/packages/source/s/setuptools
+
+PYTHON_SETUPTOOLS_VERSION = 0.6.36
+PYTHON_SETUPTOOLS_SOURCE  = distribute-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/d/distribute
 PYTHON_SETUPTOOLS_DEPENDENCIES = python

 define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
@@ -14,19 +19,23 @@ define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
 endef

 define PYTHON_SETUPTOOLS_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+	(cd $(@D); \
+	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py build)
 endef

 define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
-	(cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
+	(cd $(@D); \
+	PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
 endef

 define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
-	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
-	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+	(cd $(@D); \
+	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py install --executable=/usr/bin/python \
+	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
 endef

 $(eval $(generic-package))
 $(eval $(host-generic-package))
-
--
1.8.1.5
