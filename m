From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Dec 2012 09:40:31 -0300
Subject: [Buildroot] [PATCH] ffmpeg: make ARM optimizations explicit
Message-ID: <1356093631-558-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ffmpeg configure script tries to autodetermine ARM optimizations by
building a small code snippet with AS.
If AS allows higher-level (>generic) assembly instructions then it
passes and enables the relevant optimization path.
Some toolchains allow/default to more than generic asm and then fail
when the real code is built.
Fixes:
http://autobuild.buildroot.net/results/b6e1225a07a58cc7544e37bc55675be71e2b5088/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/ffmpeg/ffmpeg.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 90c1f1b..b018ea0 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -133,19 +133,26 @@ FFMPEG_DEPENDENCIES += host-nasm
 endif
 endif
 
-# ARM defaults to v5: clear if less, add extra if more
+# Explicitly disable everything that doesn't match for ARM
+# FFMPEG "autodetects" by compiling an extended instruction via AS
+# This works on compilers that aren't built for generic by default
 ifeq ($(BR2_generic_arm)$(BR2_arm7tdmi)$(BR2_arm610)$(BR2_arm710)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t),y)
 FFMPEG_CONF_OPT += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s),y)
 FFMPEG_CONF_OPT += --enable-armv6
+else
+FFMPEG_CONF_OPT += --disable-armv6 --disable-armv6t2
 endif
-ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s)$(BR2_cortex_a8)$(BR2_cortex_a9),y)
+ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
 FFMPEG_CONF_OPT += --enable-armvfp
+else
+FFMPEG_CONF_OPT += --disable-armvfp
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FFMPEG_CONF_OPT += --enable-neon
 endif
+
 # Set powerpc altivec appropriately
 ifeq ($(BR2_powerpc),y)
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
-- 
1.7.8.6
