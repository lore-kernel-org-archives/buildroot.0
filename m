From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Oct 2014 22:17:16 +0200
Subject: [Buildroot] [PATCH v2 1/2] x264: new package
In-Reply-To: <1412246984-15227-1-git-send-email-0intro@gmail.com> (David du
 Colombier's message of "Thu, 2 Oct 2014 12:49:43 +0200")
References: <1412246984-15227-1-git-send-email-0intro@gmail.com>
Message-ID: <87lhoyjkfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David du Colombier <0intro@gmail.com> writes:

 > This package is based on an earlier package
 > proposed by Ayaka in December 2013.

Thanks! There still seems to be some issues though:

If you build with a toolchain without BR2_LARGEFILE then:

In file included from /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:72:0,
                 from ./common/osdep.h:33,
                 from ./common/common.h:117,
                 from ./encoder/lookahead.c:39:
/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!

And with one with:
/home/peko/source/buildroot/output/host/usr/bin/arm-linux-as -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -I. -I. -std=gnu99 -mcpu=cortex-a8 -mfpu=neon -c -DSTACK_ALIGNMENT=16 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/arm/cpu-a.o common/arm/cpu-a.S
/home/peko/source/buildroot/output/host/usr/bin/arm-linux-as: unrecognized option '-_LARGEFILE_SOURCE'
Makefile:182: recipe for target 'common/arm/cpu-a.o' failed
make[1]: *** [common/arm/cpu-a.o] Error 1

From the configure output I see:

- Platform specific / ASM, so there probably needs to be some
  architecture dependencies

- I see a reference to threads, so it needs to depend on
  BR2_TOOLCHAIN_HAS_THREADS

- It would be good with an option to enable the cli interface

- Stripping is done on a global level if needed, the individual packages
  shouldn't strip

platform:      ARM
system:        LINUX
cli:           no
libx264:       internal
shared:        yes
static:        yes
asm:           yes
interlaced:    yes
avs:           avxsynth
lavf:          no
ffms:          no
mp4:           no
gpl:           yes
thread:        posix
opencl:        yes
filters:       crop select_every 
debug:         no
gprof:         no
strip:         yes
PIC:           yes
bit depth:     8
chroma format: all


-- 
Bye, Peter Korsgaard
