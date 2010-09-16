From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libidn: convert old-style hooks
	to new-style hooks
Message-ID: <20100916113823.8DF5B8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=26d0bb8b11ecef1273a2cc95f0197f65dc7b3a62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libidn/libidn.mk |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 79e0321..1627c96 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -13,17 +13,23 @@ LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
 LIBIDN_LIBTOOL_PATCH = NO
 LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-$(eval $(call AUTOTARGETS,package,libidn))
+define LIBIDN_REMOVE_BINARY
+	rm -f $(TARGET_DIR)/usr/bin/idn
+endef
 
-$(LIBIDN_HOOK_POST_INSTALL):
 ifneq ($(BR2_PACKAGE_LIBIDN_BINARY),y)
-	rm -f $(TARGET_DIR)/usr/bin/idn
+LIBIDN_POST_INSTALL_TARGET_HOOKS += LIBIDN_REMOVE_BINARY
 endif
+
+define LIBIDN_REMOVE_EMACS_STUFF
 	rm -rf $(TARGET_DIR)/usr/share/emacs
-	touch $@
+endef
 
-$(LIBIDN_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+LIBIDN_POST_INSTALL_TARGET_HOOKS += LIBIDN_REMOVE_EMACS_STUFF
+
+define LIBIDN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libidn*
 	rm -f $(TARGET_DIR)/usr/bin/idn
-	rm -f $(LIBIDN_TARGET_INSTALL_TARGET) $(LIBIDN_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,libidn))
-- 
1.7.1
