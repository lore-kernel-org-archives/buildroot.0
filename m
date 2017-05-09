From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 May 2017 09:35:37 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-08
In-Reply-To: <20170509062824.6D04D208E1@mail.free-electrons.com>
References: <20170509062824.6D04D208E1@mail.free-electrons.com>
Message-ID: <20170509093537.5560182b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Alexey, Yegor, Bernd, Yann, Vicente, Fabrice, Frank, Floris, Peter,
J?r?me, there are some questions/issues for you below :-)

On Tue,  9 May 2017 08:28:24 +0200 (CEST), Thomas Petazzoni wrote:

> Build statistics for 2017-05-08
> ================================
> 
>       successes : 217
>        failures : 23 

We're doing quite well for a beginning of the debugging cycle, so it'd
be great to reduce even further the number of build failures. Let's
analyze a few of them.

On 23 issues:

   13 issues that have no solution yet
   10 issues that have a solution committed, or close to be committed

>       xtensa |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/436f6173bb29a945abc75899a6b74e1266362fc9 |     

error: Name clash for '<pstage/lib>libboost_system.a'

Yegor, you are in the DEVELOPERS file for Boost, could you have a look ?

>    powerpc64 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/ed21ac166f2151aa69a7790a17ff05f05afa512d |     

Would be fixed by https://patchwork.ozlabs.org/patch/759742/.

>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/17baccfb72de050aee9bc8ba2b46442afe45292d |     
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/8f8ad583f03edb6294dce3cf6de51391320bbafc |     
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/a262cc45114cc3ddf51cb9db5ab35971bf32b8cb |     

ARC toolchain issue. Alexey, could you have a look ?

>      powerpc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/88774af2845e17cab021a72c8f3171fe30b3a1ff |     
>     mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6912abef6ebb03f9ac4888967b522ab707a51319 |     

I have submitted a patch upstream for this issue, I will submit it to
Buildroot hopefully today.

>        sparc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/d7c3b145a64ed3916b89ddb4090050f3b9205e37 |     

It's being handled by Romain. He has sent a v2, but it still has some
issues, I guess Romain will send another version soon.

>     mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/4f62a79e7567c6f7a61373e3095f771ff12a57ef |     
>  powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/17e523be894b60d7a9b2a3303f02c3fb34816828 |     
>     mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/9c90ffcb15a6bcddcafb6288ba742177392ddaa1 |     

Would be all fixed by my series on mpir.

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8a068af584a52cb48375da851e8d7ddb9ee9b646 |     

libavcodec/x86/ac3dsp_init.c: In function 'ac3_downmix_sse':
libavcodec/x86/ac3dsp_init.c:161:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/ac3dsp_init.c:165:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/ac3dsp_init.c:161:9: error: 'asm' operand has impossible constraints

Bernd ?

>         mips |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/863e56002599e51e8e9cd7459ddb8931d1055ae8 |     

libpostproc/postprocess.c:94:53: error: expected ',' or ';' before 'FFMPEG_VERSION'
 const char postproc_ffversion[] = "FFmpeg version " FFMPEG_VERSION;

Bernd ? :-)

>         i686 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/ac72a2a47705cf527684e15c95c97504ac17349c |     
>          arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/faf374b70436257d70131e42592e333c00cd982a |     
>          sh4 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/eef0e90a270838a0792142b94212e1dbd0781314 |     

All fixed by
https://git.buildroot.org/buildroot/commit/?id=4b72b54fd3b0074864e5ad36ec2fdcd30f4d58eb

>     mips64el |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/63a83af7cdc1db88397ac5a40b25bf787c50955d |     

scan_usb.c:37:29: error: unknown type name 'usb_dev_handle'
(and more USB related errors)

Yann, you are listed in the DEVELOPERS file for "nut". Could you have a
look ?

>       mipsel |                      php-7.1.4 | NOK | http://autobuild.buildroot.net/results/0ff0866a6c8be7dfeea099de0c5c514afac5572f | ORPH

checking for SQLBindCol in -lodbc... no
configure: error: Your ODBC library does not exist or there was an error. Check config.log for more information

In config.log:

/home/test/autobuild/run/instance-0/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libodbc.a(SQLCreateDataSource.o): In function `SQLCreateDataSource.part.0':
SQLCreateDataSource.c:(.text+0x54): undefined reference to `lt_dlopen'
SQLCreateDataSource.c:(.text+0x58): undefined reference to `lt_dlopen'
SQLCreateDataSource.c:(.text+0x68): undefined reference to `lt_dlsym'
SQLCreateDataSource.c:(.text+0x74): undefined reference to `lt_dlsym'

It's a static linking issue.

Vicente, Fabrice, Frank, Floris, over the last months, you have
contributed changes on the PHP package. Would you be willing to adopt
it (i.e being listed in the DEVELOPERS file) ?

>          arm |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/d7216e2c14c24ed5a0129b7729aae3ae584b44db |     

  CXXLD    libpoppler-qt4.la
../../libtool: line 7489: cd: usr/lib: No such file or directory
libtool:   error: cannot determine absolute directory name of 'usr/lib'

Peter (Seiderer), another Poppler/Qt issue it seems.

>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/16640aa938dc3907bc04bb80ee1fb0d54a9460c0 | ORPH

./.libs/libprotobuf.so: undefined reference to `__atomic_fetch_add_4'
./.libs/libprotobuf.so: undefined reference to `__atomic_compare_exchange_4'

We need to link against libatomic.

>          arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/878fb42a19aa56a128fa73b7bed39aad57241107 | ORPH

Conflict between <net/if_arp.h> and <linux/if_arp.h>.

>       x86_64 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/ba1298e71ef28857654ae8d4593d09e4fe8cdda0 |     

af_alg_ops.c:110:22: error: conflicting types for 'crypt'
 METHOD(af_alg_ops_t, crypt, bool,

J?r?me, you are looking after strongswan. Could you have a look ?

>         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/bdca3f0e11cd9f6dbb68e84a8cc3ff1ea8dd799f |     

src/client/options.cpp: In function 'client_options process_command_line(int, const char**)':
src/client/options.cpp:139:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304

Compiler bug. We should try without optimizations, and see if gcc 6.x
has the issue or not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
