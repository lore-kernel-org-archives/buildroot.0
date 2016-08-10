From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 16:14:55 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <20160810063029.6F291102D04@stock.ovh.net>
References: <20160810063029.6F291102D04@stock.ovh.net>
Message-ID: <20160810161455.142a6a19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Please find below the usual analysis of build failures. Hiroshi,
Waldemar, Gustavo, Fabrice, Yann, Dagg, J?rg, Vivien, Vicente, Samuel,
Peter, Joris, Alistair, please have a look below, there's some fun
stuff for you! :-) Thanks for your help.

Thomas

On Wed, 10 Aug 2016 08:30:29 +0200 (CEST), Thomas Petazzoni wrote:

>         m68k |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/081aa0b4f0e65648653ae7d3c157dd887f41f58d/

Bogus build result from Andre's machine, ignore.

>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/01f4be126c2d786a5ad7f220c2cf60539888a480/
>         bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3c2196e7c8f5e7c278af655d17ee57527680f084/
>         bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/9f6c0d4aaf5348ab499744856e92775ac38eb0dd/
>         bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/394e530c5dcd9ccb590eb151aeaadb37d11e0e39/

All of these are Blackfin C++ issues, I've disabled C++ support on
Blackfin with the internal toolchain, so those errors will be gone.

>          arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/4ff19128f2aa861d0ad91e96bd32e7de0321a522/
>       x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/772ec47dce51e29406a53785b7733ee6124da095/

musl build issue.

>         bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/ada44228bf13ec05382275bd6571396f5ba2b1f7/

Blackfin C++ issue, ignore.

>          arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e263cdf69ae5e6c5a1cdcc43950df5a0052ed1b1/

ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
2 bad relocscollect2: error: ld returned 1 exit status

Not sure binutils on target for ARM/Cortex-M is well supported. Anyone
to look into this?

>         m68k |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/72fce07ee7857b5fc87474bb0d6226c86707d905/

Apparently bogus build result from Andre's machine.

>         bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/88b02a5dd5408318941ccbfcea0a9cbaa331500a/

libpixman-1.so: undefined reference to `__emutls_get_address'

Waldemar, can you have a look?

>          arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/7be65682380f7c2321e19b5e7cbf6f67c6b55874/

Conflicting CPU architectures 13/1

>        nios2 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b5cb831e2b309a6e4b3497a6da23fd023dcdab29/

Bogus from Andre's machine I believe/

>         m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f34ad4f0cf094fa31b7dc18522e9eedfc5c2c940/

/tmp/cctGT3zI.s: Assembler messages:
/tmp/cctGT3zI.s:14834: Error: value -34500 out of range
/tmp/cctGT3zI.s:15075: Error: value -35250 out of range
/tmp/cctGT3zI.s:15528: Error: value -45542 out of range
/tmp/cctGT3zI.s:15529: Error: value -45566 out of range
/tmp/cctGT3zI.s:15539: Error: value -45886 out of range

Waldemar ?

>          arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/d14921d20bfc260e2044b9869560b5b2d839d518/

Still the same stdlib.h gcc6 issue. Any solution in sight Samuel?

>         i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/3e12415fc18168b301008f552259a84c7beb13b4/

musl build issue.

>          arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b5ac909853bbcf6ea16cef5c973b0d203aa262fb/
>      powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e54e09d52582d543f065371c94319b0756f273cd/

Really weird "powerpc-linux-gcc.br_real: error: 2: No such file or
directory" error.

>         bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/1118d568959006b7f973761884fd3f4b63be19b1/

Compiler issue:

  libavcodec/hevcdsp_template.c:1678:1: error: unable to find a register to spill in class 'CCREGS'

Waldemar?

>          arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ca4c67b093afd6f14349fcdc87b02e0480172e8c/

Conflicting CPU architectures 13/1

We really need to investigate this one.

>          arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/5a04bb54cd9b33d1292ea58aea2bf6f91c1d4722/
>          arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/6d8481e989cf8f8918c44981e9ecbf3ef0eed575/
>          arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/f660ba94f509d47ba88dd9449e5b58ade15f25a7/

fatal error: You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use these intrinsics.

Gustavo, you are the last person who bumped fio, could you have a look?

>          arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d6cb92a6e32f61e9f3a5949b15d965131de9817d/

The intl/pthread static linking issue.

>      powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/5e6cc4c432ce6c964ac285026978ad14d9eae97c/

The libaio issue.

>         i586 |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/481649105bd898d01829b31042e096f4ccc56694/

error: declaration of 'int posix_memalign(void**, size_t, size_t) throw ()' has a different exception specifier
 extern "C" int posix_memalign (void **, size_t, size_t) throw ();

Hum, I think we already had this problem with musl in the past, but I
can't remember the solution :-/

>         mips |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/f07acec6df9785c34f6d2e320b4940772e90d0b2/

Weird error:

./gauche.h:43:35: fatal error: gauche/config_threads.h: No such file or directory
 #include <gauche/config_threads.h>

Hiroshi, you added this package, could you have a look?

>          arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/5106180047c4eecb4cda501927ae733a193053e3/

Bogus result from Andre's machine.

>       x86_64 |              host-libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f9f420128da09ef57ed2339bb3a8e89b308e27d8/

Bogus result from Andre's machine.

>          arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/7de469f9042b61f942b69ce66f454911491afed2/

Static linking issue with libpthread. Fabrice, could you have a look?

>         i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/b5e47741fb4843428cbe10f8c250650b060dbf1e/

musl / i586 / SSP issue

>       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b593d422f394f1ed6a91faaa5ff73c769d523abb/

The NGREG issue. I worked on this yesterday, I have some improvements,
but it's not yet ready :-/

>          arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/01fa012c01ec41aa8d93f319627337221acf1dc3/

Musl issue.

>          arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/1ddbc071fa8e5f52bea98f62d289d1c6cf075bec/

Weird static linking issue, I think Yann said he was unable to
reproduce.

>          arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/68266cb5b26a62387dc99aef31fc9654c8fcd505/

This one is a musl issue. Yann, could you have a look?

>          arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/85114d93de24b7a685b64ba3fa8b41f2ebce50a4/

Fixed by https://git.buildroot.org/buildroot/commit/?id=f0417f965f800585d6d39f2218ba81021ac085b1.

>          arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/fd200405e32aa590c011eb55d22c7ce4ada8568d/

musl build issue. Dagg, since you added this package, could you have a
look?

>          arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/89556bcc30eba232f9662ea62b072f222d7d2239/

xml2/pthread static linking issue.

>       x86_64 |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/715c3ff13844a030767a49731069183aa02cc5f2/

config.status: error: cannot find input file: `rpcgen/Makefile.in'

