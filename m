From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:21 +0100
Subject: [Buildroot] [PATCH 6/7] [INCOMPLETE] pkg-generic: act on enabled
	services
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <8bc04b49d635970227458d633820f50a4ee06dee.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7ea23ce..3e9a430 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -238,6 +238,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
+	$($(PKG)_INSTALL_SERVICES)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
@@ -481,7 +482,25 @@ $(2)_POST_LEGAL_INFO_HOOKS      ?=
 # Services to enable/disable
 ifneq ($$($(2)_SERVICES),)
 PACKAGES_WITH_SERVICES += $(1)
-endif
+
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
+define $(2)_INSTALL_SERVICES
+	$(INSTALL) -d -m 0755 $$(TARGET_DIR)/etc/init.d
+	$(INSTALL) -d -m 0755 $$(TARGET_DIR)/etc/defaults
+	$$(foreach srv,$$($(2)_SERVICES),\
+		$(INSTALL) -D -m 0755 $$(PKGDIR)/S??$$(srv) $$(TARGET_DIR)/etc/init.d/ && \
+		printf "ENABLED=%s\n" \
+			$$(if $$(BR2_PACKAGE_$(2)_SRV_$$(call UPPERCASE,$$(srv))),YES,NO) \
+			>$$(TARGET_DIR)/etc/defaults/$$(srv) && \
+		if [ -f $$(PKGDIR)/$$(srv).defaults ]; then \
+			cat $$(PKGDIR)/$$(srv).defaults >>$$(TARGET_DIR)/etc/defaults/$$(srv); \
+		fi && \
+		chmod 644 $$(TARGET_DIR)/etc/defaults/$$(srv) || exit 1$(sep)\
+	)
+endef
+endif # Sys-V init
+
+endif # Services
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -612,6 +631,7 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_TARGET):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
-- 
1.9.1
