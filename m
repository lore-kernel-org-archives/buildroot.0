From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Dec 2020 19:05:26 +0100
Subject: [Buildroot] [PATCH 3/5] package/datatables-buttons: new package
In-Reply-To: <20201208180529.9152-1-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
Message-ID: <20201208180529.9152-3-patrickdepinguin@gmail.com>
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
 package/datatables-buttons/Config.in          | 12 ++++++++++
 .../datatables-buttons.hash                   |  3 +++
 .../datatables-buttons/datatables-buttons.mk  | 22 +++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/datatables-buttons/Config.in
 create mode 100644 package/datatables-buttons/datatables-buttons.hash
 create mode 100644 package/datatables-buttons/datatables-buttons.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59e2711bc8..747c94c750 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2504,6 +2504,7 @@ F:	docs/manual/
 F:	package/cereal/
 F:	package/chartjs/
 F:	package/datatables/
+F:	package/datatables-buttons/
 F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
diff --git a/package/Config.in b/package/Config.in
index a460fc8453..66725e4243 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1569,6 +1569,7 @@ endif
 	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
+	source "package/datatables-buttons/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables-buttons/Config.in b/package/datatables-buttons/Config.in
new file mode 100644
index 0000000000..515038ebe5
--- /dev/null
+++ b/package/datatables-buttons/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DATATABLES_BUTTONS
+	bool "datatables-buttons"
+	depends on BR2_PACKAGE_DATATABLES
+	select BR2_PACKAGE_JSZIP
+	help
+	  The Buttons library for DataTables provides a framework with
+	  common options and API that can be used with DataTables, but
+	  is also very extensible, recognising that you will likely want
+	  to use buttons which perform an action unique to your
+	  applications.
+
+	  https://datatables.net/extensions/buttons
diff --git a/package/datatables-buttons/datatables-buttons.hash b/package/datatables-buttons/datatables-buttons.hash
new file mode 100644
index 0000000000..336e4afd24
--- /dev/null
+++ b/package/datatables-buttons/datatables-buttons.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	427632c0245f488328edab83b53294545744c8de621a5eaa9dd3d257d7ed7775  Buttons-1.6.1.zip
+sha256	21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  Buttons-1.6.1/License.txt
diff --git a/package/datatables-buttons/datatables-buttons.mk b/package/datatables-buttons/datatables-buttons.mk
new file mode 100644
index 0000000000..fe66deac8e
--- /dev/null
+++ b/package/datatables-buttons/datatables-buttons.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# datatables-buttons
+#
+################################################################################
+
+DATATABLES_BUTTONS_VERSION = 1.6.1
+DATATABLES_BUTTONS_SITE = https://datatables.net/releases
+DATATABLES_BUTTONS_SOURCE = Buttons-$(DATATABLES_BUTTONS_VERSION).zip
+DATATABLES_BUTTONS_LICENSE = MIT
+DATATABLES_BUTTONS_LICENSE_FILES = Buttons-$(DATATABLES_BUTTONS_VERSION)/License.txt
+define DATATABLES_BUTTONS_EXTRACT_CMDS
+	$(UNZIP) $(DATATABLES_BUTTONS_DL_DIR)/$(DATATABLES_BUTTONS_SOURCE) -d $(@D)
+endef
+
+define DATATABLES_BUTTONS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-buttons/css $(TARGET_DIR)/var/www/datatables-buttons/js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/css $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/js $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/js/*.min.js
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
