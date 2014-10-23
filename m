From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 09:49:32 +0200
Subject: [Buildroot] [PATCH v2 04/30] gst-ffmpeg: use the new
 BR2_ARM_CPU_ARM* options
In-Reply-To: <5447D7DD.5090200@mind.be>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141021211811.GF23999@free.fr>
 <20141022093400.2bc39e83@free-electrons.com>
 <5447D7DD.5090200@mind.be>
Message-ID: <20141023094932.7e5559b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 22 Oct 2014 18:14:21 +0200, Arnout Vandecappelle wrote:

>  I wouldn't want to actually use it unless tested on real hardware, however.

Well, if you grep through the gst-ffmpeg tree, you will that the
ARMV6T2 condition is only used in two places in
gst-libs/ext/libav/libavcodec/arm/asm.S :

.macro  mov32   rd, val
#if HAVE_ARMV6T2
        movw            \rd, #(\val) & 0xffff
    .if (\val) >> 16
        movt            \rd, #(\val) >> 16
    .endif
#else
        ldr             \rd, =\val
#endif
.endm

.macro  movrel rd, val
#if HAVE_ARMV6T2 && !CONFIG_PIC && !defined(__APPLE__)
        movw            \rd, #:lower16:\val
        movt            \rd, #:upper16:\val
#else
        ldr             \rd, =\val
#endif
.endm

So when you have ARMV6T2, it uses movw/movt instead of ldr. That's the
only difference with the non-ARMV6T2 mode. Then you can read
http://community.arm.com/groups/processors/blog/2010/07/27/how-to-load-constants-in-assembly-for-arm-architecture,
which says:

"""
As mentioned earlier, there are other ways to load a constant. In the
latest version of the ARM architecture, ARMv7, two new instructions
were introduced to improve the situation:

- movw, or move wide, will move a 16-bit constant into a register,
  implicitly zeroing the top 16 bits of the target register.

- movt, or move top, will move a 16-bit constant into the top half of a
  given register without altering the bottom 16 bits. Now moving an
  arbitrary 32-bit constant is as simple as this:
"""

So I think it's safe to say than --enable-armv6t2 can be used on ARMv7
as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
