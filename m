From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:39:39 +0200
Subject: [Buildroot] Analysis of build failures, help requested!
In-Reply-To: <20140417063009.B2279100D24@stock.ovh.net>
References: <20140417063009.B2279100D24@stock.ovh.net>
Message-ID: <20140417213939.35afc5ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

There are issues below for Samuel, Gustavo, Max, Baruch and Luca to
look at.

On Thu, 17 Apr 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 53 
>        failures : 44 

Not a good number :-(

I'd like to have some help to bring this number down. Your help is more
than welcome!

To get things started, here is the usual analysis below.


>     x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/656192072f08e6e45a24a87b568be5a5f7e3210b/

aserver.c:(.text.startup+0x365): warning: gethostbyname is obsolescent, use getnameinfo() instead.
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libc.a(vfork.os): In function `__GI_vfork':
(.text+0x0): multiple definition of `__vfork'
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libpthread.a(pt-vfork.os):(.text+0x0): first defined here
collect2: error: ld returned 1 exit status

This looks like a static linking issue in uClibc. Could someone
investigate this? Gustavo, maybe? :-)

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/db87c4861cff78ffd8019f224748c908eec9a826/

/home/test/test/3/output/build/cppcms-1.0.4/booster/booster/locale/conversion.h:99:22: error: 'wstring' in namespace 'std' does not name a type

Smells like wchar support is now needed by cppcms.

>       bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/c360300cc3212eadcf29f864bb3b92270978355c/

charconv.o: In function `_iconv_init_codepage':
src/charconv.c:(.text+0x26): undefined reference to `_libiconv_open'

>       bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/2d88c936f76d979d0efc7956b4c5d960667ac3a5/

Linking with libpng statically needs -lm:

/home/test/test/2/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libpng.a(png.o): In function `_png_reciprocal2':
png.c:(.text+0xb88): undefined reference to `_floor'

>     x86_64 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/493daca4d73298df683c73c833f16782d92f3d8d/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/f6b80ae32acf7f89bb1c12999679ff1be9733d44/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/eb60fb989c252c2f7ddac9cd4d778e001e77228e/
>     x86_64 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/8d46ca8ed5d1a00622393477e2a5aaaa4af742f4/

Despite Samuel's patch, there is still a problem.

>    powerpc |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/a0937887e3a395ac6b8d32ac71d3e7c62244d40b/
>       i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/da377d7c8e5210bf221c09178dfe8fe3ca59c813/
>        arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/4a3e6093f1c0a54c653d8e3ed3bc8781739e2cf0/
>      avr32 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/dfeff1eb7464afce359adcf38a7a611062562bb4/
>       mips |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/5a7832ed8e62b1c0859e2a2a3d3ae77c0e2fa917/
> microblazeel |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/17e075d388dcb69458fd7595f1cd95d518ceb41d/
>       i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/ab4ace43dccadf51119f20396c10e3362259fb2a/

The annoying jquery-ui problem. Despite Gustavo's patch, there are
still some invalid tarballs in the autobuilders. I need to clean them
up, at least for the ones I control.

>        arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0b81ee67ea52ce6078abec1f2339aaf5f6e983d7/

Static linking issue.

> microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/dd583e1c11bba814cd0f124eeeffeca5657a0aa9/

Fixed by http://git.buildroot.net/buildroot/commit/?id=2b4b0ce9f2a51e8c1d3d467b7360668baa9a4ae8

>        arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a88e2af7cd1ece12213da52c8dd687f8d6813299/

Python problem, to be investigated by Samuel.

>        arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/09fbf27931715b1d19765401aa0834188602349f/

The toolchain is
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-bleeding-edge-2014.02-rc1.tar.bz2,
which was built before the fix for PR 58595 was merged.

How to handle this case ?

>        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a7bd26d799ab7293afce03a1df56f107338b65b0/

I need to add a new exclusion in the autobuilder script to avoid this.

>      avr32 |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/88d1f04450f0866ec3a357950f26b2cd77015790/

Hopefully fixed by 690d8ff5bcf317b3b8b2457da759659017fad442.

>       bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/0f3654e8d5b0bb83caa99d1c607c1c968ca9439f/

src/process/sysdep_LINUX.c: In function 'initprocesstree_sysdep':
src/process/sysdep_LINUX.c:207: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
src/process/sysdep_LINUX.c:207: error: (Each undeclared identifier is reported only once
src/process/sysdep_LINUX.c:207: error: for each function it appears in.)

Glob support missing in Blackfin toolchain. I've asked the Blackfin
people to change the configuration of their toolchain, but it will not
be before their next release. What should we do in the mean time?
Explicitly disable this package for this particular toolchain?

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/7b3c89fcd496c0bc80063f63ecd58c827e8077ea/

The usual floating point problem. Will someone one day have a serious
look at it ?

>       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/3892840e3a38847c295d615acb65cb1dfd65d079/
>        arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/45aa2aedf223a7fb987f49da4ea7a22531e057b9/
>       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/fedbdc7eba51d789fe5a2da13eb6a37bce71cd33/
>    powerpc |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/9424e93e6fe61fa5a124b00b283d7f628da7e8da/
>       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/d52aa6d02887f922e66c670de7589814211b6bed/
>       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/5db18c162c53c93460c4d58599804dad069fc2ec/
>       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/d54d3255d765e0bbb5a472829ff08cbb5e35169a/
>       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/e5e582942755c1038ed1faedc398422f7c244e25/

