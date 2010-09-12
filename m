From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:56 +0200
Subject: [Buildroot] [PATCH 10/74] samba: convert old-style hooks to
	new-style hooks
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e8ba6a5119ce025c351380a942f3a399d78fb9a7.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |   29 +++++++++++++++++------------
 1 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 44f7fde..141c690 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -85,9 +85,6 @@ SAMBA_UNINSTALL_TARGET_OPT = \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),uninstallswat)
 
 
-$(eval $(call AUTOTARGETS,package,samba))
-
-
 # binaries to keep
 SAMBA_BINTARGETS_y = \
 	usr/sbin/smbd \
@@ -155,14 +152,14 @@ SAMBA_TXTTARGETS_ = \
 SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_FINDSMB) += usr/bin/findsmb
 SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_SMBTAR) += usr/bin/smbtar
 
-
-$(SAMBA_HOOK_POST_INSTALL):
-	$(call MESSAGE,"Post installing")
-	# remove unneeded
+define SAMBA_REMOVE_UNNEEDED_BINARIES
 	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_))
 	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_TXTTARGETS_))
-ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+endef
+
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_UNNEEDED_BINARIES
+
+define SAMBA_REMOVE_SWAT_DOCUMENTATION
 	# Remove the documentation
 	rm -rf $(TARGET_DIR)/usr/swat/help/manpages
 	rm -rf $(TARGET_DIR)/usr/swat/help/Samba3*
@@ -170,10 +167,15 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	# Removing the welcome.html file will make swat default to
 	# welcome-no-samba-doc.html
 	rm -rf $(TARGET_DIR)/usr/swat/help/welcome.html
+endef
+
+ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
 endif
 endif
-	# strip binaries
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_y))
+
+define SAMBA_INSTALL_INITSCRIPTS_CONFIG
 	# install start/stop script
 	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
 		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
@@ -182,5 +184,8 @@ endif
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi
-	$(Q)touch $@
+endef
+
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
 
+$(eval $(call AUTOTARGETS,package,samba))
-- 
1.7.0.4
