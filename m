From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 10:35:11 +0100
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227073009.1283F101A83@stock.ovh.net>
References: <20131227073009.1283F101A83@stock.ovh.net>
Message-ID: <20131227103511.2c218d17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Here is a quick analysis of yesterday build issues.

On Fri, 27 Dec 2013 08:30:09 +0100 (CET), Thomas Petazzoni wrote:

>      avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/1066e6cc9ef66d8d7e6be976507b8c77e550d24e/
>       i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/86faf32c4315d808ad3255bb79d6c4078a968505/
>      avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/3f053b065558a03a44075b9edb0e5b48e6d88101/
>    powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c2cac87e8d717fdc6039ecba8bb16d064d491e8b/

The two AVR32 build failures are fixed, they were caused by
dn_skipname() being missing on old uClibc used on AVR32.

However, the i686 and powerpc build failures are apparently caused by
the GnuTLS update. Gustavo, can you have a look?

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/29d14f0a4b3b2fee18a879374e172f3cc6e7c2ec/

Cairo/OpenGL problem, not sure what exactly.

>       bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/534fc024975aa25dfa2470c748811ee621c8d6ec/

cegui should depends on !BR2_PREFER_STATIC_LIB

>        arc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/05493d9d27e18e1d17ae7e6feec978ec50a09e31/

Seems to be a uClibc issue on ARC:

e4defrag.c:203:12: error: conflicting types for 'posix_fadvise'

Mischa, can you have a look?

>        arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/e3f7caf853d61c2f06969dbb780c2d7e5ad116a5/

ARC gcc compiler error:

libavcodec/snow.c:921:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:8530

Mischa, should I mark ffmpeg as !BR2_arc for the moment, until the
compiler issues are resolved?

>    powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/dcee73d661f31de64e4995a91c255e06418b4924/
>    powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/222ed7f34f9f1d6f9d9242a3434cd217f2307a2f/
>    powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/4c2742e7aafc15ca936668c9a12d62b660cc6a05/
>    powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/6d7e22489c1da842660a654183bc656548b4e178/

Problem fixed already.

>      nios2 |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/e9bc81b3a7a3634c108f33ade56ec7e0ed98fe38/

We should probably mark gdb as not available on nios2.

>       sh4a |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/1bd67b616e996d684dd584576569517f4653addd/

Already fixed by Gustavo.

>        arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/8a0df7aea57e0739cc42c1a78945fb34b90c895e/
>     x86_64 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/0ed2ce5eedaf9e8cc41e54610438ef9005b36688/
>     x86_64 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/98e971a581a025f2134642c994991caf36aa7f5e/
>       mips |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/b607159efe2fbfedbef6cfc4770d70366250234a/

Qt4 issue, not sure what.

>     xtensa |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/1fb5bde77ea84f13fe8db7dedda5b8a29671b939/

