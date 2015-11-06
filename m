From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  6 Nov 2015 20:15:30 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
	installation
Message-ID: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages misbehave, and install files in either of;
  - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
  - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).

One common reason for that is that pkgconf now prepends the sysroot path
to all the paths it returns. Other reasons vary, but are mostly due to
poorly writen generic-packages.

Add a check for those locations, as part of the command blocks for the
target and staging installs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Romain Naour <romain.naour@openwide.fr>

---
Chamges v3 -> v4:
  - don't use step hooks; do the checks in the command blocks (Arnout)

Changes v2 -> v3:
  - also check for $(HOST_DIR) in case the user specified an
    out-of-build-dir location  (Arnout)

---
Note that, in the current state of Buildroot, this *will* cause a lot of
build failures until all those packages are fixed. Among the known to
break are quite a few Xorg packages.
---
 package/pkg-generic.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a5d0e57..82ec32e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -229,6 +229,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	$(call check-install-dirs,$(STAGING_DIR))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
@@ -275,6 +276,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(call check-install-dirs,$(TARGET_DIR))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
@@ -286,6 +288,23 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
 
 ################################################################################
+# check-install-dirs -- check that packages do not incorrectly install files
+# into incorrect locations
+#
+# argument 2 is the base directory to check for
+################################################################################
+define check-install-dirs
+	$(Q)if [ -d $(1)/$(HOST_DIR) ]; then \
+		printf "ERROR: package %s installs files in %s\n" $($(PKG)_NAME) $(1)$(HOST_DIR); \
+		exit 1; \
+	fi
+	$(Q)if [ -d $(1)/$(O) ]; then \
+		printf "ERROR: package %s installs files in %s\n" $($(PKG)_NAME) $(1)$(O); \
+		exit 1; \
+	fi
+endef
+
+################################################################################
 # virt-provides-single -- check that provider-pkg is the declared provider for
 # the virtual package virt-pkg
 #
-- 
1.9.1
