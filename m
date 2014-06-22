From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:18:41 +0200
Subject: [Buildroot] [git commit] gst-ffmpeg: fix build on armv6 without
	thumb2 (e.g. RaspberryPi)
Message-ID: <20140622171907.7E40E9D04E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=929180d1b899f93467b8833f4b08b6dd20ff298d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rename existing patch and the one added by Arnout to follow
the patch naming convention.]

Cc: Marco Trapanese <marcotrapanese@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ....13_gcc47.patch => gst-ffmpeg-0001-gcc47.patch} |    0
 ...0002-arm-avoid-using-the-movw-instruction.patch |   41 ++++++++++++++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0001-gcc47.patch
similarity index 100%
rename from package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_gcc47.patch
rename to package/gstreamer/gst-ffmpeg/gst-ffmpeg-0001-gcc47.patch
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch
new file mode 100644
index 0000000..288dc3d
--- /dev/null
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch
@@ -0,0 +1,41 @@
+Date: Mon, 1 Aug 2011 20:21:04 +0300
+Subject: [libavcodec] arm: Avoid using the movw instruction needlessly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+This fixes building for ARM11 without Thumb2.
+
+Signed-off-by: Martin Storsj?? <martin@martin.st>
+
+[Arnout: backported to gst-ffmpeg, from ffmpeg 9a83adaf3]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S b/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
+index d3058ff..b6aee86 100644
+--- a/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
++++ b/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
+@@ -37,7 +37,7 @@ function ff_ac3_bit_alloc_calc_bap_armv6, export=1
+         ldrb            r10, [r4], #1
+ 1:
+         ldrsh           r9,  [r0], #2                   @ mask[band]
+-        movw            r8,  #0x1fe0
++        mov             r8,  #0xff0
+         sub             r9,  r9,  r12                   @   - snr_offset
+         mov             r11, r10
+         ldrb            r10, [r4], #1                   @ band_start_tab[band++]
+@@ -44,7 +44,7 @@ function ff_ac3_bit_alloc_calc_bap_armv6, export=1
+         subs            r9,  r9,  r5                    @   - floor
+         movlt           r9,  #0
+         cmp             r10, r3                         @   - end
+-        and             r9,  r9,  r8                    @   & 0x1fe0
++        and             r9,  r9,  r8, lsl #1            @   & 0x1fe0
+         subgt           r8,  r3,  r11
+         suble           r8,  r10, r11
+         add             r9,  r9,  r5                    @   + floor => m
+--
+1.7.10.4
+
