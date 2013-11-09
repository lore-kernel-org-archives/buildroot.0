From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Nov 2013 19:15:43 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
Message-ID: <20131109191543.414f5694@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

If you're Cc'ed on this e-mail, it means that there is a question for
you below. Here is a summary of who should look at what problems (note
that some problems are not affected to anyone, either because the
reason is unknown or because there is no clear "owner" for the problem):

Markos Chandras			aespipe, fdk-aac, gmp, libiscsi
Sonic Zhang, Aaron Wu		boost, icu, openpgm
Chris Zankel			cdrkit
Peter Korsgaard			gst1-plugins-bad, pulseaudio
Gustavo Zacarias		protobuf-c, mplayer, nettle (ARM), php
Simon Dawson			libcap-ng, util-linux, zeromq, zmqpp
Spenser Gilliland		libglib2, nettle (Microblaze), openssl
Ezequiel Garcia			libnspr
Mischa Jonker			pulseaudio, ti-utils
Fatih A??c?			qt5base
Tzu-Jung Lee			tstools

Thanks!

Thomas

On Sat,  9 Nov 2013 08:30:28 +0100 (CET), Thomas Petazzoni wrote:

> Detail of failures
> ===================
> 
>       mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/da0268df99b9bf920d88121e7c3d33d41a57d951/

Unknown problem (error: C compiler cannot create executables). Markos,
as our MIPS guy, can you have a look at this one?

>        arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/983828bd27a521020e42e58cce9393e6b8d23502/

It was a wrong toolchain configuration, with a weird toolchain.
I've removed the toolchain from the autobuilders.

>    powerpc |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/1c6a33e75fe0617e01d7413cdfd5fbd466f822d4/

Missing link against -lrt for static linking.

>        arm |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/6123186a66bbea833ab2fa980346f16825b22d21/

checking for snd_ctl_open in -lasound... no
configure: error: No linkable libasound was found.
make: *** [/home/test/test/3/output/build/alsa-utils-1.0.26/.stamp_configured] Error 1

Weird, don't know what's happening here.

>        arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6aff0a6b9c7b2890cc069868b041ed74e549933b/

This was my funky toolchain (same as alsa-lib problem above). Toolchain
removed from the autobuilders.

>     xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/11de6f161585c12148c1b2b4fc8ab830183edfe9/
>     xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/2d3d255b2d3ae1456a377dbc03f695b7adf010e8/

This is fixed by http://patchwork.ozlabs.org/patch/289532/, which
hasn't been committed yet. It will also require a rebuild of the
toolchain in the autobuilders.

Peter, can you commit this patch?

>       bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/84f9d9d2b6b5356984c6d59aad5e28b3e7847651/

Don't know what's going on. Sonic, Aaron, can you have a look?

>        arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/116d13f7489981c39c3759eaf8302be4d795f339/

This was my weird toolchain (same problem as alsa-lib). Toolchain
removed from the autobuilders.

>     xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/0315c117986f3aac8c0719d744cb47ee03738ee9/

