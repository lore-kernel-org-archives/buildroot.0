From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Feb 2021 21:57:24 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/python3-setuptools: bump to
 version 53.0.0
Message-ID: <20210211045724.4182457-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased add executable patch.

We can no longer keep the python3 and python2 versions in sync as
python2 support was dropped in setuptools version 53.0.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Update to 53.0.0 from 46.1.3
  - Use 53.0.0 for both target and host python3
---
 .../{ => 44.0.0}/0001-add-executable.patch    |  0
 .../53.0.0/0001-add-executable.patch          |  1 +
 .../python-setuptools/python-setuptools.hash  |  2 +
 .../python-setuptools/python-setuptools.mk    | 27 +++++--
 .../0001-add-executable.patch                 | 75 ++++++++++++++++++-
 ...setuptools.hash => python-setuptools.hash} |  0
 .../python3-setuptools/python3-setuptools.mk  | 10 +--
 7 files changed, 102 insertions(+), 13 deletions(-)
 rename package/python-setuptools/{ => 44.0.0}/0001-add-executable.patch (100%)
 create mode 120000 package/python-setuptools/53.0.0/0001-add-executable.patch
 mode change 120000 => 100644 package/python3-setuptools/0001-add-executable.patch
 rename package/python3-setuptools/{python3-setuptools.hash => python-setuptools.hash} (100%)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/44.0.0/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/0001-add-executable.patch
rename to package/python-setuptools/44.0.0/0001-add-executable.patch
diff --git a/package/python-setuptools/53.0.0/0001-add-executable.patch b/package/python-setuptools/53.0.0/0001-add-executable.patch
new file mode 120000
index 0000000000..6a35e5fd85
--- /dev/null
+++ b/package/python-setuptools/53.0.0/0001-add-executable.patch
@@ -0,0 +1 @@
+../../python3-setuptools/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 769b68c35d..bddb7cb331 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,6 @@
 # From https://pypi.org/pypi/setuptools/json
 md5  32b6cdce670ce462086d246bea181e9d  setuptools-44.0.0.zip
+md5  73aa0d4f02cec851514165d1ca8aef2b  setuptools-53.0.0.tar.gz
 sha256  e5baf7723e5bb8382fc146e33032b241efc63314211a3a120aaa55d62d2bb008  setuptools-44.0.0.zip
+sha256  1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5  setuptools-53.0.0.tar.gz
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 08a180ce0c..2e34aad9b7 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,11 +4,20 @@
 #
 ################################################################################
 
+HOST_PYTHON_SETUPTOOLS_VERSION = 44.0.0
+HOST_PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
+HOST_PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
-PYTHON_SETUPTOOLS_VERSION = 44.0.0
-PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+PYTHON_SETUPTOOLS_VERSION = 53.0.0
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/12/68/95515eaff788370246dac534830ea9ccb0758e921ac9e9041996026ecaf2
+else
+PYTHON_SETUPTOOLS_VERSION = $(HOST_PYTHON_SETUPTOOLS_VERSION)
+PYTHON_SETUPTOOLS_SOURCE = $(HOST_PYTHON_SETUPTOOLS_SOURCE)
+PYTHON_SETUPTOOLS_SITE = $(HOST_PYTHON_SETUPTOOLS_SITE)
+endif
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
@@ -16,16 +25,22 @@ PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+define PYTHON_SETUPTOOLS_EXTRACT_CMDS
+	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
+endef
+else
 define PYTHON_SETUPTOOLS_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
 	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
 	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
 endef
+endif
 
 define HOST_PYTHON_SETUPTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
-	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
+	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(HOST_PYTHON_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)
 endef
 
 $(eval $(python-package))
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
index 0000000000..60be8d42a4
--- /dev/null
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -0,0 +1,74 @@
+From bece6bdbc7ffea53e09751b4ec6d9e5103b9a814 Mon Sep 17 00:00:00 2001
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
+[James: refresh for setuptools 53.0.0]
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
+2.25.1
+
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python-setuptools.hash
similarity index 100%
rename from package/python3-setuptools/python3-setuptools.hash
rename to package/python3-setuptools/python-setuptools.hash
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 3f4f1100fe..30c2eefe4f 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 44.0.0
-PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+PYTHON3_SETUPTOOLS_VERSION = 53.0.0
+PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/12/68/95515eaff788370246dac534830ea9ccb0758e921ac9e9041996026ecaf2
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
@@ -16,9 +16,7 @@ HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
 HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
 
 define HOST_PYTHON3_SETUPTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
-	mv $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
+	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $(HOST_PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
 endef
 
 $(eval $(host-python-package))
-- 
2.25.1
