From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 14 Jun 2012 14:43:08 +0100
Subject: [Buildroot] [PATCH] jquery: allow custom install location
Message-ID: <1339681388-13133-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Allow the JavaScript install path to be customised. By default, JavaScript files
are installed to /var/www under the target root directory.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/jquery/Config.in |    7 +++++++
 package/jquery/jquery.mk |    4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/jquery/Config.in b/package/jquery/Config.in
index 92f5604..e811d48 100644
--- a/package/jquery/Config.in
+++ b/package/jquery/Config.in
@@ -6,3 +6,10 @@ config BR2_PACKAGE_JQUERY
 	  animating, and Ajax interactions for rapid web development.
 
 	  http://jquery.com
+
+config BR2_PACKAGE_JQUERY_JAVASCRIPT_PATH
+	string "Target install path for JavaScript"
+	default "/var/www"
+	depends on BR2_PACKAGE_JQUERY
+	help
+	  Specify a target install path for JavaScript files
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 08dd4a3..a4c31a8 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -8,11 +8,11 @@ endef
 
 define JQUERY_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SOURCE) \
-		$(TARGET_DIR)/var/www/jquery.js
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_JAVASCRIPT_PATH)/jquery.js
 endef
 
 define JQUERY_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.js
+	rm -f $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_JAVASCRIPT_PATH)/jquery.js
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.9.5
