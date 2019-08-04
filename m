From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:16:29 -0400
Subject: [Buildroot] [PATCH 06/08] package/python-aioredis: new package
In-Reply-To: <20190804011631.86261-1-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
Message-ID: <20190804011631.86261-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

asyncio (PEP 3156) Redis client library.
Provides a simple and clear interface to Redis based on asyncio.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-aioredis/Config.in            | 13 +++++++++++++
 package/python-aioredis/python-aioredis.hash |  5 +++++
 package/python-aioredis/python-aioredis.mk   | 14 ++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/python-aioredis/Config.in
 create mode 100644 package/python-aioredis/python-aioredis.hash
 create mode 100644 package/python-aioredis/python-aioredis.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6375c9fcd3..980a2c9b35 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -57,6 +57,7 @@ F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
 F:	package/python3/
+F:	package/python-aioredis/
 F:	package/python-asgiref/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
diff --git a/package/Config.in b/package/Config.in
index 391df0ef61..58f220a807 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,6 +825,7 @@ menu "External python modules"
 	source "package/python-aiohttp-sse/Config.in"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiomonitor/Config.in"
+	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
diff --git a/package/python-aioredis/Config.in b/package/python-aioredis/Config.in
new file mode 100644
index 0000000000..aa410dc9a7
--- /dev/null
+++ b/package/python-aioredis/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_AIOREDIS
+	bool "python-aioredis"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # redis
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	select BR2_PACKAGE_PYTHON_HIREDIS # runtime
+	select BR2_PACKAGE_REDIS # runtime
+	help
+	  Provides simple and clear interface to Redis based on asyncio.
+
+	  https://github.com/aio-libs/aioredis
+
+comment "python-aioredis needs a toolchain w/ atomic"
+	depends on !BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
new file mode 100644
index 0000000000..19f147fdcc
--- /dev/null
+++ b/package/python-aioredis/python-aioredis.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aioredis/json
+md5	fd6c66e4d8efce553c369c0855c6fb49  aioredis-1.2.0.tar.gz
+sha256	84d62be729beb87118cf126c20b0e3f52d7a42bb7373dc5bcdd874f26f1f251a  aioredis-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a288b4f41b5531ff7e9e2df9cd3f17a1844badebc52d7a9205b131f8b8a50744  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
new file mode 100644
index 0000000000..02641ec7ac
--- /dev/null
+++ b/package/python-aioredis/python-aioredis.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aioredis
+#
+################################################################################
+
+PYTHON_AIOREDIS_VERSION = 1.2.0
+PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
+PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/a3/cd122b68d8071d332972027d225f548e0206001da1aa0685ea08db803b06
+PYTHON_AIOREDIS_SETUP_TYPE = setuptools
+PYTHON_AIOREDIS_LICENSE = MIT
+PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.21.0
