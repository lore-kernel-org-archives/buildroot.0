From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 29 Feb 2016 00:16:47 +0100
Subject: [Buildroot] [PATCH v2] gst1-av: fix cpu detection in libav configure
Message-ID: <1456701407-18377-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script tries to guess a lot based on the cpu for which it
is configured. Without --cpu, it will use a 'generic' cpu and disable
any other options we pass to it.

In addition, we have to pass the --sysroot option like we do in the
ffmpeg package. This makes sure that regardless of the architecture
options that ffmpeg passes along, an external multilib toolchain
doesn't try to use a subdirectory of the sysroot. The libav build
system will pass a --isysroot argument which overrides the multilib
subdir.

Finally, we have to properly enable/disable the architecture-specific
optimisations. Autodetection of these things is completely borked in
the configure script.

Fixes:
http://autobuild.buildroot.net/results/ce83513135e7765c171353815947d715eb897d3d

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
v2: improve commit message

The --isysroot is something we should probably do in the toolchain
wrapper.
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 3a987a7..97ff40f 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -10,7 +10,10 @@ GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
 GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
 
-GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
+GST1_LIBAV_CONF_EXTRA_OPTS = \
+	--cross-prefix=$(TARGET_CROSS) \
+	--target-os=linux \
+	--sysroot=$(STAGING_DIR)
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
@@ -26,6 +29,12 @@ else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
+else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
 GST1_LIBAV_DEPENDENCIES += host-yasm
@@ -74,6 +83,18 @@ else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
 endif
 
+# Since we don't have architecture options for the DSP ASE, always disable
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mipsdspr1 --disable-mipsdspr2
+
+# We don't have mips32r5
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mips32r5
+
+ifeq ($(BR2_mips_64r6),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-mips64r6
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mips64r6
+endif
+
 GST1_LIBAV_CONF_OPTS = \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
 
-- 
2.7.0