J?rg, you've done quite some work on libtirpc, could you have a look at
this issue?

>         m68k |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/8a4e26bb1c0c64759e3914eced0a36baa0967f0b/

Waldemar, another "relocation truncated to fit: R_68K_GOT16O" for
you :-)

>          arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/68d3b8441d725ff503b4b433d02e3adce32948ef/

gcc6 issue.

>         i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/183d4eb246663b684780aefb9eda735fc5ef36bb/
>         sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/585e50e86a9ef6badd07c2dad06c762c4d1f3446/

Missing link with librt. Gustavo, could you have a look? You fixed
numerous such issues in the past, so I guess you know the trick :-)

>     mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8a6001f437701ecc75f6c9252935645bda8a8c8/

Not sure:

  checking if system libevent works as expected... configure: error: *** unusable system libevent

Vivien, you are the last person who bumped lldpd, so could you have a
look?

>          arm |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/f6a91b9067deb6b704ebcd34f03e309b8d19408c/

gcc6 issue.

>     mips64el |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/f439ccbd33430280a651de97f40e764e43e29612/

Vicente, this is related to a MIPS system call that seems to be missing:

  bdflush01.c:118:20: error: '__NR_bdflush' undeclared (first use in this function)

Could you have a look?

> microblazeel |                mosquitto-1.4.9 | NOK | http://autobuild.buildroot.net/results/85c44f6620f82957e41cb368ac46bffee402e951/

/home/test/autobuild/run/instance-3/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libuv.so.1: undefined reference to `pthread_barrier_init'
/home/test/autobuild/run/instance-3/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libuv.so.1: undefined reference to `pthread_condattr_setclock'
/home/test/autobuild/run/instance-3/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libuv.so.1: undefined reference to `pthread_barrier_wait'
/home/test/autobuild/run/instance-3/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libuv.so.1: undefined reference to `pthread_barrier_destroy'

Seems like libuv needs NPTL support.

>         bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/6a1bd73cc56cd257fa939702728802b63446473e/

integck.c: In function 'parse_mount_options':
integck.c:2889: error: 'MS_DIRSYNC' undeclared (first use in this function)
integck.c:2889: error: (Each undeclared identifier is reported only once
integck.c:2889: error: for each function it appears in.)
integck.c:2899: error: 'MS_RELATIME' undeclared (first use in this function)

Too old libc or kernel headers?

