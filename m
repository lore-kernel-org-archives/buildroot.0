From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Aug 2014 17:56:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-08-27
In-Reply-To: <20140828063009.D53DF10160A@stock.ovh.net>
References: <20140828063009.D53DF10160A@stock.ovh.net>
Message-ID: <20140828175647.44cce0a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Nicolas, Samuel, Ezequiel, Richard, Bernd, see below.

On Thu, 28 Aug 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 133
>        failures : 24 
>        timeouts : 0  
>           TOTAL : 157

Thanks to the fact that Richard Braun is now participating to the
autobuilder effort, we are now getting more builds per day than we used
to. This is very good, so thanks Richard!

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c8228aa330d67d759bf7b5dda59aff967f265574/

error trying to exec '/scratch/peko/host/usr/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/cc1': execv: Argument list too long

Does this ring any bell to someone? I remember we had some limit in the
argument list in the external toolchain wrapper, but this particular
build uses the internal toolchain backend.

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/3d0006b4f938165372270ac3fdfd28a1eddf35a0/

Still the same cppcms issue.

error: 'converter_to_utf' was not declared in this scope

Nicolas, you originally added cppcms last year. Could you help us
maintain this package by fixing the autobuilder issues that affect it?
Thanks!

>        arm |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/0f57306b425963b96e5ddcd34f813b8ea9fb5c4e/
>    powerpc |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/51b4afa42b405a3b16c4fe8dcbcc5c1044a68075/
>        arm |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/a0387ff599dc58db0c44cd7c3bd3320b66f29bf0/
>       i486 |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/7d0abd1f4d6d823ad20f7ece876bb080efd231ca/

The infamous:

error: unknown type name 'intmax_t'

I did spend some time investigating that one, but it's deep into the
messy gnulib, and I have no idea what's going on. It apparently appears
only with uClibc, so if noone steps us to fix that one, I'd suggest to
mark the gnupg2 package unavailable with uclibc.

>       bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/d3c70845ef3976def74392cc2f391ed9a3eb0ffe/

Needs shared library support:

error: dlfcn.h: No such file or directory

I have a patch series I need to finish to bump libiscsi to a modern
version, not sure when I'll finish it.

>       bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/fd401349b5c2852e02662383f7b6c6b213bfda16/

Smells like a CMake package trying to build a shared library. Samuel,
could you have a look?

>        arm |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/194a4a3ba5931760cfaac6c55b3d78b4050c5f26/

Ignore this one:

fork: Cannot allocate memory

Peter, I would suggest to move to the autobuild-run script on the
autobuilders, and then improve it so that it greps for "Cannot allocate
memory" in the end of the build log, and if it's found, it discards the
build instead of sending it to autobuild.b.o. What do you think?

I could also improve the autobuild.b.o logic to reject such builds
directly.

>       bfin |                 libroxml-2.3.0 | NOK | http://autobuild.buildroot.net/results/d188bcf5c374273ffe09589f7db5a40e4c5d7bc9/

Missing -lpthread when the library is built statically.

>       bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/2d91d7fa10ac3bd22fb5ce72acd7a0ce177f054f/

Should be fixed by http://patchwork.ozlabs.org/patch/383543/.

>       i686 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/969cdbd5ad716bc8491cdbc88ce9ab0ea243c18f/
>    powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/d04c77c54c99482ab28b7909416861ba1ac3dafb/

Ignore these, they were setup issues on Richard's machine.

>      nios2 |                 minidlna-1.1.3 | NOK | http://autobuild.buildroot.net/results/c9ef34260efd3080094b1b7ce4fd27ce914a1ca6/

checking for avformat_open_input in -lavformat... no
configure: error: Could not find libavformat - part of ffmpeg

Someone needs to reproduce... Even though I wonder who would want to
run a DLNA server on a NIOS II platform :-)

>    powerpc |                   msmtp-1.4.32 | NOK | http://autobuild.buildroot.net/results/61e695c82af001f387151ed0787e92c8697f8749/

msmtp.c:60:32: fatal error: Security/Security.h: No such file or directory

>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/228b43e67e683cecfa3851a8a030d06e9fdc6dac/

"Solved" by http://git.buildroot.net/buildroot/commit/?id=0f46e48c9c55e85b365ae93ef9aabe9e4121652b

>       bfin |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/754947d2a77a4dbe91057d8ce64fc4996e716ece/

Another CMake based package that tries to build a shared library. Samuel ? :-)

>        arm |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/352e41c285e2a05163750f269960564e76397ca6/

Broken assembler:

/home/test/autobuild/instance-1/output/build/polarssl-1.2.11/library/bignum.c: In function 'mpi_mul_hlp':
/home/test/autobuild/instance-1/output/build/polarssl-1.2.11/library/bignum.c:1010:1: error: r7 cannot be used in asm here

>       i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/4c15b0029c0777eb33d00cbc6f69b8357ed49c9c/

multiple definition of `setreuid'
(and a few similar symbols).

uClibc bug.

>        arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9fa33dd4b3bfc74df0392523eceb16c952814ab3/

/home/buildroot/instance-0/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/4.9.1/cc1: error while loading shared libraries: libz.so.1: cannot open shared object file: No such file or directory

This highlights two problems:

 1/ Richard should install the 32 bits libz library on his system used
    for autobuild-run.

 2/ Maybe we should add some logic to check the presence of this
    library when it's needed.

>      nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/543c982608f7d335bf5d5aac5385de7d966aa96d/

The prlimit64() issue.

>        arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6980696ff42ae075c46447374dd4004c4af33f20/

checking for GLES2/gl2.h... yes
checking whether to use OpenGL ES 2 support... configure: error: Cannot enable OpenGL ES 2 support without EGL
make: *** [/scratch/peko/build/webkit-1.11.5/.stamp_configured] Error 1

Bernd?

>        arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/753c76463c813789fd6b7f85b9f484847f2d1f5e/

Gazillions of errors...

> microblazeel | xapp_xfs-1c8459eafc04997751... | NOK | http://autobuild.buildroot.net/results/dbd6df7457112c28dee1de6b0638a1695b188bbb/

warning: redundant redeclaration of 'ErrorF'

Bernd, maybe?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
