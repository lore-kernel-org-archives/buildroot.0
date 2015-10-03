From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 14:13:12 +0200
Subject: [Buildroot] [git commit] package/freerdp: introduce the wayland
	client
Message-ID: <20151003122242.2E1A7818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e01e5ddca6edc0608e32da9adc7645d4bb8db095
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use 'depends on' for wayland to match X11 client]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/Config.in  |    5 +++++
 package/freerdp/freerdp.mk |   22 ++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 6d9d6fc..b194515 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -72,6 +72,11 @@ config BR2_PACKAGE_FREERDP_CLIENT_X11
 comment "server and X11 client need X.Org"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_FREERDP_CLIENT_WL
+	bool "wayland client"
+	default y
+	depends on BR2_PACKAGE_WAYLAND
+
 endif
 
 comment "freerdp needs a toolchain w/ wchar, dynamic library, threads"
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 0b68e2e..baf83f0 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -85,12 +85,12 @@ ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
 FREERDP_CONF_OPTS += -DWITH_SERVER=ON
 endif
 
-ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_X11),y)
+ifneq ($(BR2_PACKAGE_FREERDP_CLIENT_X11)$(BR2_PACKAGE_FREERDP_CLIENT_WL),)
 FREERDP_CONF_OPTS += -DWITH_CLIENT=ON
 endif
 
 #---------------------------------------
-# X.Org libs for client and/or server
+# Libraries for client and/or server
 
 # The FreeRDP buildsystem uses non-orthogonal options. For example it
 # is not possible to build the server and the wayland client without
@@ -191,6 +191,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+FREERDP_DEPENDENCIES += wayland
+FREERDP_CONF_OPTS += -DWITH_WAYLAND=ON
+else
+FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
+endif
+
 #---------------------------------------
 # Post-install hooks to cleanup and install missing stuff
 
@@ -218,14 +225,21 @@ endef
 FREERDP_POST_INSTALL_STAGING_HOOKS += FREERDP_RM_CLIENT_X11_LIB
 endif # ! X client
 
+# Wayland client is always built as soon as wayland is enabled, so
+# manually remove it if the user does not want it.
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),)
+define FREERDP_RM_CLIENT_WL
+	rm -f $(TARGET_DIR)/usr/bin/wlfreerdp
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_RM_CLIENT_WL
+endif
+
 # Remove static libraries in unusual dir
 define FREERDP_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/lib/freerdp
 endef
 FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_CLEANUP
 
-FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
-
 # Install the server key and certificate, so that a client can connect.
 # A user can override them with its own in a post-build script, if needed.
 # We install them even if the server is not enabled, since another server
