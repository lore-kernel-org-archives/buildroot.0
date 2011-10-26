From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 27 Oct 2011 00:27:55 +0200
Subject: [Buildroot] [PATCH] syslinux: add support for host-install
In-Reply-To: <85632AA8828446C5B830EBF9A14700E5@beraninstruments.com.local>
References: <85632AA8828446C5B830EBF9A14700E5@beraninstruments.com.local>
Message-ID: <1319668075-20291-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Hoi Will,

 This patch (applied to the current HEAD) builds syslinux for the host.

 What is still missing from this is a way to have a Windows self-installer.
I've got a patch cooking for that too, but it's a hack: it copies the
precompiled syslinux.exe binary from the extracted tar file.

 Regards,
 Arnout
---
 boot/syslinux/syslinux.mk |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index fa5af07..66a7076 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -26,4 +26,20 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
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
 $(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
-- 
1.7.7
