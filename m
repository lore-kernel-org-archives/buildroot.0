From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:31:21 +0200
Subject: [Buildroot] [PATCH 13/15] dhrystone: use the <pkg>_EXTRACT_CMDS
	mechanism
In-Reply-To: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ddb997a16db9a337b3590dfe33f0690e41bcd241.1314826232.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
