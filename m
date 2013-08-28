From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 09:08:12 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
Message-ID: <20130828090812.43a7f849@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We don't have that many build failures today, so let's have a look
together at each of them and see what we can do about them.

>     x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/dafc9f0c237e98b9280e813ed8100ab913e629be/

/home/test/test/3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libc.a(vfork.os):
In function `__GI_vfork': (.text+0x0): multiple definition of `__vfork'
/home/test/test/3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libpthread.a(pt-vfork.os):(.text+0x0):
first defined here collect2: ld returned 1 exit status

Is this some bug in uClibc ?

The toolchain is some old toolchain I've built quite some time ago with
Crosstool-NG. Maybe I should update it.

>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1d587ef565425b574aeb85e6e2bebd2322634868/
>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a771c47b8d818245f8b66f128ea49db208fdfe52/

That's the same problem: some parts of alsa-lib require dlopen()
functionality, but it isn't available for the FLAT-only bfin toolchain,
since it doesn't support shared library.

Should we mark all packages that use dlopen()
as !BR2_PREFER_STATIC_LIB ?

(Note: in the specific case of alsa-lib, maybe not the entire package
needs to be marked this way, but one of its suboptions).

>       i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/b85caa22ddc13bdaaac25b9016fe902ade5027de/

./mksyntax -o syntax.c
make[1]: execvp: ./mksyntax: Permission denied
./mksignames lsignames.h

Strange. Missing executable permissions on this program? Why does it
happen only rarely?

>        arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/7673109f00d51a6072c23104ac82106962903e54/


/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: error: busybox_unstripped uses VFP register arguments, libpwdgrp/lib.a(uidgid_get.o) does not
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: failed to merge target specific data of file libpwdgrp/lib.a(uidgid_get.o)

Not sure what's going on here. We're mixing hardfp with softfp for
sure, but not sure why. The toolchain is also an old toolchain
generated a while ago with Crosstool-NG. I should probably update it
before looking into this.

>    aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/6c179dca4455e4cb651f9b6bce1b2604366431f4/

{standard input}: Assembler messages:
{standard input}:7522: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v14.8b,-1'

Seems like a deeply AArch64 problem, should be reported to the AArch64 people at Linaro.

>   mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fab819eee4002a9c392c48c1ebaca5c5b6555567/

