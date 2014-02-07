From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 13:53:24 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207073009.C5A85100E3A@stock.ovh.net>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
Message-ID: <20140207135324.4c7cbe3f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

You'll find below a quick analysis of the build failures. If you are in
Cc, it means that there is a question for you below, or a request to
help debugging a specific problem. Thanks!

On Fri,  7 Feb 2014 08:30:09 +0100 (CET), Thomas Petazzoni wrote:

> Detail of failures
> ===================
> 
>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b25590e19d0e638dcbb2855a84e82ea7b2703460/

There is a patch pending that fixes this issue:
http://patchwork.ozlabs.org/patch/293833/. Maybe we should merge it?

>     mipsel |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/05d3186bcb74c905bbc689859522b88db78c2f68/

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.7.3/../../../../mipsel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3416
/home/test/test/3/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data.rel+0x4): undefined reference to `_snd_module_rawmidi_virt'

Looks like a MIPS toolchain problem, maybe? The toolchain used is a
Buildroot toolchain built with Buildroot 2013.11. If the problem no
longer occurs with the internal toolchain backend, then it will be
fixed once I rebuild the external Buildroot toolchains of the Buildroot
(when -rc1 is released). Vicente, can you test if this works with the
internal toolchain?

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1f79be918cebc29c306db6444908b20c6ada5683/
>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/91310c4da3541b9b8b447f0876d1deff2fadc19c/

Unknown problem while building cairo tests:

cairo-test-runner.c: In function 'is_running_under_debugger':
cairo-test-runner.c:168: error: implicit declaration of function 'getppid'
cairo-test-runner.c:168: warning: nested extern declaration of 'getppid'
cairo-test-runner.c:169: error: implicit declaration of function 'readlink'
cairo-test-runner.c:169: warning: nested extern declaration of 'readlink'
make[5]: *** [cairo_test_suite-cairo-test-runner.o] Error 1

Maybe disabling the cairo tests is sufficient.

>        arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf/

Internal compiler error. Ryan has sent a patch to disable the dmraid
build on ARC for now, but it would be good if the ARC team could have a
look at this. Cc'ing Anton.

>       bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/284f2a161d110d4c561cf89c052ce531b4edc173/

Not sure what's going on:

checking for blkid_get_cache in -lblkid... no
configure: error: external blkid library not found
make: *** [/home/test/test/1/output/build/e2fsprogs-1.42.9/.stamp_configured] Error 1

>      avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/7bb5b317dd35d8b3dd2fc9a777a5d65bd143348c/

../libdwfl/libdwfl_pic.a(find-debuginfo.os): In function `find_debuginfo_in_path':
find-debuginfo.c:(.text+0x3e6): undefined reference to `canonicalize_file_name'
../libdwfl/libdwfl_pic.a(dwfl_build_id_find_elf.os): In function `__libdwfl_open_by_build_id':
dwfl_build_id_find_elf.c:(.text+0x1a8): undefined reference to `canonicalize_file_name'
collect2: ld returned 1 exit status

Might be due to a too old uClibc on AVR32 ?

> microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/1996d259baffdfed52a56b93c67904df97fe5c53/

Download error. Spenser, can you have a look?

> microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5915af9e00fc29e48764778916ea6f806d6dceb8/

Not sure what's going on:

/home/test/test/3/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc libgpm.so.2 \
	 -L/home/test/test/3/output/build/gpm-1.20.7/src  -o lib/libgpm.so.2.1.0 lib/liblow.lo lib/libhigh.lo lib/libxtra.lo lib/report-lib.lo tools.lo  -lc 	
microblaze-buildroot-linux-gnu-gcc: error: libgpm.so.2: No such file or directory

> microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/42da870722f24e4202d8265597771a0449e74cfd/

Internal compiler error. Ryan has sent a patch to disable the gpsd
build on Microblaze for now, but it would be good to report the problem
to Xilinx, or bump the toolchain component versions as needed.

>       bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/3eaa07dc462b5ffa34ccf527dc921d3ad5a2c4f8/

uClibc lacks _madvise ?

  CCLD   eet
/home/test/test/3/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libeina.so: undefined reference to `_madvise'
collect2: ld returned 1 exit status

