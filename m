From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 00:01:38 +0200
Subject: [Buildroot] [git commit] ffmpeg: don't pass --enable-mipsfpu on
	non-MIPS platform
Message-ID: <20160816220523.1959782133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdd0f8d5e421d858d84bac186a5f3a3ae82a29c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current logic to pass the --{enable,disable}-mipsfpu option is:

ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
FFMPEG_CONF_OPTS += --disable-mipsfpu
else
FFMPEG_CONF_OPTS += --enable-mipsfpu
endif

In practice, this means that on MIPS soft-float, --disable-mipsfpu is
passed, and that in *all* other cases, --enable-mipsfpu is passed,
including if we are *not* targetting the MIPS architecture.

Even though this doesn't seem to cause any problem, it is a bit weird to
see --enable-mipsfpu when you're building ffmpeg for a non-MIPS
architecture, so we better fix this by enclosing the MIPS-related
options in a MIPS condition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2b4219a..5a19617 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -441,6 +441,7 @@ else
 FFMPEG_CONF_OPTS += --disable-neon
 endif
 
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
 ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
 FFMPEG_CONF_OPTS += --disable-mipsfpu
 else
@@ -454,6 +455,7 @@ else
 FFMPEG_CONF_OPTS += \
 	--disable-mips32r2
 endif
+endif # MIPS
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 FFMPEG_CONF_OPTS += --enable-altivec
