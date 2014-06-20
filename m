From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Jun 2014 22:06:20 +0200
Subject: [Buildroot] [PATCH] gst-ffmpeg: fix build on armv6 without
 thumb2 (e.g. RaspberryPi)
In-Reply-To: <1403133378-28417-1-git-send-email-arnout@mind.be>
References: <1403133378-28417-1-git-send-email-arnout@mind.be>
Message-ID: <20140620200620.GB3543@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-19 01:16 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Cc: Marco Trapanese <marcotrapanese@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I only build-tested this - Marco, please test it properly. Although, you
> probably don't even use ac3 so the failing code won't be executed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Patch is indeed the one from upstream! ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...3_01-arm-avoid-using-the-movw-instruction.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_01-arm-avoid-using-the-movw-instruction.patch
> 
> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_01-arm-avoid-using-the-movw-instruction.patch b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_01-arm-avoid-using-the-movw-instruction.patch
> new file mode 100644
> index 0000000..288dc3d
> --- /dev/null
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_01-arm-avoid-using-the-movw-instruction.patch
> @@ -0,0 +1,41 @@
> +Date: Mon, 1 Aug 2011 20:21:04 +0300
> +Subject: [libavcodec] arm: Avoid using the movw instruction needlessly
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=utf8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes building for ARM11 without Thumb2.
> +
> +Signed-off-by: Martin Storsj? <martin@martin.st>
> +
> +[Arnout: backported to gst-ffmpeg, from ffmpeg 9a83adaf3]
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> +---
> + gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S b/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
> +index d3058ff..b6aee86 100644
> +--- a/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
> ++++ b/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
> +@@ -37,7 +37,7 @@ function ff_ac3_bit_alloc_calc_bap_armv6, export=1
> +         ldrb            r10, [r4], #1
> + 1:
> +         ldrsh           r9,  [r0], #2                   @ mask[band]
> +-        movw            r8,  #0x1fe0
> ++        mov             r8,  #0xff0
> +         sub             r9,  r9,  r12                   @   - snr_offset
> +         mov             r11, r10
> +         ldrb            r10, [r4], #1                   @ band_start_tab[band++]
> +@@ -44,7 +44,7 @@ function ff_ac3_bit_alloc_calc_bap_armv6, export=1
> +         subs            r9,  r9,  r5                    @   - floor
> +         movlt           r9,  #0
> +         cmp             r10, r3                         @   - end
> +-        and             r9,  r9,  r8                    @   & 0x1fe0
> ++        and             r9,  r9,  r8, lsl #1            @   & 0x1fe0
> +         subgt           r8,  r3,  r11
> +         suble           r8,  r10, r11
> +         add             r9,  r9,  r5                    @   + floor => m
> +--
> +1.7.10.4
> +
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
