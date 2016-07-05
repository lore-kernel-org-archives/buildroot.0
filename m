From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  5 Jul 2016 16:41:33 +0200
Subject: [Buildroot] [PATCH v2] circus: new package
Message-ID: <1467729693-27460-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: fix merge conflict (Maxime Hadjinlian)

 package/Config.in          |  1 +
 package/circus/Config.in   | 21 +++++++++++++++++++++
 package/circus/circus.hash |  3 +++
 package/circus/circus.mk   | 14 ++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/circus/Config.in
 create mode 100644 package/circus/circus.hash
 create mode 100644 package/circus/circus.mk

diff --git a/package/Config.in b/package/Config.in
index 6cc1d3e..4d3d202 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1635,6 +1635,7 @@ menu "System tools"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 	source "package/bootutils/Config.in"
+	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/dcron/Config.in"
diff --git a/package/circus/Config.in b/package/circus/Config.in
new file mode 100644
index 0000000..476a53e
--- /dev/null
+++ b/package/circus/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CIRCUS
+	bool "circus"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
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
+comment "circus needs a toolchain w/ C++, wchar, threads and Python2/3"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS && (BR2_PACKAGE_PYTHON || \
+		BR2_PACKAGE_PYTHON3))
diff --git a/package/circus/circus.hash b/package/circus/circus.hash
new file mode 100644
index 0000000..728cad5
--- /dev/null
+++ b/package/circus/circus.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/circus/json, sha256 locally computed
+md5	cddd4a8844907d8b6b402ca9c713d176  circus-0.13.0.tar.gz
+sha256	6201800a5fb05144b5e6c5ac9eb901b914305e8beaeb01f8edf54ab6ab1a295a  circus-0.13.0.tar.gz
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
new file mode 100644
index 0000000..a7693bd
--- /dev/null
+++ b/package/circus/circus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# circus
+#
+################################################################################
+
+CIRCUS_VERSION = 0.13.0
+CIRCUS_SOURCE = circus-$(CIRCUS_VERSION).tar.gz
+CIRCUS_SITE = https://pypi.python.org/packages/source/c/circus
+CIRCUS_SETUP_TYPE = setuptools
+CIRCUS_LICENSE = Apache-2.0
+CIRCUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.8.1
