From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 17:05:12 +0200
Subject: [Buildroot] [git commit] minidlna: fix build failure
Message-ID: <20131008150944.689769B930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aab5d679e72f11d4b405d63803663896bb69a98c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the 1.0.26 version bump a new routine was added to find newer
versions of ffmpeg and/or libav on different include paths.
Unfortunately this uses absolute pathnames hence when there's no
matching ffmpeg/libav headers on the host it fails to build. Fixes:
http://autobuild.buildroot.net/results/20a/20a1b3a9f040d2207b6c533a158e9747054ddd2d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
