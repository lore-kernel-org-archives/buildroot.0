From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:01:44 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: fix mpd.conf installation
	check
Message-ID: <20110209220225.0F1D58F47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b482314f87281db1f9fba028b028e1542ccf463
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If target /etc/mpd.conf exists the evaluation will be fail thus breaking
the build process. Fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 971ad67..61b107b 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -96,9 +96,10 @@ MPD_CONF_OPT += --disable-wavpack
 endif
 
 define MPD_INSTALL_EXTRA_FILES
-	[ ! -f $(TARGET_DIR)/etc/mpd.conf ] && \
+	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
 		$(INSTALL) -D package/multimedia/mpd/mpd.conf \
-			$(TARGET_DIR)/etc/mpd.conf
+			$(TARGET_DIR)/etc/mpd.conf; \
+	fi
 	$(INSTALL) -m 0755 -D package/multimedia/mpd/S95mpd \
 		$(TARGET_DIR)/etc/init.d/S95mpd
 endef
-- 
1.7.3.4
