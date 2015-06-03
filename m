From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:26 +0200
Subject: [Buildroot] [PATCH 09/32 v2] package/matchbox: make
	match-startup-monitor a real package
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <5cd476aabdc148407817406453007a4a3c213146.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-startup-monitor is missing a Kconfig entry, but is
so far solely a build-time dependency of matchbox-panel.

So, make it a real package, and only build-depend on it when enabled.
Fix the condition to build-depend on it.

To keep the existing behaviour, default to 'y' when startup-notification
is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - restore previous behaviour, to be used whenever startup-notification
    is enabled  (Arnout)
---
 package/matchbox/Config.in                          | 1 +
 package/matchbox/matchbox-panel/matchbox-panel.mk   | 4 ++--
 package/matchbox/matchbox-startup-monitor/Config.in | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 package/matchbox/matchbox-startup-monitor/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 9b27d4d..2f9b73d 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -26,5 +26,6 @@ source "package/matchbox/matchbox-desktop/Config.in"
 source "package/matchbox/matchbox-common/Config.in"
 source "package/matchbox/matchbox-fakekey/Config.in"
 source "package/matchbox/matchbox-keyboard/Config.in"
+source "package/matchbox/matchbox-startup-monitor/Config.in"
 
 endif
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index d3efed9..f7d699b 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -13,9 +13,9 @@ MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPTS = --enable-expat
 
-ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+ifeq ($(BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR),y)
 MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
-MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
+MATCHBOX_PANEL_DEPENDENCIES += matchbox-startup-monitor
 else
 MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
 endif
diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox/matchbox-startup-monitor/Config.in
new file mode 100644
index 0000000..95af5fc
--- /dev/null
+++ b/package/matchbox/matchbox-startup-monitor/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
+	bool
+	default y if BR2_PACKAGE_STARTUP_NOTIFICATION
-- 
1.9.1
