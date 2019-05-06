From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon,  6 May 2019 10:15:44 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/python-pytest-runner: new package
In-Reply-To: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557130548-6267-4-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bcc needs this package because
python-bcc and python-pytest require this package
to work.
Setup scripts can use pytest-runner
to add setup.py test support for pytest runner.

python-bcc requires host pytest-runner
to compile properly.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

---
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Remove-setuptools_scm-dependency.patch    | 29 ++++++++++++++++++++++
 package/python-pytest-runner/Config.in             |  9 +++++++
 .../python-pytest-runner/python-pytest-runner.hash |  3 +++
 .../python-pytest-runner/python-pytest-runner.mk   | 15 +++++++++++
 6 files changed, 58 insertions(+)
 create mode 100644 package/python-pytest-runner/0001-Remove-setuptools_scm-dependency.patch
 create mode 100644 package/python-pytest-runner/Config.in
 create mode 100644 package/python-pytest-runner/python-pytest-runner.hash
 create mode 100644 package/python-pytest-runner/python-pytest-runner.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index abb6b4e..b7480c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1226,6 +1226,7 @@ F:	package/python-xlib/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 F:	package/python-pytest
+F:	package/python-pytest-runner
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 2a0aca9..4fcf4f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1016,6 +1016,7 @@ menu "External python modules"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytest/Config.in"
+	source "package/python-pytest-runner/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
diff --git a/package/python-pytest-runner/0001-Remove-setuptools_scm-dependency.patch b/package/python-pytest-runner/0001-Remove-setuptools_scm-dependency.patch
new file mode 100644
index 0000000..d67da8c
--- /dev/null
+++ b/package/python-pytest-runner/0001-Remove-setuptools_scm-dependency.patch
@@ -0,0 +1,29 @@
+From d04d8da1c410e97e023c300d6606dee46741ae28 Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Thu, 2 May 2019 16:41:34 +0200
+Subject: [PATCH] Remove setuptools_scm dependency
+
+setuptools_scm is an optional dependency of
+pytest-runner.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+
+---
+ host-python-pytest-runner-4.4/setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host-python-pytest-runner-4.4/setup.py b/host-python-pytest-runner-4.4/setup.py
+index b72262c..0396741 100644
+--- a/setup.py
++++ b/setup.py
+@@ -55,7 +55,7 @@ params = dict(
+ 		],
+ 	},
+ 	setup_requires=[
+-		'setuptools_scm>=1.15.0',
+ 	],
+ 	classifiers=[
+ 		"Development Status :: 5 - Production/Stable",
+-- 
+2.7.4
+
diff --git a/package/python-pytest-runner/Config.in b/package/python-pytest-runner/Config.in
new file mode 100644
index 0000000..01dea9d
--- /dev/null
+++ b/package/python-pytest-runner/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYTEST_RUNNER
+	bool "python-pytest-runner"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS_SCM
+	help
+	  Setup scripts can use pytest-runner to add setup.py
+	  test support for pytest runner.
+
+	  https://pypi.org/project/pytest-runner/
diff --git a/package/python-pytest-runner/python-pytest-runner.hash b/package/python-pytest-runner/python-pytest-runner.hash
new file mode 100644
index 0000000..da76c50
--- /dev/null
+++ b/package/python-pytest-runner/python-pytest-runner.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 00ad6cd754ce55b01b868a6d00b77161e4d2006b3918bde882376a0a884d0df4  pytest-runner-4.4.tar.gz
+sha256 a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pytest-runner/python-pytest-runner.mk b/package/python-pytest-runner/python-pytest-runner.mk
new file mode 100644
index 0000000..ffebea5
--- /dev/null
+++ b/package/python-pytest-runner/python-pytest-runner.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pytest-runner
+#
+################################################################################
+
+PYTHON_PYTEST_RUNNER_VERSION = 4.4
+PYTHON_PYTEST_RUNNER_SOURCE = pytest-runner-$(PYTHON_PYTEST_RUNNER_VERSION).tar.gz
+PYTHON_PYTEST_RUNNER_SITE = https://files.pythonhosted.org/packages/15/0a/1e73c3a3d3f4f5faf5eacac4e55675c1627b15d84265b80b8fef3f8a3fb5
+PYTHON_PYTEST_RUNNER_LICENSE = MIT
+PYTHON_PYTEST_RUNNER_LICENSE_FILES = LICENSE
+PYTHON_PYTEST_RUNNER_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.7.4
