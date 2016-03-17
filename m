From: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>
Date: Thu, 17 Mar 2016 16:59:21 +0530
Subject: [Buildroot] [PATCH 1/1] raptor: new package
Message-ID: <1458214161-17159-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Raptor is a free software / Open Source C library that provides a set of parsers
and serializers that generate Resource Description Framework (RDF) triples
by parsing syntaxes or serialize the triples into a syntax.

http://librdf.org/raptor/

Patch added in the package:
0001-configure.ac-remove-conditional-lib-inclusion.patch

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
Changes v1:
  - Added 0001-configure.ac-remove-conditional-lib-inclusion.patch.
  - Added optional dependencies libcurl,yajl and icu.

Signed-off-by: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>
---
 package/Config.in                                  |  1 +
 ...igure.ac-remove-conditional-lib-inclusion.patch | 20 +++++++++++++++
 package/raptor/Config.in                           | 11 ++++++++
 package/raptor/raptor.hash                         |  2 ++
 package/raptor/raptor.mk                           | 30 ++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch
 create mode 100644 package/raptor/Config.in
 create mode 100644 package/raptor/raptor.hash
 create mode 100644 package/raptor/raptor.mk

diff --git a/package/Config.in b/package/Config.in
index c4d98c4..430cef8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1036,6 +1036,7 @@ menu "JSON/XML"
 	source "package/mxml/Config.in"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
+	source "package/raptor/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/xerces/Config.in"
diff --git a/package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch b/package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch
new file mode 100644
index 0000000..0fd0495
--- /dev/null
+++ b/package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch
@@ -0,0 +1,20 @@
+Removed condition for header path inclusion from the configure file.
+Upstream: None
+
+Signed-off-by: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>
+
+diff --git a/configure.ac b/configure.ac
+index 10ff870..27b9957 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1145,9 +1145,7 @@ have_lininn=no
+ have_inn_parsedate=no
+ 
+ oCPPFLAGS="$CPPFLAGS"
+-if test -d /usr/include/inn; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/include/inn"
+-fi
++
+ AC_CHECK_HEADER(libinn.h)
+ CPPFLAGS="$oCPPFLAGS"
+ 
diff --git a/package/raptor/Config.in b/package/raptor/Config.in
new file mode 100644
index 0000000..65979a2
--- /dev/null
+++ b/package/raptor/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_RAPTOR
+	bool "raptor"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
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
index 0000000..965ef0c
--- /dev/null
+++ b/package/raptor/raptor.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# raptor
+#
+################################################################################
+
+RAPTOR_VERSION = 2.0.15
+RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
+RAPTOR_SITE = http://download.librdf.org/source
+RAPTOR_DEPENDENCIES = libxml2 libxslt
+RAPTOR_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
+RAPTOR_LICENSE_FILES = LICENSE.txt
+
+RAPTOR_CONF_OPTS = --with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
+		--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+RAPTOR_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_YAJL),y)
+RAPTOR_DEPENDENCIES += yajl
+RAPTOR_CONF_ENV += LIBS="-lm"
+endif
+
+ifeq ($(BR2_PACKAGE_YAJL),y)
+RAPTOR_DEPENDENCIES += icu
+endif
+
+$(eval $(autotools-package))
-- 
2.5.0
