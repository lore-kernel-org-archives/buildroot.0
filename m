From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:05:32 +0200
Subject: [Buildroot] [git commit] libgtk3: create icon-theme.cache for icon
	themes
Message-ID: <20160421200555.0A2467FCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52a2f0a0740a3f48104bcfe5fd1ba5e5f5c7b084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It makes icon lookups faster, though it's not strictly necessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: enclsoe the hook definition in the condition.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk3/libgtk3.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7bd92ca..5591262 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -180,5 +180,15 @@ define HOST_LIBGTK3_INSTALL_CMDS
 		$(HOST_DIR)/usr/bin/gtk-encode-symbolic-svg
 endef
 
+# Create icon-theme.cache for each of the icon directories/themes
+# It's not strictly necessary but speeds up lookups
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+define LIBGTK3_UPDATE_ICON_CACHE
+	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+		-exec $(HOST_DIR)/usr/bin/gtk-update-icon-cache {} \;
+endef
+TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
