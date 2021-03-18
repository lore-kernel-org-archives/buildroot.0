From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Mar 2021 22:42:52 -0600
Subject: [Buildroot] [PATCH v3 1/2] package/python3-setuptools: bump to
 version 54.1.2
Message-ID: <20210318044253.3202355-1-james.hilliard1@gmail.com>
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
Changes v2 -> v3:
  - Update to 54.1.2 from 53.0.0
Changes v1 -> v2:
  - Update to 53.0.0 from 46.1.3
  - Use 53.0.0 for both target and host python3
---
 .../{ => 44.0.0}/0001-add-executable.patch    |  0
 .../{ => 44.0.0}/python-setuptools.hash       |  0
 .../54.1.2/0001-add-executable.patch          |  1 +
 .../54.1.2/python3-setuptools.hash            |  1 +
 .../python-setuptools/python-setuptools.mk    | 27 +++++--
 .../0001-add-executable.patch                 | 75 ++++++++++++++++++-
 .../python3-setuptools.hash                   |  5 +-
 .../python3-setuptools/python3-setuptools.mk  | 10 +--
 8 files changed, 105 insertions(+), 14 deletions(-)
 rename package/python-setuptools/{ => 44.0.0}/0001-add-executable.patch (100%)
 rename package/python-setuptools/{ => 44.0.0}/python-setuptools.hash (100%)
 create mode 120000 package/python-setuptools/54.1.2/0001-add-executable.patch
 create mode 120000 package/python-setuptools/54.1.2/python3-setuptools.hash
 mode change 120000 => 100644 package/python3-setuptools/0001-add-executable.patch
 mode change 120000 => 100644 package/python3-setuptools/python3-setuptools.hash

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/44.0.0/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/0001-add-executable.patch
rename to package/python-setuptools/44.0.0/0001-add-executable.patch
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/44.0.0/python-setuptools.hash
similarity index 100%
rename from package/python-setuptools/python-setuptools.hash
rename to package/python-setuptools/44.0.0/python-setuptools.hash
diff --git a/package/python-setuptools/54.1.2/0001-add-executable.patch b/package/python-setuptools/54.1.2/0001-add-executable.patch
new file mode 120000
index 0000000000..6a35e5fd85
--- /dev/null
+++ b/package/python-setuptools/54.1.2/0001-add-executable.patch
@@ -0,0 +1 @@
+../../python3-setuptools/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python-setuptools/54.1.2/python3-setuptools.hash b/package/python-setuptools/54.1.2/python3-setuptools.hash
new file mode 120000
index 0000000000..d385f4cbb3
--- /dev/null
+++ b/package/python-setuptools/54.1.2/python3-setuptools.hash
@@ -0,0 +1 @@
+../../python3-setuptools/python3-setuptools.hash
\ No newline at end of file
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 08a180ce0c..4dd2994c7c 100644
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
+PYTHON_SETUPTOOLS_VERSION = 54.1.2
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b8/d3/155ebd29b6e34ac283614d3a1e7f476ffb93f535aa0d8b3647fa014815aa
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
index 0000000000..c9d363cd36
--- /dev/null
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -0,0 +1,74 @@
+From b325d59820450a4bd04c3466999a7b2e2ab5546f Mon Sep 17 00:00:00 2001
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
+[James: refresh for setuptools 54.1.2]
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
index 0000000000..6d1c01100e
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  684e00a094af81fac87ffe0bcf5732c4  setuptools-54.1.2.tar.gz
+sha256  ebd0148faf627b569c8d2a1b20f5d3b09c873f12739d71c7ee88f037d5be82ff  setuptools-54.1.2.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 3f4f1100fe..538417bece 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 44.0.0
-PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+PYTHON3_SETUPTOOLS_VERSION = 54.1.2
+PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b8/d3/155ebd29b6e34ac283614d3a1e7f476ffb93f535aa0d8b3647fa014815aa
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
