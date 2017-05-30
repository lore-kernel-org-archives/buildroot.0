From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 09:51:48 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-29
In-Reply-To: <20170530063003.4239020C46@mail.free-electrons.com>
References: <20170530063003.4239020C46@mail.free-electrons.com>
Message-ID: <20170530095148.0f0d4980@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Usual analysis of build results. Matt, Waldemar, Vicente, Peter, please
see below. Thanks!

On Tue, 30 May 2017 08:30:03 +0200 (CEST), Thomas Petazzoni wrote:

>       x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/cebeb6d5da3f581be395ef0ad51ded0cfc2f540b |     

/home/test/autobuild/run/instance-0/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/bdver3/usr/lib64/libgcrypt.so.20: undefined reference to `gpg_err_set_errno at GPG_ERROR_1.0'
/home/test/autobuild/run/instance-0/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/bdver3/usr/lib64/libgcrypt.so.20: undefined reference to `gpgrt_lock_init at GPG_ERROR_1.0'
/home/test/autobuild/run/instance-0/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so: undefined reference to `libssh2_scp_recv2'

I think this is another rpath,/usr/lib issue.

>          arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/15f4c33170dcc0bc5a4e348c3b769fb632c3471d |     
>          arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/9c0efce0c7d1bb750c7ebf209f77dad51b16c52f |     

ERROR: gnutls not found using pkg-config
Note: When building a static binary, add --pkg-config-flags="--static".

I believe those should be fixed by the recent commit that disables
gnutls in static only configurations.

>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/2f049cc47ed0a59d743a9b948077227fd83b10d2 |     
>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/4428b0ac0452ce79dd7fbdd473675a90acd3e73c |     
>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/39e5134b2abf58b9a20a20b13d1b0e33e150f960 |     

Matthew, looking at
http://autobuild.buildroot.net/?reason=host-erlang-rebar-2.6.4 is quite
interesting:

 - The issue only appears on your autobuilder instance

 - It appeared until October 17th, then stopped. And then suddenly, it
   started reappearing again on May 20, more than 6 months later.

What changed? How can we investigate this?

>       xtensa |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/60def1b15ea61d3cb5f50e9de3f354dd2e17d270 | ORPH

/home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `__gthread_mutex_lock':
/home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/host-gcc-final-5.4.0/build/xtensa-buildroot-linux-uclibc/libgcc/./gthr-default.h:748: undefined reference to `dl_iterate_phdr'

Ah, yes. It's libtool dropping -static. That's because madplay has a
weird version of libtool, on which our libtool patch doesn't apply so
we have MADPLAY_LIBTOOL_PATCH = NO. Therefore, the hack we have that
makes libtool -static behave like -all-static isn't applied, causing
this build failure.

Fix: add a custom patch for madplay that adds the -static/-all-static
hack.

> microblazeel | make[7]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/eeb75fae7c47c3ba770c53636d20c1ab00fba02f |     

Occurred after 1h21 of build, so seems like the compiler was stuck in
an infinite loop. And it seems to be quite reproducible:

   http://autobuild.buildroot.net/?status=TIMEOUT&arch=microblazeel

Always on gst-ffmpeg.

Waldemar, perhaps?

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/90a4410274c201a22c2e6d15b302179b9e9c34c8 |     
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9e76e46e57fdec477d6b8902d448d219f5275a4c |     

I'll apply Bernd patches, even if I'm not entirely happy with them.

>      aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/fbfd428c0e18671fcb618dd007b35812f6e71a6c |     

video/out/opengl/egl_helpers.c.14.o: In function `create_context':
/home/test/autobuild/run/instance-3/output/build/mpv-0.25.0/build/../video/out/opengl/egl_helpers.c:116: undefined reference to `mpgl_preferred_gl_versions'
/home/test/autobuild/run/instance-3/output/build/mpv-0.25.0/build/../video/out/opengl/egl_helpers.c:116: undefined reference to `mpgl_preferred_gl_versions'
/home/test/autobuild/run/instance-3/output/build/mpv-0.25.0/build/../video/out/opengl/egl_helpers.c:116: undefined reference to `mpgl_preferred_gl_versions'
video/out/opengl/egl_helpers.c.14.o: In function `mpegl_load_functions':
/home/test/autobuild/run/instance-3/output/build/mpv-0.25.0/build/../video/out/opengl/egl_helpers.c:231: undefined reference to `mpgl_load_functions2'
/home/test/autobuild/run/instance-3/output/build/mpv-0.25.0/build/../video/out/opengl/egl_helpers.c:231: undefined reference to `mpgl_load_functions2'

Don't know. Needs investigation.

>          arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/704fa126d3ed62c482285819816d7e80472b620d |     
>          arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/150ca78deb7d5d94ee85688e9638ed406c2000d9 |     

/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/eglplatform.h:125:22: fatal error: X11/Xlib.h: No such file or directory
 #include <X11/Xlib.h>

Same, needs investigation.

>     mips64el |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/57879e99eca1e0755001af7fd5163646cdaa6b0f | ORPH

/home/buildroot/buildroot-test/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(regex.os): In function `re_compile_pattern':
regex.c:(.text+0xd4a0): multiple definition of `re_compile_pattern'
ext/mbstring/oniguruma/reggnu.o:reggnu.c:(.text+0xfc): first defined here
/home/buildroot/buildroot-test/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(regex.os): In function `re_match':
regex.c:(.text+0xe13c): multiple definition of `re_match'
ext/mbstring/oniguruma/reggnu.o:reggnu.c:(.text+0xb4): first defined here
/home/buildroot/buildroot-test/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(regex.os): In function `__GI_re_search':
regex.c:(.text+0xe164): multiple definition of `re_search'

Static linking issue. Needs to rename some functions?

>       mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/c3a096fda15ef01b527261a8efbab67ac76829fa |     

{standard input}: Assembler messages:
{standard input}:708: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v0,$t8,$t7'
{standard input}:759: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v1,$t8,$t7'
{standard input}:765: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $t2,$t8,$t7'
{standard input}:770: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v1,$t7,$t8'

Vicente, could you comment on this?

>    powerpc64 | v4l2grab-f8d8844d52387b3db7... | NOK | http://autobuild.buildroot.net/results/9eea759992d2c57764156dfeba5682eed8c39797 |     

Bogus:

  sort: write failed: standard output: No space left on device

Peter, could you do some cleanup on gcc21 ? :-)

>         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/63153b044e7883b9b6f97c7fd8ff50015f624efc |     

src/client/options.cpp: In function 'client_options process_command_line(int, const char**)':
src/client/options.cpp:139:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304

Compiler bug. Waldemar?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
