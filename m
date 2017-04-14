From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 14 Apr 2017 11:30:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] ffmpeg: fix neon support for aarch64
Message-ID: <20170414093026.32067-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg ported arm 32-bit NEON code to aarch64 as hard dependency:
http://ffmpeg.org/pipermail/ffmpeg-devel/2016-November/202733.html

Buildroot option BR2_ARM_CPU_HAS_NEON handles only the 32bit case:
https://git.buildroot.net/buildroot/commit/?id=0976cd6cd64a128a2ac921e4f35f0e7cbe306692

For aarch64 we need to make sure to pass --enable-neon in order to
prevent a link error, fixes

http://autobuild.buildroot.net/results/fa4/fa46003249664b1f97f6c18253c84cd3d6fb9cdb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed if-clause (Thomas)
    v1 "fixed" the problem as well by omitting --disable-neon,
    ffmpeg then autodetected neon support ;)

 package/ffmpeg/ffmpeg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 059f8320e..adc0f5d42 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -432,6 +432,8 @@ FFMPEG_CONF_OPTS += --disable-vfp
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FFMPEG_CONF_OPTS += --enable-neon
+else ifeq ($(BR2_aarch64),y)
+FFMPEG_CONF_OPTS += --enable-neon
 else
 FFMPEG_CONF_OPTS += --disable-neon
 endif
-- 
2.11.0
