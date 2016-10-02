From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  2 Oct 2016 17:37:23 +0200
Subject: [Buildroot] [PATCH] vo-aacenc: disable arm optimizations on
	thumb2-only variants
Message-ID: <20161002153723.1135-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/258/258e14227cdd5a6f5cc83ab7fd176eb5b5b8445a/
http://autobuild.buildroot.org/results/634/6345b4c491fca952cd692844e3ac2932ac4836dc/

The ARM assembly optimizations in vo-aacenc requires ARM instructions
support, so disable for ARM variants without ARM instruction support (E.G.
cortex-m).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vo-aacenc/vo-aacenc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
index 23d7e62..ecdd584 100644
--- a/package/vo-aacenc/vo-aacenc.mk
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -15,6 +15,7 @@ VO_AACENC_CFLAGS = $(TARGET_CFLAGS)
 # arm specific asm optimizations
 ifeq ($(BR2_arm),y)
 
+ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
 # vo-aacenc has ARM assembly code that cannot be compiled in Thumb2
 # mode, so we must force the traditional ARM mode.
 VO_AACENC_CFLAGS += -marm
@@ -33,6 +34,10 @@ VO_AACENC_CONF_OPTS += --disable-armv5e
 endif
 
 endif # !neon
+
+else
+VO_AACENC_CONF_OPTS += --disable-armv7neon --disable-armv5e
+endif # has-arm
 endif # arm
 
 VO_AACENC_CONF_ENV = \
-- 
2.9.3
