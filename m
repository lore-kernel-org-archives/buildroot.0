From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jan 2015 09:49:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-01-12
In-Reply-To: <20150113073016.3005C100E75@stock.ovh.net>
References: <20150113073016.3005C100E75@stock.ovh.net>
Message-ID: <20150113094943.18230555@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

See below an analysis of the build failures. Gregory, Johan, Frank,
Gustavo, Ezequiel, Paul, Yann, there are questions for you below,
please read on. Thanks!

On Tue, 13 Jan 2015 08:30:16 +0100 (CET), Thomas Petazzoni wrote:

>          sh4 | checking whether /home/peko... | TIM | http://autobuild.buildroot.net/results/e10fde8dd5f4e0c74a31c4856a9a8786d4cf10fb/

Ignore.

>         bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/f0c00f82b59c7a45bb08bf555ccd01e9918283aa/

ini/ini_fileobj.c:196: error: expected declaration specifiers or ???...??? before ???iconv_t???
ini/ini_fileobj.c: In function ???initialize_conv???:

Maybe ding-libs need libiconv for toolchains that don't have locale
support.

Gregory, since you added the ding-libs package, can you have a look?

>          arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/59d9a417639303e7d28d5ad18633192e460894c1/

This should already be fixed by
http://git.buildroot.net/buildroot/commit/?id=a5f3db697f37d81b87a99dc3fdce9a6a7f4e0754.

>         bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/4004e869b528e579e98c2935bece9a42a897f322/

freetype doesn't say it should link against bzip2 for static builds.
Someone to look into this?

>      powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/63352d31006f9ea8eb589487b506fbb9f126edae/
>      powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/49604ba7b7e6bc55031a4f252d470b3f1a689932/
>          arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/eaeb75b9538765693e7c025f6a72af2caaf2a819/
>          arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/05a1849f81c66c4c15e91fc13abc881e35cc05bc/

Not sure what this is:

beam/erl_bif_re.c: In function 'erts_init_bif_re':
beam/erl_bif_re.c:68:5: error: 'erts_pcre_malloc' undeclared (first use in this function)
beam/erl_bif_re.c:68:5: note: each undeclared identifier is reported only once for each function it appears in
beam/erl_bif_re.c:69:5: error: 'erts_pcre_free' undeclared (first use in this function)
beam/erl_bif_re.c:70:5: error: 'erts_pcre_stack_malloc' undeclared (first use in this function)
beam/erl_bif_re.c:71:5: error: 'erts_pcre_stack_free' undeclared (first use in this function)

Johan, Frank, you are our Erlang guys. Can you have a look?

>      powerpc |         host-util-linux-2.25.2 | TIM | http://autobuild.buildroot.net/results/baf53c04ab3f71c80c2045d6e38182626f206f35/

Ignore.

>         bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/66ba5f76694d0738b113463579ce6b2fa49a89d6/

/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -ldl

Probably iptables should depends on !BR2_STATIC_LIBS.

Gustavo, can you have a look?

>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1e991f21af18e2e9d9f663f26fa2229b7ab151a4/

/tmp/cc6dd5Km.s: Assembler messages:
/tmp/cc6dd5Km.s:951: Error: bad expression
/tmp/cc6dd5Km.s:952: Error: bad expression
/tmp/cc6dd5Km.s:978: Error: bad expression
/tmp/cc6dd5Km.s:979: Error: bad expression

Ezequiel, can you have a look and suggest a solution?

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/315d453bef6654eb14fec141eaac00a41058e0f9/

/home/peko/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: warning: cannot find entry symbol __start; defaulting to 00000000
/home/peko/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/elf2flt: clients/memcapable.gdb: `-a' option specified with non-fully-resolved input file

Not sure what's going on.

>         bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/f8fdc259c0c0fb26d6e1121705f2f4b260a04d7d/

/ssd1/thomas/autobuild/instance-2/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o): In function `_bio_zlib_free':
c_zlib.c:(.text+0x48): undefined reference to `_inflateEnd'
c_zlib.c:(.text+0x62): undefined reference to `_deflateEnd'

Missing linking against zlib.

>      powerpc |                   libtasn1-4.2 | NOK | http://autobuild.buildroot.net/results/496789d849af3f41f0b926f4defa8d4cf51bfeb1/

  CC       structure.lo
