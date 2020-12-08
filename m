From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Dec 2020 19:05:28 +0100
Subject: [Buildroot] [PATCH 5/5] package/datatables-responsive: new package
In-Reply-To: <20201208180529.9152-1-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
Message-ID: <20201208180529.9152-5-patrickdepinguin@gmail.com>
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
 package/datatables-responsive/Config.in       | 12 ++++++++++
 .../datatables-responsive.hash                |  3 +++
 .../datatables-responsive.mk                  | 23 +++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/datatables-responsive/Config.in
 create mode 100644 package/datatables-responsive/datatables-responsive.hash
 create mode 100644 package/datatables-responsive/datatables-responsive.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 60bbb30271..38a568dee1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2506,6 +2506,7 @@ F:	package/chartjs/
 F:	package/datatables/
 F:	package/datatables-buttons/
 F:	package/datatables-fixedcolumns/
+F:	package/datatables-responsive/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index f1792aa46a..c9e28fa25d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1571,6 +1571,7 @@ endif
 	source "package/datatables/Config.in"
 	source "package/datatables-buttons/Config.in"
 	source "package/datatables-fixedcolumns/Config.in"
+	source "package/datatables-responsive/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables-responsive/Config.in b/package/datatables-responsive/Config.in
new file mode 100644
index 0000000000..085824af40
--- /dev/null
+++ b/package/datatables-responsive/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DATATABLES_RESPONSIVE
+	bool "datatables-responsive"
+	depends on BR2_PACKAGE_DATATABLES
+	help
+	  In the modern world of responsive web design tables can often
+	  cause a particular problem for designers due to their row
+	  based layout.  Responsive is an extension for DataTables that
+	  resolves that problem by optimising the table's layout for
+	  different screen sizes through the dynamic insertion and
+	  removal of columns from the table.
+
+	  https://datatables.net/extensions/responsive
diff --git a/package/datatables-responsive/datatables-responsive.hash b/package/datatables-responsive/datatables-responsive.hash
new file mode 100644
index 0000000000..b2e55b4ae2
--- /dev/null
+++ b/package/datatables-responsive/datatables-responsive.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	47caf3b753dd2c537b8834816eaf38c4df214cb4e6a97144e0de4cf82ad24d02  Responsive-2.2.3.zip
+sha256	da4e1020ae97c095a14d7830c1a8a793e080c062e22d749ecd3fc3c075673dbf  Responsive-2.2.3/License.txt
diff --git a/package/datatables-responsive/datatables-responsive.mk b/package/datatables-responsive/datatables-responsive.mk
new file mode 100644
index 0000000000..705dde3421
--- /dev/null
+++ b/package/datatables-responsive/datatables-responsive.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# datatables-responsive
+#
+################################################################################
+
+DATATABLES_RESPONSIVE_VERSION = 2.2.3
+DATATABLES_RESPONSIVE_SITE = https://datatables.net/releases
+DATATABLES_RESPONSIVE_SOURCE =  Responsive-$(DATATABLES_RESPONSIVE_VERSION).zip
+DATATABLES_RESPONSIVE_LICENSE = MIT
+DATATABLES_RESPONSIVE_LICENSE_FILES = Responsive-$(DATATABLES_RESPONSIVE_VERSION)/License.txt
+
+define DATATABLES_RESPONSIVE_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_RESPONSIVE_DL_DIR)/$(DATATABLES_RESPONSIVE_SOURCE) -d $(@D)
+endef
+
+define DATATABLES_RESPONSIVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-responsive/css $(TARGET_DIR)/var/www/datatables-responsive/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/css $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/js $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)/js/*.min.js
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
