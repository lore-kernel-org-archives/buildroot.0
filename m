From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 21:00:03 +0200
Subject: [Buildroot] [git commit] package/python-opcua-asyncio: new package
Message-ID: <20200906185156.852418852A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dc5e1a9cc387219c6a0557a61bba6c7363ed27c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opcua-asyncio is an asyncio-based asynchronous OPC UA client
based on python-opcua, removing hacks for support of
python < 3.6.
Asynchronous programming allows for simpler code (e.g. less need
for locks) and potentially performance gains.

More information is available at :
https://github.com/FreeOpcUa/opcua-asyncio.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-opcua-asyncio/Config.in                 | 14 ++++++++++++++
 package/python-opcua-asyncio/python-opcua-asyncio.hash |  3 +++
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 93cccef70d..93a86811ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1428,6 +1428,7 @@ F:	package/python-aiofiles/
 F:	package/python-crayons/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
+F:	package/python-opcua-asyncio/
 F:	package/python-piexif/
 
 N:	Juha Rantanen <juha@codercoded.com>
diff --git a/package/Config.in b/package/Config.in
index 9d5124e838..02213310a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1050,6 +1050,7 @@ menu "External python modules"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
+	source "package/python-opcua-asyncio/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
new file mode 100644
index 0000000000..6dee004b9b
--- /dev/null
+++ b/package/python-opcua-asyncio/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
+	bool "python-opcua-asyncio"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_DATEUTIL #runtime
+	select BR2_PACKAGE_PYTHON_PYTZ #runtime
+	select BR2_PACKAGE_PYTHON_LXML #runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY #runtime
+	select BR2_PACKAGE_PYTHON_AIOFILES #runtime
+	help
+	  opcua-asyncio is an asyncio-based asynchronous
+	  OPC UA client based on python-opcua, removing
+	  hacks for support of python < 3.6.
+
+	  https://github.com/FreeOpcUa/opcua-asyncio
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
new file mode 100644
index 0000000000..d8aee272de
--- /dev/null
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
new file mode 100644
index 0000000000..50b581037b
--- /dev/null
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-opcua-asyncio
+#
+################################################################################
+
+PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
+PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
+PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
+PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
+PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
+PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
