From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:52 +0100
Subject: [Buildroot] [PATCH v1 3/6] vlc: fix live555 support
In-Reply-To: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391870095-3738-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc looks for a *.pc file which is not provided by the live555 package.
So, instead, we explicitly set the LIVE555_CFLAGS and LIVE555_LIBS
variables.

Fixes:
  http://autobuild.buildroot.org/results/b59/b5972ecad4e5004dc23a2366066ce45346994f58/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 1027151..feee82d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -194,6 +194,15 @@ endif
 ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPT += --enable-live555
 VLC_DEPENDENCIES += live555
+VLC_CONF_ENV = \
+	LIVE555_CFLAGS="\
+		-I$(STAGING_DIR)/usr/include/live \
+		-I$(STAGING_DIR)/usr/include/live/BasicUsageEnvironment \
+		-I$(STAGING_DIR)/usr/include/live/groupsock \
+		-I$(STAGING_DIR)/usr/include/live/liveMedia \
+		-I$(STAGING_DIR)/usr/include/live/UsageEnvironment \
+		" \
+	LIVE555_LIBS="-L$(STAGING_DIR)/usr/lib -lliveMedia"
 else
 VLC_CONF_OPT += --disable-live555
 endif
-- 
1.8.5.4
