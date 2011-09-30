From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 08:26:07 +0200
Subject: [Buildroot] [git commit] whetstone: use the <pkg>_EXTRACT_CMDS
	mechanism
Message-ID: <20110930063212.3AD548DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ad5533832eba4bf386b81d33ecaaf92a4a145fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/whetstone/whetstone.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 48a3adf..048f4de 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -8,6 +8,10 @@ WHETSTONE_VERSION = 1.2
 WHETSTONE_SOURCE = whetstone.c
 WHETSTONE_SITE = http://www.netlib.org/benchmark/
 
+define WHETSTONE_EXTRACT_CMDS
+	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+endef
+
 define WHETSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) LDLIBS="-lm" -C $(@D) whetstone
 endef
@@ -25,9 +29,3 @@ define WHETSTONE_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-
-$(BUILD_DIR)/whetstone-$(WHETSTONE_VERSION)/.stamp_extracted:
-	@$(call MESSAGE,"Extracting")
-	$(Q)mkdir -p $(@D)
-	$(Q)cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
-	$(Q)touch $@