>        arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ca25323567324fb9082e3c0f318ea8b961fad3d8/

Don't know:

  CC     evas_cache2.lo
evas_cache2.c: In function '_evas_cache_image_entry_delete':
evas_cache2.c:176:17: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c:181:18: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c: In function '_evas_cache2_image_preloaded_cb':
evas_cache2.c:296:13: error: 'Image_Entry_Flags' has no member named 'preload_done'
evas_cache2.c:303:23: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c:308:17: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c: In function '_evas_cache2_image_entry_preload_add':
evas_cache2.c:317:17: error: 'Image_Entry_Flags' has no member named 'preload_done'
make[5]: *** [evas_cache2.lo] Error 1

>        arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/59cefaba9d382f0de17b5dccb2d88fc74d36f520/

task.c: In function 'read_groups':
task.c:110:5: error: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'ssize_t' [-Werror=format=]
     evt, new_sz, ret);
     ^
cc1: all warnings being treated as errors
make[2]: *** [task.o] Error 1

 -> We should build this package without treating warning as error.

>      nios2 |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/9aca518bf53aea62bc4bb437976f0223113c26ce/

Would be good to see if the bump of ltp-testsuite proposed by Vicente
fixes this problem. Peter, can you apply
http://patchwork.ozlabs.org/patch/317112/ ?

>      nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/f592a011321429426be81bd1ecf664ad9a2c0161/

Duplicate declaration of setns() :

attach.c:54:12: error: static declaration of 'setns' follows non-static declaration
In file included from /home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/sched.h:42:0,
                 from namespace.h:27,
                 from attach.c:43:
/home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/bits/sched.h:92:12: note: previous declaration of 'setns' was here
make[4]: *** [liblxc_so-attach.o] Error 1

Ezequiel ?

>    powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/6d97daa1754aa4380b2fae23698da24a9790b61e/
>        arm | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/828c7a686736710c4fcb152230d0fa6b5f4d6ad3/

Already fixed by Ryan.

>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/a46b4c97fe126b23a96051a8bf1243a7f4935434/
>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/ac2d0808752ef5e31dc7121b9f00e1968e8a3621/
>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/232dfa5c786b0423dde4fdb3166fdd8e746bb34b/
>       i686 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/799f24846ba800500243bb69e85a1d6b10960ef3/
>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/77f1b0d537d6d2aa1eea066d15f46fc492ff160d/

Linking problem against libvorbis. To be investigated. Gustavo ?

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a2da603abd4ce895c2515e687882c63774c20749/

ARM/floating point problem:

