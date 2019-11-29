From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:29:09 -0800
Subject: [Buildroot] [PATCH/next 3/4] package/python-gitpython: new package
In-Reply-To: <20191129212910.2537303-1-aduskett@gmail.com>
References: <20191129212910.2537303-1-aduskett@gmail.com>
Message-ID: <20191129212910.2537303-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

GitPython is a python library used to interact with git repositories, high-level
like git-porcelain, or low-level like git-plumbing.

It provides abstractions of git objects for easy access of repository data, and
additionally allows you to access the git repository more directly using either
a pure python implementation, or the faster, but more resource intensive git
command implementation.

The object database implementation is optimized for handling large quantities of
objects and large datasets, which is achieved by using low-level structures and
data streaming.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-gitpython/Config.in            | 21 +++++++++++++++++++
 .../python-gitpython/python-gitpython.hash    |  5 +++++
 package/python-gitpython/python-gitpython.mk  | 14 +++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/python-gitpython/Config.in
 create mode 100644 package/python-gitpython/python-gitpython.hash
 create mode 100644 package/python-gitpython/python-gitpython.mk

diff --git a/package/Config.in b/package/Config.in
index 15abe0871c..f01810b2cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -924,6 +924,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gitdb2/Config.in"
+	source "package/python-gitpython/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
diff --git a/package/python-gitpython/Config.in b/package/python-gitpython/Config.in
new file mode 100644
index 0000000000..3cd813a142
--- /dev/null
+++ b/package/python-gitpython/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_PYTHON_GITPYTHON
+	bool "python-gitpython"
+	depends on BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_GITDB2 # runtime
+	select BR2_PACKAGE_GIT # runtime
+	help
+	  GitPython is a python library used to interact with git
+	  repositories, high-level like git-porcelain, or low-level like
+	  git-plumbing.
+
+	  It provides abstractions of git objects for easy access of
+	  repository data, and additionally allows you to access the git
+	  repository more directly using either a pure python
+	  implementation, or the faster, but more resource intensive git
+	  command implementation.
+
+	  The object database implementation is optimized for handling
+	  large quantities of objects and large datasets, which is
+	  achieved by using low-level structures and data streaming.
+
+	  https://github.com/gitpython-developers/GitPython
diff --git a/package/python-gitpython/python-gitpython.hash b/package/python-gitpython/python-gitpython.hash
new file mode 100644
index 0000000000..928839d7fe
--- /dev/null
+++ b/package/python-gitpython/python-gitpython.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gitpython/json
+md5	7555ad89a22f663c25cced5f623bdef0  GitPython-3.0.5.tar.gz
+sha256	9c2398ffc3dcb3c40b27324b316f08a4f93ad646d5a6328cafbb871aa79f5e42  GitPython-3.0.5.tar.gz
+# Locally computed sha256 checksums
+sha256	fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
diff --git a/package/python-gitpython/python-gitpython.mk b/package/python-gitpython/python-gitpython.mk
new file mode 100644
index 0000000000..107cc8afa2
--- /dev/null
+++ b/package/python-gitpython/python-gitpython.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gitpython
+#
+################################################################################
+
+PYTHON_GITPYTHON_VERSION = 3.0.5
+PYTHON_GITPYTHON_SOURCE = GitPython-$(PYTHON_GITPYTHON_VERSION).tar.gz
+PYTHON_GITPYTHON_SITE = https://files.pythonhosted.org/packages/d2/e8/0bd80cc9e1422f5449d663479459c3c032ff7acaf6609a63324d23bde9ac
+PYTHON_GITPYTHON_SETUP_TYPE = setuptools
+PYTHON_GITPYTHON_LICENSE = BSD-3-Clause
+PYTHON_GITPYTHON_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.23.0
