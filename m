From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 11:03:36 +0200
Subject: [Buildroot] [git commit] live555: install to staging
Message-ID: <20111028090516.7F3358EE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30bcdbbb70bd5943949c738702b0b38f12a1f325
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install live555 library to staging for mplayer.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/live555/live555.mk |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/live555/live555.mk b/package/multimedia/live555/live555.mk
index 0051ea0..9e0ef14 100644
--- a/package/multimedia/live555/live555.mk
+++ b/package/multimedia/live555/live555.mk
@@ -7,6 +7,7 @@
 LIVE555_VERSION = 2011.06.16
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public/
+LIVE555_INSTALL_STAGING = YES
 LIVE555_INSTALL_TARGET = YES
 
 define LIVE555_CONFIGURE_CMDS
@@ -26,6 +27,18 @@ define LIVE555_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
+LIVE555_HEADERS_TO_INSTALL = \
+	liveMedia/include \
+	groupsock/include \
+	UsageEnvironment/include \
+	BasicUsageEnvironment/include
+
+LIVE555_LIBS_TO_INSTALL = \
+	liveMedia/libliveMedia.a \
+	groupsock/libgroupsock.a \
+	UsageEnvironment/libUsageEnvironment.a \
+	BasicUsageEnvironment/libBasicUsageEnvironment.a
+
 LIVE555_FILES_TO_INSTALL- =
 LIVE555_FILES_TO_INSTALL-y =
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
@@ -33,12 +46,29 @@ LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live5
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer
 LIVE555_FILES_TO_INSTALL- += $(LIVE555_FILES_TO_INSTALL-y)
 
+define LIVE555_INSTALL_STAGING_CMDS
+	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
+		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
+		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
+	done; \
+	for i in $(LIVE555_LIBS_TO_INSTALL); do \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i`; \
+	done
+endef
+
 define LIVE555_INSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
 	done
 endef
 
+define LIVE555_UNINSTALL_STAGING_CMDS
+	rm -rf $(STAGING_DIR)/usr/include/live
+	for i in $(LIVE555_LIBS_TO_INSTALL); do \
+		rm -f $(addprefix $(STAGING_DIR)/usr/lib/, `basename $$i`); \
+	done
+endef
+
 define LIVE555_UNINSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-); do \
 		rm -f $(addprefix $(TARGET_DIR)/usr/bin/, `basename $$i`); \
