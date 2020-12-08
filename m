From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Dec 2020 19:05:25 +0100
Subject: [Buildroot] [PATCH 2/5] package/datatables: new package
In-Reply-To: <20201208180529.9152-1-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
Message-ID: <20201208180529.9152-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/datatables/Config.in       |  7 +++++++
 package/datatables/datatables.hash |  3 +++
 package/datatables/datatables.mk   | 23 +++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/datatables/Config.in
 create mode 100644 package/datatables/datatables.hash
 create mode 100644 package/datatables/datatables.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cb272e7ae..59e2711bc8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2503,6 +2503,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/cereal/
 F:	package/chartjs/
+F:	package/datatables/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index 5fb6eaeccf..a460fc8453 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1568,6 +1568,7 @@ endmenu
 endif
 	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
+	source "package/datatables/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables/Config.in b/package/datatables/Config.in
new file mode 100644
index 0000000000..8537b9f9a6
--- /dev/null
+++ b/package/datatables/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DATATABLES
+	bool "datatables"
+	help
+	  Javascript library providing advanced interaction controls for
+	  your HTML tables.
+
+	  https://datatables.net
diff --git a/package/datatables/datatables.hash b/package/datatables/datatables.hash
new file mode 100644
index 0000000000..23e1f045ae
--- /dev/null
+++ b/package/datatables/datatables.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	e2c79dd9d02caa04130ce888061bc922e18561e72e842ba0cb657d1812d9f1bf  DataTables-1.10.20.zip
+sha256	c6a873f21550ed804f76013c36e14225704c1aa551fdb870e0c626eb91c19247  DataTables-1.10.20/license.txt
diff --git a/package/datatables/datatables.mk b/package/datatables/datatables.mk
new file mode 100644
index 0000000000..f8b0c7cfc7
--- /dev/null
+++ b/package/datatables/datatables.mk
@@ -0,0 +1,23 @@
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
+DATATABLES_LICENSE_FILES = DataTables-$(DATATABLES_VERSION)/license.txt
+
+define DATATABLES_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_DL_DIR)/$(DATATABLES_SOURCE) -d $(@D)
+endef
+
+define DATATABLES_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables/css $(TARGET_DIR)/var/www/datatables/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/css $(@D)/DataTables-$(DATATABLES_VERSION)/media/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/js $(@D)/DataTables-$(DATATABLES_VERSION)/media/js/*.min.js
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
