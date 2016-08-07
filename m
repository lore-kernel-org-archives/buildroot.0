From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 11:26:54 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160806063028.356101023A1@stock.ovh.net>
References: <20160806063028.356101023A1@stock.ovh.net>
Message-ID: <20160807112654.7b520594@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the usual analysis of build failures. Waldemar, Alexey, Vlad,
Gustavo, Frank, Gwenhael, Angelo, Fran?ois, Romain, Bernd, can you have
a look below? Thanks!

On Sat,  6 Aug 2016 08:30:28 +0200 (CEST), Thomas Petazzoni wrote:

>         bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/20d72bb9e0aeb6adbce4239f848d355c7f8339e9/

This is the usual Blackfin internal toolchain C++ issue. I have built
a new Blackfin toolchain with -rc1 + the latest patches from Waldemar,
but we know there is still a remaining problem (or at least one).

Waldemar: what about simply disabling C++ support in the Blackfin
internal toolchain support for 2016.08 ?

>          arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/05f46ab28cbfc587e2e031bf38fb975447f8bab6/

Would be fixed by: https://patchwork.ozlabs.org/patch/656416/

>         bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/9ff665b54ce3bed2608ca4ef032cb912cda8c23f/
>         bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1969f4c186a16e6623ff994af3ceb981611e1d57/
>         bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1ae7f70b513c76f4fdb27c00f183692dc57aeb62/

Will be fixed by the newer Blackfin toolchain (which has some not yet
committed patches from Waldemar).

>         bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/2b6a2521be7fac66e6d37b024f358daaaf20fbf9/

Still the Blackfin C++ problem.

>          arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/fc6f7fe7ce19b0aec5142787126786cafab808e9/

Usual musl header inclusion issue.

>          arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c27be3e5a573860b332db2c8feafea8d0b8fe9c1/

Romain proposes https://patchwork.ozlabs.org/patch/656412/ to address
this problem.

>         bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/3a04670c1738a7a7180d8ce8944aadde7351169d/

eelf32bfin.c: In function 'gldelf32bfin_place_orphan':
eelf32bfin.c:1790:1: error: unable to find a register to spill in class
'CCREGS' }

Waldemar, another "fun" Blackfin bug.

>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5a673c692aeb957cd8beb2c2c10ce5fd882ba4b5/

The usual:

