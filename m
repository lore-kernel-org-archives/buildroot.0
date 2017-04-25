From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Apr 2017 12:14:16 -0700
Subject: [Buildroot] [PATCH 2/9] package/python-traitlets: New package
In-Reply-To: <20170425191423.13294-1-andrew.smirnov@gmail.com>
References: <20170425191423.13294-1-andrew.smirnov@gmail.com>
Message-ID: <20170425191423.13294-3-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'traitlets'[1] package to Buildroot. Needed by IPython.

[1] https://pypi.python.org/pypi/traitlets

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-traitlets/Config.in             |  8 ++++++++
 package/python-traitlets/python-traitlets.hash |  2 ++
 package/python-traitlets/python-traitlets.mk   | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-traitlets/Config.in
 create mode 100644 package/python-traitlets/python-traitlets.hash
 create mode 100644 package/python-traitlets/python-traitlets.mk

diff --git a/package/Config.in b/package/Config.in
index eb6d197..47f43eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -843,6 +843,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
diff --git a/package/python-traitlets/Config.in b/package/python-traitlets/Config.in
new file mode 100644
index 0000000..ba79218
--- /dev/null
+++ b/package/python-traitlets/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TRAITLETS
+	select BR2_PACKAGE_PYTHON_DECORATOR
+	select BR2_PACKAGE_PYTHON_ENUM if BR2_PACKAGE_PYTHON
+	bool "python-traitlets"
+	help
+	  A configuration system for Python applications.
+
+	  https://pypi.python.org/pypi/traitlets
diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
new file mode 100644
index 0000000..3b14991
--- /dev/null
+++ b/package/python-traitlets/python-traitlets.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 370f938ad730d52272ef74f96f831cb21138f6168e46fe582fe256c35cc656ce python-traitlets-4.3.2.tar.gz
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
new file mode 100644
index 0000000..6cfd3e5
--- /dev/null
+++ b/package/python-traitlets/python-traitlets.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-traitlets
+#
+################################################################################
+
+PYTHON_TRAITLETS_VERSION = 4.3.2
+PYTHON_TRAITLETS_SOURCE = python-traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
+PYTHON_TRAITLETS_SITE = $(call github,ipython,traitlets,$(PYTHON_TRAITLETS_VERSION))
+PYTHON_TRAITLETS_LICENSE = BSD-3c
+PYTHON_TRAITLETS_SETUP_TYPE = distutils
+PYTHON_TRAITLETS_DEPENDENCIES = python-decorator
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_TRAITLETS_DEPENDENCIES += python-enum
+endif
+
+$(eval $(python-package))
-- 
2.9.3
