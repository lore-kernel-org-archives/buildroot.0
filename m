From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 11:53:30 +0100
Subject: [Buildroot] [git commit] package/datatables: new package
Message-ID: <20210102103606.111288259E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3995a68e2103a484f089c98b8d6ce9a81081762f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/datatables/Config.in       |  7 +++++++
 package/datatables/datatables.hash |  3 +++
 package/datatables/datatables.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ff5a31a1d..9985f7ce49 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2515,6 +2515,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/cereal/
 F:	package/chartjs/
+F:	package/datatables/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index 9e8f354d1b..2ada0a7a57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1579,6 +1579,7 @@ endmenu
 endif
 	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
+	source "package/datatables/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables/Config.in b/package/datatables/Config.in
new file mode 100644
index 0000000000..89009712d8
--- /dev/null
+++ b/package/datatables/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DATATABLES
+	bool "datatables"
+	help
+	  Javascript library providing advanced interaction controls
+	  for your HTML tables.
+
+	  https://datatables.net
diff --git a/package/datatables/datatables.hash b/package/datatables/datatables.hash
new file mode 100644
index 0000000000..d6eeadfb37
--- /dev/null
+++ b/package/datatables/datatables.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	e2c79dd9d02caa04130ce888061bc922e18561e72e842ba0cb657d1812d9f1bf  DataTables-1.10.20.zip
+sha256	c6a873f21550ed804f76013c36e14225704c1aa551fdb870e0c626eb91c19247  license.txt
diff --git a/package/datatables/datatables.mk b/package/datatables/datatables.mk
new file mode 100644
index 0000000000..7bd3d83ac3
--- /dev/null
+++ b/package/datatables/datatables.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# datatables
+#
+################################################################################
+
+DATATABLES_VERSION = 1.10.20
+DATATABLES_SITE = https://datatables.net/releases
+DATATABLES_SOURCE =  DataTables-$(DATATABLES_VERSION).zip
+DATATABLES_LICENSE = MIT
+DATATABLES_LICENSE_FILES = license.txt
+
+define DATATABLES_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_DL_DIR)/$(DATATABLES_SOURCE) -d $(@D)
+	mv $(@D)/DataTables-$(DATATABLES_VERSION)/* $(@D)
+	rmdir $(@D)/DataTables-$(DATATABLES_VERSION)
+endef
+
+define DATATABLES_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables/css $(TARGET_DIR)/var/www/datatables/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/css $(@D)/media/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/js $(@D)/media/js/*.min.js
+endef
+
+$(eval $(generic-package))
