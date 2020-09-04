From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Fri,  4 Sep 2020 16:33:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-aiofiles : new package
In-Reply-To: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
References: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200904143301.6657-2-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ordinary local file IO is blocking, and cannot easily and
portably made asynchronous.
This means doing file IO may interfere with asyncio applications,
which shouldn?t block the executing thread. aiofiles helps
with this y introducing asynchronous versions of files
that support delegating operations to a separate thread pool.

More information is available at :
https://pypi.org/project/aiofiles.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
Package has been tested with check-package:
$ ./utils/check-package package/python-aiofiles/*
27 lines processed
0 warnings generated

 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-aiofiles/Config.in            |  8 ++++++++
 package/python-aiofiles/python-aiofiles.hash |  5 +++++
 package/python-aiofiles/python-aiofiles.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-aiofiles/Config.in
 create mode 100644 package/python-aiofiles/python-aiofiles.hash
 create mode 100644 package/python-aiofiles/python-aiofiles.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d306c5f025..5f66576b6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1419,6 +1419,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/python-aiofiles/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
 
diff --git a/package/Config.in b/package/Config.in
index 3b6ced8f0f..f99fa83cd9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -856,6 +856,7 @@ menu "External python modules"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aioconsole/Config.in"
 	source "package/python-aiodns/Config.in"
+	source "package/python-aiofiles/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-cors/Config.in"
 	source "package/python-aiohttp-debugtoolbar/Config.in"
diff --git a/package/python-aiofiles/Config.in b/package/python-aiofiles/Config.in
new file mode 100644
index 0000000000..9cc3d7fe59
--- /dev/null
+++ b/package/python-aiofiles/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOFILES
+	bool "python-aiofiles"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  aiofiles aims to  handle local disk files in
+	  asyncio applications.
+
+	  https://pypi.org/project/aiofiles
diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
new file mode 100644
index 0000000000..3c3e8565a3
--- /dev/null
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiofiles/json
+md5  2243eff06072115e8afe8907677ca51d  aiofiles-0.5.0.tar.gz
+sha256  98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af  aiofiles-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
new file mode 100644
index 0000000000..28f41e3967
--- /dev/null
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiofiles
+#
+################################################################################
+
+PYTHON_AIOFILES_VERSION = 0.5.0
+PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/2b/64/437053d6a4ba3b3eea1044131a25b458489320cb9609e19ac17261e4dc9b
+PYTHON_AIOFILES_SETUP_TYPE = setuptools
+PYTHON_AIOFILES_LICENSE = Apache-2.0
+PYTHON_AIOFILES_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
