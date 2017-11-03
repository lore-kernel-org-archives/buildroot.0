From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  3 Nov 2017 14:01:27 -0700
Subject: [Buildroot] [PATCH v2] python-raven: new package
Message-ID: <20171103210127.19979-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v1:
- reword commit to match upstream style
- fold the DEVELOPERS modifications into the same commit
- add Config selections for required python core modules
- bump version to 6.3.0

Tested in a clean chroot, events are generated for exceptions, and
reported to the server configured for the client.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/python-raven/Config.in         | 15 +++++++++++++++
 package/python-raven/python-raven.hash |  3 +++
 package/python-raven/python-raven.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/python-raven/Config.in
 create mode 100644 package/python-raven/python-raven.hash
 create mode 100644 package/python-raven/python-raven.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 49fa789c1d..3fc9d52a1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -787,6 +787,9 @@ F:	package/pdbg/
 F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig

+N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/python-raven/
+
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/

diff --git a/package/Config.in b/package/Config.in
index 28444f64de..13a3bf0406 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -874,6 +874,7 @@ menu "External python modules"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-raven/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
diff --git a/package/python-raven/Config.in b/package/python-raven/Config.in
new file mode 100644
index 0000000000..f8954e085c
--- /dev/null
+++ b/package/python-raven/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_RAVEN
+	bool "python-raven"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+
+	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+
+	help
+	  Raven is a client for Sentry (https://getsentry.com).
+
+	  https://github.com/getsentry/raven-python
diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
new file mode 100644
index 0000000000..0e0a4f56e5
--- /dev/null
+++ b/package/python-raven/python-raven.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/raven/json, sha256 locally computed
+md5	2efce7acbabe1a0f32d168736a654789  raven-6.3.0.tar.gz
+sha256	f3e465a545dcdb6a387d1fcb199d08f786ba3732d7ce6aa681718b04da6aedf1  raven-6.3.0.tar.gz
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
new file mode 100644
index 0000000000..c17aac4a3d
--- /dev/null
+++ b/package/python-raven/python-raven.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-raven
+#
+################################################################################
+
+PYTHON_RAVEN_VERSION = 6.3.0
+PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
+PYTHON_RAVEN_SITE = https://pypi.python.org/packages/e8/b0/27886f69cdb4d9f6265bba1c4973bb5371b060272a5795c511d8839a6028
+PYTHON_RAVEN_SETUP_TYPE = setuptools
+PYTHON_RAVEN_LICENSE = BSD-3-Clause
+PYTHON_RAVEN_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
--
2.15.0
