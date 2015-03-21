From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 21 Mar 2015 23:52:45 +0100
Subject: [Buildroot] [PATCH] sh4: fix toolchain creation
In-Reply-To: <550D884B.5030107@mind.be>
References: <20150320182214.GA3086@waldemar-brodkorb.de>
 <550D884B.5030107@mind.be>
Message-ID: <20150321225245.GL21001@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

>  Hi Waldemar,
> 
> On 20/03/15 19:22, Waldemar Brodkorb wrote:
> > The Linux kernel does force compile with -m4-nofpu, which is only
> > available when building a multilib toolchain.
> > The interesting part here is, that buildroot use --disable-multilib for
> > gcc configure, but enables --with-multilib-list=m4,m4-nofpu in
> > the default configuration for Qemu targeting r2d emulation.
> > This results in a toolchain, which can be used for the kernel and
> > for userland without creating a multilib toolchain with different
> > kinds of libgcc version. In the multilib case there would be some
> > subdirectories created like !m4 or m4-nofpu. As buildroot uses a
> > short version of toolchain creation, a multilib enabled gcc build
> > fails when creating libgcc.
> 
>  To be honest, I still don't understand what's going on here despite all this
> explanation...

Thomas wants to update the external toolchain for sh4, but build
fails.
 
> > So the best solution is to just keep multilib disabled, but always
> > add --with-multilib-list=m4,m4-nofpu when sh4/sh4eb is choosen.
> 
>  But this sounds sane.
> 
>  However:
> 
> > Tested with sh4 minimal toolchain build and qemu defconfig with
> > gcc 4.8.x and uClibc.
> 
>  If I understand correctly, you applied your patch and tested that
> qemu_sh4_r2d_defconfig still works, right? Well, that should come as no surprise
> since it just moves the --with-multilib-list option from one place to the other,
> so you'll end up with exactly the same toolchain.

Yes. No regression so far :)
 
>  The real question is: does it also work for other SH targets? Does it work on
> real hardware? Or rather, is there anything that used to work that breaks now?

Producing a sh4 toolchain with buidroot works after this patch,
which did not work before.
I made a short test of a static linked bash produced by this
toolchain on my SNAPGear SME575:
/tmp/bash --version
GNU bash, version 4.3.33(1)-release (sh4-buildroot-linux-uclibc)
# uname -a
Linux SG575 2.4.31-uc0 #1 Thu Feb 7 21:35:20 EST 2008 sh4 unknown
# cat /proc/cpuinfo 
cpu family      : SH-4
cache size      : 8K-byte/16K-byte
bogomips        : 239.20

Machine: SnapGear
CPU clock: 239.98MHz
Bus clock: 119.99MHz
Peripheral module clock: 119.99MHz

Looks okay. Still need to get a newer kernel and libc on the box:
uClibc 0.9.27 preinstalled ;)

best regards
 Waldemar 
