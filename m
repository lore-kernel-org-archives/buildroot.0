From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Sep 2014 20:36:40 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140906063010.93F60101336@stock.ovh.net>
References: <20140906063010.93F60101336@stock.ovh.net>
Message-ID: <20140906203640.09c6d8be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fran?ois, Nathaniel, see below.

On Sat,  6 Sep 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/ac5ad7be5500d50cdb0a1d649361b6fe14d29570/
>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/812226d89a3d79ce95c53b5f5c736225969cb35a/
>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/1c98cddde2e4f28ba8b7d653313b12a7c88dbb60/

Should be fixed by http://patchwork.ozlabs.org/patch/386642/.

>        arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/994a84d192848b90a70e28e5ebaa769701bcaec9/

Due to libtirpc using atomic intrinsics not available on ARC. I've
started having a look, but adding the dependency
on !BR2_ARCH_HAS_ATOMIC_INTRINSICS to all reverse dependencies on
libtirpc is not simple in terms of handling the comments.

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d0a1f7a64c0b6a0748123f2525ee09af7369336c/

Should be fixed by http://patchwork.ozlabs.org/patch/386626/.

>        arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/87127e51d49ec5281c4ea86a9637fd527ce483d6/

The infamous:

  error: unknown type name 'intmax_t'

problem.

>        arm |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/03b15dde13d804e5b8b0df7f887ce0552c69fa6d/

configure: error: no termcap library found
Makefile:8229: recipe for target 'configure-gdb' failed

Seems like Nathaniel autobuilder does not have the ncurses development
libraries installed (also causing build failures in host-mysql, for
example). What is our policy regarding ncurses? I have it installed in
my autobuilder because I use it to run "make menuconfig". But it's true
it's not technically absolutely required to run a Buildroot build.

Should we add dependency on host-ncurses where appropriate? Or should
we make ncurses development files on the build machine a mandatory
dependency? What if the user uses only xconfig or gconfig?

>     x86_64 |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/d66c0941009b442292011721d900699023e143e8/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/6dc5a30ab02289d28b12fe736ec3fe34cc804da1/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/dab15db53aeda3115945fc7befcdaa895ebd79e0/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/89b1b745c52fa65313a69a157a4198180fd80cf1/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/267f69143908a33054468179f934b28ba3fc4b40/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/043c4a940d2cfea56be14b86fabf18b64db0987f/

Should be fixed by http://patchwork.ozlabs.org/patch/386639/.

>    powerpc |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/e197f20bd5ec4aae6d8692d67df4f539a9df33e2/
> microblazeel |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/b1fad7600afd4e9c747834d9585949260c82385a/
>    powerpc |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/625419c6c20b957fe4d0c9f309da8730f0860304/
>    aarch64 |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/521ea04ac7d16ff23901f92600b1b67235a00dbe/

Should be fixed by http://patchwork.ozlabs.org/patch/386617/.

>        arm |                libgcrypt-1.6.2 | NOK | http://autobuild.buildroot.net/results/194d91880aefa05bbfec2b83daeed133ddaee495/

Transient error, ignore:

Resolving ftp.gnupg.org... failed: Name or service not known.
wget: unable to resolve host address ???ftp.gnupg.org???

>       bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/5cba23312890c3985552305f9d85cd38270a9578/

Should be fixed by http://patchwork.ozlabs.org/patch/386619/.

>       bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ed812757a2400a6a060944c661fcd85d600c2a7b/

Probably tries to build a shared library.

>        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a42c4d1abdee3ee28048e68f28781d5914dcd23b/

Peter should move to the autobuild-run script.

>      nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/a2e40c005135be85e6161f7294d749c63a6673e0/

Don't know, to be reproduced/investigated.

>       i686 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/179d10ed4855cb0e357ff50517abc737c9abdce4/

Fran?ois ?

/usr/bin/perl "-Iinc" /usr/share/perl/5.20/ExtUtils/xsubpp  -typemap /usr/share/perl/5.20/ExtUtils/typemap -typemap typemap  SSLeay.xs > SSLeay.xsc && mv SSLeay.xsc SSLeay.c
make[1]: *** No rule to make target '/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/perl5/5.18.2/i686-linux/CORE/vutil.h', needed by 'SSLeay.o'.  Stop.

>        arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/c1454491c21c81a2f01b5f21aeff5c39f0a49155/

Issue on Nathaniel autobuilder instance:

gzip: /home/chroot/media/code/buildroot/autobuilder/instance-0/dl/yaml-1.1.1.tgz: not in gzip format

Nathaniel, could you have a look at the yaml-1.1.1.tgz tarball? Also,
look at ftop-1.0.tar.gz, which has a similar issue. It would be good to:

 *) Save those tarballs somewhere else so we can study what they look
    like and hopefully understand the problem.

 *) Then immediately remove them from the instance-<X>/dl/ directory,
    so that future builds will not fail due to this.

>       bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/12776a0122fa992aa23c80c449de3d6962d20bc8/

Static linking issue:

SDLnet.c:(.text+0x14e): warning: gethostbyaddr is obsolescent, use getaddrinfo() instead.
/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libSDL_mixer.a(mixer.o): In function `_Mix_LoadWAV_RW':
mixer.c:(.text+0x1128): undefined reference to `_SDL_LoadWAV_RW'
/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libSDL_mixer.a(mixer.o): In function `_mix_channels':
mixer.c:(.text+0x15c2): undefined reference to `_SDL_MixAudio'
mixer.c:(.text+0x1646): undefined reference to `_SDL_MixAudio'
/home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libSDL_mixer.a(wavestream.o): In function `_WAVStream_PlaySome':
wavestream.c:(.text+0x224): undefined reference to `_SDL_MixAudio'

>       i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/d526340a1e079e504e4655766d0058317acec1eb/

uClibc bug around setresgid() and al. being redefined. Already reported
upstream.

>       mips |                   samba-3.6.24 | TIM | http://autobuild.buildroot.net/results/9499dbdd4c6c2b1eb6dbe088b986c2ed72ed45c0/

Ignore.

>       bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/1c5efa35c3a8082a1a51cf59d5682b21e5e3d932/

Don't know yet.

Checking for libupnp >= 1.4.2 ...
Error, can't find libupnp !
See file "config.log" produced by configure for more details.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
