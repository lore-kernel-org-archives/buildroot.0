From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 10:10:15 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140211073008.EC16B101035@stock.ovh.net>
References: <20140211073008.EC16B101035@stock.ovh.net>
Message-ID: <20140211101015.1b282bd3@skate>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hello,

On Tue, 11 Feb 2014 08:30:08 +0100 (CET), Thomas Petazzoni wrote:
> Build statistics for 2014-02-10
> ===============================
> 
>         success : 72 
>        failures : 22 

Wow, only 22 failures yesterday, and amongst them we have 7 failures
that are not Buildroot's fault. So it's really 15 failures. Let's look
at them.

>       mips | [8G(0[0m[30m[47m(0[0... | NOK | http://autobuild.buildroot.net/results/f3fd767dccd8c993ec68d75c7be8a16ada5d2f08/

Ignore. Probably caused by me killing the autobuilder jobs to get them
restarted after the BUILDROOT_DL_DIR -> BR2_DL_DIR issue.

>     xtensa |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/8717968dfeeedf429cd188fa53d6c90bce621490/

C++ static linking problem, but not caused by a broken external
toolchain, since I only use the internal toolchain backend for xtensa.

>     xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/246b3778a1a646afd1c8b9c17b4579fb5a27120e/

lib/spawn_faction_adddup2.c: In function 'posix_spawn_file_actions_adddup2':
lib/spawn_faction_adddup2.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
lib/spawn_faction_adddup2.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'

uClibc problem?

>      avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/7bf7f9c786a3199e29d0dc38c4878cb6bf9c26dc/

../libdwfl/libdwfl_pic.a(find-debuginfo.os): In function `find_debuginfo_in_path':
find-debuginfo.c:(.text+0x3e6): undefined reference to `canonicalize_file_name'
../libdwfl/libdwfl_pic.a(dwfl_build_id_find_elf.os): In function `__libdwfl_open_by_build_id':
dwfl_build_id_find_elf.c:(.text+0x1a8): undefined reference to `canonicalize_file_name'

>     xtensa |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/ce20e355db99303365bc6b4cfab92c3c4329b2fd/

Static linking problem with pthread?

./.libs/libgd.a(gdft.o):(.literal+0x6c): undefined reference to `pthread_mutex_lock'
./.libs/libgd.a(gdft.o):(.literal+0x74): undefined reference to `pthread_mutex_unlock'
./.libs/libgd.a(gdft.o):(.literal+0x78): undefined reference to `pthread_mutex_destroy'
./.libs/libgd.a(gdft.o):(.literal+0x88): undefined reference to `pthread_mutex_init'

>     x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/acfb07943b417461b1d1efd96f796293d7c95300/

Not sure.
*** Warning: Linking the shared library libgstffmpeg.la against the
*** static library ../../gst-libs/ext/libav/libavutil/libavutil.a is not portable!
/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: ../../gst-libs/ext/libav/libavcodec/libavcodec.a(lpc_mmx.o): relocation R_X86_64_PC32 against symbol `ff_pd_1' can not be used when making a shared object; recompile with -fPIC
/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
make[4]: *** [libgstffmpeg.la] Error 1

>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7f7ce4711cfb3659a1b5deecf6705a90713b864e/

*** ERROR - configure could not detect your platform
*** see the readme.html
*** or, try copying icu/source/config/mh-linux to mh-unknown
***   and editing it.

Some Blackfin person should look into this.

>        arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/d15f4a5e92ef3e0e868cbcfcef6b8e4440eae306/

Evas/OpenGL/GLX issue:

evas_x_main.c: In function 'eng_window_new':
evas_x_main.c:306:14: warning: implicit declaration of function 'glXMakeContextCurrent' [-Wimplicit-function-declaration]
evas_x_main.c: In function 'eng_window_free':
evas_x_main.c:477:4: warning: implicit declaration of function 'glXDestroyWindow' [-Wimplicit-function-declaration]
evas_x_main.c: In function 'eng_best_visual_get':
evas_x_main.c:698:34: error: 'GLX_DRAWABLE_TYPE' undeclared (first use in this function)
evas_x_main.c:698:34: note: each undeclared identifier is reported only once for each function it appears in
evas_x_main.c:699:34: error: 'GLX_WINDOW_BIT' undeclared (first use in this function)
evas_x_main.c:710:39: error: 'GLX_RENDER_TYPE' undeclared (first use in this function)
evas_x_main.c:711:39: error: 'GLX_RGBA_BIT' undeclared (first use in this function)
evas_x_main.c:728:34: error: 'GLX_TRANSPARENT_TYPE' undeclared (first use in this function)
evas_x_main.c:729:34: error: 'GLX_NONE' undeclared (first use in this function)
evas_x_main.c:732:14: warning: implicit declaration of function 'glXChooseFBConfig' [-Wimplicit-function-declaration]
evas_x_main.c:732:22: warning: assignment makes pointer from integer without a cast [enabled by default]
evas_x_main.c:745:19: warning: implicit declaration of function 'glXGetVisualFromFBConfig' [-Wimplicit-function-declaration]
evas_x_main.c:745:27: warning: assignment makes pointer from integer without a cast [enabled by default]

>       mips | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/0a5362e6687c2c62ecd36b118bde0b512a2b39c1/
>       mips | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/768f6bd5f5adb0d8d1da9387d6551b58384cd36e/
>    powerpc | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/d990d5d0c941c13a54df60267d841e301cba6dd0/
>    powerpc | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/980eb9a3d98fa8c64fadf890f01f0dfb332a1fc8/
>     x86_64 | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/cfd41ff7265d088026b1cbc85733fb992c0e593e/
>     x86_64 | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/e3bcc49fa603d985465d01877eaf7744f14213dd/

Not sure how this is possible, I believe those are just left-overs from
the BUILDROOT_DL_DIR -> BR2_DL_DIR migration, and the build jobs I killed.

>        arm |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/5510343f964a637f722e4275a4e55034c332b1c3/

The tool to generate .po files was not here?

rm -f da.gmo && : -c --statistics --verbose -o da.gmo da.po
rm -f es.gmo && : -c --statistics --verbose -o es.gmo es.po
rm -f fr.gmo && : -c --statistics --verbose -o fr.gmo fr.po
rm -f de.gmo && : -c --statistics --verbose -o de.gmo de.po
mv: mv: mv: mv: cannot stat `t-fr.gmo'cannot stat `t-da.gmo'cannot stat `t-de.gmo'cannot stat `t-es.gmo': No such file or directory
: No such file or directory
: No such file or directory: No such file or directory

>    powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/75bbfa4a5a1139957cde03c39179f1389813784b/

Kernel headers problem:

In file included from mmc_cmds.c:30:0:
mmc.h:18:29: fatal error: linux/mmc/ioctl.h: No such file or directory
compilation terminated.

>        arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e4066efae55f84e9270ae7139760de2ab32ca967/

C++/static problem, external Buildroot toolchain. Will be fixed once I
rebuild the toolchain (Peter, please release -rc1 !).

>        arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/

libusb compatibility issue?

scan_usb.c:34:29: error: unknown type name 'usb_dev_handle'
scan_usb.c:38:41: error: unknown type name 'usb_dev_handle'
scan_usb.c:41:1: error: unknown type name 'usb_dev_handle'
scan_usb.c:41:48: warning: 'struct usb_device' declared inside parameter list [enabled by default]
scan_usb.c:41:48: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
scan_usb.c: In function 'nutscan_load_usb_library':
scan_usb.c:67:22: error: 'nut_usb_close' undeclared (first use in this function)

>       bfin |                  rpcbind-0.2.0 | NOK | http://autobuild.buildroot.net/results/d7c788749b54275154cc3934a7a32385cd72be61/

rpcbind needs MMU, I've sent a patch to disallow rpcbind on !MMU
platforms.

>    powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/cb22f21cae34e40eea4704029706fe6688550384/

I will try to send a patch for this one.

>     x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/95b0f70e36a0063601d5c8d719f749902bac7ef3/

In file included from /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.7.3/include/stdint.h:3:0,
                 from /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/netinet/in.h:24,
                 from /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/arpa/inet.h:23,
                 from src/thrift/transport/TSSLSocket.cpp:25:
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:58:27: error: candidates are: typedef long unsigned int uint64_t
In file included from /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/numeric/conversion/numeric_cast_traits.hpp:27:0,
                 from /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/numeric/conversion/cast.hpp:34,
                 from /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/lexical_cast.hpp:159,
                 from src/thrift/transport/TSSLSocket.cpp:31:
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/cstdint.hpp:314:42: error:                 typedef boost::ulong_long_type boost::uint64_t
src/thrift/transport/TSSLSocket.cpp:351:1: error: 'uint64_t' does not name a type

>     x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b0d3c997d6ae8bbdb606c0a24bac9287dd17ce69/

Not sure what happened here. Maybe a spurious failure caused by me
killing build jobs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
