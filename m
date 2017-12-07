From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Dec 2017 09:20:19 +0100
Subject: [Buildroot] [PATCH 3/5] python-tabledata: new package
In-Reply-To: <20171207082021.4605-1-yegorslists@googlemail.com>
References: <20171207082021.4605-1-yegorslists@googlemail.com>
Message-ID: <20171207082021.4605-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                              |  1 +
 package/python-tabledata/Config.in             | 12 ++++++++++++
 package/python-tabledata/python-tabledata.hash |  4 ++++
 package/python-tabledata/python-tabledata.mk   | 21 +++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/python-tabledata/Config.in
 create mode 100644 package/python-tabledata/python-tabledata.hash
 create mode 100644 package/python-tabledata/python-tabledata.mk

diff --git a/package/Config.in b/package/Config.in
index 433224c3a4..9c9a4a7ac7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,6 +909,7 @@ menu "External python modules"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-systemd/Config.in"
+	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-thrift/Config.in"
diff --git a/package/python-tabledata/Config.in b/package/python-tabledata/Config.in
new file mode 100644
index 0000000000..9e8ca9c31d
--- /dev/null
+++ b/package/python-tabledata/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_TABLEDATA
+	bool "python-tabledata"
+	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
+	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
+	help
+	  A Python library to represent tabular data for
+	  pytablewriter/pytablereader/SimpleSQLite.
+
+	  https://github.com/thombashi/tabledata
diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
new file mode 100644
index 0000000000..efc6d6a826
--- /dev/null
+++ b/package/python-tabledata/python-tabledata.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/tabledata/json, sha256 locally computed
+md5	4ff69d8855a835890944591721d0c129  tabledata-0.0.5.tar.gz
+sha256	e16490e4c15f06ee258015431ec247a5b301aec4ebca3297cf6451efb9eb3cfb  tabledata-0.0.5.tar.gz
+sha256  cbce2ac14dd81b6a1155029034512a304505692cc63b625538916cf93bee8ca2  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
new file mode 100644
index 0000000000..1305909374
--- /dev/null
+++ b/package/python-tabledata/python-tabledata.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-tabledata
+#
+################################################################################
+
+PYTHON_TABLEDATA_VERSION = 0.0.5
+PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
+PYTHON_TABLEDATA_SITE = https://pypi.python.org/packages/9d/03/2e96d18f2bd4b76611fc6aa3881c7e15c857eea99debea9b80ec689354ba
+PYTHON_TABLEDATA_SETUP_TYPE = setuptools
+PYTHON_TABLEDATA_LICENSE = MIT
+PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
+
+# remove setup.cfg as it tries to create a wheel file and hence
+# breaks the build process
+define PYTHON_TABLEDATA_REMOVE_SETUP_CFG
+	rm $(@D)/setup.cfg
+endef
+PYTHON_TABLEDATA_POST_EXTRACT_HOOKS = PYTHON_TABLEDATA_REMOVE_SETUP_CFG
+
+$(eval $(python-package))
-- 
2.11.0
