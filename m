From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 21 Jan 2015 21:26:21 +0100
Subject: [Buildroot] [RFC v2] python-lxml: add target package variant
Message-ID: <1421871981-3146-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: add working dependencies and provide path to XML libraries configs

 package/Config.in                  |  1 +
 package/python-lxml/Config.in      | 10 ++++++++++
 package/python-lxml/python-lxml.mk |  9 ++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 package/python-lxml/Config.in

diff --git a/package/Config.in b/package/Config.in
index 266de13..366e393 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ menu "external python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
diff --git a/package/python-lxml/Config.in b/package/python-lxml/Config.in
new file mode 100644
index 0000000..1ccaa5e
--- /dev/null
+++ b/package/python-lxml/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_LXML
+	bool "python-lxml"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_ZLIB
+	help
+	  The lxml XML toolkit is a Pythonic binding for the C libraries
+	  libxml2 and libxslt.
+
+	  http://lxml.de/
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 758ce87..a7f072f 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -20,6 +20,13 @@ PYTHON_LXML_LICENSE_FILES = \
 # So, we use setuptools.
 PYTHON_LXML_SETUP_TYPE = setuptools
 
-PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
+PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
 
+# python-lxml needs these scripts in order to properly detect libxml2 and
+# libxslt compiler and linker flags
+PYTHON_LXML_BUILD_OPTS = \
+	--with-xslt-config=$(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/xslt-config \
+	--with-xml2-config=$(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/xml2-config
+
+$(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.1.0
