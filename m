From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 15:05:39 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160222073022.D29851025E8@stock.ovh.net>
References: <20160222073022.D29851025E8@stock.ovh.net>
Message-ID: <20160222150539.0301105e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The usual analysis of build failures. Karoly, Eric, Yann, Olivier,
Alexey, Lada, Bernd, Vicente, Alan, Waldemar, Samuel, Gustavo, could
you have a look below, there are some questions/issues for all of
you :-)

Thanks a lot!

On Mon, 22 Feb 2016 08:30:22 +0100 (CET), Thomas Petazzoni wrote:

>         mips |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/2bf4e5ea9b67b80ba38bfeaf71b747a92be09011/

tools/avinfo.c:193:24: error: unknown type name 'a2dp_ldac_t'
 static void print_ldac(a2dp_ldac_t *ldac)

It's not MIPS specific, since the same build issue occurred on other
architectures.

Could someone have a look ?

>          arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/92802995144a76202040421255b003aded527958/
>          arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/db5733d2a62f84f90056d5e48e3f08fe94b87a6d/

Musl build issue. A patch was submitted a long time ago, but got
rejected: https://patchwork.ozlabs.org/patch/509731/. Since nobody
really cared, I propose to mark canfestival as not available on musl.

>          arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/e09ea3a64d396bbc855acf7c07fcbea28fb2395d/

Static linking issue. Rodrigo is on it.

>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/07ccca8f80c56ab0ff48bfee876885b1c8c3916e/

/home/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
cannot find Scrt1.o: No such file or directory collect2: error: ld
returned 1 exit status Makefile:232: recipe for target 'ippserver'
failed

Olivier, you re-enabled and updated the CUPS package, can you have a
look ?


>          arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b169b939e38cb761319a92d2871f4f59ddb5c4ac/

/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.4/../../../../arc-buildroot-linux-uclibc/bin/ld:
BFD (GNU Binutils) 2.23.2 assertion fail
elf32-arc.c:3062 /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.4/../../../../arc-buildroot-linux-uclibc/bin/ld:
BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:3062

Alexey, Lada, this is an ARC toolchain issue. Any hints?

>      aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8b47dea53fc8608ab62cadfaeecdf828fd3d940f/

Atomic operations problem, this is being discussed around a patch that
was submitted by Frank.

>         sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/68f98acca8b02aeaa98c78d2e95a6a29df629fef/

mutex.o: In function `fio_mutex_up':
/home/test/autobuild/instance-1/output/build/fio-fio-2.6/mutex.c:182: undefined reference to `arch_flags'

Not sure what's going on. Someone to investigate?

>          arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/edfb6854306ccaed9592139ad803850c2e0011d2/

linux-nat.c: In function 'lin_thread_get_thread_signals':
linux-nat.c:4878:15: error: '__SIGRTMIN' undeclared (first use in this function)
     restart = __SIGRTMIN;

Smells like a musl build issue. Bernd had a patch "[PATCH 1/1]
package/gdb: Fix musl build", which I marked as "Changes Requested"
yesterday. It looks like this particular patch was pretty good, though
submitting the patch upstream would be good (the patch says it was
submitted and points to an almost 5 years old bug report).

>     mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b848969d518008dadb40fbebc40bab4124231c2b/
>     mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/ace98b9c51379e19f70bbe0bda94ff80ab9dd7fc/

Vicente, this one is for you:

libavformat/aadec.c:1:0: error: '-mips64r2' conflicts with the other architecture options, which specify a mips64r6 processor

>         i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6f0c9a682bc98f962874a38c9e2a334fea21b0cb/
>       xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/a9216cd5f9568ef134b64341b629efea40d54fe1/

make[3]: Entering directory `/home/peko/autobuild/instance-2/output/build/hidapi-d17db57b9d4354752e0af42f5f33007a42ef2906/hidtest'
make[3]: *** No rule to make target `hidtest.o', needed by `hidtest-libusb'.  Stop.

