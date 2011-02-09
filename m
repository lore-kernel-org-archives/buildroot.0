From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Feb 2011 10:25:53 -0300
Subject: [Buildroot] [PATCH 5/5] mpd: fix mpd.conf installation check
In-Reply-To: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1297257953-8381-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If target /etc/mpd.conf exists the evaluation will be fail thus breaking
the build process. Fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
