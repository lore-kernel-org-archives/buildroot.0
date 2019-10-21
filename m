From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:47:26 +0200
Subject: [Buildroot] [git commit] package/openlayers: new package
Message-ID: <20191021195352.03C5F8396A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18d786d8f096c6b514c9185fcddd92c895b53346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/openlayers/Config.in       | 11 +++++++++++
 package/openlayers/openlayers.hash |  2 ++
 package/openlayers/openlayers.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c8ff524e83..e941896ea2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1473,6 +1473,7 @@ endmenu
 endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
+	source "package/openlayers/Config.in"
 endmenu
 
 menu "JSON/XML"
diff --git a/package/openlayers/Config.in b/package/openlayers/Config.in
new file mode 100644
index 0000000000..a7b7f334cf
--- /dev/null
+++ b/package/openlayers/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_OPENLAYERS
+	bool "openlayers"
+	help
+	  OpenLayers makes it easy to put a dynamic map in any web
+	  page. It can display map tiles, vector data and markers
+	  loaded from any source. OpenLayers has been developed to
+	  further the use of geographic information of all kinds. It
+	  is completely free, Open Source JavaScript, released under
+	  the 2-clause BSD License (also known as the FreeBSD).
+
+	  https://openlayers.org
diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
new file mode 100644
index 0000000000..edb6f937e1
--- /dev/null
+++ b/package/openlayers/openlayers.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	4d62277993108a256fe4d11c02f880f15d4ef184f70e246e52cf1f164ac8ff8b	v6.0.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
new file mode 100644
index 0000000000..6dadc6d96a
--- /dev/null
+++ b/package/openlayers/openlayers.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# openlayers
+#
+################################################################################
+
+OPENLAYERS_VERSION = 6.0.1
+OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
+OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
+OPENLAYERS_LICENSE = BSD-2-Clause
+# There's no separate license file in the archive, only minified files.
+
+define OPENLAYERS_EXTRACT_CMDS
+	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
+	mv $(@D)/v$(OPENLAYERS_VERSION)-dist/* $(@D)
+	rmdir $(@D)/v$(OPENLAYERS_VERSION)-dist/
+endef
+
+define OPENLAYERS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/var/www/ \
+		$(@D)/ol.css $(@D)/ol.js
+endef
+
+$(eval $(generic-package))
