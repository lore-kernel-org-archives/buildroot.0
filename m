From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Feb 2014 10:08:42 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221073009.2E62F10136B@stock.ovh.net>
References: <20140221073009.2E62F10136B@stock.ovh.net>
Message-ID: <20140221100842.2d988a70@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Fri, 21 Feb 2014 08:30:08 +0100 (CET), Thomas Petazzoni wrote:

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/cf6d6b0c794e254676903f86d96d11d107c79283/

cairo-test-runner.c: In function 'is_running_under_debugger':
cairo-test-runner.c:168: error: implicit declaration of function 'getppid'
cairo-test-runner.c:168: warning: nested extern declaration of 'getppid'
cairo-test-runner.c:169: error: implicit declaration of function 'readlink'
cairo-test-runner.c:169: warning: nested extern declaration of 'readlink'

Needs investigation.

>       i686 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/bd4cc779b46e3837e3d6c43c97eaf42fdfc3a288/

Fixed by http://git.buildroot.net/buildroot/commit/?id=0cb2b158d4650ab0f0648056c212686d026997ae.

>      avr32 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/61dc8c841b878abe60fffa7e686e15e362fa908b/

Looks like a problem linking with zlib or something like that. Not sure
if it's AVR32 specific or not:

../cups/libcups.a(file.o): In function `cups_compress':
/home/test/test/2/output/build/cups-1.3.11/cups/file.c:271: undefined reference to `crc32'
/home/test/test/2/output/build/cups-1.3.11/cups/file.c:271: undefined reference to `deflate'

>       bfin |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/51249e8d3487e17bb6a60a99dcbd461f7b591eac/

Just sent a patch to fix this.

>       sh4a |               dropbear-2014.63 | NOK | http://autobuild.buildroot.net/results/294f462fd585b405fc3067967f9508202bb76230/

Download problem. Peter, can you put the tarball on
sources.buildroot.net?

>      nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/480d1337de3467520d629fa8bdee57436337ce05/

Fixed by
http://lists.busybox.net/pipermail/buildroot/2014-February/089981.html
and
http://lists.busybox.net/pipermail/buildroot/2014-February/089982.html,
but I must say I don't necessarily understand the problem.

>       bfin |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/b2beb4876fba22f139df9c336ff0fae77354721b/

gpm uses fork(), cannot work on !MMU. Patch sent.

>      avr32 | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/ee2ec848e893f08fa80caf99a67e68b73b6400e8/

driver_nmea2000.c: In function 'nmea2000_open':
driver_nmea2000.c:1607: error: 'PF_CAN' undeclared (first use in this function)
driver_nmea2000.c:1607: error: (Each undeclared identifier is reported only once
driver_nmea2000.c:1607: error: for each function it appears in.)
driver_nmea2000.c:1636: error: 'AF_CAN' undeclared (first use in this function)

Smells like a too old kernel header problem, but it uses an AVR32
toolchain built by Buildroot 2014.02-rc1, so I would suppose the kernel
headers are quite recent?

>      nios2 |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/df09e1fe301480b599be777bf26874d66a152810/

Fixed by http://git.buildroot.net/buildroot/commit/?id=faed40cf1dd378e764c8c202f9e4652ff845b148.

>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b415fed7fae4012bad7d8b53a481bd71bdab716f/
>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ce09a82e33663902c063bfb23a7dafe4067d4e46/

Both fixed by
http://git.buildroot.net/buildroot/commit/?id=8797a8cb587634c907321ab6aa50ba5400392739.

>    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/5a25499020b8e933a8c1d9381aecbce0ac74dddc/

In file included from common.c:10:0:
/home/test/test/1/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/include/linux/netlink.h:31:2: error: expected specifier-qualifier-list before 'sa_family_t'
make[3]: *** [common.lo] Error 1

Smells like a kernel headers problem.

>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9994201ccccdd36349bad75c001810785c3b09b1/
>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/ed66792e332ee0256a17f98cbe21dfcfe6e8743b/

Both fixed by
http://git.buildroot.net/buildroot/commit/?id=045651e253be4ec20abbff0cd2678b88509cbb20.

>       mips |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/e4d510ab6ba69f95401e3120ab90ccdff22deb91/

mbpixbuf.c:127:3: error: unknown type name 'jmp_buf'

Vicente maybe?

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/aa95d19fa5fdddd4e6ac5ae5f079396ffd7b70a9/

ARM floating point issue.

{standard input}: Assembler messages:
{standard input}:3784: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:3869: Error: selected processor does not support ARM mode `veor q0,q0,q2'
{standard input}:3870: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:3931: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
{standard input}:4001: Error: selected processor does not support ARM mode `veor d0,d0,d2'
{standard input}:4002: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'

>     mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/c76e6f8b2d7fc29abc2f4dcae962b60cf91a8e0c/

Usual rt-tests failure on mipsel, fixed by a bump of rt-tests, but
which was committed to next.

>        arc |                ruby-1.9.3-p484 | NOK | http://autobuild.buildroot.net/results/c3d235d4c42f6b256cf3bba7140dae5c7bd4d2fd/

compiling parser.c
{standard input}: Assembler messages:
{standard input}:2581: Error: operand out of range (524 is not between -512 and 511)
{standard input}:2585: Error: operand out of range (516 is not between -512 and 511)
{standard input}:2856: Error: operand out of range (512 is not between -512 and 511)

Compiler problem on ARC. Maybe fixed by the bump of the ARC toolchain
in next. Anton, can you confirm?

>      avr32 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/bbf179eb809c5515fbf7bb0ab54c1d02fc6e71c7/

/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/crtbegin.o:(.fini+0x0): relocation truncated to fit: R_AVR32_GOT18SW against `__do_global_dtors_aux'
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/crtbegin.o:(.init+0x0): relocation truncated to fit: R_AVR32_GOT18SW against `frame_dummy'

Weird problem. Maybe a binary that is too big for AVR32 ? Samba creates
really huge binaries. Should we simply disable samba on avr32
altogether? Or is it a specific configuration of Samba that doesn't
build?

>       mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/95cac37ef8f035c024ebcd808367739c29875f30/

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: ./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): relocation R_MIPS_26 against `div' can not be used when making a shared object; recompile with -fPIC
./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): could not read symbols: Bad value
collect2: error: ld returned 1 exit status

