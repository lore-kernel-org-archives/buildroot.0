From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 16:02:18 +0200
Subject: [Buildroot] [git commit branch/next] rapidxml: new package
Message-ID: <20150817141424.01F4C7FBDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a33bc3ad9d2c1d516988585113a7751251b8ba4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - Rewrap Config.in help text
  - Indicate that the SHA256 hash has been locally calculated, and add
    the MD5 and SHA1 hashes from SourceForge.
  - Use downloads.sourceforge.net as the download site instead of
    garr.dl.sourceforge.net, in order to use the SourceForge mirrors
    properly, and be consistent with all other Buildroot packages
    downloading stuff from SourceForge.
  - Change the license from "MIT" to "Boost Software License 1.0 or
    MIT" as indicated by the license.txt file.
  - Change the <pkg>_EXTRACT_CMDS to remove the sub-directory created
    by the .zip file extraction, and simplify the staging installation
    step accordingly.]

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/rapidxml/Config.in     |   11 +++++++++++
 package/rapidxml/rapidxml.hash |    6 ++++++
 package/rapidxml/rapidxml.mk   |   27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..3ab87cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -918,6 +918,7 @@ menu "JSON/XML"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
 	source "package/rapidjson/Config.in"
+	source "package/rapidxml/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/xerces/Config.in"
diff --git a/package/rapidxml/Config.in b/package/rapidxml/Config.in
new file mode 100644
index 0000000..76b2248
--- /dev/null
+++ b/package/rapidxml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_RAPIDXML
+	bool "rapidxml"
+	help
+	  RapidXml is an attempt to create the fastest XML parser
+	  possible, while retaining useability, portability and
+	  reasonable W3C compatibility. It is an in-situ parser with
+	  parsing speed approaching speed of strlen function executed
+	  on the same data.
+
+	  http://sourceforge.net/projects/rapidxml/
+	  https://en.wikipedia.org/wiki/RapidXml
diff --git a/package/rapidxml/rapidxml.hash b/package/rapidxml/rapidxml.hash
new file mode 100644
index 0000000..81919f0
--- /dev/null
+++ b/package/rapidxml/rapidxml.hash
@@ -0,0 +1,6 @@
+# From https://sourceforge.net/projects/rapidxml/files/rapidxml/rapidxml%201.13/
+sha1 f5fd4fbc5ad7e96045313697811d65ea8089a950 rapidxml-1.13.zip
+md5 7b4b42c9331c90aded23bb55dc725d6a rapidxml-1.13.zip
+
+# Locally calculated
+sha256	c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571  rapidxml-1.13.zip
diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
new file mode 100644
index 0000000..4356d8d
--- /dev/null
+++ b/package/rapidxml/rapidxml.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rapidxml
+#
+################################################################################
+
+RAPIDXML_VERSION = 1.13
+RAPIDXML_SOURCE = rapidxml-$(RAPIDXML_VERSION).zip
+RAPIDXML_SITE = http://downloads.sourceforge.net/project/rapidxml/rapidxml/rapidxml%20$(RAPIDXML_VERSION)/
+RAPIDXML_LICENSE = Boost Software License 1.0 or MIT
+RAPIDXML_LICENSE_FILES = license.txt
+
+# C++ headers only
+RAPIDXML_INSTALL_TARGET = NO
+RAPIDXML_INSTALL_STAGING = YES
+
+define RAPIDXML_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDXML_SOURCE)
+	mv $(@D)/rapidxml-$(RAPIDXML_VERSION)/* $(@D)/
+	rmdir $(@D)/rapidxml-$(RAPIDXML_VERSION)
+endef
+
+define RAPIDXML_INSTALL_STAGING_CMDS
+	cp -dpfr $(@D)/*hpp $(STAGING_DIR)/usr/include
+endef
+
+$(eval $(generic-package))
