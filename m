From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Oct 2013 23:18:20 -0300
Subject: [Buildroot] [PATCH] minidlna: fix build failure
Message-ID: <1381198700-16125-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the 1.0.26 version bump a new routine was added to find newer
versions of ffmpeg and/or libav on different include paths.
Unfortunately this uses absolute pathnames hence when there's no
matching ffmpeg/libav headers on the host it fails to build. Fixes:
http://autobuild.buildroot.net/results/20a/20a1b3a9f040d2207b6c533a158e9747054ddd2d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/minidlna/minidlna.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 4df6ff0..c99ade2 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -35,10 +35,15 @@ endif
 
 MINIDLNA_MAKE_OPTS += LIBS='$(MINIDLNA_COMMON_LIBS)'
 
+# genconfig.sh uses absolute paths to find libav, so help it out
 define MINIDLNA_BUILD_CMDS
 	PREFIX=$(STAGING_DIR)/usr \
 		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(MINIDLNA_CFLAGS)" -C $(@D) depend
+	$(SED) '/HAVE_LIBAV/d' $(@D)/config.h
+	echo "#define HAVE_LIBAVUTIL_AVUTIL_H 1" >>$(@D)/config.h
+	echo "#define HAVE_LIBAVFORMAT_AVFORMAT_H 1" >>$(@D)/config.h
+	echo "#define HAVE_LIBAVCODEC_AVCODEC_H 1" >>$(@D)/config.h
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(MINIDLNA_CFLAGS)" $(MINIDLNA_MAKE_OPTS) -C $(@D) all
 endef
-- 
1.8.1.5
