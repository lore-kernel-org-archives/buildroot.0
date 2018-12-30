From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 30 Dec 2018 14:41:34 +0800
Subject: [Buildroot] [PATCH 1/2] package/python3-setuptools: new package
Message-ID: <1546152095-4439-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This package is used to build host-python3-setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk                              |  8 +++++-
 package/python-setuptools/python-setuptools.mk     |  1 +
 .../python3-setuptools/0001-add-executable.patch   |  1 +
 package/python3-setuptools/python3-setuptools.hash |  1 +
 package/python3-setuptools/python3-setuptools.mk   | 31 ++++++++++++++++++++++
 5 files changed, 41 insertions(+), 1 deletion(-)
 create mode 120000 package/python3-setuptools/0001-add-executable.patch
 create mode 120000 package/python3-setuptools/python3-setuptools.hash
 create mode 100644 package/python3-setuptools/python3-setuptools.mk

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 1ee465b..3f0da61 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -187,9 +187,13 @@ endif # ($(4),target)
 # depend on itself!).
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifneq ($(2),HOST_PYTHON_SETUPTOOLS)
+ifeq ($$($(2)_NEEDS_HOST_PYTHON),python3)
+$(2)_DEPENDENCIES += host-python3-setuptools
+else
 $(2)_DEPENDENCIES += host-python-setuptools
 endif
 endif
+endif
 
 # Python interpreter to use for building the package.
 #
@@ -208,7 +212,9 @@ endif
 ifeq ($(4),target)
 $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
 else
-ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
+ifeq ($(2),HOST_PYTHON3_SETUPTOOLS)
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python3
+else ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
 $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
 else
 $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index cc6f991..ae31454 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating this version, please also update it in package/python3-setuptools/
 PYTHON_SETUPTOOLS_VERSION = 40.6.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
new file mode 120000
index 0000000..5bab3d9
--- /dev/null
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -0,0 +1 @@
+../python-setuptools/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
new file mode 120000
index 0000000..a3af7f0
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -0,0 +1 @@
+../python-setuptools/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
new file mode 100644
index 0000000..a49e0b1
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# python3-setuptools
+#
+################################################################################
+
+# When updating this version, please also update it in package/python-setuptools/
+PYTHON3_SETUPTOOLS_VERSION = 40.6.3
+PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
+PYTHON3_SETUPTOOLS_DL_SUBDIR = setuptools
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
+PYTHON3_SETUPTOOLS_LICENSE = MIT
+PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
+PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
+
+PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
+
+define PYTHON3_SETUPTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
+endef
+
+define HOST_PYTHON3_SETUPTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(HOST_PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
+endef
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.7.4
