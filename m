From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:08:04 +0100
Subject: [Buildroot] [git commit branch/next] live555: use upstream install
	target for staging installation
Message-ID: <20141118221448.56C8DB4903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44d15563c706dce48f84b55bd299fc94c655f071
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Move include directories out of $(STAGING_DIR)/usr/include/live. This is
upstream choice, and is consistent with e.g. Debian. Update mplayer and vlc to
match.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/live555/live555.mk |   21 ++-------------------
 package/mplayer/mplayer.mk |    2 +-
 package/vlc/vlc.mk         |    9 ++++-----
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index e933faa..8c31a08 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -23,6 +23,7 @@ define LIVE555_CONFIGURE_CMDS
 	echo 'CPLUSPLUS_COMPILER = $(TARGET_CXX)' >> $(@D)/config.linux
 	echo 'LINK = $(TARGET_CXX) -o' >> $(@D)/config.linux
 	echo 'LINK_OPTS = -L. $(TARGET_LDFLAGS)' >> $(@D)/config.linux
+	echo 'PREFIX = /usr' >> $(@D)/config.linux
 	(cd $(@D); ./genMakefiles linux)
 endef
 
@@ -30,31 +31,13 @@ define LIVE555_BUILD_CMDS
 	$(MAKE) -C $(@D) all
 endef
 
-LIVE555_HEADERS_TO_INSTALL = \
-	liveMedia/include \
-	groupsock/include \
-	UsageEnvironment/include \
-	BasicUsageEnvironment/include
-
-LIVE555_LIBS_TO_INSTALL = \
-	liveMedia/libliveMedia.a \
-	groupsock/libgroupsock.a \
-	UsageEnvironment/libUsageEnvironment.a \
-	BasicUsageEnvironment/libBasicUsageEnvironment.a
-
 LIVE555_FILES_TO_INSTALL-y =
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live555MediaServer
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer
 
 define LIVE555_INSTALL_STAGING_CMDS
-	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
-		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
-		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
-	done; \
-	for i in $(LIVE555_LIBS_TO_INSTALL); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i`; \
-	done
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 endef
 
 define LIVE555_INSTALL_TARGET_CMDS
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index dbde977..b2530e4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -92,7 +92,7 @@ MPLAYER_DEPENDENCIES += live555
 MPLAYER_CONF_OPTS += --enable-live
 MPLAYER_LIVE555 = liveMedia groupsock UsageEnvironment BasicUsageEnvironment
 MPLAYER_CFLAGS += \
-	$(addprefix -I$(STAGING_DIR)/usr/include/live/,$(MPLAYER_LIVE555))
+	$(addprefix -I$(STAGING_DIR)/usr/include/,$(MPLAYER_LIVE555))
 MPLAYER_LDFLAGS += $(addprefix -l,$(MPLAYER_LIVE555)) -lstdc++
 else
 MPLAYER_CONF_OPTS += --disable-live
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 7e81d59..e2c81d6 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -231,11 +231,10 @@ VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
 VLC_CONF_ENV += \
 	LIVE555_CFLAGS="\
-		-I$(STAGING_DIR)/usr/include/live \
-		-I$(STAGING_DIR)/usr/include/live/BasicUsageEnvironment \
-		-I$(STAGING_DIR)/usr/include/live/groupsock \
-		-I$(STAGING_DIR)/usr/include/live/liveMedia \
-		-I$(STAGING_DIR)/usr/include/live/UsageEnvironment \
+		-I$(STAGING_DIR)/usr/include/BasicUsageEnvironment \
+		-I$(STAGING_DIR)/usr/include/groupsock \
+		-I$(STAGING_DIR)/usr/include/liveMedia \
+		-I$(STAGING_DIR)/usr/include/UsageEnvironment \
 		" \
 	LIVE555_LIBS="-L$(STAGING_DIR)/usr/lib -lliveMedia"
 else
