From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  2 Sep 2011 13:15:43 +0200
Subject: [Buildroot] [PATCH v4] syslinux: add support for host-install
Message-ID: <1314962143-12093-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes in v4: The dependency on host-nasm has to be specified again
for the host package.

 boot/syslinux/syslinux.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 118807a..3f4236c 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -34,4 +34,22 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
+
+HOST_SYSLINUX_DEPENDENCIES = host-nasm
+HOST_SYSLINUX_POST_EXTRACT_HOOKS += SYSLINUX_RM_MK_LBA_IMG
+
+define HOST_SYSLINUX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_SYSLINUX_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
+endef
+
+define HOST_SYSLINUX_CLEAN_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
 $(eval $(call GENTARGETS,boot,syslinux))
+$(eval $(call GENTARGETS,boot,syslinux,host))
+
-- 
1.7.5.4