make[4]: *** No rule to make target `gllib/libgnu.la', needed by `libtasn1.la'.  Stop.
make[4]: *** Waiting for unfinished jobs....
  CC       version.lo

Weird.

>      powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/ed7abf07f5f870ac332ed909f3cd1d92a2b8d75c/

../lib/.libs/liblightning.so: undefined reference to `disassemble_init_powerpc'
collect2: error: ld returned 1 exit status
../lib/.libs/liblightning.so: undefined reference to `disassemble_init_powerpc'
collect2: error: ld returned 1 exit status

>         i686 |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/a334c96ca08044486a774e38e11b95dee54d45c7/

configure: error: in `/home/peko/autobuild/instance-0/output/build/lightning-2.0.5':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: *** [/home/peko/autobuild/instance-0/output/build/lightning-2.0.5/.stamp_configured] Error 77
make: Leaving directory `/home/peko/autobuild/instance-0/buildroot'

>      powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/585ec1ab9c808695f98011818a95f7c421a015ef/

Same as the PowerPC above.

Paul, you added the lightning package, can you have a look?

>         i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d03c37b9acf167a3b02b87609a4b056fa022f7b4/

/home/buildroot/instance-1/output/build/qemu-2.1.2/target-mips/op_helper.c: In function 'helper_lwm':
/home/buildroot/instance-1/output/build/qemu-2.1.2/target-mips/op_helper.c:448:1: internal compiler error: in assign_by_spills, at lra-assigns.c:1281
 }

I think this is https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59477.
Would someone be brave enough to reproduce the issue, and test if the
gcc patch fixes it?

Yann, maybe ? :-)

>      powerpc | qhull-60d55819729d7b49391dd... | TIM | http://autobuild.buildroot.net/results/e091805e5c6068ca4898804b70a24db072f2b800/

Ignore.

>         sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/ac18e7664a01cdc115fab368e3bc86a2ab4d70f2/

Assertion fail in toolchain. We probably need to add an exception to
not build WebKit with this toolchain.

>          arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/c96d05851014318aace7cc689385e997d2d8d5c7/

checking whether to build with ZLib library... no
configure: error: unable to find usable ZLib library
make: *** [/home/buildroot/instance-0/output/build/rpm-5.2.0/.stamp_configured] Error 1
make: Leaving directory `/home/buildroot/instance-0/buildroot'

Can someone look into this?

>       xtensa |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/062a34e281cb6eb0d91b1205b03f11df2ea39569/
>          arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/d27f794e653fca813c50a4545778c26602c45f00/
>     mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/5e686ca8f878fe1dc789cf783b2d8bdc2c5510f6/
>          arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/945cebae92e36b50810193c413fc0594fec53826/
>      powerpc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/ea72f555f468a5134e380044f8885f62e9d94d9b/
>       x86_64 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/814b42501fb38c5ee39c1148e6874b11e10bd257/
>          arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/2a9e25c311212235daefd95f873c079d25eb6e4e/
>      powerpc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/b8c97e0d73b515dca95698044f7dd1f8cf28d728/
>     mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/fc12a21bb1286ce8dc8f2bf5aa8d2b669371b194/
>          arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/06ba5025f52f7ed001f8bbc37dbf956ac71949a4/
>          arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/bb37558bb859e71c1ebc6bc459ba8ac9032ab1fc/
>      powerpc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/671200896d0b7f99d45a028d1d12eedba674a6bf/
>          arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/ba8a45dd0639e8cba1fc3b3b1c04be9cdbaca713/
>          arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/83f6a5727e9d9bbcea1a79cad14216e788697d0e/

Already fixed by the patch from Gustavo.

>          arm |                tcpreplay-4.1.0 | TIM | http://autobuild.buildroot.net/results/fce5192641a68f1a61d04b4a24e13eda5a49f9b6/

Ignore.

>         bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/38294c23a49ad45c2ed982eed23ad7eece8a1e25/

src/zmqpp/socket_types.hpp:21: error: expected identifier before ???class???
src/zmqpp/socket_types.hpp:28: error: ISO C++ forbids declaration of ???pair??? with no type
src/zmqpp/socket_types.hpp:28: error: ISO C++ forbids initialization of member ???pair???

Weird C++ issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
