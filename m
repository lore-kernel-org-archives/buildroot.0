From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:24:12 +0100
Subject: [Buildroot] [git commit] package/datatables-responsive: new package
Message-ID: <20210102110720.3C5A085B96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08c11e21a7c6ed16a92b9507160f020c9b7e8c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/datatables-responsive/Config.in            | 12 +++++++++++
 .../datatables-responsive.hash                     |  3 +++
 .../datatables-responsive/datatables-responsive.mk | 25 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1095588f46..6a0c2ed7b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2518,6 +2518,7 @@ F:	package/chartjs/
 F:	package/datatables/
 F:	package/datatables-buttons/
 F:	package/datatables-fixedcolumns/
+F:	package/datatables-responsive/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index f1e8b6f20e..6451ad4b47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1582,6 +1582,7 @@ endif
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
index 0000000000..d10313f368
--- /dev/null
+++ b/package/datatables-responsive/datatables-responsive.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	47caf3b753dd2c537b8834816eaf38c4df214cb4e6a97144e0de4cf82ad24d02  Responsive-2.2.3.zip
+sha256	da4e1020ae97c095a14d7830c1a8a793e080c062e22d749ecd3fc3c075673dbf  License.txt
diff --git a/package/datatables-responsive/datatables-responsive.mk b/package/datatables-responsive/datatables-responsive.mk
new file mode 100644
index 0000000000..bc9644701f
--- /dev/null
+++ b/package/datatables-responsive/datatables-responsive.mk
@@ -0,0 +1,25 @@
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
+DATATABLES_RESPONSIVE_LICENSE_FILES = License.txt
+
+define DATATABLES_RESPONSIVE_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_RESPONSIVE_DL_DIR)/$(DATATABLES_RESPONSIVE_SOURCE) -d $(@D)
+	mv $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)/* $(@D)
+	rmdir $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)
+endef
+
+define DATATABLES_RESPONSIVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-responsive/css $(TARGET_DIR)/var/www/datatables-responsive/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/css $(@D)/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/js $(@D)/js/*.min.js
+endef
+
+$(eval $(generic-package))