btreplay: hidden symbol `_rest32gpr_30_x'

Since this issue has been occurring since March without nobody caring,
I've sent a patch to disable this package on PowerPC:

https://patchwork.ozlabs.org/patch/656419/

>          arc |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/4059a5afe3e471d4b25db493d4c5eec646a8b0e1/

cannot find crtbeginT.o: No such file or directory

Alexey, Vlad ?

>         m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/31a488316fe3c14729a6dd9259205f8530684cab/
>         m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/dc6b899e3e502d65b2cf2f6d922a4f63857edf82/

relocation truncated to fit: R_68K_GOT16O

I guess the mxgot hack could be used here as well? Waldemar?

>       x86_64 |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/df89921a95b45822f33afb4342db63ec4c5890c3/

Gustavo, you are the one looking after cifs-utils, can you have a look?

>          arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/f7e92678e91a6cb15ccf32d4a7d75b39f49d6000/

fatal error: stdlib.h: No such file or directory

Samuel, could you have a look ?

>         i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/7bd4abf3b1a89c6ec2f43a07cc64fafe4960dee2/
>         i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a7d105a1db9fd5bf2705d8398e9c0e53ea2c8bc5/

I've looked into this issue, it's a issue with i386 + SSP and musl, it
needs some gcc patching to work properly.

>      powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/af715a4533ab61502b2c71a222f7f56b92283453/

error: unrecognized command line option '-mfloatprs=double'

Gustavo, could you advise here ?

>       x86_64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4068b547646ceb9a8c6b4b72ca3a7c7955abfefd/

Yann, I believe this is a /proc missing issue on your server.

>       x86_64 |                 dosfstools-4.0 | NOK | http://autobuild.buildroot.net/results/6cc4e51d50c8d39fee2cdc89d9aea8a90a0d4923/

PATH_MAX undefined, musl issue. Should not be too hard to fix.

>          arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/c48b73ff8b787dbc632784aa7d979ffa48528d7c/

Assembler issue, should be fixed by the latest ARC tools bump. I will
deploy the new toolchain version today.

>          arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/802b6d77e1b77b7c8fcb8f3b394cdabfd406de7a/

libconfuse issue. I know Frank was working on this, we discussed it on
IRC, but I can't recall the details. Frank?

>         m68k |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/

Again: relocation truncated to fit: R_68K_GOT16O

Waldemar, we really have lots of packages that need the -mxgot flag.
Should we enable it globally?

>          arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f14f4f62b5f23c652fa9411d9c569c2ab3394fb5/

Gwenhael, can you have a look?

>         m68k | hidapi-b5b2e1779b6cd2edda30... | NOK | http://autobuild.buildroot.net/results/2ecd240ccb15de76017942a8960faac6b3f973b4/

Already fixed by:

  https://git.buildroot.org/buildroot/commit/?id=023bba7797132713c9e656cd45846596a2b16bf5

>          arc | host-gcc-final-arc-2016.09-... | NOK | http://autobuild.buildroot.net/results/3afc00e64274e89de2cf81e1dda8854327b89291/

configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.

Alexey, Vlad ?

>      aarch64 |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/742ec4d95e78ad1a2e613d2ef314ccb6f2c8042f/

Memory allocation failure, ignore this one.

>         i586 | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/989c253478c830fa4da70d0bd3e97f196a770243/

Yann, you started looking after kmsxx, this one is a musl related
issue, could you have a look?

>          arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/a4250a073e8e52f22c3a29bfd45c13a7b6506465/

Musl related build issue. Gustavo, you originally added kvmtool, can
you have a look?

>          arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/ae93bd1b4f6e1ed8f386830d4a51f00d9466f267/

checking for Readline... no
configure: error: cannot find readline library, install readline-devel
package

Static linking issue.

>          arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/852f4b29dad031a61034dd5a7c5f1635d1aece4f/

Assembler error, should be fixed by the newer version of the ARC tools.

>          arm | libcofi-7313fbe12b0593034d0... | NOK | http://autobuild.buildroot.net/results/329c09bf123cd5b6dbcfff6251ba7a2c7cce50b8/

Trying to build a shared library on a static only configuration. I just
sent a patch to disable this package on BR2_STATIC_LIBS:

	https://patchwork.ozlabs.org/patch/656447/

>          arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/14bbb7c9c59e7f68f3ae7ad63e075e27a0da2b1e/

Fixed by
https://git.buildroot.org/buildroot/commit/?id=5879f0192e99982880aeff7da5bb934b202a6262

>      powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/1cd69c5eebc4f4a64ee272660beffc8bb4cdb9ad/
>      powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/96c53ff240dcd68fcc9e3d32c4026c9886edcbe7/
>          sh4 |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/95a6cca21aea9914ba8bb3f571760fc054c53ecd/

All three would be fixed by applying:
https://patchwork.ozlabs.org/patch/656448/

>          arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/3a0b5bf1ad87010d6d109885da8b18154603a77c/

base64.cpp:26:1: error: narrowing conversion of '-1' from 'int' to
'char' inside { } [-Wnarrowing]

Issue with modern gcc? Someone to look into this?

>         sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fbae91fe59b6a345eef41119def8ff74424dea5e/
>         i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fc48b5bcbc04c7db9bcc5e7355020db4d9c745b7/

Forgets to link with librt.

>         i586 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/deb80eea5ceae3e7f8e0549596dce2fb6a1e7596/

Fixed by commit d1dbd48ddc6e01e3a38e97d95af8bd96b5528fb1.

>     mips64el | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/dad5ea0d7ebfd0822d96b9f0cab6667e1ff145b6/
> microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/e181a761c36a9f88040be94e5de3ff7ded4dc0c1/

Ignore.

>          arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/41fa15c7f6e56850b030f87b2fb135bf813b5659/

Angelo, could you have a look?

>         bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/388a351113d278ac1f9082d653f6f08c79f7d27c/

integck.c: In function 'parse_mount_options':
integck.c:2889: error: 'MS_DIRSYNC' undeclared (first use in this function)
integck.c:2889: error: (Each undeclared identifier is reported only once
integck.c:2889: error: for each function it appears in.)
integck.c:2899: error: 'MS_RELATIME' undeclared (first use in this function)
make[2]: *** [integck] Error 1

Need a kernel header version dependency.

> microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/d4e6045308019eb8051e3d749db233a1831b76ca/
> microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/4e7e490a4eb52256aba12a131caf059cf5fa0903/

aggregartp.c:344:40: error: 'POLLRDHUP' undeclared (first use in this function)

This is fixed by the latest update of uClibc-ng, I will deploy the new
toolchains soon.

>         bfin |                      ncdu-1.11 | NOK | http://autobuild.buildroot.net/results/86b66ed92fb714795ba70c228d4d448a1b61cee0/

Fixed by 9f8bab11571813a7e641ae1d1193b25abf4270d8

>          arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/e553019e5bb02aca33785b449dc775dc539218d3/

../ncurses/curses.priv.h:366:42: error: request for member 'ext_color' in something not a structure or union

Maybe https://patchwork.ozlabs.org/patch/654321/ fixes this?

>          arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/ea537cac5a3aa3eb26ef063664847876bc5fcc60/

fatal error: stdlib.h: No such file or directory. Same error as CMake.
Is this a toolchain issue?

>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ea26242301830c4b68f64702731d19b7bcfa97db/
>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/4da692601523eac261f9fc55616d86fa31f00ec3/
>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0f9600a8bc78bcdcd724c448350330e352e29cc8/
>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/eec408a938e6791199d817ca138feb1578508fb1/

Would be fixed by https://patchwork.ozlabs.org/patch/656413/.

>         mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bacbd8723cb436d42eed74067db77e7dd110c478/

Fixed by c20e52825d575a67268d02634205897415214aca.

>         m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/b40e3092d916a0d0068ae4edd8885e38e57e2006/

Fixed by b038f8baf568a5085746e745adde3166199e2997.

>          arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/fe6843ec53fbed452d2e38a8577a235f73abb8db/

Would be fixed by https://patchwork.ozlabs.org/patch/656307/.

>          arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/bbe4371b478755f32b950093b6fa96fd009448e9/

undefined reference to `libintl_dgettext'

