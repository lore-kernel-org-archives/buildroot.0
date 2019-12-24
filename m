From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:45:57 +0100
Subject: [Buildroot] [git commit] package/python-lockfile: new package
Message-ID: <20191225145259.9592F8E273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5cc2ac91da7197d14298b2344dbaf2a89b71cdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lockfile package exports a LockFile class which provides a
simple API for locking files. Unlike the Windows
msvcrt.locking function, the fcntl.lockf and flock functions,
and the deprecated posixfile module, the API is identical
across both Unix (including Linux and Mac) and Windows
platforms.

The lock mechanism relies on the atomic nature of the link
(on Unix) and mkdir (on Windows) system calls. An
implementation based on SQLite is also provided, more as a
demonstration of the possibilities it provides than as
production-quality code.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-lockfile/Config.in            | 17 +++++++++++++++++
 package/python-lockfile/python-lockfile.hash |  5 +++++
 package/python-lockfile/python-lockfile.mk   | 15 +++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a125b45b38..e72ec0d70a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -63,6 +63,7 @@ F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-gitdb2/
+F:	package/python-lockfile/
 F:	package/python-mutagen/
 F:	package/python-pbr/
 F:	package/python-pip/
diff --git a/package/Config.in b/package/Config.in
index efe90dfc09..44e2b9fe31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -976,6 +976,7 @@ menu "External python modules"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
+	source "package/python-lockfile/Config.in"
 	source "package/python-logbook/Config.in"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
diff --git a/package/python-lockfile/Config.in b/package/python-lockfile/Config.in
new file mode 100644
index 0000000000..0e4a0fdd7d
--- /dev/null
+++ b/package/python-lockfile/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_LOCKFILE
+	bool "python-lockfile"
+	help
+	  The lockfile package exports a LockFile class which provides a
+	  simple API for locking files. Unlike the Windows
+	  msvcrt.locking function, the fcntl.lockf and flock functions,
+	  and the deprecated posixfile module, the API is identical
+	  across both Unix (including Linux and Mac) and Windows
+	  platforms.
+
+	  The lock mechanism relies on the atomic nature of the link
+	  (on Unix) and mkdir (on Windows) system calls. An
+	  implementation based on SQLite is also provided, more as a
+	  demonstration of the possibilities it provides than as
+	  production-quality code.
+
+	  https://pypi.org/project/lockfile/
diff --git a/package/python-lockfile/python-lockfile.hash b/package/python-lockfile/python-lockfile.hash
new file mode 100644
index 0000000000..ac1b7d2d4d
--- /dev/null
+++ b/package/python-lockfile/python-lockfile.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/project/lockfile/#copy-hash-modal-3c1db9ec-dd6e-4d06-8543-91094f428ac0
+md5	a6a1a82957a23afdf44cfdd039b65ff9  lockfile-0.12.2.tar.gz
+sha256	6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799  lockfile-0.12.2.tar.gz
+# Locally computed sha256
+sha256 a26276d53dacb369641f31aa0fe37216028a0d93753f862ae206ce04f54b7b29 LICENSE
diff --git a/package/python-lockfile/python-lockfile.mk b/package/python-lockfile/python-lockfile.mk
new file mode 100644
index 0000000000..212edcdcae
--- /dev/null
+++ b/package/python-lockfile/python-lockfile.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-lockfile
+#
+################################################################################
+
+PYTHON_LOCKFILE_VERSION = 0.12.2
+PYTHON_LOCKFILE_SOURCE = lockfile-$(PYTHON_LOCKFILE_VERSION).tar.gz
+PYTHON_LOCKFILE_SITE = https://files.pythonhosted.org/packages/17/47/72cb04a58a35ec495f96984dddb48232b551aafb95bde614605b754fe6f7
+PYTHON_LOCKFILE_SETUP_TYPE = setuptools
+PYTHON_LOCKFILE_LICENSE = MIT
+PYTHON_LOCKFILE_LICENSE_FILES = LICENSE
+PYTHON_LOCKFILE_DEPENDENCIES = host-python-pbr
+
+$(eval $(python-package))
