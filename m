From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Fri, 10 Jan 2014 17:50:22 -0200
Subject: [Buildroot] [PATCH 3/3] pi4j: new package
In-Reply-To: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
References: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
Message-ID: <1389383422-29665-3-git-send-email-lucas.de.marchi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add pi4j using its released binaries. The java archives are a bit
different than other packages. Since they are coming already
pre-compiled put them in /opt with the same layout as in raspbian,
according to http://pi4j.com/install.html

Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
---
 package/Config.in      |  1 +
 package/pi4j/Config.in | 10 ++++++++++
 package/pi4j/pi4j.mk   | 30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/pi4j/Config.in
 create mode 100644 package/pi4j/pi4j.mk

diff --git a/package/Config.in b/package/Config.in
index 748ddbf..ea4556f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ source "package/mtdev/Config.in"
 source "package/ne10/Config.in"
 source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
+source "package/pi4j/Config.in"
 source "package/tslib/Config.in"
 source "package/urg/Config.in"
 source "package/wiringpi/Config.in"
diff --git a/package/pi4j/Config.in b/package/pi4j/Config.in
new file mode 100644
index 0000000..99736bf
--- /dev/null
+++ b/package/pi4j/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PI4J
+	bool "pi4j"
+	depends on BR2_PACKAGE_RPI_USERLAND
+	help
+	  This package is intended to provide a bridge between the native
+	  libraries and Java for full access to the Raspberry Pi.
+
+	  It installs the pre-compiled library from the released pi4j tarball.
+
+	  http://pi4j.com/
diff --git a/package/pi4j/pi4j.mk b/package/pi4j/pi4j.mk
new file mode 100644
index 0000000..38f2926
--- /dev/null
+++ b/package/pi4j/pi4j.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# pi4j
+#
+################################################################################
+
+PI4J_VERSION = 0.0.5
+PI4J_SITE = http://pi4j.googlecode.com/files/
+PI4J_SOURCE = pi4j-$(PI4J_VERSION).zip
+PI4J_LICENSE = Apache-v2
+PI4J_LICENSE_FILES = LICENSE.txt
+
+define PI4J_EXTRACT_CMDS
+	unzip -q -d $(@D)/../ $(DL_DIR)/$(PI4J_SOURCE)
+endef
+
+define PI4J_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/lib/pi4j-core.jar \
+		$(TARGET_DIR)/opt/pi4j/lib/pi4j-core.jar
+	$(INSTALL) -D -m 0644 $(@D)/lib/pi4j-device.jar \
+		$(TARGET_DIR)/opt/pi4j/lib/pi4j-device.jar
+	$(INSTALL) -D -m 0644 $(@D)/lib/pi4j-example.jar \
+		$(TARGET_DIR)/opt/pi4j/lib/pi4j-example.jar
+	$(INSTALL) -D -m 0644 $(@D)/lib/pi4j-gpio-extension.jar \
+		$(TARGET_DIR)/opt/pi4j/lib/pi4j-extension.jar
+	$(INSTALL) -D -m 0644 $(@D)/lib/pi4j-service.jar \
+		$(TARGET_DIR)/opt/pi4j/lib/pi4j-service.jar
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.2
