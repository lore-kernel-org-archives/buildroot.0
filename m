From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Dec 2020 19:05:27 +0100
Subject: [Buildroot] [PATCH 4/5] package/datatables-fixedcolumns: new package
In-Reply-To: <20201208180529.9152-1-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
Message-ID: <20201208180529.9152-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/datatables-fixedcolumns/Config.in     | 10 ++++++++
 .../datatables-fixedcolumns.hash              |  3 +++
 .../datatables-fixedcolumns.mk                | 23 +++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/datatables-fixedcolumns/Config.in
 create mode 100644 package/datatables-fixedcolumns/datatables-fixedcolumns.hash
 create mode 100644 package/datatables-fixedcolumns/datatables-fixedcolumns.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 747c94c750..60bbb30271 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2505,6 +2505,7 @@ F:	package/cereal/
 F:	package/chartjs/
 F:	package/datatables/
 F:	package/datatables-buttons/
+F:	package/datatables-fixedcolumns/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index 66725e4243..f1792aa46a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1570,6 +1570,7 @@ endif
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
index 0000000000..2d848c911b
--- /dev/null
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	53a7b20ea9dbb6498137cb7260bde8605989ec578e4b71787f5ebc4ef9910bd9  FixedColumns-3.3.0.zip
+sha256	e8e92f97216f9ea00cb2735b933a91ec8e3869bed37b6d63a90f76f41508f2de  FixedColumns-3.3.0/License.txt
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
new file mode 100644
index 0000000000..82afa00f1a
--- /dev/null
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
@@ -0,0 +1,23 @@
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
+DATATABLES_FIXEDCOLUMNS_LICENSE_FILES = FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)/License.txt
+
+define DATATABLES_FIXEDCOLUMNS_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_FIXEDCOLUMNS_DL_DIR)/$(DATATABLES_FIXEDCOLUMNS_SOURCE) -d $(@D)
+endef
+
+define DATATABLES_FIXEDCOLUMNS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(TARGET_DIR)/var/www/datatables-fixedcolumns/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/js $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)/js/*.min.js
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
