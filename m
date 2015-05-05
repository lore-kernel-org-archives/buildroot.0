From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 09:59:52 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150505063016.079181016A5@stock.ovh.net>
References: <20150505063016.079181016A5@stock.ovh.net>
Message-ID: <20150505095952.4ddfd5b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Simon, Pascal, Gustavo, Vicente, Max, Samuel, Bernd, look below, there
are some questions/tasks for you! :-)

On Tue,  5 May 2015 08:30:15 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/6f25e80e8aedec91323ef9b67576b550d7abee60/

musl build problem. Yann has sent a patch to disable at on musl, but I
would actually prefer to fix at.

>          arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/69aff0b9d0ac8fe08e1d2f7ffb691f6a8fc8693b/

There a -L/lib64 hardcoded somewhere.

>       xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/f685d73952a2562e0f3e1c378ddd7885d6433272/

Two issues:

 * Linking C++ code with gcc
 * Missing -lpthread since we're linking statically

Simon, can you have a look?

>      aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e063085f7d34f8d7940614b26313b28f5eb2396e/
>      aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/24baf2a135a1bdb6db7bd022e3899482f7f02c10/

./src/client/linux/minidump_writer/linux_dumper.h:93:23: error: field 'regs' has incomplete type 'google_breakpad::user_pt_regs'
   struct user_pt_regs regs;

Does google-breakpad really works on AArch64 ?

Pascal, you're the original submitter of the google breakpad support,
can you have a look ?

>      aarch64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/85bd849e17c6e5ed6b5b56a4d4ad1a73f7de99c2/
>      aarch64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/38ce95ef3bf3b8270c48ca8fe839c5313ac51621/

Should be fixed by http://patchwork.ozlabs.org/patch/467829/.

>          arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/f8037de36e9a0d3b22bea1e52f563b8abeb50500/
>       xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/37238ee36af62a668e132a09490a02cf774b8889/
>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/f23333bcff3e8d317013faca00351023bf92de88/
>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/58f0276eea85f35edf7a247a958b1f42340b0a66/

These should be fixed by http://patchwork.ozlabs.org/patch/460494/ or
http://patchwork.ozlabs.org/patch/449686/. Not sure which one is the
most appropriate solution.

>      powerpc |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/7980bbd50ab63ea2bf482b8f58493ac39790a213/
>          arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/1eeb6b7f4c055968f1683a37cec2b2142923cd28/

Smells like parallel installation issue, but not sure. Angelo tried to
investigate, but was not able to reach a conclusion. Anyone to look at
this?

>       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/cd2e617f8e2b00581ab5936029f85e62ed3259ba/

md2.o: In function `md2_sum':
md2.c:(.text+0x18): undefined reference to `EVP_md2'

Gustavo, maybe? Has OpenSSL removed md2 support by default or something
like that?

>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c8f19279cd49d13b14ec0d9dc116f527325d9c5b/

Compiler issue, let's disable libcap-ng on nios.

>          arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/09a7de29e21501a094f22e9afe470524f5de8c92/

musl build problem. Will not re-appear for now since I disabled the
musl toolchain.

>     mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/48efae954e6b030fa8743a5728fb3f30a892f142/
>         mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/ed2150dd5be56056de299d2011cad340dc1e3e56/

Directly accessing the struct termios fields is bad, because depending
on the architecture, the structure is a bit different. There are some
accessors to do this, they should be used. Vincente, can you have a
look, since you fixed a similar problem in a different package some
time ago?

>          arc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/0a466cde55c5e128a2e201924f80f0ec6b8b5c2a/

Should be fixed by applying http://patchwork.ozlabs.org/patch/467858/.

>          arm |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/b41c043fb3b2fad1d9cea0a95b512fb4942b5b19/

Should be fixed by applying http://patchwork.ozlabs.org/patch/467444/.

>         bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/633581d8f95efd3fc92ce9875e0608fe40d054bf/
>         bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/bf12eb189ab35ce00a2212695d2dbf8b8a126529/

Missing -lpthread when linking statically.

>          arm |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/3a70305be4a78af9404b0bd027dbcdd011ca01b3/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/bd8796a3001458de5326f96a9110a95bac247225/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/156e4afe32f7928880859a69999abcc3c9b304d0/
>         sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/04e209c1b54ec4ccfc0da67a3f077151b65171a7/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2dcc2b044a1235cf9df24e5d55423c5e4ca7196a/
>          arm |             python-pyqt-4.11.3 | TIM | http://autobuild.buildroot.net/results/d2f426d839bebebef3d8a41d1d010a0c6ac285a9/
>          sh4 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/de975f29185aa95826b416ee5a60d2f190a979a6/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/891dc6ad46039740867a0b436281fc489cfb2772/
>      powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/65fe75b6aa965641f447c41b82d8511bd6be1a86/
>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e0df30e8068cd784bed8e47f5cd13f1f70284027/
>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/ccd0534d1dfcb1628f808da91850ec62091f2178/
>      powerpc |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/349922ebab920c82cf087080f96c12310d6e66bb/

All these issues are caused by
http://git.buildroot.net/buildroot/commit/?id=7619aba496208102e098e24454371b9513ec2f90.
I suggest to revert this patch.

>          arm |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/f2a43b62aa2a720c538fc60c80c78c8ed5b04dea/

Missing pthread, already fixed by
http://git.buildroot.net/buildroot/commit/?id=0045808c1b271eef75e08fe02b4032f3f0e3dfc7.

>       xtensa |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/31115fe8d88f52d77ed0f2da769eb8896a1b34a2/

kvs40xx.h:265:2: error: #error __BYTE_ORDER not defined
 #error __BYTE_ORDER not defined

Max, can you have a look?

>      aarch64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/23d696e3ecbd192669e0de5eae6d339730c1aea2/

Try 'libtool --help' for more information.
libtool:   error: unrecognised option: '-DHAVE_CONFIG_H'

Weird.

>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/86a4da3f9f4c9025f2f2393800c797b2af050808/
>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/438ef12933aaac24029e352fdadeedb76bbd1cbb/

tinyxml is trying to build a shared library in all cases. Samuel, you
are our CMake guy, can you have a look to fix this?

>          arm |                        unknown | TIM | http://autobuild.buildroot.net/results/c2f41853747d32f253ba251f8919e02d47f69719/
>          arm |                valgrind-3.10.1 | TIM | http://autobuild.buildroot.net/results/f5aa99efe31e5b417ba27a0de0408eed10926375/

Ignore.

>          arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/3612b54b0bbc2a55ba6f0febb7be32595b523d96/

  CC       libgles2_plugin_la-gl.lo
arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/directfb'
make[6]: *** [libdirectfb_plugin_la-directfb.lo] Error 1

Bernd, can you have a look?

>     mips64el |                xapp_xwud-1.0.4 | TIM | http://autobuild.buildroot.net/results/5c02fe80e6072ee8d1794c20a31850af71eb10eb/
>     mips64el |                   xerces-3.1.2 | TIM | http://autobuild.buildroot.net/results/9c5cc4182b561804476bdcbda5b7dbb763110aa2/
>          arc |        xproto_presentproto-1.0 | TIM | http://autobuild.buildroot.net/results/b6abf41c886ade1e88d2cce7c0250f58a966aa7c/
>          arm | znc-b396cafdb249544164ed029... | TIM | http://autobuild.buildroot.net/results/990172b1d3b2e028adba947efad9544a5a705f78/

Ignore, all these are timeouts.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
