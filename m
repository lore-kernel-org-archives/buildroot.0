From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2016 08:00:43 -0300
Subject: [Buildroot] [PATCH 2/2] libgtk3: create icon-theme.cache for icon
	themes
In-Reply-To: <1461236443-16177-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461236443-16177-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461236443-16177-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It makes icon lookups faster, though it's not strictly necessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/libgtk3.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7bd92ca..c8ba82b 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -180,5 +180,15 @@ define HOST_LIBGTK3_INSTALL_CMDS
 		$(HOST_DIR)/usr/bin/gtk-encode-symbolic-svg
 endef
 
+# Create icon-theme.cache for each of the icon directories/themes
+# It's not strictly necessary but speeds up lookups
+define LIBGTK3_UPDATE_ICON_CACHE
+	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+		-exec $(HOST_DIR)/usr/bin/gtk-update-icon-cache {} \;
+endef
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.7.3
