From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 14:49:56 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-13
In-Reply-To: <20170514063046.C79A9220A8@mail.free-electrons.com>
References: <20170514063046.C79A9220A8@mail.free-electrons.com>
Message-ID: <20170514144956.77fbdca3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

>       successes : 250
>        failures : 17 

Really good results!

On Sun, 14 May 2017 08:30:46 +0200 (CEST), Thomas Petazzoni wrote:

>          arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/5962afffac3a2041d089811cf5a73c3b4a671c60 | ORPH

Fixed in:

  https://git.buildroot.org/buildroot/commit/?id=f937bbb71673c66836577a3751e49cd964e6d9d7

>         i586 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/06c930d9c5299b79500d018ac3fb2861ce834c7c |     

Romain has proposed a patch series to fix this:

  https://patchwork.ozlabs.org/patch/762050/
  https://patchwork.ozlabs.org/patch/762051/
  https://patchwork.ozlabs.org/patch/762052/

>       x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/91f7c6954c337b03f5ac141050d9b1bee1623376 |     

/home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/5.4.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/5.4.0/crtbeginT.o: relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be used when making a shared object
/home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/5.4.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/x86_64-buildroot-linux-musl/sysroot/lib/../lib64/libc.a(__libc_start_main.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC

Not sure what this is...

>         m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/b3eaaf6d73cd49f5919143aeaa5cbb4d15a7ccc3 |     

libavutil/libavutil.a(buffer.o): In function `pool_release_buffer':
/home/buildroot/autobuild/run/instance-1/output/build/ffmpeg-3.3/libavutil/buffer.c:301: undefined reference to `__sync_fetch_and_add_4'

I'll have a look at the ffmpeg patches around atomic support.

>         sh4a |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/5dff0ec19205e02f6ee373d34cb79f39ac25b609 | ORPH

Forgets to link with librt, I have reproduced the problem locally and
will submit a fix.

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9f5a497c6242860fb67a5aa2996c3509f49a4564 |     
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b43978f11c62239a2b8089a4ff60a19af53634d9 |     

Should be fixed by:

  https://patchwork.ozlabs.org/patch/762041/
  https://patchwork.ozlabs.org/patch/762043/
  https://patchwork.ozlabs.org/patch/762042/

>      aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/866b1d28595efd8b6becf83d0a64b596538d58b0 | ORPH

A patch was proposed by Romain, but I'm not entirely sure:
https://patchwork.ozlabs.org/patch/762084/.

>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/805087e87b8bb7d11adb49d9eca3959a37aca3a2 |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=6714d79a22b4c0ad7651659c8009f93574bbd59d

>         i686 |                opencv-2.4.13.2 | NOK | http://autobuild.buildroot.net/results/4e7e3641c20b85465678d4a6d5a97ef53e793330 |     

/accts/mlweber1/instance-2/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/jasper/jas_math.h: In function 'bool jas_safe_size_mul(size_t, size_t, size_t*)':
/accts/mlweber1/instance-2/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/jasper/jas_math.h:185:15: error: 'SIZE_MAX' was not declared in this scope
/accts/mlweber1/instance-2/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/jasper/jas_math.h: In function 'bool jas_safe_size_add(size_t, size_t, size_t*)':
/accts/mlweber1/instance-2/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/jasper/jas_math.h:212:10: error: 'SIZE_MAX' was not declared in this scope

A fix like commit d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa is probably
needed here.

>          arm |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/4bae12b9a4e9744f561a79cb243e01bf3e6ea212 |   

/home/buildroot/autobuild/run/instance-3/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/openblas_config.h:82:44: warning: "__STDC_VERSION__" is not defined [-Wundef]
 #if ((defined(__STDC_IEC_559_COMPLEX__) || __STDC_VERSION__ >= 199901L || \

Samuel, could you have a look, this has been happening for a while.
  
>          arm |                      php-7.1.4 | NOK | http://autobuild.buildroot.net/results/234985fcaf6012d4ac7fbc2b2a7a4375cb7cd552 | ORPH

/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libicui18n.a(umsg.o): In function `icu_58::MessageFormatAdapter::getArgTypeList(icu_58::MessageFormat const&, int&)':
umsg.cpp:(.text._ZN6icu_5820MessageFormatAdapter14getArgTypeListERKNS_13MessageFormatERi+0x0): multiple definition of `icu_58::MessageFormatAdapter::getArgTypeList(icu_58::MessageFormat const&, int&)'
ext/intl/msgformat/msgformat_helpers.o:msgformat_helpers.cpp:(.text+0x8): first defined here

Yet another funky static library issue...

>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/cc5946f24438b90151b440b65ae178c452e7c876 | ORPH
>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b8a40663222f8930aad247657674c06156024c65 | ORPH

Needs an appropriate atomic dependency.

>         or1k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fd45d560ef4a682991bcaf984308f19c9d618d1e |     

Static linking issue: intl + zlib.

>        nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/11d8a1d71e9fd76e745680dbd442f22121217bb6 |     

Already fixed by
https://git.buildroot.org/buildroot/commit/?id=e7a64ddcbc0b262eaa549fede9bd1e8ca3bb310f.

>      sparc64 |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/c2f6f477dc510484ea126742508ff8e526f43b40 |     

Weird:

/usr/bin/install: cannot change permissions of '/home/rclinux/rc-buildroot-test/scripts/instance-2/output/target/etc/upmpdcli.conf-dist': No such file or directory
make[4]: *** [install-dist_sysconfDATA] Error 1
make[4]: *** Waiting for unfinished jobs....

Matt, is this yet another weird thing in your autobuilder configuration?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