Might be a parallel build issue. Alan, hidapi is your thing, can you
have a look?

>       x86_64 |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/c427d13cf1c50305047a3f0b0051520e672f91d8/

Fixed by https://git.busybox.net/buildroot/commit/?id=fd7a2eacb37274e9bfc7d59eb4b3c4840a4c8a2d.

>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/685e2ec91d889c6a789025864e6b4890ef6b532d/

Ignore.

>          arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/39ff650ca14bdfa35b35bbf13e01cfceeb43035e/

Musl build problem.

>          arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/f44629feae5eb8b8b61e88eac5b24cbfce8a1c4d/

Musl build problem.

>          arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/ad8fbadedc152ec93c175aeb24f062e8290a352e/

Musl build problem.

>       x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d618837a536dfd3d076ae1cecd1f598b4bf7efcd/
>       x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fa6b8a8175420e9d76f23eb7b61075ac5ce315de/

Musl build problem.

>          arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/43939f65e4516adddc4385c6e0a2193abcab0446/

Usage of 64-bits on ARM with uClibc, doesn't work because gcc uses the
__write() internal glibc symbol. We need to isolate the Kodi features
that uses this 64 bits atomic operation (if possible) and make it
depend on BR2_TOOLCHAIN_ARM_HAS_SYNC_8. See also
https://git.busybox.net/buildroot/tree/toolchain/toolchain-common.in#n339
for a discussion of this problem.

Bernd ?

>          arm | kodi-pvr-argustv-32f03271cc... | NOK | http://autobuild.buildroot.net/results/dacc3bd00ab2346d7655c0a1fb99f6c50b9da08b/

Bernd ?

>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/67f19f1fdf642c3c72deb931cb674b114bacc4da/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ed2503778126253fad08d9828f442a0b9d042fc2/

nios2 toolchain bug, will be fixed by
http://patchwork.ozlabs.org/patch/582313/.

>        sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/a17047ada385e5be5f60c07254597fcb7c4183d0/
>        sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/6d79591bce2d3fa5b93e268fe50d5b89ecd24521/

Could be fixed by http://patchwork.ozlabs.org/patch/569818/, but this
patch is wrong I believe now that we have proper Config.in options to
describe atomic operation dependencies.

Waldemar, could you have a look?

>       x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/52cdd46091740aab423987bdd6e2423b157a8799/

Musl build issue.

>          arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b1d80c4b62bd71e722f53b0e2caadd7951f23dd7/

