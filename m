From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:08:46 +0100
Subject: [Buildroot] [git commit] package/datatables-fixedcolumns: new
 package
Message-ID: <20210102110427.99641837ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0a0e9b710aff7d1fce1b277fd9c614a9892d9e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/datatables-fixedcolumns/Config.in          | 10 +++++++++
 .../datatables-fixedcolumns.hash                   |  3 +++
 .../datatables-fixedcolumns.mk                     | 25 ++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5ef979dec5..1095588f46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2517,6 +2517,7 @@ F:	package/cereal/
 F:	package/chartjs/
 F:	package/datatables/
 F:	package/datatables-buttons/
+F:	package/datatables-fixedcolumns/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index 819d135685..f1e8b6f20e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1581,6 +1581,7 @@ endif
 	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
 	source "package/datatables-buttons/Config.in"
+	source "package/datatables-fixedcolumns/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables-fixedcolumns/Config.in b/package/datatables-fixedcolumns/Config.in
new file mode 100644
index 0000000000..4d2e5ea06f
--- /dev/null
+++ b/package/datatables-fixedcolumns/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DATATABLES_FIXEDCOLUMNS
+	bool "datatables-fixedcolumns"
+	depends on BR2_PACKAGE_DATATABLES
+	help
+	  When making use of DataTables' x-axis scrolling feature
+	  (scrollX), you may wish to fix the left or right most columns
+	  in place. This extension for DataTables provides exactly this
+	  option.
+
+	  https://datatables.net/extensions/fixedcolumns
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
new file mode 100644
index 0000000000..dc94620208
--- /dev/null
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	53a7b20ea9dbb6498137cb7260bde8605989ec578e4b71787f5ebc4ef9910bd9  FixedColumns-3.3.0.zip
+sha256	e8e92f97216f9ea00cb2735b933a91ec8e3869bed37b6d63a90f76f41508f2de  License.txt
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
new file mode 100644
index 0000000000..3c744990ca
--- /dev/null
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# datatables-fixedcolumns
+#
+################################################################################
+
+DATATABLES_FIXEDCOLUMNS_VERSION = 3.3.0
+DATATABLES_FIXEDCOLUMNS_SITE = https://datatables.net/releases
+DATATABLES_FIXEDCOLUMNS_SOURCE =  FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
+DATATABLES_FIXEDCOLUMNS_LICENSE = MIT
+DATATABLES_FIXEDCOLUMNS_LICENSE_FILES = License.txt
+
+define DATATABLES_FIXEDCOLUMNS_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_FIXEDCOLUMNS_DL_DIR)/$(DATATABLES_FIXEDCOLUMNS_SOURCE) -d $(@D)
+	mv $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)/* $(@D)
+	rmdir $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)
+endef
+
+define DATATABLES_FIXEDCOLUMNS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(TARGET_DIR)/var/www/datatables-fixedcolumns/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(@D)/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/js $(@D)/js/*.min.js
+endef
+
+$(eval $(generic-package))