[ 58%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/record.o
../libusal/libusal.a(scsi-remote.o):(.literal+0xe0): undefined reference to `valloc'

Chris, can you have a look at this one, since it's apparently a
Xtensa-specific problem?

>     mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/cb87635832f4a1128f174a25c264f716399c52d4/

MIPS specific problem. We're building for mips1, but fdk-aac uses some
instructions not available on mips1. Maybe we should only enable
fdk-aac for some more capable variant of MIPS instruction sets.

Markos, can you have a look at this one?

>       bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/8579cb481e86dcae0988379c5781bd00f4e70809/

fontconfig forgets to link against libpng. Anyone willing to fix this?

>       mips |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/69b0804cbfbb24c70f90435a37fb56a118247a57/

configure: error: could not find a working compiler, see config.log for details

Markos, can you have a look?

>        arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/b99eb6a9067cee885da88bff64ee447c37e31e0c/
>        arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/b320bb61650c58e9c855e3136f5f6d7bf5e4ef56/

Same problem in both cases, related to the DirectFB plugin. Peter, you
are the one taking care of Gstreamer most of the time, can you have a
look into this?

>     x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/5d163e750808f2fdd8098cb58240bada12b770a9/
>   mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/038340dfbbbedbcfcb98ad5dbf828bc03fe26af6/

Weird compilation problem, seems really caused by an issue in
protobuf-c itself. Gustavo, you're the one who added protobuf-c, can
you have a look at this?

>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e0a1130feb1784b3d4fefe1224943d93409a3494/
>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/85c082a693ef795cecf0ef9204b7c9c0850d4b74/

Problem building icu on Blackfin:

*** ERROR - configure could not detect your platform

Sonic, Zhang, can you have a look into this?

>      avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/3df16d60f6bbb679129cd568df4440be6f35cd9f/

The missing TLS problem on AVR32. We still haven't found the solution
to handle this one. As I've suggested previously, I would simply make
TLS support unconditional in Buildroot as soon as thread support is
enabled, and then mark libcap-ng as not available on AVR32. Of course,
if you have an external toolchain without TLS support, you're on your
own.

> microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6f0066f56f10d3f17023e698fd3ba1bd2d00c4c1/
> microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/79d2df836063167f12f5bba177297a041bb7c16f/

Missing compiler intrinsics and fallocate in the Microblaze toolchain.
We're waiting for Spenser Gilliland to finish the Microblaze internal
toolchain support, so that we can ditch the crappy Microblaze external
toolchains.

>   mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/39e8e0ebbeb196276492b928b41cc0b0fe1e9ec3/
>   mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/efb87b17c49170f6377631371438911b18029cea/

The usual problem of ld being used instead of gcc, causing problem on
mips64el. However, you can't do partial linking with gcc, so a libtool
fix is needed.

Markos, I know you've identified the libtool fix for this. Could you
backport it on top of libtool 2.4.2 (that we have in Buildroot), add it
as a patch in package/libtool/, and then mark LIBISCSI_AUTORECONF =
YES so that the libtool stuff gets regenerated with a known-working
version?

>      nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/8c01fdaac7afa00bd1117c79ae047344242d1463/
>      nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a418145d72e92f64956518bb2786e33dadd08a86/

NIOS2 support missing in libnspr. Ezequiel, can you look into this?
Normally, adding an architecture support in libnspr is really easy, so
adding a patch to libnspr should be feasible. 

>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/4de7dc58e826d1dd60add2821f774c9c5f5a2a71/

Package needs to be bumped, I have already started working on this.

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/8f946e28b11b2ab1ba0d9688286c665488de0486/

libmpeg2/motion_comp_arm_s.S: Assembler messages:
libmpeg2/motion_comp_arm_s.S:29: Error: selected processor does not support ARM mode `pld [r1]'
libmpeg2/motion_comp_arm_s.S:39: Error: selected processor does not support ARM mode `pld [r1]'

That's an ARMv4t configuration. Maybe building mplayer on ARMv4t is not
possible. Adding a bunch of depends on !BR2_arm<something> is probably
the solution here. Gustavo, maybe?

>        arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/3631f7e9dad9fab356d31160ac95b7d0fec70ce2/

Needs NEON support apparently. Should be something for me.

> microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/82acbea862ee0bb5288ab498d86772bc475d3a53/
>        arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/88ea0cc0815f865e1a144d39231fdc9b47e689b0/

On Microblaze, a compiler error. Should be fixed by the internal
toolchain support for Microblaze. Waiting for Spenser on this :)

On ARM, the failure is due to nettle tests requiring C++ support. It
would be good to disable the compilation of those tests. Gustavo,
you're the one looking after nettle in general, can you look into this?

>       bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/120b7de960a04def5c53b59644eefc598bd0a1d4/

Blackfin does not have getifaddrs():

getifaddrs.c:853:3: error: #error "Unsupported interface enumeration on this platform."

Not sure how to handle this uClibc configuration difference, except by
adding "depends on !" to exclude the specific Blackfin toolchains
causing problems.

> microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/f313ac3233a8ed5b3087936c1cd8408a00fdf2bb/

Compiler error. Spenser, we need your patches!

>    aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/08d3255303f7ceda8a1ecfcf56ad665f00829632/

/usr/include/bits/predefs.h:20:3: error: #error "Never use <bits/predefs.h> directly; include <features.h> instead."
 # error "Never use <bits/predefs.h> directly; include <features.h> instead."

Gustavo, you like PHP, no ? :-)

>        arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/281ff1c8046b7e93759c5f51995f34788e717fad/

checking for atomic_ops.h... no
configure: error: *** libatomic-ops headers not found
make: *** [/home/test/test/1/output/build/pulseaudio-4.0/.stamp_configured] Error 1

For some reason, on ARC, atomic_ops is needed. Why not on other
architectures? Peter, Mischa, any idea?

>    powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/0ee61f71e61f2215a15e4655a4e22d0521334c35/

Will be fixed by my patch that prevents building parts of Qt on some
unsupported architectures.

>       i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/bbe7d79da059fdf67fb29880b8539ca2320ba86d/
>        arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/37613281f21895716ceaf64654e175148d7f543c/
>       i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc035507150aa/

For
http://autobuild.buildroot.net/results/37613281f21895716ceaf64654e175148d7f543c/build-end.log,
Samuel has already sent a patch
(http://patchwork.ozlabs.org/patch/289999/). The other two ones:

  http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc035507150aa/build-end.log
  (sqlite problem)

  http://autobuild.buildroot.net/results/bbe7d79da059fdf67fb29880b8539ca2320ba86d/build-end.log
  (inlining problem)

are not fixed. Fatih, would you mind having a look?

>        arc | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/63d294574b053aa4e2148fbc3185c5594d925ae9/

{standard input}: Assembler messages:
{standard input}:1680: Error: missing operand
{standard input}:1680: Error: junk at end of line: `@plt_tx_bip.part.8'

ARC toolchain problem, for Mischa.

>     x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/ce02d7fb9ae3aa06eaf53db39cbef27c051b525d/

Should use gcc for linking and not ld + missing -lm. Tzu-Jung Lee,
you're the one who added tstools, can you have a look at this problem?

>      avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2ba1bd78f4303ef2f543a4e4fa65d1b68ba3a765/

Missing fallocate on avr32. Simon, what is the proposal to solve this?
Add fallocate support to 0.9.31 ?

>        arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/f174541ac06aeeac82b8399686a8d4371532760d/

/tmp/cceJNtCh.s: Assembler messages:
/tmp/cceJNtCh.s:200: Error: r15 not allowed here -- `str r15,[r3,#+0]'
make[4]: *** [libcoregrind_arm_linux_a-m_libcassert.o] Error 1
make[4]: *** Waiting for unfinished jobs....

Not sure what's going on here. Anyone to have a look?

>      avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5cdf3e58df0df184f2ae1f2896c44f3f0f41c94d/

Missing compiler intrinsics on AVR32. Problem already in the process of
being solved (Simon, Alexander).

>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/64494152b75037a1194312a2a408eb7ecb6b56c8/
>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/75f2cc531892e649599681433f62a1d76e5736c9/
>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/65783df07ebb447f7561cb84b1bcf581a3084748/
>        arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/14d441c5f3a50f61cd5a872711d09fda4e5f8bbd/

Forgets to link against pthread. Simon, can you link into this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
