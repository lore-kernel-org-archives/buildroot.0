From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 22 Apr 2016 15:36:29 +0200
Subject: [Buildroot] [PATCH 2/3] python-circus: new package
In-Reply-To: <1461332190-18340-1-git-send-email-yegorslists@googlemail.com>
References: <1461332190-18340-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1461332190-18340-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-circus/Config.in          | 20 ++++++++++++++++++++
 package/python-circus/python-circus.hash |  4 ++++
 package/python-circus/python-circus.mk   | 14 ++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/python-circus/Config.in
 create mode 100644 package/python-circus/python-circus.hash
 create mode 100644 package/python-circus/python-circus.mk

diff --git a/package/Config.in b/package/Config.in
index 2f45582..e635b7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -640,6 +640,7 @@ menu "External python modules"
 	source "package/python-characteristic/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
+	source "package/python-circus/Config.in"
 	source "package/python-click/Config.in"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
diff --git a/package/python-circus/Config.in b/package/python-circus/Config.in
new file mode 100644
index 0000000..ba4da5c
--- /dev/null
+++ b/package/python-circus/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PYTHON_CIRCUS
+	bool "python-circus"
+	depends on BR2_USE_WCHAR # zeromq
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	select BR2_PACKAGE_PYTHON_IOWAIT # runtime
+	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
+	select BR2_PACKAGE_PYTHON_PYZMQ # runtime
+	select BR2_PACKAGE_PYTHON_TORNADO # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  Circus is a program that will let you run and watch multiple
+	  processes and sockets.
+
+	  https://circus.readthedocs.org/en/latest/
+
+comment "python-circus needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/python-circus/python-circus.hash b/package/python-circus/python-circus.hash
new file mode 100644
index 0000000..01994f4
--- /dev/null
+++ b/package/python-circus/python-circus.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/circus/json
+md5	cddd4a8844907d8b6b402ca9c713d176  circus-0.13.0.tar.gz
+# sha256 calculated by scanpypi
+sha256	6201800a5fb05144b5e6c5ac9eb901b914305e8beaeb01f8edf54ab6ab1a295a  circus-0.13.0.tar.gz
diff --git a/package/python-circus/python-circus.mk b/package/python-circus/python-circus.mk
new file mode 100644
index 0000000..9e5391e
--- /dev/null
+++ b/package/python-circus/python-circus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-circus
+#
+################################################################################
+
+PYTHON_CIRCUS_VERSION = 0.13.0
+PYTHON_CIRCUS_SOURCE = circus-$(PYTHON_CIRCUS_VERSION).tar.gz
+PYTHON_CIRCUS_SITE = https://pypi.python.org/packages/source/c/circus
+PYTHON_CIRCUS_SETUP_TYPE = setuptools
+PYTHON_CIRCUS_LICENSE = Apache-2.0
+PYTHON_CIRCUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.8.0.rc3