/tmp/ccmCzrHn.s: Assembler messages:
/tmp/ccmCzrHn.s:765: Error: invalid register number `63'
/tmp/ccmCzrHn.s:3686: Error: invalid register number `63'
/tmp/ccmCzrHn.s:3688: Error: invalid register number `63'

Alexey, Lada, toolchain issue.

>        sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/80988d3cc1cebd32b5c9718b936f9dfe9c10e34a/

Ignore.

>      sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/ce2c1fb10dfef1039545443ff9ef969889d2bf40/

Waldemar, this is a sparc64 issue, can you have a look?

> microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/a692bc6df992cd05470fcc5b6e59ffb449da2069/

Ignore.

>          arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/0eb25c0756eeb6b7ad4d3b1a86a47dfff3d766ef/

collect2: error: ld terminated with signal 11 [Segmentation fault]
Makefile:918: recipe for target 'gallium_dri.la' failed

Alexey, Lada, toolchain issue.

> microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/521aad4fd2e24fd78fa26a1d0c6284d56100a467/

./.libs/libglsl.a(glsl_parser_extras.o): In function `_mesa_glsl_compile_shader':
(.text+0x3850): undefined reference to `__sync_val_compare_and_swap_1'

Need to add some atomic operation dependency here.

>      aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e82b37607e3ef9efb0933e9300c48074d249a414/

mplayer on aarch64 has been failing to build for a while. I asked Joao
to fix the issue (since he enabled Mplayer on aarch64), but never
submitted a fix. I had a quick look, it didn't seem to be trivial, so I
propose to disable mplayer on aarch64.

>      powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/630771e41d71443e7c6a1ab3367199ebcc451153/
>      powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/ddb1f5ccb1fb41fdfb7c035c0a8282a4afaa9c61/

Patch pending from Maxime, http://patchwork.ozlabs.org/patch/577178/.

>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/11e90fc79cb96631fd3e44af7e15650047858b7d/
>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/1997e8c52e093395bc0b15d6de1ccf328e077fce/
>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/39892be2a1857b727f4213079faaade52d4da0d2/
>     mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/131b044097725c00c58c05bf0d4e2afa05cf145a/
>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/4db511e9d09b67ea333814d3698866c82c7afb54/
>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/6a1470c60b08c95765f3549177dfa6059b76493b/

Discussion on-going at http://patchwork.ozlabs.org/patch/582442/.

>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/63086c31c57fd68aa2759c51d7dfd49ae9e7239b/
>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/d05d7a24283cb0b5f305a7cd4cf8a60a4be7959d/
>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/92ebbd138dea50183880db49f920439b60e6f89b/

Not sure. Waldemar (sparc64 person) and Samuel (OpenCV person), any
idea ? Seems atomic related.

>          arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/bc6209c2531c791a095935ffc6ff461de04f5b04/

Musl build issue.

>         i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/a6b5ef77df470c99c83ccc02a731f944e9747c65/

checking for getstat in -lproc-3.2.8... no
checking for getstat in -lproc-3.2.7... no
configure: error: libproc not found. Please configure without procps (using --without-procps) or install procps - http://procps.sourceforge.net

Karoly, can you have a look, since you originally added openvmtools?

>      powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/8a3156e287282fb63c009e04248faf09f9b29476/
>      powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/d2686e71dcc1cf017503f7c68efdfe5c521abbc3/

security.c:245:8: error: 'PR_SET_NO_NEW_PRIVS' undeclared (first use in this function)
security.c:245:8: note: each undeclared identifier is reported only once for each function it appears in

Too old kernel headers?

>         bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/ee3701c11ba8094e74c7356105ee2a18c2c73100/

pspax.o: In function `_main':
pspax.c:(.text+0x4c8): undefined reference to `_cap_init'
pspax.c:(.text+0x964): undefined reference to `_capgetp'
pspax.c:(.text+0x970): undefined reference to `_cap_to_text'
pspax.c:(.text+0xe42): undefined reference to `_cap_free'

Static linking broken ?

>         i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/a854da559be1d617d31acbb08c39e6ac5464cee7/

security.c: In function 'security_init':
security.c:245:8: error: 'PR_SET_NO_NEW_PRIVS' undeclared (first use in this function)
  prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);

Same as the PowerPC issue.

Gustavo, since you added pax-utils, can you have a look?

>          arm |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/985dc18ec04901bea7d4fdd6e0145f7625e80869/

