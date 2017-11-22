From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:33:39 +0100
Subject: [Buildroot] [git commit branch/next] python-raven: new package
Message-ID: <20171122213720.6EC29814DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=273aad9e507eedf5245a004be8f7372a7c4d5ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes since v2:
- remove newlines from Config.in
- add LICENSE hash

Changes since v1:
- reword commit to match upstream style
- fold the DEVELOPERS modifications into the same commit
- add Config selections for required python core modules
- bump version to 6.3.0

Tested in a clean chroot, events are generated for exceptions, and
reported to the server configured for the client.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-raven/Config.in         | 12 ++++++++++++
 package/python-raven/python-raven.hash |  5 +++++
 package/python-raven/python-raven.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index df61a01..966a30b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -796,6 +796,7 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/python-raven/
 F:	package/python-websockets/
 
 N:	Johan Derycke <johanderycke@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 23526b4..a207de8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -875,6 +875,7 @@ menu "External python modules"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-raven/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
diff --git a/package/python-raven/Config.in b/package/python-raven/Config.in
new file mode 100644
index 0000000..0d4b26c
--- /dev/null
+++ b/package/python-raven/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_RAVEN
+	bool "python-raven"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	help
+	  Raven is a client for Sentry (https://getsentry.com).
+
+	  https://github.com/getsentry/raven-python
diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
new file mode 100644
index 0000000..3ed1239
--- /dev/null
+++ b/package/python-raven/python-raven.hash
@@ -0,0 +1,5 @@
+# md5 from https://pypi.python.org/pypi/raven/json, sha256 locally computed
+md5	2efce7acbabe1a0f32d168736a654789  raven-6.3.0.tar.gz
+sha256	f3e465a545dcdb6a387d1fcb199d08f786ba3732d7ce6aa681718b04da6aedf1  raven-6.3.0.tar.gz
+# License file, locally calculated
+sha256	5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
new file mode 100644
index 0000000..c17aac4
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
