From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 09:57:43 +0100
Subject: [Buildroot] [git commit branch/next] package/python-lxml: new
	package
Message-ID: <20150214085807.6E6D5803E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c66618c2c97b460a8b845fd4b027073e00238bee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The lxml XML toolkit is a Pythonic binding for the C libraries libxml2
and libxslt.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998 at free.fr: fix staging path; trim dependencies of
 the host variant]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/python-lxml/Config.in        |   10 ++++++++++
 package/python-lxml/python-lxml.hash |    2 ++
 package/python-lxml/python-lxml.mk   |   31 +++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b9d6753..077efc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -534,6 +534,7 @@ menu "external python modules"
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
diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
new file mode 100644
index 0000000..470a245
--- /dev/null
+++ b/package/python-lxml/python-lxml.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  069594837d0376a1bacf5cc42aa9a1be2e1c1396dc62f7d07f7358afecd34adf  lxml-3.4.1.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
new file mode 100644
index 0000000..e7222e8
--- /dev/null
+++ b/package/python-lxml/python-lxml.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# python-lxml
+#
+################################################################################
+
+PYTHON_LXML_VERSION = 3.4.1
+PYTHON_LXML_SITE = http://lxml.de/files
+PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
+
+# Not including the GPL, because it is used only for the test scripts.
+PYTHON_LXML_LICENSE = BSD-3c, Others
+PYTHON_LXML_LICENSE_FILES = \
+	LICENSES.txt \
+	doc/licenses/BSD.txt \
+	doc/licenses/elementtree.txt \
+	src/lxml/isoschematron/resources/rng/iso-schematron.rng
+
+# python-lxml can use either setuptools, or distutils as a fallback.
+# So, we use setuptools.
+PYTHON_LXML_SETUP_TYPE = setuptools
+
+PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
+
+# python-lxml needs these scripts in order to properly detect libxml2 and
+# libxslt compiler and linker flags
+PYTHON_LXML_BUILD_OPTS = \
+	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+
+$(eval $(python-package))
