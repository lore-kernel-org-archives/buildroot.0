From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Nov 2016 07:43:35 +0100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure
 fix	for powerpc64
References: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
Message-ID: <n500gdx8kc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 17 Nov 2016 15:15:23 +1100 schrieb Sam Bobroff:

> Because affected configure files can be discovered automatically, this
> patch introduces a hook (enabled only when building for powerpc64 and
> powerpc64le) that uses a script to scan and fix each package.

Hi,

good work! The minidlna package is fixed by your patch, but the 
libsidplay2 package needs some fixing:

>>> libsidplay2 2.1.1 Checking configure (powerpc64/powerpc64le)
support/scripts/fix-configure-powerpc64.sh /home/bernd/buildroot/br2/
output/build/libsidplay2-2.1.1
patching file /home/bernd/buildroot/br2/output/build/libsidplay2-2.1.1/./
libsidplay/configure
Hunk #1 succeeded at 4176 with fuzz 1 (offset 2874 lines).
patching file /home/bernd/buildroot/br2/output/build/libsidplay2-2.1.1/./
resid/configure
Hunk #1 succeeded at 4978 with fuzz 1 (offset 3676 lines).
patching file /home/bernd/buildroot/br2/output/build/libsidplay2-2.1.1/./
builders/resid-builder/configure
Hunk #1 succeeded at 4187 with fuzz 1 (offset 2885 lines).
patching file /home/bernd/buildroot/br2/output/build/libsidplay2-2.1.1/./
builders/hardsid-builder/configure
Hunk #1 succeeded at 4181 with fuzz 1 (offset 2879 lines).
patching file /home/bernd/buildroot/br2/output/build/libsidplay2-2.1.1/./
libsidutils/configure
Hunk #1 succeeded at 4180 with fuzz 1 (offset 2878 lines).

[...]

checking whether the /home/bernd/buildroot/br2/output/host/usr/bin/
powerpc64le-linux-gcc linker (/home/bernd/buildroot/br2/output/host/opt/
ext-toolchain/powerpc64le-buildroot-linux-gnu/bin/ld -m elf64ppc) 
supports shared libraries... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes

which leads to

/home/bernd/buildroot/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/
powerpc64le-buildroot-linux-gnu/5.4.0/../../../../powerpc64le-buildroot-
linux-gnu/bin/ld: /home/bernd/buildroot/br2/output/build/
libsidplay2-2.1.1/libsidplay/src/.libs/libsidplay2.a(player.o): In 
function `.LTHUNK4':
player.cpp:(.text._ZN12__sidplay2__6Player12interruptIRQEb
[_ZN12__sidplay2__6Player12interruptIRQEb]+0x58): call to 
`__sidplay2__::Player::fakeIRQ()' lacks nop, can't restore toc; recompile 
with -fPIC
/home/bernd/buildroot/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/
powerpc64le-buildroot-linux-gnu/5.4.0/../../../../powerpc64le-buildroot-
linux-gnu/bin/ld: final link failed: Bad value

because configure is re-created during the build phase. The quote from 
configure comes from the second run of it.

I used this defconfig: http://autobuild.buildroot.net/
results/5d6/5d60bccbe024db240630845e15a3f15e8ddf0f01/defconfig

Regards, Bernd