Hopefully fixed by f98721c2abb88fbdd128e14a0142a877b9bee3ad.

>    powerpc |                      nmap-6.40 | NOK | http://autobuild.buildroot.net/results/40269fd96a3b62fa187e9b26e5ab4ce4e7711f95/

cd ndiff && /home/test/test/1/output/host/usr/bin/python setup.py build 
  File "setup.py", line 27
    except distutils.errors.DistutilsPlatformError, e:
                                                  ^
SyntaxError: invalid syntax

This smells like a host Python 3 issue.

>      avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/1b32d9dfa41c6435ff8a7c27bfe8ab4a6576faa4/
>      avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/0a070674d3f8bdb547cbea6c86068f2d0a2ed235/

I'm looking into these, I have a fix almost ready.

>     xtensa |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/a54f3707781dc193292eda7d1723fce6487d6980/

linking ../../lib/libQtCore.so.4.8.5
.obj/debug-shared-emb-generic/qmetaobject.o:(.debug_line+0x37a4): dangerous relocation: overflow after relaxation
.obj/debug-shared-emb-generic/qobject.o:(.debug_line+0x55b5): dangerous relocation: overflow after relaxation
.obj/debug-shared-emb-generic/qlatincodec.o:(.debug_line+0xcd7): dangerous relocation: overflow after relaxation
.obj/debug-shared-emb-generic/qmetaobject.o:(.debug_frame+0xa89): dangerous relocation: overflow after relaxation
.obj/debug-shared-emb-generic/qobject.o:(.debug_frame+0xae9): dangerous relocation: overflow after relaxation
.obj/debug-shared-emb-generic/qlatincodec.o:(.debug_frame+0x1a1): dangerous relocation: overflow after relaxation
collect2: error: ld returned 1 exit status

This needs to be looked at by our Xtensa experts.

>     x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/e3b26ee314880fdb50bb774a0539bfba04d9fbcf/

posix_fallocate() problem:

../../../3rdparty/sqlite/sqlite3.c:23535:42: error: 'posix_fallocate' undeclared here (not in a function)
../../../3rdparty/sqlite/sqlite3.c:93246:1: warning: missing initializer [-Wmissing-field-initializers]
../../../3rdparty/sqlite/sqlite3.c:93246:1: warning: (near initialization for 'sqlite3Apis.aggregate_count') [-Wmissing-field-initializers]

>    powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/d7cd279e8e0145c2cd0d8611512af83be6379e72/

checking snmp v3 status... required
configure: error: in `/home/test/test/3/output/build/snmppp-3.3.4':
configure: error: cryptographic library required for SNMPv3, but neither OpenSSL nor TomCrypt nor DES is available.
See `config.log' for more details

Luca, maybe ?

>       bfin |                  wayland-1.4.0 | NOK | http://autobuild.buildroot.net/results/3cdb49166c07fe04c8c76a82e5b3072746937d21/

Needs dynamic library.

wayland-server.c:36:19: error: dlfcn.h: No such file or directory
  CC       connection.lo

>       sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b46334b877119e66a8ccfe23179ec222cdc2274a/

Ah, yes, I started having a look at this one some time ago. I think I
had some ideas, but I don't remember :/

./DerivedSources/JavaScriptCore/LLIntAssembly.h: In static member function 'static JSC::JSValue JSC::LLInt::CLoop::execute(JSC::CallFrame*, JSC::OpcodeID, bool)':
./DerivedSources/JavaScriptCore/LLIntAssembly.h:2548:33: error: 'Double2Ints' was not declared in this scope
make[2]: *** [Source/JavaScriptCore/llint/libjavascriptcoregtk_1_0_la-LowLevelInterpreter.lo] Error 1

>        arm |            xapp_xdriinfo-1.0.4 | NOK | http://autobuild.buildroot.net/results/f7af081048ad967ed4a76afd8c527395f7b0c2dc/
>        arm |            xapp_xdriinfo-1.0.4 | NOK | http://autobuild.buildroot.net/results/90a8226a8a2978eb13d02645cb9e3d95d9b95757/

checking for library containing glXGetProcAddressARB... no
configure: error: in `/scratch/peko/build/xapp_xdriinfo-1.0.4':
configure: error: cannot find GL library - make sure Mesa or other OpenGL package is installed

Probably fixed by Bernd's patch?

>     xtensa |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/8a8a0f8cca293ce1f383421ba8b1223b4266e3bc/

Similar Xtensa problem?

xercesc/validators/schema/.libs/SchemaGrammar.o:(.debug_line+0x1c82): dangerous relocation: overflow after relaxation
xercesc/validators/schema/.libs/SchemaGrammar.o:(.debug_frame+0x531): dangerous relocation: overflow after relaxation

>        arm |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/80a53ca3a299327e6646e7aea24a008c2214e190/

/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: attempted static link of dynamic object `/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.3/../../../../arm-unknown-linux-uclibcgnueabi/lib/libstdc++.so'

>       bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/e6dcf7b21fc7f066a62e9ec85d8e6b89e9687f5b/

Need a way to disable tests.

test_fork.cpp: In function 'int main()':
test_fork.cpp:38: error: 'fork' was not declared in this scope
make[2]: *** [test_fork.o] Error 1

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