We have the same problem on x86-64: some vlc library is apparently not
build with -fPIC. Could someone look into this?

It has caused the last 3 build failures of vlc on mips:

 http://autobuild.buildroot.org/?reason=vlc-2.1.2&arch=mips&step=3

and the four last build failures of vlc on x86-64:

 http://autobuild.buildroot.org/results/a53/a53ea017ec92150c7d37c0da0ca9a8dac75f460e/build-end.log

>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c1ffdd6fd0a7d352faddbe58a81b66c22bbf7bbf/

Architecture support problem.

./Source/JavaScriptCore/assembler/MacroAssembler.h:62:2: error: #error "The MacroAssembler is not supported on this platform."

>       bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/f234ca1dace003be0dc3e331589eb448170d6ad1/

Missing atomic builtins?

../src/.libs/libzmq.so: warning: the use of OBSOLESCENT `tempnam' is discouraged, use `mkstemp'
/home/test/test/1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libpgm.so: warning: gethostbyaddr is obsolescent, use getaddrinfo() instead.
/home/test/test/1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libpgm.so: undefined reference to `___sync_add_and_fetch_2'
/home/test/test/1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libpgm.so: undefined reference to `___sync_fetch_and_add_2'

>    powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/c077d0782fd2791e295a8abf9464c9933a16a52f/

Static linking issue:

/home/test/test/3/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/test/3/output/host/usr/powerpc-buildroot-linux-uclibc/lib/libstdc++.so'

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
