From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] oprofile: use correct way of
	overriding steps
Message-ID: <20100916113827.C65358AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d073318876c92f9d0729d8d775a3a1eada3eeff1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/oprofile.mk |   21 +++++++++------------
 1 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 215e85b..3be50f2 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -26,22 +26,19 @@ endif
 
 OPROFILE_DEPENDENCIES := popt binutils_target
 
-$(eval $(call AUTOTARGETS,package,oprofile))
-
-$(OPROFILE_TARGET_INSTALL_TARGET):
+define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
-	cp -dpfr $(OPROFILE_DIR)/events/$(OPROFILE_ARCH) $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -m 644 $(OPROFILE_DIR)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -m 755 $(OPROFILE_DIR)/utils/opcontrol $(TARGET_DIR)/usr/bin
-	$(INSTALL) -m 755 $(addprefix $(OPROFILE_DIR)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
-	touch $@
+	cp -dpfr $(@D)/events/$(OPROFILE_ARCH) $(TARGET_DIR)/usr/share/oprofile
+	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
+	$(INSTALL) -m 755 $(@D)/utils/opcontrol $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
+endef
 
-$(OPROFILE_TARGET_CLEAN):
+define OPROFILE_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
 	rm -f $(TARGET_DIR)/usr/bin/opcontrol
 	rm -rf $(TARGET_DIR)/usr/share/oprofile
-	-$(MAKE) -C $(OPROFILE_DIR) clean
-	touch $@
+endef
 
+$(eval $(call AUTOTARGETS,package,oprofile))
-- 
1.7.1
