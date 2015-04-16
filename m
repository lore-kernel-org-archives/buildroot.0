From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 16 Apr 2015 16:50:50 +0200
Subject: [Buildroot] [PATCH] live555: fix library installation
Message-ID: <1429195850-4884-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual target installation commands optionally copies 3 executables
that demonstrate the library usage, but do not the library itself.

This results in the following errors at runtime:

  # openRTSP
  openRTSP: can't load library 'libliveMedia.so.38'
  # live555MediaServer
  live555MediaServer: can't load library 'libliveMedia.so.38'
  # MPEG2TransportStreamIndexer
  MPEG2TransportStreamIndexer: can't load library 'libliveMedia.so.38'
  #

Tested with the following defconfig, which is basically
qemu_arm_versatile_defconfig + C++ + live555:

BR2_arm=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.0"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.0.config"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_LIVE555=y
BR2_TARGET_ROOTFS_EXT2=y

Fix the whole installation step by using the 'make install' step provided
by the upstream package, similar to what was done in commit
44d15563c706dce48f84 for the staging installation.
After that, we just delete the optional executables that are not selected
in configure.

Note: this change has the effect of installing all the test and demo
executables produced by the live555 compilation process, and that were
previously not copied. This increases the uncompressed target filesystem
size by roughly 300 kB (tested for a 32-bit ARM target).

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/live555/live555.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index cbd1e85..f5ff85f 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -44,18 +44,19 @@ define LIVE555_BUILD_CMDS
 	$(MAKE) -C $(@D) all
 endef
 
-LIVE555_FILES_TO_INSTALL-y =
-LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
-LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live555MediaServer
-LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer
+LIVE555_FILES_TO_REMOVE += $(if $(BR2_PACKAGE_LIVE555_OPENRTSP),,openRTSP)
+LIVE555_FILES_TO_REMOVE += $(if $(BR2_PACKAGE_LIVE555_MEDIASERVER),,live555MediaServer)
+LIVE555_FILES_TO_REMOVE += $(if $(BR2_PACKAGE_LIVE555_MPEG2_INDEXER),,MPEG2TransportStreamIndexer)
 
 define LIVE555_INSTALL_STAGING_CMDS
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 endef
 
 define LIVE555_INSTALL_TARGET_CMDS
-	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1; \
+	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
+	for i in $(LIVE555_FILES_TO_REMOVE); do \
+		echo "Removing $$i"; \
+		rm -f $(TARGET_DIR)/usr/bin/`basename $$i`; \
 	done
 endef
 
-- 
1.9.1
