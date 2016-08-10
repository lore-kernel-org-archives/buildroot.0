From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 23:29:04 +0200
Subject: [Buildroot] [PATCH 3/3] ffmpeg: don't pass --enable-mipsfpu on
	non-MIPS platform
In-Reply-To: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470864544-31919-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.7.4
