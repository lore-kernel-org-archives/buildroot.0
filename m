From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 20:51:25 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/python-bcc: new package
In-Reply-To: <1556823086-29917-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556823086-29917-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556823086-29917-7-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bcc python wrapper required by bcc to
work properly.

audit package is used by python-bcc
to map system calls to their correspending
numbers in various architectures
that are different from x86_64.

python-bcc requires host-python-pytest-runner
to compile properly.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

---
Changes v1 => v2:
- Correcting typos and adding #runtime
comment.
- Invoke pytest-runner only when neccessary.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...e-pytest-runner-a-conditional-requirement.patch | 47 ++++++++++++++++++++++
 package/python-bcc/Config.in                       | 11 +++++
 package/python-bcc/python-bcc.hash                 |  3 ++
 package/python-bcc/python-bcc.mk                   | 15 +++++++
 6 files changed, 78 insertions(+)
 create mode 100644 package/python-bcc/0001-Make-pytest-runner-a-conditional-requirement.patch
 create mode 100644 package/python-bcc/Config.in
 create mode 100644 package/python-bcc/python-bcc.hash
 create mode 100644 package/python-bcc/python-bcc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dc83571..35451d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1225,6 +1225,7 @@ F:	package/python-websockets/
 F:	package/python-xlib/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/python-bcc
 F:	package/python-pytest
 F:	package/python-pytest-runner
 F:	package/python-traittypes
diff --git a/package/Config.in b/package/Config.in
index 4918ec5..38d5321 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -832,6 +832,7 @@ menu "External python modules"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
+	source "package/python-bcc/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-bcc/0001-Make-pytest-runner-a-conditional-requirement.patch b/package/python-bcc/0001-Make-pytest-runner-a-conditional-requirement.patch
new file mode 100644
index 0000000..219e850
--- /dev/null
+++ b/package/python-bcc/0001-Make-pytest-runner-a-conditional-requirement.patch
@@ -0,0 +1,47 @@
+From e7c8912e5e59de50fe359fe2e03f179c25c2dfbf Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Thu, 2 May 2019 17:18:16 +0200
+Subject: [PATCH] Make pytest runner a conditional requirement
+
+Check for pytest-runner only if setup.py was invoked with 'test'
+argument.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+---
+ python-bcc-0.1.10/setup.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/python-bcc-0.1.10/setup.py
+index c27e9a9..9a91e04 100644
+--- a/setup.py
++++ b/setup.py
+@@ -4,6 +4,7 @@
+ """The setup script."""
+ 
+ from setuptools import setup, find_packages
++import sys
+ 
+ with open('README.rst') as readme_file:
+     readme = readme_file.read()
+@@ -17,7 +18,8 @@ requirements = [
+     'traittypes',
+ ]
+ 
+-setup_requirements = ['pytest-runner', ]
++needs_pytest = set(['pytest', 'test', 'ptr']).intersection(sys.argv)
++pytest_runner = ['pytest-runner'] if needs_pytest else []
+ 
+ test_requirements = [
+     'pytest',
+@@ -46,7 +48,7 @@ setup(
+     keywords='bcc',
+     name='bcc',
+     packages=find_packages(include=['bcc']),
+-    setup_requires=setup_requirements,
++    setup_requires=pytest_runner,
+     test_suite='tests',
+     tests_require=test_requirements,
+     url='https://github.com/willsheffler/bcc',
+-- 
+2.7.4
+
diff --git a/package/python-bcc/Config.in b/package/python-bcc/Config.in
new file mode 100644
index 0000000..a007bc9
--- /dev/null
+++ b/package/python-bcc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_BCC
+	bool "python-bcc"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_AUDIT  # runtime
+	select BR2_PACKAGE_PYTHON_PYTEST_RUNNER
+	select BR2_PACKAGE_PYTHON_TRAITLETS # runtime
+	select BR2_PACKAGE_PYTHON_TRAITTYPES
+	help
+	  Python3 wrappers for BPF Compiler Collection (BCC).
+
+	  https://pypi.org/project/bcc/
diff --git a/package/python-bcc/python-bcc.hash b/package/python-bcc/python-bcc.hash
new file mode 100644
index 0000000..29caac9
--- /dev/null
+++ b/package/python-bcc/python-bcc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 a6f41ae67a8b697979d26bbc719fc9ea1b8bb47bdebb44b08fc0d5d308ae12b3  bcc-0.1.10.tar.gz
+sha256 c6386f8304dfdbfc5184f2f01c9b9f45c7cef27cf4ffdf9e138372487f7a9c2b  LICENSE
diff --git a/package/python-bcc/python-bcc.mk b/package/python-bcc/python-bcc.mk
new file mode 100644
index 0000000..5327e5e
--- /dev/null
+++ b/package/python-bcc/python-bcc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-bcc
+#
+################################################################################
+
+PYTHON_BCC_VERSION = 0.1.10
+PYTHON_BCC_SOURCE = bcc-$(PYTHON_BCC_VERSION).tar.gz
+PYTHON_BCC_SITE = https://files.pythonhosted.org/packages/38/dc/3ca34874926789f8df53f3c1d1c38e77ebf876f43760e8745316bb8bd1c0
+PYTHON_BCC_LICENSE = Apache-2.0
+PYTHON_BCC_LICENSE_FILES = LICENSE
+PYTHON_BCC_SETUP_TYPE = setuptools
+PYTHON_BCC_DEPENDENCIES = host-python-pytest-runner
+
+$(eval $(python-package))
-- 
2.7.4
