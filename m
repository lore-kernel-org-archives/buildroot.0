From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Apr 2015 10:42:31 +0200
Subject: [Buildroot] [PATCH v2] live555: fix library installation
Message-ID: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual target installation commands optionally copy 3 executables
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
qemu_arm_versatile_defconfig plus C++ and live555:

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

Note: this change has the effect of installing unconditionally all the
test and demo executables produced by the live555 compilation process,
and that were previously not (or optionally) copied. This increases the
uncompressed target filesystem size by roughly 300 kB (tested for a
32-bit ARM target). Undesired files can be deleted in a post-build script.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

Changes v1 -> v2:
  - removal of the per-program options, just install everything,
    and leave it to post-build scripts to clean up what's needed
    (suggested by Thomas Petazzoni);
  - slightly improve commit message.
---
 package/live555/Config.in  | 23 -----------------------
 package/live555/live555.mk |  9 +--------
 2 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/package/live555/Config.in b/package/live555/Config.in
index 3823039..5018296 100644
--- a/package/live555/Config.in
+++ b/package/live555/Config.in
@@ -7,28 +7,5 @@ config BR2_PACKAGE_LIVE555
 
 	  http://www.live555.com/liveMedia/
 
-if BR2_PACKAGE_LIVE555
-
-config BR2_PACKAGE_LIVE555_OPENRTSP
-	bool "OpenRTSP"
-	default y
-	help
-	  Live555 RTSP Client.
-
-config BR2_PACKAGE_LIVE555_MEDIASERVER
-	bool "live555MediaServer"
-	default y
-	help
-	  RTSP Server. Supports numerous media formats such as H.264 and MPEG2.
-
-config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
-	bool "MPEG2TransportStreamIndexer"
-	default y
-	help
-	  MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
-	  operation in the Live555MediaServer.
-
-endif
-
 comment "live555 needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index cbd1e85..f90d5a4 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -44,19 +44,12 @@ define LIVE555_BUILD_CMDS
 	$(MAKE) -C $(@D) all
 endef
 
-LIVE555_FILES_TO_INSTALL-y =
-LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
-LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live555MediaServer
-LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer
-
 define LIVE555_INSTALL_STAGING_CMDS
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 endef
 
 define LIVE555_INSTALL_TARGET_CMDS
-	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1; \
-	done
+	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
