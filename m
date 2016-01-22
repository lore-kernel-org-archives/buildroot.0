From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 10:29:57 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122073021.E35B6101A27@stock.ovh.net>
References: <20160122073021.E35B6101A27@stock.ovh.net>
Message-ID: <20160122102957.10f29956@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Gustavo, Carsten, Frank, Vicente, Alan, Romain, Bernd, Thomas, Peter,
Max, Joao, Maxime, Sonic, Simon, Waldemar, please see below, there are
some questions for you. Thanks!

On Fri, 22 Jan 2016 08:30:21 +0100 (CET), Thomas Petazzoni wrote:

>          arm |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/c8c7f9a799d1af507a6edd5e02b0bbc8b7b5d068/

gettext/libintl handling issue.

>       mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/62f386829193c747176ace05e4b26826fcabbf59/
>     mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a92fa5dc5d9d6742d61d4d293f7eac97c5355dfe/

rbt.c:116:15: error: two or more data types in declaration specifiers
  isc_uint32_t ptrsize;
               ^
rbt.c:116:22: error: expected identifier or '(' before ';' token
  isc_uint32_t ptrsize;

Gustavo, can you have a look ? I think this error already popped up in the past, no?

>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c7d987a51f2b2b731fb60e0e741361bbfb4ff230/
>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b2c860fc8fbc7a025bcd3c04e9b43b04f029ead3/
>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5a33d69d2c11e3013b73b3f6c1d8ab3a31facf62/
>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a7c7eb7c2f477f8a19c1b364f746dfd31bf18a3d/
>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fb2f5cbe28a41161df7e3c5b2f6a36242daf5374/
>       xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/179345a92e0c1db1b8d5bccb27c6b93e484f9b6d/
>         i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8612864811bbb04d655a6040869ccb81396d7737/
>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/51c54c85010c61245a4ef51d4e602974809d077f/
>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e474243b83233c008fc2351c77eba35269e95439/
>       xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/30898a3c7a5fceb1bd14a287064b96e04fba7921/
> microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d5d159dc004e28fed537b84fae76afb0734b2ec0/
> microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/71e9dbb63b91980723554651071fdc3d7a2250f2/
>     mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3ee30fe28f709c63c9a0e2d0d91440d855ff73a9/
>       xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c48523b0bc50c61a9dd1bb691cd3fe3b05fdc1a7/
>          sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/04553f5d6b73b0a97901995674b0876c33d062f5/

The FE_* issue. I tried to have a look at the other day. It seems like
the Boost code does check for FE_*, but it does by running tests with
the host compiler... So it concludes that fenv.h support is OK, but
then it really builds with the target compiler and fails. But the boost
build system is so... that I'm not even sure.

>          arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/be64a45ac158b9057fb3e7ef9b515250acc77187/

Still the u_long problem. Carsten ?

>        sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/20cd87c6a05c91ee223b813040d9d10fa923b174/

libatomic_ops not usable. Probably need to disable erlang on Sparc and
be done with it?

>       x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e4ab3fa4a121f7d7edb0263f02aac2ee836905a7/

sys/common/erl_poll.c: In function 'update_pollset':
sys/common/erl_poll.h:132:5: error: '__uint32_t' undeclared (first use in this function)
   ((__uint32_t) (EV))
     ^
sys/common/erl_poll.c:1150:24: note: in expansion of macro 'ERTS_POLL_EV_E2N'
     epe_templ.events = ERTS_POLL_EV_E2N(ps->fds_status[fd].events);
                        ^
sys/common/erl_poll.h:132:5: note: each undeclared identifier is reported only once for each function it appears in
   ((__uint32_t) (EV))
     ^
sys/common/erl_poll.c:1150:24: note: in expansion of macro 'ERTS_POLL_EV_E2N'
     epe_templ.events = ERTS_POLL_EV_E2N(ps->fds_status[fd].events);
                        ^

Musl build issue. Frank, can you have a look at this one ?

>          arm |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/f271386d3cefad4a4971bc8698848b4563498e6b/

./.libs/libgdk_pixbuf-2.0.so: undefined reference to `libintl_bind_textdomain_codeset'
./.libs/libgdk_pixbuf-2.0.so: undefined reference to `libintl_bindtextdomain'
./.libs/libgdk_pixbuf-2.0.so: undefined reference to `libintl_gettext'

Gustavo, can you have a look ?

>     mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/1a0eb189ad91a7f2fb7285f4225555a0a0febda2/

libavformat/aacdec.c:1:0: error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor

Vicente, this one is for you :-)

>       xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/a5b0d3816953b5477d7938cf001fb048fee7462b/

Weird:

  make[3]: *** No rule to make target `hidtest.o', needed by `hidtest-libusb'.  Stop.

