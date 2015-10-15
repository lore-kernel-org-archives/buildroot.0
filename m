From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 13:28:11 +0200
Subject: [Buildroot] [git commit] mplayer: enable apng and tdsc only if zlib
	is available
Message-ID: <20151015112816.C140881F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9731582d5c10d362878a194aa34bfcc0825a4395
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apng and tdsc are enabled by default, but they need zlib, otherwise the
compilation will fail with an error like this one:

libavcodec/pngdec.c:35:18: fatal error: zlib.h: No such file or
directory
 #include <zlib.h>
                  ^
compilation terminated.

So add an autodep on BR2_PACKAGE_ZLIB to enable or disable support for
apng and tdsc accordingly.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index d896b35..2f58864 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -27,6 +27,19 @@ else
 MPLAYER_CONF_OPTS += --disable-big-endian
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MPLAYER_DEPENDENCIES += zlib
+MPLAYER_CONF_OPTS += \
+	--enable-decoder=apng \
+	--enable-encoder=apng \
+	--enable-decoder=tdsc
+else
+MPLAYER_CONF_OPTS += \
+	--disable-decoder=apng \
+	--disable-encoder=apng \
+	--disable-decoder=tdsc
+endif
+
 ifeq ($(BR2_PACKAGE_SDL),y)
 MPLAYER_CONF_OPTS += \
 	--enable-sdl \
