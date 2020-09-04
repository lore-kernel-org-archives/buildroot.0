From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Fri,  4 Sep 2020 16:33:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-opcua-asyncio : new package
In-Reply-To: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
References: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200904143301.6657-3-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opcua-asyncio is an asyncio-based asynchronous OPC UA client
based on python-opcua, removing hacks for support of
python < 3.6. 
Asynchronous programming allows for simpler code (e.g. less need
for locks) and potentially performance gains.

More information is available at :
https://github.com/FreeOpcUa/opcua-asyncio.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---

Package has been tested with check-package:
$ ./utils/check-package package/python-opcua-asyncio/*
31 lines processed
0 warnings generated
	
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-opcua-asyncio/Config.in                 | 14 ++++++++++++++
 package/python-opcua-asyncio/python-opcua-asyncio.hash |  3 +++
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-opcua-asyncio/Config.in
 create mode 100644 package/python-opcua-asyncio/python-opcua-asyncio.hash
 create mode 100644 package/python-opcua-asyncio/python-opcua-asyncio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5f66576b6f..7a289c1e46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1422,6 +1422,7 @@ N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 F:	package/python-aiofiles/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
+F:	package/python-opcua-asyncio/
 
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
diff --git a/package/Config.in b/package/Config.in
index f99fa83cd9..7a351a6ccb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1048,6 +1048,7 @@ menu "External python modules"
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
index 0000000000..2754c19059
--- /dev/null
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
+sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
new file mode 100644
index 0000000000..febde48ba5
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
+PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0
+PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.11.0