Alan, hidapi is your thing, would you mind having a look ?

>          arm |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/e178371c2c3bf42d59c6fc26409e098081239ccb/

lib/evas/filters/evas_filter_parser.c: In function '_lua_backtrace':
lib/evas/filters/evas_filter_parser.c:2434:20: error: 'LUA_GLOBALSINDEX' undeclared (first use in this function)
    lua_getfield(L, LUA_GLOBALSINDEX, "debug");

Romain ? This is host-efl, maybe we need to disable Lua support or
something ?

> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d35f6ee7643a695af7db3739ff480d25b99ee051/
> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/09f4a89e463b6ccbca01cce1d38eb849c17ed6e1/

The documentation issue. Romain, you looked into this a while ago, why
does it pop up again on Microblaze specifically ?

Maybe we can switch to the mainline gdb for Microblaze ?

>        nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0e8d5ab5127b5e40c58912fe16504e3fcb941e69/
>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/10f61d4cc5f6fdac231185d577493e0e82c5d091/
> microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bdcb9bbd7a07f0bde1b575bbf7ae88d006a1e823/
>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a25de6a6e8d68fd86ebf2c5805c6fe31d5860656/
>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f00e14e2360544ffe7501247dddfcb701631646d/
>     mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/95491e089e6e18bfddbf6d7d19450026e9a349f5/
>     mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/936d66543e2db55309af115ead64ded24f31661c/
>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/25409dfeb7ce5806115092eb341e201d680ab974/
>         bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1a45412939a3f9d6fa59d086d834a3b4a4bffef7/

Would be fixed by http://patchwork.ozlabs.org/patch/571347/.

>        nios2 |           imagemagick-6.9.2-10 | NOK | http://autobuild.buildroot.net/results/0bf3a2a284b7d4712ab1530562d3b8164fc75e88/

The usual:

  assertion fail elf32-nios2.c:1038

This is being fixed at
https://sourceware.org/bugzilla/show_bug.cgi?id=19405. In the mean
time, we could disable on NIOS II maybe ?

>          arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/50e34db9e273ebb7b8a9198dec254f6b22e26eff/

iperf.h:71:21: error: field 'tcpInfo' has incomplete type
     struct tcp_info tcpInfo; /* getsockopt(TCP_INFO) for Linux, {Free,Net}BSD */

musl build issue.

Gustavo, you added the iperf3 package, can you have a look ?

>       x86_64 |                 iproute2-4.4.0 | NOK | http://autobuild.buildroot.net/results/d3d79b55cb19987d5d5c0da9c0f0d25697697c05/

Already fixed by
https://git.busybox.net/buildroot/commit/?id=11d7b8b64aa171823bc4c97e3cce43884d078ecf.

>       x86_64 | iucode-tool-1cbd73013cd4c6b... | NOK | http://autobuild.buildroot.net/results/7f8626db69500a84a393053a485f04180c565673/

Fixed by https://git.busybox.net/buildroot/commit/?id=6a774f400b20612cb77836a47aaf62ea72422fb8.

>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/183df75a853c3b0e2617c9219a356c5531aa523d/

Will be fixed once we bump to binutils 2.26. Romain, maybe we should
disable libcap-ng in the mean time ?

>       x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/7d444611f8efa40e0eb81ac88365416ef553fcd5/
>       x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/6287fa5a754610f04f0df93bf611676d982f5cff/

Musl build issue. Bernd, can you have a look ?

>      powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/cdae10070b9a97066dbfd0fb2c2004d9bd1fdd43/
>      powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/0df8b1f78b671ff05b2ecbf9c4cf08b8898e2d43/

Fixed by https://git.busybox.net/buildroot/commit/?id=b8fb4903fb858bc81eab6ac5bd37c801853594cb.

>         i686 |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
>       x86_64 |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/

These are really weird. The patch doesn't apply when the build takes
place on my build server, but it does apply when I test things locally
on my machine. A difference in the version of patch ?

>        sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/4feaa9089ee9a183c5086b791bea35c0156945af/

Atomic issue strikes again.

