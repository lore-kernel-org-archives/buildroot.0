From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sun, 16 Oct 2011 23:57:55 +0000 (UTC)
Subject: [Buildroot] buildroot noob help!
References: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
 <CAEYzJUHho5fwzEks9d67i3dGc8BhEpH09kGr-icoa5LeRgT=uw@mail.gmail.com>
 <201110151606.35102.minimod@morethan.org>
 <CAFo83mEQUkMazfnZLAu=UPn+xgyjY-g4qkYMTmqZDr0JC99vKQ@mail.gmail.com>
Message-ID: <j7fr23$n6e$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-10-15, Jed Evnull <jedevnull@gmail.com> wrote:

>> If your __not__ building on non-ARM, why do you need a
>> cross-compiler?
>>
>> If you __are__ building on non-ARM, how did you expect your host
>> machine to execute the ARM binaries inside of the chroot?
>>
>> Me-thinks you need QEMU or such like to do that.
>
> Sorry, I was probably incoherent. My goal is to produce arm binaries for my
> tablet. I want them as small as possible, so I want statically linked
> packages with uclibc, rather than glibc.

Are you trying to build a bootable root filesystem or not?  If not,
then buildroot is not the right tool.  Buildroot is for building root
filesystems.  Hence the name. ;)

> My first try was to use just the buildroot cross-compile toolchain
> with ./configure CC=arm-linux-gcc, LDFLAGS=-static, etc. A 'normal'
> cross-compile, I guess. This is how I use the sourcery arm toochain
> to produce kernels for my device.  That didn't work for anything but
> simple hello world programs. Lots of different errors with autoconf.

If you just want to build statically linked ARM executables on a
normal Linux desktop (e.g. IA32 or AMD64), then I think you should
probably just build an arm-linux uclibc toolchain using crosstool-ng
and use that for your builds (remember, you might have to pass the
appropriate --sysroot option so the toolchain can find all if its
include and library files).

 http://crosstool-ng.org/

Using buildroot is going the long way 'round.

I just built a static ARM "hello world" C program using my
crosstool-ng toochain (the same one I use with Buildroot to build root
filesystems), and it's 15KB (stripped).  That's a damn sight better
than my normal Gentoo glibc toolchain does.  It generates a 515KB IA32
executable (stripped) from the same source file.  Glibc has been
_spectectacularly_ bad job for static linking for quite some time.

> So I thought I would set up qemu for chroot and directly compile from
> within the root_fs produced by buildroot, as worked with
> scratchbox/qemu. But chroot into the image fails.chroot: failed to
> run command `/bin/su'.

I don't think chroot is what you want.  What you want is gcc's
--sysroot option 

-- 
Grant Edwards               grant.b.edwards        Yow! Hmmm ... A hash-singer
                                  at               and a cross-eyed guy were
                              gmail.com            SLEEPING on a deserted
                                                   island, when ...
