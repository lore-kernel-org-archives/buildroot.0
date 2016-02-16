From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:13:47 +0530
Subject: [Buildroot] [PATCH 1/1] font-awesome:new package
Message-ID: <1455601427-20322-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Font Awesome is a full suite of 605 pictographic icons for easy
 scalable vector graphics on websites.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/Config.in                      |  1 +
 package/font-awesome/Config.in         |  7 +++++++
 package/font-awesome/font-awesome.hash |  2 ++
 package/font-awesome/font-awesome.mk   | 23 +++++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/font-awesome/Config.in
 create mode 100644 package/font-awesome/font-awesome.hash
 create mode 100644 package/font-awesome/font-awesome.mk

diff --git a/package/Config.in b/package/Config.in
index a5b31aa..a2bd46e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ menu "Graphics"
 	source "package/cairomm/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
+	source "package/font-awesome/Config.in"
 	source "package/fontconfig/Config.in"
 	source "package/freetype/Config.in"
 	source "package/gd/Config.in"
diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
new file mode 100644
index 0000000..065f554
--- /dev/null
+++ b/package/font-awesome/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FONT_AWESOME
+	bool "font-awesome"
+	help
+	  Font Awesome is a full suite of 605 pictographic icons for easy
+	  scalable vector graphics on websites.
+
+	  https://github.com/FortAwesome/Font-Awesome
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
new file mode 100644
index 0000000..d6b2be7
--- /dev/null
+++ b/package/font-awesome/font-awesome.hash
@@ -0,0 +1,2 @@
+# Locally Computed
+sha256  7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8  font-awesome-v4.5.0.tar.gz
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
new file mode 100644
index 0000000..acaa3d8
--- /dev/null
+++ b/package/font-awesome/font-awesome.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# font-awesome
+#
+################################################################################
+
+FONT_AWESOME_VERSION = v4.5.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_LICENSE = OFLv1.1, MIT
+FONT_AWESOME_LICENSE_FILES = css/font-awesome.css
+FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+
+define FONT_AWESOME_INSTALL_TARGET_CMDS
+	# Install required directories
+	for dir in $(FONT_AWESOME_DIRECTORIES_LIST); \
+	do \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/font-awesome/$$dir && \
+		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/font-awesome/$$dir \
+			$(@D)/$$dir/*.* || exit 1; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
