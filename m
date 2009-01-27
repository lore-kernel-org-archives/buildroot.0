From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 06:49:51 +0100
Subject: [Buildroot] alsa lib problem
In-Reply-To: <497E0B14.8040801@carallon.com> (Will Wagner's message of "Mon\,
	26 Jan 2009 19\:12\:20 +0000")
References: <497E0B14.8040801@carallon.com>
Message-ID: <87ocxt2t8g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

Hi,

 Will> The definition in asound.h is:

 Will> struct sndrv_pcm_channel_info {
 Will> 	unsigned int channel;
 Will> 	off_t offset;			/* mmap offset */
 Will> 	unsigned int first;		/* offset to first sample in bits */
 Will> 	unsigned int step;		/* samples distance in bits */
 Will> };

 Will> The problem is that when compiling linux it thinks off_t is 4
 Will> bytes but it appears that when compiling alsa-lib it thought it
 Will> was 8 bytes. I assume this is because something in the
 Will> toolchain on the host PC or the alsa-lib build is wrong and it
 Will> is picking up a define from outside buildroot.

It looks to me like a largefile problem, E.G:

cat test.c
#include <stdio.h>
#include <sys/types.h>
int main(int argc, char **argv)
{
  printf("%d\n", sizeof(off_t));
  return 0;
}
arm-linux-gcc -static -o test test.c && qemu-arm ./test
4

arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -static -o test test.c && qemu-arm ./test
8

We unconditinally add the largefile stuff to TARGET_CFLAGS, which
apparently isn't a good idea for alsa.

If the kernel interface is always with an 32bit offset, then asound.h
should probably be changed to use a 32bit data type instead. Could you
try changing it to an unsigned int and recompile?

-- 
Bye, Peter Korsgaard
