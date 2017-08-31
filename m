From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 31 Aug 2017 10:16:31 +0300
Subject: [Buildroot] Need help with cross-compiler configuration
In-Reply-To: <CANK3ZEd3CKYjuDZd-6gOe1qPPURboKvSL5rYG+wsjHP3ee+4xA@mail.gmail.com>
References: <CANK3ZEf0_A2aexR9mDJK3pi_CZhbBcujAnmsStvoJ6+DRZSVnA@mail.gmail.com>
 <20170830184823.i43svfizch3f3m75@tarshish>
 <CANK3ZEd3CKYjuDZd-6gOe1qPPURboKvSL5rYG+wsjHP3ee+4xA@mail.gmail.com>
Message-ID: <20170831071631.2irz2a4dxpw74h3c@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aseem,

On Thu, Aug 31, 2017 at 12:30:05PM +0530, Aseem Sharma wrote:
> On Thu, Aug 31, 2017 at 12:18 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Aug 30, 2017 at 08:19:33PM +0530, Aseem Sharma wrote:
> > > I am naive to buildroot & processor world trying to compile
> > > "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor (compatible
> > to
> > > ARMv5TE instruction-set)" based old system.
> > >
> > > I compiled the buildroot (kernel, rootfs & cross-compiler) by setting
> > arm926t
> > > (little-endian) as target arch/variant as suggested by Arnout/Baruch in
> > > response to my old query. However, now I am having trouble booting the
> > > system with the new buildroot created zImage. I do not seem to get any
> > > output/log on the system screen after flashing this new image onto the
> > > system.
> >
> > Which kernel did you use?
>
> [Aseem] I am using the zImage built by default kernel version with
> "buildroot-2017.02.5"  ie. "4.9.13"

Do you have any reason to believe that this kernel supports your target? You 
will most likely need to write a device-tree file for your target. This is 
purely kernel related, so out of scope for Buildroot and for this list.

> > > To verify if the buildroot is configured correctly for my system, I 
> > > tried
> > > to create a helloWorld program using the buildroot internal
> > cross-compiler
> > > and then tried to run it on the arm based system (running old 2005
> > > buildroot release). Following is the exact error message that I observe:
> > > *hello.c on Host:*
> > >
> > > #include <stdio.h>
> > > int main()
> > > {
> > >    printf("Hello, World!");
> > >    return 0;
> > > }
> > >
> > > *Command Line used to Compile on Host:*
> > >
> > > sudo /home/administrator/Downloads/buildroot_2017/buildroot-2017.0
> > > 2.5/output/host/usr/bin/arm-linux-gcc --sysroot=/home/administrator/
> > > Downloads/buildroot_2017/buildroot-2017.02.5/output/staging -o test
> > hello.c
> > >
> > > *Screen Output on Target:*
> > >
> > > *# *./test
> > > *./test: line 1: syntax error: unexpected ")"*
> > > *#*
> > > *#* cat ./test | more   *                              ------->  Just to
> > > prove its not a shell script!*
> > > bFLTD? ?c0 ?eY??)? ?? ?? ? -?-? ??-?
> > >                                     ?
> > >                                      0???R??X at -? ? 0?0`?S?0?S3?/??
> > >  ?, at -?`?A ?????0?S3?/??  40?@-? ??@ ?R??????0?S?
> > > ? ?0 ?0???? @-?80?S?
> > >
> > > *Please let me know if I am missing something. *
> >
> > Did you build your test program statically? If not, which libc variant do
> > you
> > use?
>
> [Aseem] I built the test program by dynamically linking to libc. I am
> assuming it would have picked it up from the default libraries created by
> buildroot inside "buildroot-2017.02.5/output/staging" directory.
> Do you think my below compile instructions was faulty? The whole idea for
> this exercise was to confirm if the the cross compiler (built by me) was
> configured correctly to be able to create binaries compatible with my
> system.

The default Buildroot libc is uClibc. This libc does not guarantee binary 
compatibility between releases. This means that you'll need to copy the libc 
to your target, and make sure that the binaries you produce find it. The 
easiest method for doing that is using chroot.

Alternatively, you can build static binaries that don't need run-time presence 
of libc files.

> > Do you use compatible ARM ABI? The so called OABI (for old ABI) has still
> > been
> > in use at that time. See https://wiki.debian.org/ArmEabiPort.
>
> [Aseem] I am sorry, I do not really understand compatible ARM ABI and the
> procedure to check if it being used. How do I check it?

The Debian wiki page I linked to provides a few methods for doing that using 
objdump, file, and readelf utilities.

> > Buildroot dropped support for ARM OABI a few years ago.
>
> [Aseem] Do you mean that I have to pick up an older version of buildroot to
> make this work on my device? If yes, coould you please point me to the
> correct build to be used.

The Config.in.legacy file lists the BR2_ARM_OABI config symbol under "Legacy 
options removed in 2013.08". So you might have luck with an earlier release.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
