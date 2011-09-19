From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:19 +0200
Subject: [Buildroot] [PATCH 16/21] dhrystone: use the <pkg>_EXTRACT_CMDS
	mechanism
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0a04b353dce3a97be30c05bc84dbf478181d2355.1316464690.git.thomas.petazzoni@free-electrons.com>
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