/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgdbm.a(gdbmerrno.o): In function `gdbm_strerror':
gdbmerrno.c:(.text+0x18): undefined reference to `libintl_dgettext'
/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgdbm.a(gdbmfetch.o): In function `gdbm_fetch':

Static linking issue. Fran?ois, you are the maintainer of our Perl
package, can you have a look?

>          arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/f61ae46ba4d4fc3af3784d1f612a8c1cc7de3314/
>          arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/a124d4c8a2ef36165b29fbcc99c4c8ff89d296fb/

Static linking issue, forgets to link with libm.

Eric, you added pifmrds a while ago, can you have a look?

>         sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/918d72bd9684a39dc688b143b682f8b5f49f1b26/

r_fps.c:296:1: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://support.codesourcery.com/GNUToolchain/> for instructions.

Gaah. A bit of investigation needed, maybe we should simply disable
prboom with this toolchain.

>         bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/884bd0fef2f88154da949fa3f4cc04368575183a/
>         bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/34f8754e2ddb243aaa73af196622449f655c5213/

Weird:

/home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:330: error: expected `;' before 'i'
/home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:331: error: expected `;' before 'e'
/home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:333: error: 'i' was not declared in this scope
/home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:333: error: 'e' was not declared in this scope

>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3f3d2938ba6a590ff2c4b20a7a15a46cbb079bc8/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f67b512b761cb53a9d66ecfda9894e1f8d86c26f/

Romain has submitted patches.

>        sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/872cb03d5869bd616fe8b22099a9ec4d556645ea/
>        sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d462bf881ab01102ae26e20794b90c0ac3bbe27e/

obj/release/JSObjectRef.o: In function `JSClassRetain':
JSObjectRef.cpp:(.text+0xc0): undefined reference to `__sync_add_and_fetch_4'

Need to add some atomic operation dependency here. Waldemar?

>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/90a74e1c6c759e7029802caed2b3117fd63b1f17/

Romain has submitted patches.

>       mipsel |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/9379603f465a5ce3a579bf27338a5a4be0f11728/

{standard input}: Assembler messages:
{standard input}:708: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v0,$t8,$t7'
{standard input}:759: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v1,$t8,$t7'
{standard input}:765: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $t2,$t8,$t7'

MIPS stuff. Vicente ?

>      powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/87c882bc1a0dec9d76917c1e2db51fea61150294/

eval.c: In function 'rb_protect':
eval.c:881:1: internal compiler error: in move_insn, at haifa-sched.c:3439
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://support.codesourcery.com/GNUToolchain/> for instructions.

Compiler boom. Disable ruby with this toolchain? Gustavo?

>          arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/d22c1da4439806ded7cf8abf54ef92d0bf97dc9f/

checking for no... no
configure: error: library 'libxml2' is required for the rss module
package/pkg-generic.mk:185: recipe for target '/home/autobuild/instance-0/output/build/sconeserver-

Smells like a static linking issue. Yann, you already fixed another
static linking issue with sconeserver, surely fixing another one will
make your evening more enjoyable ? :-)

>      sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/fde279194387e131a4027d5a1e2183da8e477bbb/

fpie/fPIE problem. I did had a patch for that, forgot to submit it.
Will try to submit it soonish.

>       mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/95721f7b88c46a20202fb02e408817097df965c3/

/home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/../../../../mips-img-linux-gnu/bin/ld: cannot find -lssp_nonshared
/home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/../../../../mips-img-linux-gnu/bin/ld: cannot find -lssp

Vicente, still no news from your toolchain guys?

>          arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/52202f98b9ebd273bdb3dd87f27cb1789f8362f9/
>          arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/d97674be3ebc90ab99e93b1b294cfae8c7c1dad8/

File truncated weird thing. Quick investigation reveals that:

 - It seems to appear only in static linking scenarios.

 - It appeared many times with sqlite-3100200, appeared only once with
   3100100, never appeared with neither 3100000 or 3090200.

Any ideas?

>     mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/64cd09dc957cbeaab9c5c6d331d38e6e22da29ae/

prototypes.h:625:5: error: conflicting types for 'getnameinfo'
 int getnameinfo(const struct sockaddr *, socklen_t,

Interestingly, this problem seems to occur only on MIPS. Vicente,
Gustavo, any idea?

>      aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/fd0be644bf5c1c448eb1d2f94adbb433095f22f8/

src/common/libor-crypto-testing.a(src_common_libor_crypto_testing_a-crypto_format.o): In function `crypto_write_tagged_contents_to_file':
crypto_format.c:(.text+0x1c): relocation truncated to fit: R_AARCH64_LDST64_ABS_LO12_NC against symbol `smartlist_new' defined in .text section in src/common/libor.a(container.o)

Hmmmm, some ARM64 toolchain person in the room?

>          arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6703eb14e69120f82878e4d3fb0dc5a4362cd8ef/

Musl build issue.

>          arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/28638752ebe923b6597ebc6838c1f97477dc23dc/

Will be fixed by http://patchwork.ozlabs.org/patch/569556/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
