From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 22:32:53 +0100
Subject: [Buildroot] [git commit] python-aiohttp: new package
Message-ID: <20181202071557.3384081583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce697dbdccf6a4f4b3494044d37186417f9c05b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Async http client/server framework (asyncio).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-aiohttp/Config.in           | 14 ++++++++++++++
 package/python-aiohttp/python-aiohttp.hash |  5 +++++
 package/python-aiohttp/python-aiohttp.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff95f6aba2..1cfa9969bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -988,6 +988,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-aiodns/
+F:	package/python-aiohttp/
 F:	package/python-async-timeout/
 F:	package/python-cchardet/
 F:	package/python-multidict/
diff --git a/package/Config.in b/package/Config.in
index 6fa09bab32..ce8d70c458 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -796,6 +796,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aiodns/Config.in"
+	source "package/python-aiohttp/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
new file mode 100644
index 0000000000..81862c9bba
--- /dev/null
+++ b/package/python-aiohttp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP
+	bool "python-aiohttp"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
+	select BR2_PACKAGE_PYTHON_CHARDET if !BR2_INSTALL_LIBSTDCPP # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	select BR2_PACKAGE_PYTHON_YARL # runtime
+	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	help
+	  Async http client/server framework (asyncio).
+
+	  https://github.com/aio-libs/aiohttp
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
new file mode 100644
index 0000000000..8f158af3cb
--- /dev/null
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp/json
+md5	80a6e0c6c452d511d1d37755d6f0995a  aiohttp-3.4.4.tar.gz
+sha256	51afec6ffa50a9da4cdef188971a802beb1ca8e8edb40fa429e5e529db3475fa  aiohttp-3.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256	bb0c0eeae85492ebfa03442b7784d4c42a623e15346df54ae85f55df972a82af  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
new file mode 100644
index 0000000000..df8bdfb4b2
--- /dev/null
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp
+#
+################################################################################
+
+PYTHON_AIOHTTP_VERSION = 3.4.4
+PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/70/27/6098b4b60a3302a97f8ec97eb85d42f55a2fa904da4a369235a8e3b84352
+PYTHON_AIOHTTP_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
