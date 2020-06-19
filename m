From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 19 Jun 2020 16:57:13 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/dejavu: Install dejavu fonts in
 staging dir
In-Reply-To: <20200619145719.2352019-1-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
Message-ID: <20200619145719.2352019-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Trimarchi <michael@amarulasolutions.com>

The dejavu font is used by cups-filters and needs to be
installed in staging directory.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/dejavu/dejavu.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
index 9b57f0992e..be3d91f179 100644
--- a/package/dejavu/dejavu.mk
+++ b/package/dejavu/dejavu.mk
@@ -11,6 +11,7 @@ DEJAVU_LICENSE_FILES = LICENSE
 
 DEJAVU_FONTS_INSTALL =
 DEJAVU_FONTCONFIG_CONF_INSTALL =
+DEJAVU_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_DEJAVU_MONO),y)
 DEJAVU_FONTS_INSTALL += DejaVuSansMono*.ttf
@@ -50,6 +51,14 @@ define DEJAVU_FONTCONFIG_CONF_INSTALL_CMDS
 endef
 endif
 
+define DEJAVU_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/share/fonts/dejavu/
+	for i in $(DEJAVU_FONTS_INSTALL) ; do \
+		$(INSTALL) -m 0644 $(@D)/ttf/$$i \
+			$(STAGING_DIR)/usr/share/fonts/dejavu/ || exit 1 ; \
+	done
+endef
+
 define DEJAVU_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/fonts/dejavu/
 	for i in $(DEJAVU_FONTS_INSTALL) ; do \
-- 
2.25.1
