From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 11:41:24 +0200
Subject: [Buildroot] [git commit] ffmpeg: fix neon support for aarch64
Message-ID: <20170414094133.43FEA826D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9de0100cf1ef55789d582fce265dd6c536beb6e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg ported arm 32-bit NEON code to aarch64 as hard dependency:
http://ffmpeg.org/pipermail/ffmpeg-devel/2016-November/202733.html

Buildroot option BR2_ARM_CPU_HAS_NEON handles only the 32bit case:
https://git.buildroot.net/buildroot/commit/?id=0976cd6cd64a128a2ac921e4f35f0e7cbe306692

For aarch64 we need to make sure to pass --enable-neon in order to
prevent a link error, fixes

http://autobuild.buildroot.net/results/fa4/fa46003249664b1f97f6c18253c84cd3d6fb9cdb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 059f832..adc0f5d 100644
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
