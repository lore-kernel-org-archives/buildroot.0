From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 30 Aug 2011 18:28:50 +0200
Subject: [Buildroot] [PATCH 2/2] syslinux: add support for host-install
In-Reply-To: <1314721730-8241-1-git-send-email-arnout@mind.be>
References: <1314721730-8241-1-git-send-email-arnout@mind.be>
Message-ID: <1314721730-8241-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: arnout <arnout@cab5c6b8-da64-4be1-9ed2-3136eea3ef10>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/syslinux/syslinux.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 125960f..fe48b34 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -34,4 +34,21 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
+
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
