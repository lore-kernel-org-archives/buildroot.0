From: Jordan Yelloz <jordan@yelloz.me>
Date: Wed, 22 Jun 2016 14:01:24 -0700
Subject: [Buildroot] [PATCH 1/2] swupdate: allowed website install path
In-Reply-To: <20160622210125.18930-1-jordan@yelloz.me>
References: <20160622210125.18930-1-jordan@yelloz.me>
Message-ID: <20160622210125.18930-2-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some systems run on an empty /var tmpfs and would prefer the website
data installed in /usr/share/swupdate/www or something similar so this
allows the website data to go somewhere else. The default location of
/var/www/swupdate is preserved.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/swupdate/Config.in   |  9 +++++++++
 package/swupdate/swupdate.mk | 11 ++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 1d14a7c..bc90a2f 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -51,6 +51,15 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	  This is necessary if you want to run swupdate with the embedded
 	  webserver and do not provide an own website to be installed to
 	  /var/www/swupdate.
+
+if BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
+
+config BR2_PACKAGE_SWUPDATE_WEBSITE_PATH
+	string "location of swupdate website data"
+	default "/var/www/swupdate"
+
+endif
+
 endif
 
 comment "swupdate needs a toolchain w/ threads"
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index f49cbaa..d479416 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -114,11 +114,16 @@ endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
-	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
-		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
-		cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
+	$(SWUPDATE_INSTALL_TARGET_WEBSITE_CMDS)
 endef
 
+ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
+define SWUPDATE_INSTALL_TARGET_WEBSITE_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)$(BR2_PACKAGE_SWUPDATE_WEBSITE_PATH)
+	$(INSTALL) -m 0644 $(@D)/www/* $(TARGET_DIR)$(BR2_PACKAGE_SWUPDATE_WEBSITE_PATH)
+endef
+endif
+
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
 ifeq ($(BR2_PACKAGE_SWUPDATE)$(BR_BUILDING),yy)
-- 
2.9.0
