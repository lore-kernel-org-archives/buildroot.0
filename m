From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:40 +0200
Subject: [Buildroot] [PATCH 29/30] package/matchbox-panel: add support for
	dnotify
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <39072254f3d646691a8c637e551ffaede7b9928c.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using dnotify, matchbox-panel can automatically reload its menu.

dnotify requires a kernel >=2.4, which we can consider to be
virtually for granted.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-panel/Config.in         | 7 +++++++
 package/matchbox/matchbox-panel/matchbox-panel.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox/matchbox-panel/Config.in
index 93241f0..6daf2db 100644
--- a/package/matchbox/matchbox-panel/Config.in
+++ b/package/matchbox/matchbox-panel/Config.in
@@ -18,4 +18,11 @@ config BR2_PACKAGE_MATCHBOX_PANEL_ACPI
 	  otherwise the battery monitor mini-applet is not
 	  built.
 
+config BR2_PACKAGE_MATCHBOX_PANEL_DNOTIFY
+	bool "use dnotify"
+	help
+	  Using dnotify allows matchbox-panel to automatically reload
+	  its menu when entries are changed (e.g. when a new application
+	  is installed).
+
 endif # BR2_PACKAGE_MATCHBOX_PANEL
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index aa9018c..dedbab6 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -26,6 +26,12 @@ else
 MATCHBOX_PANEL_CONF_OPTS += --disable-acpi-linux
 endif
 
+ifeq ($(BR2_PACKAGE_MATCHBOX_PANEL_DNOTIFY),y)
+MATCHBOX_PANEL_CONF_OPTS += --enable-dnotify
+else
+MATCHBOX_PANEL_CONF_OPTS += --disable-dnotify
+endif
+
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
 MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
 endif
-- 
1.9.1
