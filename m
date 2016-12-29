From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Thu, 29 Dec 2016 12:56:50 -0200
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
Message-ID: <20161229145650.4013-1-barbieri@profusion.mobi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ecore will reach 'upower' using D-Bus in order to detect if the system
state changes. This is optional, but done by default and if D-Bus
itself fails, then an error message will be presented.

Since we do not ship upower target package, just remove that from
target. Since it's useless for host, remove it as well.

Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
---
 package/efl/efl.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 7a8e47f4c..f7c99a965 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -272,6 +272,11 @@ else
 EFL_CONF_OPTS += --disable-librsvg
 endif
 
+define EFL_HOOK_REMOVE_UPOWER
+	rm -fr $(TARGET_DIR)/usr/lib/ecore/system/upower
+endef
+EFL_POST_INSTALL_TARGET_HOOKS = EFL_HOOK_REMOVE_UPOWER
+
 $(eval $(autotools-package))
 
 ################################################################################
@@ -352,4 +357,9 @@ else
 HOST_EFL_CONF_OPTS += --disable-cxx-bindings
 endif
 
+define HOST_EFL_HOOK_REMOVE_UPOWER
+	rm -fr $(HOST_DIR)/usr/lib/ecore/system/upower
+endef
+HOST_EFL_POST_INSTALL_HOOKS = HOST_EFL_HOOK_REMOVE_UPOWER
+
 $(eval $(host-autotools-package))
-- 
2.11.0