>     mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/4d63874fe2efda8ac7aa3a8c82affa99f0ce5af0/

[.... many more of this issue ....]

Fixed by
https://git.busybox.net/buildroot/commit/?id=343ec915e3f7cb6f83ef114cd6c5e5f3502d8f4a.

>     mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3a2b141d90b28a2954fa0ad3104cba81d648d2a3/
>       mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/70aa227c8a289631c2973474cfaef5973756dd5c/
>     mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/2b8c777c76b7e5d5a426045f5a3872d6b71faa56/
>       mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3f19dd459400ac7fca39e69dd280def6a547f8b6/

tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c:50: undefined reference to `authdes_create'
collect2: error: ld returned 1 exit status

Thomas, you touched the ltp-testsuite/tirpc handling recently IIRC.
Interestingly, this problem only occurs on MIPS apparently. Thomas,
Vicente, can you have a look ?


>          arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/b48bc7ad4bede4d16c079da0ae1121e6796a0e8d/
>          arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/25dcb19c3dd32e50990f9b45053d71ea18746a80/
>          arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/a3f93498811491d37ba13d024e33e68a8bc7ba18/

checking for dlopen in -lc... no
configure: error: Cannot find dlopen in libdl nor libc. Use LDFLAGS=-Ldir to specify their location.

In a static linking only situation.

Samuel, can you have a look ? Most likely we should simply disable
lttng-tools for static only scenarios.

>       x86_64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/2561190b274d71666c4bdf3c569b02063cefdb30/

./relocatable.c: In function 'libintl_relocate':
./relocatable.c:402:40: error: 'INSTALLPREFIX' undeclared (first use in this function)
       const char *orig_installprefix = INSTALLPREFIX;

Musl related ? Not sure. Peter, you added the madplay package back in
2007, so can you have a look ? :-)

> microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/0d71cd6edccd390106636cc0c4acfe5a8dca112a/
> microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/6567477b87c081db97a9c2bf84af182a9a281193/

Another atomic issue: __sync_val_compare_and_swap_1.

>       mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/3f9443a76d2f8811720748b487e045eec23ec338/
>       mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/104b8fae4ff5918353e0e6a7ac050e2f04d701c1/

Vicente, this is with your new mips toolchains, SSP library problem.
Can you have a look ?

>       xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/bff7436a800eeea92c0c92bd2846b0f2b31947fd/

/tmp/cchH5TCg.s:23436: Error: value of 38619 too large for field of 2 bytes at 2889

Toolchain problem. Max can you have a look ?

>      aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/aadce770cf86ded813a78f936f0a6d4441845907/

libavutil/aarch64/cpu.c:25:32: error: 'HAVE_ARMV8' undeclared (first use in this function)
     return AV_CPU_FLAG_ARMV8 * HAVE_ARMV8 |
                                ^
libavutil/aarch64/cpu.c:25:32: note: each undeclared identifier is reported only once for each function it appears in

Joao, you enabled mplayer on AArch64, can you have a look please ?

>      powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/fe3be93988e585a84ae3116a0c327e1e2c95ad08/

Still the same build issue:

cache.c: In function 'same_path':
cache.c:429:22: error: field 'fh' has incomplete type
cache.c:436:2: warning: implicit declaration of function 'name_to_handle_at' [-Wimplicit-function-declaration]
Makefile:613: recipe for target 'mountd-cache.o' failed

Maxime ? I gave you some hints about this one, can you cook a patch ?

>          arm |                     php-5.6.17 | NOK | http://autobuild.buildroot.net/results/0bbae90d05f14ac1fdbac7d8d69d4e6fd922e301/

Forgets to link with pthread in a static linking scenario.

Gustavo ?

>          arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/bd886cd10a8f52647296de2ff50270f25532756e/

Weird C++ error:

  error: member 'QChar std::__cxx11::basic_string<QChar, std::char_traits<QChar>, secmem::alloc<QChar> >::<anonymous union>::_M_local_buf [8]' with constructor not allowed in union

Vicente, you added this package, so can you have a look ?

>          arm |               pptp-linux-1.8.0 | NOK | http://autobuild.buildroot.net/results/56dd530d53489220d0080480310b8dc150cf1b2e/

Musl build issue. Gustavo ?

>          arc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/d6565367f83cc845495e5e5f60935b71d04ef2da/

Toolchain issue it seems:

/home/test/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.4/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/test/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-gmain.o): relocation R_ARC_32_ME against `.rodata.str1.4' can not be used when making a shared object; recompile with -fPIC

