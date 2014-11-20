From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Nov 2014 09:44:07 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-19
In-Reply-To: <20141120073014.164A510107F@stock.ovh.net>
References: <20141120073014.164A510107F@stock.ovh.net>
Message-ID: <20141120094407.4b487379@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Quick analysis of yesterday build results. Samuel, Peter, Gustavo,
Bernd, Yann, Vincente, Alexey, please have a look below.

On Thu, 20 Nov 2014 08:30:13 +0100 (CET), Thomas Petazzoni wrote:

>      powerpc |       canfestival-7740ac6fdedc | NOK | http://autobuild.buildroot.net/results/29fd3e550937f48e2270149a3d44cfb8bcf5c16a/

canfestival builds shared libraries even when BR2_PREFER_STATIC_LIB=y.
Samuel, canfestival was submitted by you, can you have a look at this
issue?

>      powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/38b4030b17a8ba1319afcfbc326489ecd030b0be/

The uClibc bug about setreuid().

What do we do about this one? It still isn't fixed upstream. Should we
simply disable uClibc for static builds? (But then we would only have
musl left as a C library compatible with static builds). Or do we
simply blacklist for now the packages that are known to use the symbols
causing problems?

Peter?

>       xtensa |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/1a46e53cf892534f1b3a16c249fa710485290b5a/
>          arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/e732d1bac8fe68fd8bba50e4e9d908be3d996c83/

  CCLD     clamscan
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompress'
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressInit'
../libclamav/.libs/libclamav.so: undefined reference to `bzDecompressEnd'
collect2: error: ld returned 1 exit status

Bernd, can you have a look?

>          arm |                 dovecot-2.2.15 | NOK | http://autobuild.buildroot.net/results/9b536926b3b2bf82c683b48e9697a220f1b4bf33/

/home/buildroot/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/mysql/libmysqlclient.a(my_time.o): In function `str_to_time':
my_time.c:(.text+0x9a8): multiple definition of `str_to_time'
../../src/lib-dovecot/.libs/libdovecot.a(strnum.o):strnum.c:(.text+0x4f4): first defined here
../../src/lib-dovecot/.libs/libdovecot.a(file-dotlock.o): In function `dotlock_create':

Symbol conflict between MySQL and Dovecot it seems, in static linking
configuration. Bernd, can you have a look, since you contributed
ClamAV ?

>          arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/8338a03028de9502be506a80bd947d80b3e50a49/
>          arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/361aa2e47a7561ff6624829bdfcfe66ecaddc4a6/

Fixed by http://git.buildroot.net/buildroot/commit/?id=32c2385f268bd7a2f7d1f55d712c5de648bfc657.

>       mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/a2708c96117eaad4f2bf6b304e607f18451fa35b/

relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used when making a shared object; recompile with -fPIC

Vincente, maybe you can have a look?

> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/825351fd20a2712bf115f7e09e9d1d79967594f5/

Seems like we might need flex.

ada-lex.c missing and flex not available.
make[3]: *** [ada-lex.c] Error 1
make[3]: *** Waiting for unfinished jobs....

>      powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dc0dd9e878edd2b359900d02e1d53d294321c00b/
>          arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0b8411482def8fdfba0aaaa19be01a477707d874/

configure: error: No curses/termcap library found

Why don't we simply add host-ncurses to the host-mysql dependencies?
Nathaniel, can you reproduce this issue on your autobuilder, and see if
adding host-ncurses to the dependencies of host mysql fixes the problem?

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/632f3a8ab49f0e7679212470b93cc3a748bc953a/

warning: cannot find entry symbol __start; defaulting to 00000000

Smells like libmemcached tries to build a shared library even if we're
using the FLAT file format.

Gustavo?

>          arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/92edf234780795bc2dc1aa495c492df1528204a1/

corender.c:17:19: fatal error: GL/gl.h: No such file or directory

Yann, Bernd? I know Yann did an analysis of the issue, but I don't
think we heard back from Bernd about it. Bernd, can you have a look at
Yann's analysis of the issue?

>         bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/c60d880b620c47f4aa03cdf2e1bb85a526242d54/

Proposal of fix by Baruch at http://patchwork.ozlabs.org/patch/412575/.

>         bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/15b764112b52e4805010b1af7f6439643e0c8978/

/home/chroot/media/code/buildroot/autobuilder/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libSDL_mixer.a(mixer.o): In function `_Mix_LoadWAV_RW':
mixer.c:(.text+0x1128): undefined reference to `_SDL_LoadWAV_RW'
/home/chroot/media/code/buildroot/autobuilder/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libSDL_mixer.a(mixer.o): In function `_mix_channels':
mixer.c:(.text+0x15c2): undefined reference to `_SDL_MixAudio'
mixer.c:(.text+0x1646): undefined reference to `_SDL_MixAudio'
/home/chroot/media/code/buildroot/autobuilder/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libSDL_mixer.a(wavestream.o): In function `_WAVStream_PlaySome':
wavestream.c:(.text+0x224): undefined reference to `_SDL_MixAudio'

Yet another static linking issue.

>         sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/119adf6a31266e71e45fb1951d7e8ebbd1ff41fe/

Bug in the CodeSourcery SH4 toolchain. I don't think we have any other
solution than blacklisting configurations that contain Qt4 Webkit and
that use this toolchain. Opinions?

>          arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/9b480421bd66e046ff9200963facb2663b77fd35/

device-linux.o: In function `check_ip6_forwarding':
/home/test/autobuild/instance-1/output/build/radvd-2.8/device-linux.c:189: undefined reference to `sysctl'

Alexey, can you have a look at this one?

>         bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/cf2723cf650486586ff18b6ef57c91a74a97bbc9/

bfin-linux-uclibc-g++: /home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so: No such file or directory

Don't know what's going on. Someone to have a look?

>       mipsel |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/beaeaae8163af269ec22c4da0b02e6333a5535c2/

Ignore.

>         bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/51bd1464fe85f3fcdc5beb095cb1cdbfa413ec24/

Fixed by http://git.buildroot.net/buildroot/commit/?id=7450386ae9b6d48bf13d1d8a9853b50d9e767c28.

>      powerpc |            xlib_libXfont-1.5.0 | TIM | http://autobuild.buildroot.net/results/4ebf60da298d9dee9864e07138a830f7a05aa1e3/

Ignore.

>         bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/3a24fe2b89073bc72a1ab960ae470dc7976738fb/
>         bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/2695eccd44bf36e8ce6486c5c8626acbe428d299/

Funky C++ issue. Could someone with C++ knowledge have a look? Maybe
zmqpp is using some C++ features that are too new for the gcc 4.3.x
used in the Blackfin toolchain.

>     mips64el | znc-b396cafdb249544164ed029... | TIM | http://autobuild.buildroot.net/results/ec3771f538d45da7d1d81eef77c14afdff112d55/

Ignore.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
