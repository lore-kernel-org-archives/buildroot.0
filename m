From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:31 +0100
Subject: [Buildroot] [PATCH 02/14 v6] package/python-lxml: add target variant
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <d52f87b97c5cad6a9a361521c62ceb7cbe7a510f.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998 at free.fr: fix staging path; trim dependencies of
 the host variant]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                  |  1 +
 package/python-lxml/Config.in      | 10 ++++++++++
 package/python-lxml/python-lxml.mk | 10 +++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 package/python-lxml/Config.in

diff --git a/package/Config.in b/package/Config.in
index 5f6ebc2..6b2b2a3 100644
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
index 758ce87..7a94b09 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -20,6 +20,14 @@ PYTHON_LXML_LICENSE_FILES = \
 # So, we use setuptools.
 PYTHON_LXML_SETUP_TYPE = setuptools
 
-PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
+PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
+HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt
 
+# python-lxml needs these scripts in order to properly detect libxml2 and
+# libxslt compiler and linker flags
+PYTHON_LXML_BUILD_OPTS = \
+	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+
+$(eval $(python-package))
 $(eval $(host-python-package))
-- 
1.9.1
