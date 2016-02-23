From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Feb 2016 22:07:37 -0600
Subject: [Buildroot] [PATCH 1/1] raptor: new package
Message-ID: <1456200457-47727-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in          |  1 +
 package/raptor/Config.in   | 13 +++++++++++++
 package/raptor/raptor.hash |  2 ++
 package/raptor/raptor.mk   | 19 +++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/raptor/Config.in
 create mode 100644 package/raptor/raptor.hash
 create mode 100644 package/raptor/raptor.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..3f0b442 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "JSON/XML"
 	source "package/mxml/Config.in"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
+	source "package/raptor/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/xerces/Config.in"
diff --git a/package/raptor/Config.in b/package/raptor/Config.in
new file mode 100644
index 0000000..61bc49b
--- /dev/null
+++ b/package/raptor/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RAPTOR
+	bool "raptor"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_YAJL
+	help
+	  A C library that provides a set of parsers and
+	  serializers that generate Resource Description
+	  Framework (RDF) triples by parsing syntaxes or
+	  serialize the triples into a syntax.
+
+	  http://librdf.org/raptor/
diff --git a/package/raptor/raptor.hash b/package/raptor/raptor.hash
new file mode 100644
index 0000000..ee7a71b
--- /dev/null
+++ b/package/raptor/raptor.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed raptor2-2.0.15.tar.gz
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
new file mode 100644
index 0000000..128e444
--- /dev/null
+++ b/package/raptor/raptor.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# raptor
+#
+################################################################################
+
+RAPTOR_VERSION = 2.0.15
+RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
+RAPTOR_SITE = http://download.librdf.org/source
+RAPTOR_DEPENDENCIES = libxml2 libcurl libxslt yajl
+RAPTOR_LICENSE = GPLv2.1 LGPLv2.1 Apache-2.0
+RAPTOR_LICENSE_FILES = LICENSE.txt
+
+RAPTOR_CONF_OPTS = --with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
+		--with-curl-config=$(STAGING_DIR)/usr/bin/curl-config \
+		--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+		--with-yajl=$(STAGING_DIR)
+
+$(eval $(autotools-package))
-- 
1.9.1
