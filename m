From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 12:26:30 +0100
Subject: [Buildroot] [PATCHv2 07/12] package/chartjs: new package
In-Reply-To: <20200210112636.8155-1-patrickdepinguin@gmail.com>
References: <20200210112636.8155-1-patrickdepinguin@gmail.com>
Message-ID: <20200210112636.8155-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Note: even though the Chart.js developers make specific tarballs on GitHub
(i.e. not simply 'source code' tarballs), they cannot be used in Buildroot
because their names do not encode a version number, e.g. 'Chart.js.zip'.
This means that on upgrades, the same tarball name would have different
contents and thus a different hash.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/chartjs/Config.in    |  7 +++++++
 package/chartjs/chartjs.hash |  3 +++
 package/chartjs/chartjs.mk   | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/chartjs/Config.in
 create mode 100644 package/chartjs/chartjs.hash
 create mode 100644 package/chartjs/chartjs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 30bf7c2b18..54120f8142 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2372,6 +2372,7 @@ F:	package/civetweb/
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/cereal/
+F:	package/chartjs/
 F:	package/libtelnet/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
diff --git a/package/Config.in b/package/Config.in
index 6c55a7471d..813da4efff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1513,6 +1513,7 @@ menu "External AngularJS plugins"
 endmenu
 endif
 	source "package/bootstrap/Config.in"
+	source "package/chartjs/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/chartjs/Config.in b/package/chartjs/Config.in
new file mode 100644
index 0000000000..73cc9b7750
--- /dev/null
+++ b/package/chartjs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CHARTJS
+	bool "chartjs"
+	help
+	  Chart.js, a simple yet flexible JavaScript charting library
+	  for designers & developers
+
+	  https://www.chartjs.org/
diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
new file mode 100644
index 0000000000..d2426ea614
--- /dev/null
+++ b/package/chartjs/chartjs.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	8079d8fd39131fcfaec33f1c7799412bcf8e051e25b10bd6e37fc16159417aa1  chartjs-v2.9.3.tar.gz
+sha256	7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
new file mode 100644
index 0000000000..171e0a4a7c
--- /dev/null
+++ b/package/chartjs/chartjs.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# chartjs
+#
+################################################################################
+
+CHARTJS_VERSION = v2.9.3
+CHARTJS_SITE = $(call github,chartjs,Chart.js,$(CHARTJS_VERSION))
+CHARTJS_LICENSE = MIT
+CHARTJS_LICENSE_FILES = LICENSE.md
+
+define CHARTJS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.css \
+		$(TARGET_DIR)/var/www/chartjs/css/Chart.css
+	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.js \
+		$(TARGET_DIR)/var/www/chartjs/js/Chart.js
+	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.bundle.min.js \
+		$(TARGET_DIR)/var/www/chartjs/js/Chart.bundle.js
+endef
+
+$(eval $(generic-package))
-- 
2.24.1
