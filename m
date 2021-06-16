From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:36:08 +0200
Subject: [Buildroot] [git commit] package/weston: add configuration options
 for weston shells
Message-ID: <20210616190531.5B05B8132C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffb525840cf583134111b112143238d58d14e7f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable selection of used weston shells. By default all available
shells are enabled to keep the old behavior. The new configuration
options enable the user to select them individually.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
[yann.morin.1998 at free.fr:
  - ensure at least one shell is enabled; desktop arbitrarily chosen
  - s/BR2_PACKAGE_WESTON_SHELL_SELECTED/BR2_PACKAGE_WESTON_HAS_SHELL/
  - reword associated comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 25 +++++++++++++++++++++++++
 package/weston/weston.mk | 24 ++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index d07eba4c9d..8f3dbc7931 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBDRM
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
 	help
 	  Weston is the reference implementation of a Wayland
 	  compositor, and a useful compositor in its own right.
@@ -119,6 +120,30 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+# Weston needs at least one shell; this can be one of the bundled ones,
+# below, of from a third-party package, which should then select this.
+config BR2_PACKAGE_WESTON_HAS_SHELL
+	bool
+
+config BR2_PACKAGE_WESTON_SHELL_DESKTOP
+	bool "desktop shell"
+	default y
+
+config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
+	bool "fullscreen shell"
+	default y
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
+config BR2_PACKAGE_WESTON_SHELL_IVI
+	bool "ivi shell"
+	default y
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
+config BR2_PACKAGE_WESTON_SHELL_KIOSK
+	bool "kiosk shell"
+	default y
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8afe4bbab4..6dd5439291 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -133,6 +133,30 @@ else
 WESTON_CONF_OPTS += -Dtest-junit-xml=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_DESKTOP),y)
+WESTON_CONF_OPTS += -Dshell-desktop=true
+else
+WESTON_CONF_OPTS += -Dshell-desktop=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_FULLSCREEN),y)
+WESTON_CONF_OPTS += -Dshell-fullscreen=true
+else
+WESTON_CONF_OPTS += -Dshell-fullscreen=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_IVI),y)
+WESTON_CONF_OPTS += -Dshell-ivi=true
+else
+WESTON_CONF_OPTS += -Dshell-ivi=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_KIOSK),y)
+WESTON_CONF_OPTS += -Dshell-kiosk=true
+else
+WESTON_CONF_OPTS += -Dshell-kiosk=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
 WESTON_CONF_OPTS += -Ddemo-clients=true
 WESTON_DEPENDENCIES += pango