{standard input}: Assembler messages:
{standard input}:3921: Error: selected processor does not support ARM mode `vmov d0,r7,r8'
{standard input}:3923: Error: selected processor does not support ARM mode `vld1.32 {d2[],d3[]},[r2,:32]'
{standard input}:3924: Error: selected processor does not support ARM mode `vmov d1,r0,r1'
{standard input}:3925: Error: selected processor does not support ARM mode `vmul.f32 q0,q0,q1'
{standard input}:3926: Error: selected processor does not support ARM mode `vst1.32 {q0},[r3,:128]!'

>        arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f9863fc6b285c76cb3c9926f96b970b98d3203fa/

Static link problem with libstdc++, will be fixed once I rebuild the
Buildroot external toolchains when 2014.02-rc1 is released.

>     mipsel |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/a57b67bc905a3381cf6f1f86d7af588aecacac60/
>     x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/8108d1b8c524c415a4101f527aa34d8db9df5aa8/
>      avr32 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/514f7fe52b17e28966e95adb1e0b13de12f2488b/

Fixed by the patch from Samuel Martin.

>        arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/3605675ef8dd03362670ba33ef003b15326bd440/

Link problem:

  CCLD     pango-view
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXdamage.so.1, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXfixes.so.3, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXext.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: warning: libX11.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so: undefined reference to `XWidthOfScreen'
/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so: undefined reference to `_XReply'

>       mips |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/7552c9c4106dc5dda8a54178d2ce0dccb40267e0/
>     x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b241b930f109f68bec3e250e583a934e6d32b565/
>    aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/dfeda680f6f2b44487cd0f79a47b79a6eff9108e/
>    powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/7b2924aecdfd6220caf523765693fd8fe3bd3853/

Download problems, fixed by removing the invalid tarball on the autobuilders.

>       sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/463f2d7d4becda8338a806597094204dde8adf36/

To be ignored.

>    powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/399e62acf2c452653cb2ee9ca150a0cfe7e33326/

Missing setns() on CodeSourcery toolchain. Since util-linux is really
needed for many packages, it would be good to find a fix that doesn't
involve disabling util-linux completely.

checking for syscall setns... no
configure: WARNING: Unable to detect syscall setns.
configure: error: nsenter selected but setns syscall not found
make: *** [/home/test/test/3/output/build/util-linux-2.23.2/.stamp_configured] Error 1

Gustavo, an idea?

>    powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a9fbda1006db0ebd8961ee582151aaae7d7e8fe6/
>        arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b5972ecad4e5004dc23a2366066ce45346994f58/
>    powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/d41d2f36a4384289e300a3cf91d51960df9fab00/

The first two ones are related to live555 missing:

checking for LIVE555... no
configure: WARNING: Package live555 was not found in the pkg-config search path.
Perhaps you should add the directory containing `live555.pc'
to the PKG_CONFIG_PATH environment variable
No package 'live555' found.
checking for live555 version 1324598400 or later... no
configure: WARNING: live555 is missing or its installed version is too old:

The last one is a little more weird:

  CC       libvmem_plugin_la-vmem.lo
In file included from sdl.c:31:0:
../../config.h:733:0: warning: "_REENTRANT" redefined
<command-line>:0:0: note: this is the location of the previous definition
sdl.c:45:4: error: #error Xlib required due to XInitThreads
In file included from sdl.c:47:0:
../../include/vlc_xlib.h:26:23: fatal error: X11/Xlib.h: No such file or directory
compilation terminated.

Simon, maybe?

>        arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/47a6a7f419dc76a0a3864304e7335b59a0c89b4a/

Some Javascript JIT stuff should be disabled on ARMv4.

>    powerpc |                   weston-1.4.0 | NOK | http://autobuild.buildroot.net/results/aa54b1aaf0ac89531d7a1e7dd3900b35605ae3f5/

  CC       weston-data-device.o
launcher-util.c: In function 'setup_tty':
launcher-util.c:334:38: error: 'K_OFF' undeclared (first use in this function)
launcher-util.c:334:38: note: each undeclared identifier is reported only once for each function it appears in
make[4]: *** [libsession_helper_la-launcher-util.lo] Error 1

Yann ?

>    powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/fd296ba75a767556fd1a39c5552a6e00cb59d867/

Weird C++ error:

src/zmqpp/message.cpp:437:38:   instantiated from here
src/zmqpp/frame.hpp:52:2: error: 'zmqpp::frame::frame(const zmqpp::frame&)' is private
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-gnu/4.5.2/../../../../powerpc-linux-gnu/include/c++/4.5.2/bits/stl_construct.h:80:7: error: within this context
src/zmqpp/frame.hpp:52:2: error: deleted function 'zmqpp::frame::frame(const zmqpp::frame&)'
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-gnu/4.5.2/../../../../powerpc-linux-gnu/include/c++/4.5.2/bits/stl_construct.h:80:7: error: used here
make[1]: *** [build/obj/zmqpp/message.o] Error 1

Simon, Alexander ?

Thanks for your help!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
