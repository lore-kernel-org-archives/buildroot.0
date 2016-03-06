From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Mar 2016 12:00:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: improve inline asm handling
	for libpostproc
Message-ID: <1457262024-2160-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We compile ffmpeg with runtime cpu detect enabled, which is also the
default upstream:
https://ffmpeg.org/pipermail/ffmpeg-cvslog/2012-September/054876.html
http://article.gmane.org/gmane.comp.video.ffmpeg.devel/151613

If inline asm is enabled (default value) libpostproc enables code for
mmx/3dnow/sse2, regardless of the target CPU chosen by buildroot:
http://git.videolan.org/gitweb.cgi/ffmpeg.git/?p=ffmpeg.git;a=blob;f=libpostproc/postprocess.c;h=1dc719cf93985d5504acb8af20441f5f3d5f9fe8;hb=refs/heads/release/2.8#l536

This patch moves the current i586-only workaround, which was based on
an incomplete understanding of the problem, inside the ifeq-libpostproc
code block.
Please note that inline-asm is also used on other archs besides x86,
therefore we need to check both for BR2_i386 and BR2_X86_CPU_HAS_MMX.

This patch was compile-tested using these defconfigs:

BR2_x86_i486=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_POSTPROC=y

BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_POSTPROC=y

BR2_x86_pentium_mmx=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_POSTPROC=y

This patch supersedes http://patchwork.ozlabs.org/patch/589461/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddfac20..9288d0e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -111,6 +111,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
 FFMPEG_CONF_OPTS += --enable-postproc
+# disable inline-asm on non-mmx Intel CPUs
+ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),y)
+FFMPEG_CONF_OPTS += --disable-inline-asm
+endif
 else
 FFMPEG_CONF_OPTS += --disable-postproc
 endif
@@ -352,11 +356,6 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
-ifeq ($(BR2_x86_i586),y)
-# Needed to work around a bug with gcc 5.x:
-# error: 'asm' operand has impossible constraints
-FFMPEG_CONF_OPTS += --disable-inline-asm
-endif
 FFMPEG_CONF_OPTS += --disable-yasm
 FFMPEG_CONF_OPTS += --disable-mmx
 endif
-- 
2.7.0
