From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 7 May 2012 23:39:57 -0400
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <20120507154541.325b298d@skate>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
 <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
 <20120507154541.325b298d@skate>
Message-ID: <CADiAo4LmQX4-fjbhfXFm=UKBVX4FSfuk1_NOesU+XfLpbSiueA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, May 7, 2012 at 9:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 7 May 2012 08:47:10 -0400,
> Dimitry Golubovsky <golubovsky@gmail.com> a ?crit :
>
>> >> +define V86D_BUILD_CMDS
>> >> + ? ? $(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C
>> >> $(@D) all
>> >
>> > You can used $(TARGET_CONFIGURE_OPTS) here as well.
>>
>> I tried that, and it did not compile. -D__i386__ should be given
>> explicitly to cc.
>
> This -D is rather a CFLAGS, so:
>
> ? ? ? ?$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D__i386__" -C $(@D) all
>

No, it does not work this way. Value of $(CC) with -D__i386__ should
be passed deeper down to the lowest level Makefile in order for v86d
to compile.

/40G2/golubovsky/src/buildroot-patching/buildroot/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-D__i386__ -c -pipe -Os  -o fpu.o fpu.c
In file included from decode.c:41:0:
x86emu/x86emui.h:64:20: fatal error: x86emu.h: No such file or directory

(the way you proposed) does not work as local flags are lost.

But:

/40G2/golubovsky/src/buildroot-patching/buildroot/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-D__i386__ -c -I. -I../../include -I../../include/x86emu -o decode.o
decode.c
v86_x86emu.c: In function 'v86_init':
v86_x86emu.c:50:3: warning: initialization from incompatible pointer type
v86_x86emu.c:53:3: warning: initialization from incompatible pointer type
v86_x86emu.c:57:3: warning: initialization from incompatible pointer type
v86_x86emu.c:58:3: warning: initialization from incompatible pointer type
v86_x86emu.c:59:3: warning: initialization from incompatible pointer type
v86_x86emu.c:60:3: warning: initialization from incompatible pointer type
v86_x86emu.c:61:3: warning: initialization from incompatible pointer type
v86_x86emu.c:62:3: warning: initialization from incompatible pointer type

(my way) works as it is only $CC that is needed by the lower level Makefile.

I'll make other changes as recommended.

Thanks.
-- 
Dmitry Golubovsky

Anywhere on the Web
