From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Dec 2011 23:28:44 +0100
Subject: [Buildroot] [git commit] package: add jQuery Validation plugin
Message-ID: <20111218230945.C0F6C8F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50e00c3b6d2a40ea69716cb3df160a40892e19fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                              |    1 +
 package/jquery-validation/Config.in            |    9 +++++++++
 package/jquery-validation/jquery-validation.mk |   18 ++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b8eb066..2c15f23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -324,6 +324,7 @@ endif
 
 menu "Javascript"
 source "package/jquery/Config.in"
+source "package/jquery-validation/Config.in"
 endmenu
 
 menu "Networking"
diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
new file mode 100644
index 0000000..2a764c1
--- /dev/null
+++ b/package/jquery-validation/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_JQUERY_VALIDATION
+	bool "jQuery-Validation"
+	select BR2_PACKAGE_JQUERY
+	help
+	  The jQuery Validation Plugin provides drop-in validation for
+	  your existing forms, while making all kinds of
+	  customizations to fit your application really easy.
+
+	  http://bassistance.de/jquery-plugins/jquery-plugin-validation/
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
new file mode 100644
index 0000000..5f25b58
--- /dev/null
+++ b/package/jquery-validation/jquery-validation.mk
@@ -0,0 +1,18 @@
+JQUERY_VALIDATION_VERSION = 1.9.0
+JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
+JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
+
+define JQUERY_VALIDATION_EXTRACT_CMDS
+	unzip -d $(BUILD_DIR) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
+endef
+
+define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/jquery.validate.min.js \
+		$(TARGET_DIR)/var/www/jquery.validate.js
+endef
+
+define JQUERY_VALIDATION_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/var/www/jquery.validate.js
+endef
+
+$(eval $(call GENTARGETS))
