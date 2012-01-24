From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 12:59:47 +0100
Subject: [Buildroot] [git commit] syslinux: add support for host-install
Message-ID: <20120124120024.EB91D903C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9baaa5b4a39145f4cc64c6bba1a6aa8cec48f00a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes it possible to build the syslinux/extlinux installer, so a
bootable USB drive, CompactFlash or SD card can be created by a user
script.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/syslinux/syslinux.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index da30d5a..3e89bdf 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -26,4 +26,18 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
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