Alexey ?

>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aa1492777c5f60ab45921618f64910ca4d048e5f/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a74810f0fce398c41fef11b8e2b8e1a52ffdb46a/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cb70d195cf9b9b5ae09b83a40ef767cc8f699a9c/

Toolchain issues. Being fixed in upstream gcc, but we should disable
with external NIOS2 toolchain anyway.

Romain ?

>          arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/53e7e122e96b4b96c0f5feb4f26055b3f5ad8096/

Full static configuration fails with:

/home/test/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ldl

See if we can, get rid of the libdl dependency or make qt (or one of
its sub-option) depend on dynamic library.


>          arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/a6f6502e55fd68803f3ff8b4b76cce6601e101db/

In file included from src/lib/rt-get_cpu.c:4:0:
src/include/rt-get_cpu.h:9:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>

Should depend on dynamic library.

>         bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/268d29bd910c17b1fccad5d13ce281238080efd2/
>         bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/1eb3d1ca20ce81fa2b10593d9393fb130558a706/

process.c: In function 'rb_spawn_process':
process.c:3921: warning: passing argument 2 of 'rb_ary_new_from_values' from incompatible pointer type
process.c:3923: error: 'status' undeclared (first use in this function)
process.c:3923: error: (Each undeclared identifier is reported only once
process.c:3923: error: for each function it appears in.)

Sonic, this is a Blackfin problem, can you have a look ?


>          arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/178bdfb062949fb10b9d6b9830975aa57702b3ae/

Static configuration, fails with:

checking for mpfr_init in -lmpfr... no
configure: error: libraries 'mpfr' and 'gmp' are required for the maths module

Simon, can you have a look ?

>      sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/328192a8c561f3517bb0f9ebafb59d09e4f4b3ae/

policy_scan.o: In function `yyget_out':
policy_scan.c:(.text+0x504): relocation truncated to fit: R_SPARC_GOT13 against symbol `yyout' defined in .bss section in policy_scan.o
policy_scan.o: In function `yyget_leng':
policy_scan.c:(.text+0x520): relocation truncated to fit: R_SPARC_GOT13 against symbol `yyleng' defined in COMMON section in policy_scan.o

Waldemar, this is a toolchain problem, can you have a look ?

>     mips64el |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/3c1fef2163b8a194ede70040da87af95bf5dc331/

/home/buildroot/autobuild/run/instance-2/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libreadline.a(display.o): In function `cr':
display.c:(.text+0x208): undefined reference to `tputs'
display.c:(.text+0x210): undefined reference to `tputs'

Static linking problem.

Vicente, in commit 41d6f177d226b9014f5a14d0d05ca843f482d94f, you added
some patches to fix static linking. Seems like there are more
problems :-)

>          arm |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/601d8dc1654d8733db49b195139e12437663034c/

plugins/plugin_loader.c: In function 'load_plugin':
plugins/plugin_loader.c:359:13: error: 'RTLD_LAZY' undeclared (first use in this function)
  int flag = RTLD_LAZY;

Needs dynamic library ?

>       mipsel |                   stunnel-5.28 | NOK | http://autobuild.buildroot.net/results/3448dc253a4a86450f15fb225374bd1e643dacd1/

Vicente, this is with your new MIPS toolchain, SSP problem:

/home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/../../../../mips-img-linux-gnu/bin/ld: cannot find -lssp_nonshared
/home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-img-linux-gnu/4.9.2/../../../../mips-img-linux-gnu/bin/ld: cannot find -lssp

>          arc |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/e9c5df490264a2d9ff5160187bda75431493d666/

../gnu/libgnu.a(quotearg.o): In function `quote':
quotearg.c:(.text+0xdac): multiple definition of `quote'
/home/buildroot/buildroot-test/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libacl.a(quote.o):/home/buildroot/buildroot-test/instance-1/output/build/acl-2.2.52/libmisc/quote.c:27: first defined here

I don't think it's specific to ARC. Anyone to have a look ?

>          arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7009e334e51adce37353c5d4f618fb28678f6114/

PIE problem, patch pending.

>          arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/c660d29b0184daf7d16045b595e48d3c73ab521a/

checking for GLES2/gl2.h... yes
checking whether to use OpenGL ES 2 support... configure: error: Cannot enable OpenGL ES 2 support without EGL enabled.

Gustavo ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
