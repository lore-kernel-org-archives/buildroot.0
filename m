From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:33:05 -0000
Subject: [Buildroot] [git commit] linux: install dtc (device tree compiler)
	as host tool if selected
Message-ID: <20120531113257.6597B96E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=707d44d0a28906ebda49584dd5f55985406f0bde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having dtc as a host tool can be useful for users that have a custom
boot scenario where the device tree is not embedded in the kernel.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 34f8623..f165dda 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -183,6 +183,15 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
+
+define LINUX_INSTALL_HOST_TOOLS
+	# Installing dtc (device tree compiler) as host tool, if selected
+	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
+		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
+	fi
+endef
+
+
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 endef
@@ -197,6 +206,7 @@ define LINUX_INSTALL_TARGET_CMDS
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
+	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
 include linux/linux-ext-*.mk
