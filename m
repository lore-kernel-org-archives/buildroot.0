From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri,  9 Jan 2015 22:13:38 +0100
Subject: [Buildroot] [PATCH] bootstrap: new package
Message-ID: <1420838018-2511-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                |  1 +
 package/bootstrap/Config.in      |  7 +++++++
 package/bootstrap/bootstrap.hash |  2 ++
 package/bootstrap/bootstrap.mk   | 22 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/bootstrap/Config.in
 create mode 100644 package/bootstrap/bootstrap.hash
 create mode 100644 package/bootstrap/bootstrap.mk

diff --git a/package/Config.in b/package/Config.in
index 5ece4a5..8476773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -740,6 +740,7 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
+	source "package/bootstrap/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
diff --git a/package/bootstrap/Config.in b/package/bootstrap/Config.in
new file mode 100644
index 0000000..743d8a3
--- /dev/null
+++ b/package/bootstrap/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BOOTSTRAP
+	bool "bootstrap"
+	help
+	  Bootstrap is the most popular HTML, CSS, and JS framework
+	  for developing responsive, mobile first projects on the web.
+
+	  http://getbootstrap.com
diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
new file mode 100644
index 0000000..acb06b4
--- /dev/null
+++ b/package/bootstrap/bootstrap.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  95ca4a02aff37570660c81a87065b53ebc281c33fa86b91a6a7a650eee10678f  bootstrap-3.3.1-dist.zip
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
new file mode 100644
index 0000000..e78f88b
--- /dev/null
+++ b/package/bootstrap/bootstrap.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# bootstrap
+#
+################################################################################
+
+BOOTSTRAP_VERSION = 3.3.1
+BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
+BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
+BOOTSTRAP_LICENSE = MIT
+
+define BOOTSTRAP_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+endef
+
+define BOOTSTRAP_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/var/www/bootstrap
+	$(TAR) c -C $(@D) dist |  \
+		$(TAR) x -C $(TARGET_DIR)/var/www/bootstrap --strip-components=1
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
