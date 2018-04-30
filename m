From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 30 Apr 2018 12:23:58 -0700
Subject: [Buildroot] [PATCH 1/2] host-python: Select host python version
 when no target python
In-Reply-To: <20180430192359.15733-1-tpiepho@impinj.com>
References: <20180430192359.15733-1-tpiepho@impinj.com>
Message-ID: <20180430192359.15733-2-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot will select the host python version, 2 or 3, based on the
target python version.  Without a target python, one gets host python 2.

While both versions of host python can be built, only one can be the
default and have setuptools and distutils support.  This must match the
target python version, but if there is no target python version it could
be either 2 or 3.  Currently, the default host python will be 2 if there
is no target python selected and there is no way to change that.

This patch allows one to select host python 3 in this instance.  Iff
there is no target python selected, then a host package option for
python3 will be available.

If there is a target python selected, then this new option is forced by
that and no longer user selectable.

Add variable PKG_PYTHON_HOST_PYTHON to be used by non-python-packages
that need host-python.  If they can work with either host-python
version, they should use this variable to depend on the correct one.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/Config.in.host         | 1 +
 package/pkg-python.mk          | 6 +++++-
 package/python/python.mk       | 2 +-
 package/python3/Config.in.host | 8 ++++++++
 package/python3/python3.mk     | 2 +-
 5 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 package/python3/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index a8a4c1f802..aab431c8d6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -43,6 +43,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python3/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index f57e486dad..add100eedc 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -24,6 +24,10 @@ define PKG_PYTHON_SYSCONFIGDATA_NAME
 $(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata_m_linux_*.py)))
 endef
 
+# If a package, which is not a python-package, needs a host python, but it can
+# be either version, use this as the dependency
+PKG_PYTHON_HOST_PYTHON = $(if $(BR2_PACKAGE_HOST_PYTHON3),host-python3,host-python)
+
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
@@ -166,7 +170,7 @@ ifeq ($(4),target)
 $(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
 else
 ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
-$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_HOST_PYTHON3),host-python3,host-python)
 else
 ifeq ($$($(2)_NEEDS_HOST_PYTHON),python2)
 $(2)_DEPENDENCIES += host-python
diff --git a/package/python/python.mk b/package/python/python.mk
index aa7917ab46..ea68d49b19 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -225,7 +225,7 @@ PYTHON_AUTORECONF = YES
 # Some packages may have build scripts requiring python2.
 # Only install the python symlink in the host tree if python3 is not enabled
 # for the target, otherwise the default python program may be missing.
-ifneq ($(BR2_PACKAGE_PYTHON3),y)
+ifneq ($(BR2_PACKAGE_HOST_PYTHON3),y)
 define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
 	ln -sf python2 $(HOST_DIR)/bin/python
 	ln -sf python2-config $(HOST_DIR)/bin/python-config
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
new file mode 100644
index 0000000000..d5846df614
--- /dev/null
+++ b/package/python3/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON3
+	bool "host python3" if !BR2_PACKAGE_PYTHON3 && !BR2_PACKAGE_PYTHON
+	default BR2_PACKAGE_PYTHON3
+	help
+	  Use Python version 3 for the host Python version.
+
+	  If Python is enabled for the target, then this must match the target's
+	  Python version and this option is not user selectable.
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6e61108661..427f9616aa 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -244,7 +244,7 @@ endif
 # python version chosen for the target.
 # Only install the python symlink in the host tree if python3 is enabled
 # for the target.
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
 define HOST_PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(HOST_DIR)/bin/python
 	ln -fs python3-config $(HOST_DIR)/bin/python-config
-- 
2.14.3
