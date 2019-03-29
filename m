From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:06:08 +0100
Subject: [Buildroot] [git commit] package/gst1-libav: fix build on mips64el
Message-ID: <20190329160252.3FDAB8A2D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=902d3d27bc729b5466fcb3eb130525f26f6d81b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply the same behavior for CPU in gst1-libav than in ffmpeg:
 - use generic cpu for all mips architectures
 - use GCC_TARGET_{ARCH,CPU} instead of BR2_TARGET_{ARCH,CPU}

Fixes:
 - http://autobuild.buildroot.org/results/776028a43bd180b4895efc74321e3aee56cbcb47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 254ab719ae..73e47a0639 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -35,10 +35,14 @@ GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
 # Generic CPU setup for bundled ffmpeg
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
-else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
+# Default to --cpu=generic for MIPS architecture, in order to avoid a
+# build failure on mips64r6.
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=generic
+else ifneq ($(GCC_TARGET_CPU),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(GCC_TARGET_CPU)
+else ifneq ($(GCC_TARGET_ARCH),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(GCC_TARGET_ARCH)
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