(cd .libs/libdirectfb_dummy.a.tmp && /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ar x ../../.libs/libdirectfb_dummy.a)
/home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld -o libdirectfb_dummy.o -r .libs/libdirectfb_dummy.a.tmp/*.o
/home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: .libs/libdirectfb_dummy.a.tmp/dummy.o: ABI is incompatible with that of the selected emulation
/home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: failed to merge target specific data of file .libs/libdirectfb_dummy.a.tmp/dummy.o
/home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: Attempt to do relocatable link with elf64-tradlittlemips input and elf32-ntradlittlemips output
/home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: final link failed: File in wrong format

Still the same problem of mixing MIPS ABIs, because DirectFB is calling
"ld" directly and not "gcc" to do the link.

I had proposed a solution in
http://lists.busybox.net/pipermail/buildroot/2013-June/073399.html and
http://lists.busybox.net/pipermail/buildroot/2013-June/073400.html, but
Markos Chandras said that the upstream package should rather be fixed
to use gcc instead of ld for linking. So I guess we should fix DirectFB here.

> microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/94661d9cb3e27579a09e4518f55dd8406d1cc502/

../lib/libext2fs.so: undefined reference to `fallocate64'
collect2: ld returned 1 exit status

No largefile support in this toolchain? Something else?

>     x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/d58be37b9b18b37eab4acec9a6bbe28863ef4d22/

scons: *** [gpsd] Implicit dependency `/home/test/test/2/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libm.so' not found, needed by target `gpsd'.

Not sure what's happening here. Surely if -lm was missing, we would be
seeing more build failures of gpsd, no?

>   mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8159d3a5e7ea17ef4c3ee732fb21941a017429db/

/home/test/test/1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/libc.a(vfprintf.o): In function `_i18n_number_rewrite':
printf-parse.h:(.text.unlikely+0x338): relocation truncated to fit: R_MIPS_TLS_GOTTPREL against `_nl_current_LC_CTYPE'

No idea.

> microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/519219ec8e4c4aa06baf3353cd2e37bf4fef9362/

./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_or_4'
./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_sub_4'
./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_xor_4'
./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_add_4'
./.libs/libglib-2.0.so: undefined reference to `fallocate64'
./.libs/libglib-2.0.so: undefined reference to `__sync_bool_compare_and_swap_4'
./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_and_4'

Too old gcc?

>   mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0a19073440d22b36df05a54c9104c139cc6d376b/

Same as the one above (relocation truncated to fit).

>       bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c3084342085371618f961c00cc866ae37b5e9453/

libglib uses fork(). I did post
http://patchwork.ozlabs.org/patch/226374/ a while ago.

>        arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/1f51c9fce5d3e2758ccea8176406289a1bc069b5/

auth_none.c:46:21: fatal error: pthread.h: No such file or directory

libtirpc needs thread support. Originally, I was against adding the
BR2_TOOLCHAIN_HAS_THREADS dependency and thought we should fix libtirpc
instead. But I've changed my mind, I think we shouldn't diverge too
much from upstream (we already have large patches on libtirpc).

So I believe we should apply a refresh of
http://patchwork.ozlabs.org/patch/244409/, with some adjustments.

>       bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/760bfa75559ec1fe2a7060e9e6792c9789410f2c/

loadlib.c:61:19: error: dlfcn.h: No such file or directory

Uses dlopen() functionality. Should we mark !BR2_PREFER_STATIC_LIB ?

>    powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/7bcab9b94a81b89789dc1cabe9f6940ed4f5ea51/

Too old kernel headers in toolchain. Options:

 1/ Add an exception in the autobuilder script.

 2/ Modify media-ctl to integrate the necessary kernel headers and use
    them when not available from the toolchain.

I'm inclined to favor 1/.

>       i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/e2090822a32da8b70f0928644a03873a712f3c97/

/usr/bin/install: cannot stat `/home/test/test/3/output/build/ncftp-3.2.5/bin/ncftpbookmarks': No such file or directory
make: *** [/home/test/test/3/output/build/ncftp-3.2.5/.stamp_target_installed] Error 1

Some binary is not generated as our .mk file expects. Should be trivial
to fix.

> microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b95477576f1d3a84951c70ddd158b75e9f19efbd/

sha512-compress.c: In function '_nettle_sha512_compress':
sha512-compress.c:180:1: internal compiler error: in reload, at reload1.c:1059
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

Oops. Not much we can do here.

Should we add an exception in the autobuilder scripts? Or an exception
directly within Buildroot between this package and the particular
Microblaze toolchain causing the issue?

>    powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9daf0f46642020591731e20d3bf9041ff6259846/

/home/test/test/3/output/host/usr/bin/powerpc-linux-gnu-gcc   example.o lib/libpci.so.3.2.0  -o example
/home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/lib/libkmod.so: undefined reference to `_Static_assert'

No idea, I haven't investigated.

>        arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/d859068bc4a7f2b406ca83b8e19fe8b60391c0ba/

/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h

Should be fixed by the recently committed
http://git.buildroot.net/buildroot/commit/?id=f09636710b14f1493de7c8cd24aaf3a5d1322389.

>        arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b970d41df5fa8f63b7ee90e99e7a91846f6715e1/

The EGL functionality test failed!
 EGL is required for OpenGL ES to manage contexts & surfaces.
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_EGL, QMAKE_LIBDIR_EGL and QMAKE_LIBS_EGL in
 /scratch/peko/build/qt-4.8.5/mkspecs/qws/linux-arm-g++.
make: *** [/scratch/peko/build/qt-4.8.5/.stamp_configured] Error 1

The OpenGL implementation being selected is BR2_PACKAGE_RPI_USERLAND.
Not sure why it doesn't find it. Needs investigation.

>        arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3577a7221d429658b459507cd2430fc275be8564/

DirectFB disabled.
 DirectFB support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: *** [/scratch/peko/build/qt5base-5.0.2/.stamp_configured] Error 101

To be reproduced/investigated.

>        arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d268003b0a3402dde930a72ab467ee393b2ebe64/

OpenGL ES 2.x disabled.
The OpenGL ES 2.0 functionality test failed!
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_OPENGL_ES2, QMAKE_LIBDIR_OPENGL_ES2 and QMAKE_LIBS_OPENGL_ES2 in
 /home/test/test/1/output/build/qt5base-5.0.2/mkspecs/devices/linux-buildroot-g++.
make: *** [/home/test/test/1/output/build/qt5base-5.0.2/.stamp_configured] Error 1

As I pointed to Peter, this should be fixed by
http://patchwork.ozlabs.org/patch/269662/.

>       i686 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/4532e7835c0bc047266d74fa5144d1e67a367ae0/

cp -dpfr /home/test/test/2/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/qml/QtWebKit /home/test/test/2/output/target/usr/qml/
cp: cannot stat `/home/test/test/2/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/qml/QtWebKit': No such file or directory
make: *** [/home/test/test/2/output/build/qt5webkit-5.0.2/.stamp_target_installed] Error 1

This has been reported several times by users. Apparently, we can build
webkit without QML support, but this isn't correctly taken into account
in our qt5webkit.mk.

>        arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/439ce2c3c33a92966808071d4fc7231d50453c79/

Project ERROR: Unknown module(s) in QT: gui

qt5webkit would need gui support in qt5base, which sounds logical.

>     mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/41534b06b9bdf1a373f3fe4f4717c3bc8c9d7e1d/

src/cyclictest/cyclictest.c: In function 'timerthread':
src/cyclictest/cyclictest.c:638:9: error: 'union <anonymous>' has no member named '_tid'

Toolchain is a MIPS toolchain built with Buildroot 2013.05, so not old.

>     x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/

utils/backtrace.c:23:23: fatal error: execinfo.h: No such file or directory

uClibc doesn't have execinfo.h by default. Proper testing should be
added in strongswan code. J?r?me, can you have a look at this?

>       mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/28527d8ec87d7c0e9d380682216a33ea192eee42/

/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: note: 'pthread_setcancelstate@@GLIBC_2.0' is defined in DSO /home/test/test/2/output/host/usr/mips-buildroot-linux-gnu/sysroot/soft-float/lib/libc.so.6 so try adding it to the linker command line
/home/test/test/2/output/host/usr/mips-buildroot-linux-gnu/sysroot/soft-float/lib/libc.so.6: could not read symbols: Invalid operation

>       mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/876ea074ef53e020d7e72bc508aca834d2dda341/

Same problem.

>    powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/f037bf84f58ae293d5b26d5260e3a47a0ed36749/

syslogd.c: In function 'main':
syslogd.c:1237:1: error: unrecognizable insn:
(insn 66 65 67 4 (set (subreg:SI (reg:V2SI 502) 0)
        (lo_sum:SI (reg:SI 503)
            (symbol_ref/f:SI ("*.LC98") [flags 0x82] <var_decl 0x55e10ae0 *.LC98>))) syslogd.c:885 -1
     (nil))
syslogd.c:1237:1: internal compiler error: in extract_insn, at recog.c:2109
Please submit a full bug report,

Ooh. That's an old toolchain built with Crosstool-NG. I should maybe
rebuild it with a more recent compiler.

>   mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/a24bcf23cfc4e5d69ee29ef11397679eb8198468/

src/v4l.c: In function 'v4l_adapter_check':
src/v4l.c:468:5: error: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'v4l2_std_id' [-Werror=format]
src/v4l.c:504:5: error: format '%llx' expects argument of type 'long long unsigned int', but argument 13 has type 'v4l2_std_id' [-Werror=format]
cc1: all warnings being treated as errors

tvheadend is built with -Werror, this is not good. Yann, can you change
this?

>    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/f3a1c2245eab30a512fddda620c42b1cab1725bf/

checking for linux/dvb/frontend.h usability (DVB-T2, DVB API >= v5.3)... no
*******************************************************
*** ERROR: w_scan requires linux DVB API v5.3 or higher.
*** Please update your linux dvb headers,
*** (usually /usr/include/linux/dvb).
*** EXITING!
*******************************************************
make: *** [/home/test/test/1/output/build/w_scan-20130331/.stamp_configured] Error 1

Does this means the kernel headers of the toolchain are too old? What
are the solutions to this?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