>          arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/b0f33713f8141fa3c1e428edda4c4d4a6f3d112f/

Bogus result from Andre's machine.

>          arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/41e02f7535515dd75f1efc6ea53a5d8c15b1d296/

fusermount.c: In function 'count_fuse_fs':
fusermount.c:172:24: error: '_PATH_MOUNTED' undeclared (first use in this function)
     const char *mtab = _PATH_MOUNTED;
                        ^
Vicente, you are the last person who bumped ntfs-3g, could you have a
look?

>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/9a5d36eac4a38d481df2eaf7e090717548d28649/

Fixed by https://git.buildroot.org/buildroot/commit/?id=caf8074cb4a08d61d5179b77bba7c72dc2c95481.

> microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/55a8af9ad0038826146d0404e119a9bd8376423f/
>         m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/77af7206e8765dae9b4820b55082be290787f6bd/
> microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/6d6e0b8198d3b0400de92f3564453159f204bb03/
>         m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/e2e9593b10c03b1d238b119ead5a2470e84fd600/

All fixed by
https://git.buildroot.org/buildroot/commit/?id=2a65eacfc11eae3a989e2d354e1c768217f04e4d.

>         bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/635010b1e7f46518aa059d8348224cbf01637a54/

Static linking issue. Samuel, since this is a CMake based package,
could you have a look?

>          arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f05725424915a1ee825bd7e57399883826c56fd5/

gcc 6 issue:

op_bfd.cpp:546:7: error: in argument to unary !
  if (!verbose)

>       x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/77dc8ec40074ac334c30a77fc261fa2b179f732c/
>       x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/bfedb3b028175b24be28bb1cb8f5911deded86ef/
>         sh4a |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/8dd96c26d7bdd900706ad25721e01d4cc1b8f276/

Bogus from Andre's machine?

>      aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/73e44ce4bcc21125ea3caba4dfb8d2683a4193f5/

Crazy C++ issue. Nobody cared for a long while, so I'm tempted to mark
this package as BROKEN. Vicente, you are the last person who bumped
this package, what do you think?

>         m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/791917c1343f53e12f27b06cfd5e1d2e88078014/
>         m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/349d4b49d65a652551c4de20233684bb4ffa5ae3/

#error Target architecture was not detected as supported by Double-Conversion.

Probably we need to disable this package on m68k. Waldemar?

>      aarch64 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/0e371b1d870d89a8bcb92ff91225e0e1f9ec9f23/

Again the udev/kms issue:

Project ERROR: libudev development package not found
KMS disabled.
 KMS support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.

Peter (Seiderer), coud you have a look? We had patch
https://patchwork.ozlabs.org/patch/646264/ from Akihiko Odaki, but I
was not convinced. If you could double check and see what the proper
solution is, it would be good.

>      powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/863ad2378cb6e9630026c74fcb5ad4fd04b17076/

Static linking issue. Joris, since you added this package, could you
have a look? Thanks!

> microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/3b5b88959887d8126444b728d59fc46987c52e4a/

squeezelite.h:248:121: error: 'PTHREAD_PRIO_INHERIT' undeclared (first use in this function)

Needs NPTL I guess.

>          arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/11b819cf31dfaca0ed4bc5918ab30ae4f3ec56ae/

src/import/export-raw.c: In function 'reflink_snapshot':
src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
         new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);

Patches available from Yann, needs review.

>         bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/2cd8a7366ef1c3cef898afb3e150e84a67e5f0fc/
>         bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f0fc2c5cda3ac35e289d120dfc864a85cf93cd7b/
>         bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/90640255111ccb63f45d2748a277bdea84aa029f/

Don't know what's going on. Fabrice, since you added this package,
could you have a look?

> microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/e66dc62d703e0f74f1339926ba2837aa69c2e412/

ptrace not available on Microblaze?

>          arc |                        unknown | NOK | http://autobuild.buildroot.net/results/f855a040e41f832e1a7d8792a473b65207bee241/

Bogus from Andre's machine.

>      aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/17641484cb1c2648fcc76e1d1733c71d47025ed5/

Python issue. Alistair, since you added the Xen package, could you have
a look?

>         i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/366ac68fff498576cc6bbc2ef396e9cb5137c01d/

Musl issue.

>      aarch64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/26decc6b98fe35733dc6be95f6c6ba3028fddc1d/
>       x86_64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/144e0be1a9aa7d2f00b535c8266052eedb91bddb/

Let's assume this might be fixed by
https://git.buildroot.org/buildroot/commit/?id=3686101a2ae9ec37b4d34a368db03c325f7f92e3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