Forgets to link with libintl, in a static configuration. Fran?ois, can you have a look?

>         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/754959831528764b5ed908b000c1e6d24a151c2c/

/tmp/ccnMF6vi.s: Assembler messages:
/tmp/ccnMF6vi.s: Fatal error: Tried to convert PC relative branch to absolute jump

Waldemar ?

>          arm |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/9b9acd75def0ed807753d47a623dab947b253144/

Conflicting CPU architectures 13/1

Weird, happens on our Cortex-M4 configuration.

>          arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b385bf435085728aece6323a5006ba9fa6631744/

Would be fixed by https://patchwork.ozlabs.org/patch/656450/.

>          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/733145e94d7c4f3b11e867c60a1e8f8e049a3ce0/

checking for ext2fs_initialize in -lext2fs... no
configure: error: Ext2 direct support required but libraries not found.

>          sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/67fc16366717f34df492683a14ecd23376e23110/
>          sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/a3efa1d65487f094f02ea0f5c78f6b9ee5e60cac/
>          sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/a822fe8aea4a648e7c515a9759184d005886482f/

error: '__NR_sched_setattr' undeclared
error: '__NR_sched_getattr' undeclared

>         i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/83b32ca687b29237654d529325fb0792a62b9b6f/

Musl i586 / SSP issue (mentioned above).

>          arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/924c1766989e91e5f807969d45d0a21efe87c401/

Toolchain issue. Hopefully fixed by the latest update.

>         bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/916e17bab62813081fc4bae84dc486f044436cb3/

Blackfin toolchain issue.

>          arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/1752ca6a393b43750022db3faee85cfc9d360bc4/

x86_64-linux-gnu-g++: error: unrecognized command line option '-matomic'
x86_64-linux-gnu-g++: error: unrecognized command line option '-matomic'

Why is the heck a x86_64-linux-gnu compiler used on an ARC
configuration? There are some configure scripts issues as well:

Looking for C++ compiler... ./configure: line 110: eval: -g: invalid option
eval: usage: eval [arg ...]
./configure: line 110: eval: -c: invalid option
eval: usage: eval [arg ...]


>       x86_64 |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/00de6dcceff00458a4c99847c030ab1e2db0e9bd/

musl build issue.

>          arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d4e68d561c9de68b3bf50a97bb93298fd7bbffe1/

static linking issue.

>         m68k |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/5fcaba84c884c688e0af27dc70e820fbd62299c9/
>     mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/7eebec964d14b55977c15b60c05f889ca88be904/
>          arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/d14b78d793d2ef6c858127e2ba9a8b105c9f8c64/
>        nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/8474ac510a0da04860cbb7d3a5a31d7f5ba5e9bc/
>     mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0fc085ec7759db88149eeb7c15841dbcd6a02069/
>         mips |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/b5566ac8a90d91fc0e5426365f5c350f5e145ed8/

Hopefully all fixed by 1f3946ecc00786fdb4ab2666ff9054d084b7f2a5.

>          arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/f2e3d5c49249fc2ed1ddb4d3c6f831e77729614d/
>          arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/be9ba3b875ade563a4e0d5289e3d41e92d3f54ec/

Musl build issue.

>       x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9ce2bb491aee30863ab623c6b84916132d84b60d/

tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
 #include <bits/local_lim.h>

Yet another musl build issue.

> microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1086a649c0c38ede13cfbe4663b67ec98475feba/

internal compiler error: in merge_overlapping_regs, at regrename.c:295

Romain, we probably want to disable this package on Microblaze, no?

>       mipsel |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/2c51bbc7dadaaaee0ce11d0f9eb521f11b0d949f/

src/compositor-rdp.c: In function 'xf_peer_activate':
src/compositor-rdp.c:875:2: error: stray '\302' in program

>      sparc64 | xdriver_xf86-video-savage-2... | NOK | http://autobuild.buildroot.net/results/ecdb6977d282c276cbdf1f3dd0ccfaddff1d1ac5/

Bernd, could you have a look?

>          arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/a60f2e120c97e4bfe9902febb3bb26600da476aa/
>          arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/0de6c064efb66aed32cc465349dd8dc138be0668/

This is the DRM issue, being discussed currently, there is a proposed
patch from Bernd.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