checking if unaligned memory access works correctly... configure: error: in `/home/test/test/2/output/build/gstreamer1-1.2.1':
configure: error: cannot run test program while cross compiling

Baruch, can you have a look into this? Thanks!

>        arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/6dde840af39f19564f27957d82a2e066365280e8/

Connection problem to elf2flt CVS server.

>     xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/96909f548776eb69bb62f262db242c47f1c1d5a4/

Transient uClibc version error. Will be fixed by my patch that makes
Xtensa use a fixed uClibc version, rather than the latest snapshot.

>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/fdd120105087e7f3b977eef745039d5200dacb1f/

*** ERROR - configure could not detect your platform
*** see the readme.html
*** or, try copying icu/source/config/mh-linux to mh-unknown
***   and editing it.

Not sure what's going on. Sonic? Aaron?

>        arc |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/f23f3fc5ece6ce19fb5a0fb0748d4d5db9975df7/

The package uses pthread_setaffinity_np(), which is only available in
NPTL. Options:

 */ change iozone to not use pthread_setaffinity_np()

 */ have an additional kconfig knob that tells whether the thread
    implementation is NPTL or not and disallow iozone when !NPTL

>    powerpc |                    lftp-4.4.10 | NOK | http://autobuild.buildroot.net/results/8f9ddf8eab2f70280679198461c3c6153c9c516d/

Package needs to depend on host-pkgconf at least in some conditions, I
will send a patch for this.

>        arm |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/821243ca0583a6185e0650ee04125bd173ef4439/

Transient problem on the build server, ignore.

>        arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/d3a2a7c07aa1afc7e5f8582ac33199ee76d5c79f/
>        arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/8f9343313f4ac9c64d2f8c1f637d3dc0525b8ccb/

ARC compiler problem:

{standard input}: Assembler messages:
{standard input}:886: Error: operand out of range (-130 is not between -128 and 127)

Mischa, what action should we take?

>       bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/f4c795f060280df43b9e96691c4668f4d676fbdd/

libpng link problem. A bit mysterious as to why it happens on bfin and
not other architectures.

>      avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/870ea38cd0fc30859cb244e1ab452adbdb007a43/

Compiler error:

test-hkdf.c: In function 'test_hkdf_test_case_7':
test-hkdf.c:329: internal compiler error: in compute_frame_pointer_to_fb_displacement, at dwarf2out.c:10602
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.atmel.com/avr32/> for instructions.

It's when building a test, so maybe we can disable building the tests
of libsecret?

>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/75e4b40443852424bf1841c11501de4dcd85cc08/

uClibc issue on Xtensa? Baruch?

spawn_faction_addclose.c: In function 'posix_spawn_file_actions_addclose':
spawn_faction_addclose.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
spawn_faction_addclose.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'
spawn_faction_addclose.c:59:24: error: 'posix_spawn_file_actions_t' has no member named '_actions'
spawn_faction_addclose.c:59:47: error: 'posix_spawn_file_actions_t' has no member named '_used'
spawn_faction_addclose.c:64:19: error: 'posix_spawn_file_actions_t' has no member named '_used'

>     x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/0b620cd095671236cc86dcb4611a0f5ea11abceb/
>   mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/de073826641a1424de5536df8b2f51a350fcb99d/
>        arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/687d700732f31fcffaf280187e5563f474a46cc2/
>   mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/0a81675a14aab25df18c6ac260e6146dfde8caf8/
>        arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/3410a5eab18dbd343e86e5f810b916589ab3910f/

Since the conversion to the package Python infrastructure, Ola
configure script no longer detects that the google.protobuf Python
module is installed. But it does this check in a way that is inherently
not cross-compilation safe. I've started the investigation, to be
continued.

>        arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/283678c74ffdcbae6ffbb976689970891beed5e8/

Link issue:

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.8.2/../../../../arm-linux-gnueabihf/bin/ld: warning: libXdamage.so.1, needed by /home/test/test/3/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
[...]

>        sh4 |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/90577a72731026e4a08a15c0cab086a1fbe3bd2d/
>        arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/f69e6e1280da8985d5197b99e8c07a165a1a007b/
>        arm |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/32dc1bc7562abf1206b72b64a972e9c71bc785ae/

Should be fixed by the Python cross-compilation fix I've pushed
yesterday evening.

>    powerpc |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/3085077d0f075a62487722eded3cc657d59e2e43/
>    aarch64 |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/9020140ca39d2aa2a085a6cfa09996ed41f9b998/

Qt4 issue, similar to the one of Grantle.

>        sh4 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/a249b0cd5b20a2c3eee34b585cd58d4a03a9338e/

../../../3rdparty/sqlite/sqlite3.c:23535:42: error: 'posix_fallocate' undeclared here (not in a function)

I think we had this problem in the past. Note that the SH4 toolchain is
older than other toolchain (generated with Buildroot 2013.05, while
other toolchains are generated with Buildroot 2013.11-rc2).

Fatih, any idea?

>      avr32 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/e3af369e55431222f6ba3ab37f838e135560cc35/

Apparently no support for AVR32:

../../include/QtCore/../../src/corelib/global/qprocessordetection.h:323:6: error: #error "Unable to determine byte order!"

Disallow Qt5 on AVR32 ?

>    aarch64 |                qt5script-5.2.0 | NOK | http://autobuild.buildroot.net/results/5d455148cfee5b804d38822386e03ee3061ac15f/

No support for AArch64 in JavaScriptCore, if I understand correctly.
But wasn't the Javascript interpreter changed with the removal of
qt5jsbackend? I'm not really following between the Javascript
interpreter used by qt5script, by the qt5declarative stuff and by the
qt5webkit stuff. Are they three different Javascript interpreters?

>    powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/8ba1c0ffa35904a98fd4fe93175cefe35f431f04/

Too old kernel headers. Will add exceptions to the autobuilder script.

>    powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/2c2a8cbacd3851b00f8bad4a1d7dde06edfe861a/
>    aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/f8a12af8df04890eed2008c5913b83a39f0205ee/
>   mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/df71e185bd69789cc3eb015160bb0ceffa491b62/

Not sure what's going on here. Builds were too long, but the build log
is empty. Weird.

>    powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/59caf8a155a0c2593eace6ba160dbbcd6ff8baa3/

Too old kernel headers. Will add exceptions to the autobuilder script.

>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d3b2e12d3ab8ec87a0321e7cb2031760427ae606/

PowerPC not supported by the Javascript stuff in Webkit:

./Source/JavaScriptCore/assembler/MacroAssembler.h:62:2: error: #error "The MacroAssembler is not supported on this platform."

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
