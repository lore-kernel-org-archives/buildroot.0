From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 08:26:07 +0200
Subject: [Buildroot] [git commit] dhrystone: use the <pkg>_EXTRACT_CMDS
	mechanism
Message-ID: <20110930063212.067008DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44e42c61c44017a273b187ea19a78b60b499823c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhrystone/dhrystone.mk |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 45eb91c..098b9f1 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -8,6 +8,11 @@ DHRYSTONE_VERSION = 2
 DHRYSTONE_SOURCE = dhry-c
 DHRYSTONE_SITE = http://www.netlib.org/benchmark/
 
+define DHRYSTONE_EXTRACT_CMDS
+	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
+	$(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
+endef
+
 define DHRYSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
@@ -25,10 +30,3 @@ define DHRYSTONE_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-
-$(BUILD_DIR)/dhrystone-$(DHRYSTONE_VERSION)/.stamp_extracted:
-	@$(call MESSAGE,"Extracting")
-	$(Q)mkdir -p $(@D)
-	$(Q)cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE)
-	$(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
-	$(Q)touch $@
