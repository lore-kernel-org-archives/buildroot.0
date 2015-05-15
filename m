From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 18:02:07 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87y4kqdawo.fsf@dell.be.48ers.dk>
References: <20150514063016.DE5B7100C9A@stock.ovh.net>
 <20150514231309.4e8158df@free-electrons.com>
 <87y4kqdawo.fsf@dell.be.48ers.dk>
Message-ID: <20150515180207.53153cb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, 15 May 2015 00:58:15 +0200, Peter Korsgaard wrote:

>  > The nios2 problems are due to a toolchain issue. We should simply
>  > disable boost with this toolchain.
> 
> Yes, will you send a patch?

Yes, patch ready, will be part of my next batch of autobuilder fixes.

>  > The PowerPC problems are due to a uClibc bug. I've done some tests, and
>  > boost-1.57.0 builds fine on PowerPC/glibc, ARM/uClibc, but fails on
>  > PowerPC/uClibc. It's the boost-log module that causes the problem.
> 
> So what then, make the boost-log option depend on
> !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)?

Done, part of my next batch.

>  >> bfin | libarchive-3.1.2 | NOK |
>  >> http://autobuild.buildroot.net/results/5f7b69a324b72dfb522a9299804c113414db348c/
> 
>  > libacl.a: No such file or directory
> 
>  > I don't know.
> 
> The .libs/libacl.a sounds like libtool getting confused. Other than that
> I also don't know.

Currently working on it, though I think I already spent some time on it
a while ago, and could never reach a conclusion.


>  >> nios2 | mosquitto-1.4.1 | NOK |
>  >> http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/
> 
>  > Infamous "undefined reference to symbol '_gp'" issue.
> 
> :/ Should we depend on !BR2_nios2?

Yes, added to my next batch of autobuilder fixes.

>  >> mipsel | postgresql-9.4.1 | NOK |
>  >> http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/
> 
>  > /home/buildroot/build/instance-0/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o):
>  > In function `zlib_stateful_expand_block':
>  > c_zlib.c:(.text+0x78): undefined reference to `inflate'
> 
>  > Static linking issue. Do we really want to support static linking of
>  > postgresql?
> 
> I don't think so, lets just mark it as !BR2_STATIC_LIBS.

Done, will also be part of my next batch.

>  >> powerpc | python-pyqt-4.11.3 | NOK |
>  >> http://autobuild.buildroot.net/results/d2bf71cdd0fe9b0049ba2889de89ccc36cfdc58a/
> 
>  > We need to apply http://patchwork.ozlabs.org/patch/468134/.
> 
> Is that an ack? If so, please reply to the patch with it.

I'm honestly too lazy to do the full build of this stuff to verify, but
I think the patch is OK.

>  >> arm | qt5base-5.4.1 | NOK |
>  >> http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/
> 
>  > g++: error: unrecognized command line option '-fuse-ld=gold'
> 
> The problem is that qt5base doesn't understand cross compilation. It
> correctly checks if the target compiler supports the gold linker and
> then ends up using -fuse-ld=gold with both the host and target
> compilers, so it breaks on old hosts.
> 
> I'm not sure how we should fix that. Any ideas?

I've added a fix for that one as well, which makes sure -fuse-ld=gold
is not use for host builds, but only for target builds.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
