From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2014 10:16:27 +0100
Subject: [Buildroot] [git commit] package: add vo-aacenc (aac encoder)
Message-ID: <20140228133413.A1FF59BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0510e34783b871c68273479e0f5ba7295c11339d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/vo-aacenc/Config.in    |    9 +++++++++
 package/vo-aacenc/vo-aacenc.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b8b2f4e..cb2d31b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ source "package/portaudio/Config.in"
 source "package/speex/Config.in"
 source "package/taglib/Config.in"
 source "package/tremor/Config.in"
+source "package/vo-aacenc/Config.in"
 source "package/webrtc-audio-processing/Config.in"
 endmenu
 
diff --git a/package/vo-aacenc/Config.in b/package/vo-aacenc/Config.in
new file mode 100644
index 0000000..b5487dc
--- /dev/null
+++ b/package/vo-aacenc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_VO_AACENC
+	bool "vo-aacenc"
+	help
+	  This library contains an encoder implementation of the
+	  Advanced Audio Coding (AAC) audio codec. The library is
+	  based on a codec implementation by VisualOn as part of the
+	  Stagefright framework from the Google Android project.
+
+	  http://sourceforge.net/projects/opencore-amr/
diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
new file mode 100644
index 0000000..8f01c34
--- /dev/null
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# vo-aacenc
+#
+################################################################################
+
+VO_AACENC_VERSION = 0.1.3
+VO_AACENC_SITE = http://downloads.sourceforge.net/project/opencore-amr/vo-aacenc
+VO_AACENC_LICENSE = Apache-2.0
+VO_AACENC_LICENSE_FILES = COPYING
+VO_AACENC_INSTALL_STAGING = YES
+
+# arm specific asm optimizations
+ifeq ($(BR2_arm),y)
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+VO_AACENC_CONF_OPT += --enable-armv7neon
+# mfpu=neon needed to assemble neon code
+VO_AACENC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mfpu=neon"
+else
+VO_AACENC_CONF_OPT += --disable-armv7neon
+
+ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),)
+VO_AACENC_CONF_OPT += --enable-armv5e
+else
+VO_AACENC_CONF_OPT += --disable-armv5e
+endif
+
+endif # !neon
+endif # arm
+
+$(eval $(autotools-package))
