From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 10:12:41 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140214073009.1D7E6102637@stock.ovh.net>
References: <20140214073009.1D7E6102637@stock.ovh.net>
Message-ID: <20140214101241.27857b9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Aaron, Ezequiel, Spenser, Anton, Baruch and Gustavo, there are
questions for you below. Please read on ! :-)

On Fri, 14 Feb 2014 08:30:08 +0100 (CET), Thomas Petazzoni wrote:

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/899395ce00ba54f19fd1f8ebaf1ea7a15e3d98dc/
>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0fcb07e9efbef5881c986199e2c1358d7fd9cffa/

cairo-test-runner.c: In function 'is_running_under_debugger':
cairo-test-runner.c:168: error: implicit declaration of function 'getppid'
cairo-test-runner.c:168: warning: nested extern declaration of 'getppid'
cairo-test-runner.c:169: error: implicit declaration of function 'readlink'
cairo-test-runner.c:169: warning: nested extern declaration of 'readlink'

This problem has been here for a while. Aaron, as the Blackfin person,
can you have a look into this and sent a patch to fix the problem? Thanks!

>      nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/780c3388e408ae6479e824711b1c02fdbd34bef4/

No idea what this error means. Ezequiel ?

/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libgpg-error.so.0 so try adding it to the linker command line

> microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/916eec6a8853c49eab5b7806edcc0add06b8168f/

Spenser, can you have a look at this one?

/home/test/test/2/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc -g -o dropwatch main.o lookup.o lookup_bfd.o lookup_kas.o -lbfd -liberty -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm
/home/test/test/2/output/host/usr/lib/gcc/microblaze-buildroot-linux-gnu/4.9.0/../../../../microblaze-buildroot-linux-gnu/bin/ld: cannot find -liberty

>      nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/

Another missing syscall on NIOS II ? Ezequiel ?

../lib/libext2fs.so: undefined reference to `fallocate64'
collect2: error: ld returned 1 exit status

>     x86_64 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/2d83f38b4a6cb2a1a47c78306da7773270ce698e/

Weird:

/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: ../../gst-libs/ext/libav/libavcodec/libavcodec.a(lpc.o): relocation R_X86_64_PC32 against symbol `ff_pd_1' can not be used when making a shared object; recompile with -fPIC

But the build is not a static library build.

>    powerpc |              host-libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/e3581e4a17e2c577458f5481b391f548b7fcdf69/

Spurious failure, the build machine was too heavily loaded.

>       i686 |            host-libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/784b3989fab4007d6d077fba9a9078cf337ce002/

  CCLD   testThreads
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_code at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_auto_decoder at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_end at XZ_5.0'
/home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_properties_decode at XZ_5.0'
collect2: error: ld returned 1 exit status

I find it rather weird that this doesn't happen more often...

>       i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/a9d35975c7699515350eb307712cd69b6d48e418/

Not enough backlog to see what the error is, unfortunately.

>        arc |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/97ec0c366c24bd03fe4c26851e8729a4d8eaf4d0/

Internal compiler error. Anton, would you mind checking if your recent
bump of the ARC toolchain components solves this compiler problem?

>     xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/ba205bcbb6898bee78f610883f3837930eda262c/

Binutils internal error. Baruch ?

>      nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/3d77c91847a099b2498030505b91f3f84c81df18/

Issue with kernel headers ?

/home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/libnfnetlink/linux_nfnetlink.h:6:6: error: nested redefinition of 'enum nfnetlink_groups'
/home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/libnfnetlink/linux_nfnetlink.h:6:6: error: redeclaration of 'enum nfnetlink_groups'

>        arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/4abdea83c6915aa02b6dc55c9a9dd964ba70ac4b/

Another internal compiler error. Anton, same thing, is that fixed by your recent bump?

>   mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/f6aa04e2b904b1aae3b68b2ffbb1b8edb6f4929a/

This one is fixed by
http://git.buildroot.net/buildroot/commit/?h=next&id=898e54bd783280ee1ffb6aeeb523c9fb8c31641a,
but unfortunately Peter only merged it in the next branch, so we still
have the build problem on master.

>    powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/79e24d5ada564e664f32041cc71a1aeac0d9d5cd/
>    powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/b23f295008a834bbb37b6ea5c99842409b652bc9/

Too old kernel headers;

> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/3becd76e2a7c3cf843d43ea9f1713fd536888cd7/
> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/2b1feb18dc415c69aae6de9d558e527faae7b246/

utils.c:779:21: error: 'FE_DIVBYZERO' undeclared (first use in this function)
     feenableexcept (FE_DIVBYZERO);

Spenser ? :-)

>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/8d3ee14585f54c6946b449854df9f06ea7746e8e/

Maybe the blackfin uClibc lacks _glob_pattern_p ? Aaron ?

./.libs/libpopt.so: undefined reference to `_glob_pattern_p'

>    powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/64ed5890d4d03399eb549cba4aa3e65afd3b005f/

./Modules/posixmodule.c: In function '_pystat_fromstructstat':
./Modules/posixmodule.c:1356:22: error: 'struct stat' has no member named 'st_birthtime'

Weird: it wants to use st_birthtime, even though this field doesn't
exist under Linux, and Python has a configure test that checks whether
it exists or not, and the code is properly conditionally compiled.

>     xtensa |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/70b77e7a5b292e3fcbcf8cab4651c48220f2bd17/

Needs NPTL. Fixed by my series about NPTL support.

>      nios2 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/bc674e494c24155800583dde5dfda0709709becb/

Wooo, lots of errors. Relocation truncated to fit (maybe the binary is
too large), and missing fallocate64.

>     x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/eb6317433b89d3ad2a70b39a186ee223bc3f4a41/
>     x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d439787cb8b3ee3e001dfd24e93351201a1387ce/
>     x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/c397677e2332c9a39950ea840333fc05d04c2e68/

uint64_t type problem. Gustavo, can you have a look?

>    powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a659d7ede91bb13904c360fe8c8f316b7011918b/

Something for me to look at, it seems.

>    powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b92b707ec32bf6f9a0c5834fd68d81d76d1a6365/

Weird messages:

Assembler messages:
Fatal error: can't create obj/esfilter.o: No such file or directory

Parallel build issue?

>        arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/4df8cd85e0287910567df81c0394b2914570e98a/

src/input/mpegts/dvb_support.c:415:25: error: 'SYS_TURBO' undeclared here (not in a function)
   { "TURBO",            SYS_TURBO }

Too old kernel headers.

>       bfin |                       udev-182 | NOK | http://autobuild.buildroot.net/results/386be48be71ede6e06ea5547e37a1b6448f5fba2/

udev needs fork().

>       sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/52bc9c4c2dfc0bd37f7170b98a2201ed853bad74/
>       sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/899155257298dbc85c1681f900ddd042ead98412/
>       sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/b908769c1291da8f758a44b04d36dbc415400b39/

Those ones should be fixed now, they were caused by issues in the
autobuilder script.

>     x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a53ea017ec92150c7d37c0da0ca9a8dac75f460e/

/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld: ./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): relocation R_X86_64_PC32 against undefined symbol `gcry_md_reset@@GCRYPT_1.2' can not be used when making a shared object; recompile with -fPIC
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld: final link failed: Bad value

>    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/6e7c691099a8f3eef4fc84860ceb1a94f25873eb/

Too old kernel headers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
