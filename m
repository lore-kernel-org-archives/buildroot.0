From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 26 Jan 2009 19:12:20 +0000
Subject: [Buildroot] alsa lib problem
Message-ID: <497E0B14.8040801@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have alsa-lib compiling for my arm target however aplay fails to work with the kernel 
reporting:

ALSA sound/core/pcm_native.c:2587: unknown ioctl = 0x80184132

Decoding this ioctl it is SNDRV_PCM_IOCTL_CHANNEL_INFO defined in asound.h.

The reason it is not working is that the kernel and alsa-lib think that the 
sndrv_pcm_channel_info struct is different sizes.

The definition in asound.h is:

struct sndrv_pcm_channel_info {
	unsigned int channel;
	off_t offset;			/* mmap offset */
	unsigned int first;		/* offset to first sample in bits */
	unsigned int step;		/* samples distance in bits */
};

The problem is that when compiling linux it thinks off_t is 4 bytes but it appears that 
when compiling alsa-lib it thought it was 8 bytes. I assume this is because something in 
the toolchain on the host PC or the alsa-lib build is wrong and it is picking up a define 
from outside buildroot.

Does this sound possible? How do I establish which definition it is using?

Thanks,

Will.
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
