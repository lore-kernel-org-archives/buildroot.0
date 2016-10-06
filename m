From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 06:48:58 +0200
Subject: [Buildroot] [PATCH 5/5] package/python-mwscrape: new package
In-Reply-To: <20161006044858.27768-1-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
Message-ID: <20161006044858.27768-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                            |  1 +
 package/python-mwscrape/Config.in            | 10 ++++++++++
 package/python-mwscrape/python-mwscrape.hash |  2 ++
 package/python-mwscrape/python-mwscrape.mk   | 17 +++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-mwscrape/Config.in
 create mode 100644 package/python-mwscrape/python-mwscrape.hash
 create mode 100644 package/python-mwscrape/python-mwscrape.mk

diff --git a/package/Config.in b/package/Config.in
index 1f6b397..ebe173c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -709,6 +709,7 @@ menu "External python modules"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-mwclient/Config.in"
+	source "package/python-mwscrape/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
diff --git a/package/python-mwscrape/Config.in b/package/python-mwscrape/Config.in
new file mode 100644
index 0000000..bc2efb1
--- /dev/null
+++ b/package/python-mwscrape/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_MWSCRAPE
+	bool "python-mwscrape"
+	select BR2_PACKAGE_PYTHON_COUCHDB
+	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_MWCLIENT
+	select BR2_PACKAGE_PYTHON_PYLRU
+	help
+	  Download rendered articles from MediaWiki API to CouchDB
+
+	  https://github.com/itkach/mwscrape
diff --git a/package/python-mwscrape/python-mwscrape.hash b/package/python-mwscrape/python-mwscrape.hash
new file mode 100644
index 0000000..b91ef69
--- /dev/null
+++ b/package/python-mwscrape/python-mwscrape.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 8de8a5ef257851f6e1e41247f64710f48859a5e3f91ebc7200bb60769f02f296  python-mwscrape-6a58d7801eb1e884fd0516f1adbedbd4481c10e6.tar.gz
diff --git a/package/python-mwscrape/python-mwscrape.mk b/package/python-mwscrape/python-mwscrape.mk
new file mode 100644
index 0000000..44d156b
--- /dev/null
+++ b/package/python-mwscrape/python-mwscrape.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-mwscrape
+#
+################################################################################
+
+PYTHON_MWSCRAPE_VERSION = 6a58d7801eb1e884fd0516f1adbedbd4481c10e6
+PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
+PYTHON_MWSCRAPE_LICENSE = BSD-3c
+PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt
+PYTHON_MWSCRAPE_DEPENDENCIES = python-couchdb \
+	$(if $(BR2_PACKAGE_PYTHON),python-futures,) \
+	python-mwclient \
+	python-pylru
+PYTHON_MWSCRAPE_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.3
