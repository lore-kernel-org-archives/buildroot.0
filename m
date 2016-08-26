From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 17:16:19 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: default to --cpu=generic
	for MIPS architecture
Message-ID: <20160902142940.80F098253D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30a87d332779f8dda1260ad7947c5482427cd447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option is needed to prevent this message from configure:

WARNING: unknown CPU. Disabling all MIPS optimizations.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - group with the other --cpu conditions so that only one is passed.
 - improve the comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a816cea..91e7fa9 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -449,12 +449,17 @@ else
 FFMPEG_CONF_OPTS += --disable-pic
 endif
 
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+# Default to --cpu=generic for MIPS architecture, in order to avoid a
+# warning from ffmpeg's configure script.
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+FFMPEG_CONF_OPTS += --cpu=generic
+else ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
 else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
 endif
 
+
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
