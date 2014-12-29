From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 09:30:05 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20141229073016.9A54E101206@stock.ovh.net>
References: <20141229073016.9A54E101206@stock.ovh.net>
Message-ID: <20141229093005.3a3c0142@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Dec 2014 08:30:15 +0100 (CET), Thomas Petazzoni wrote:

>          arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/23398bc625ad2719f001c1ab0c76713bc2adbf07/

The infamous cppcms issue, which has been happening since months.

>      powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/ca32c4de8b645c96cedb80b6270a792e9601ad84/
>      powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/

Kernel headers issue with this old toolchain?

>     mips64el |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/6afd10f435692c72363f065d654d07eb4d74cd37/

mv dmalloc.h.t dmalloc.h
./dmallocc.cc:41:21: fatal error: dmalloc.h: No such file or directory
 #include "dmalloc.h"

Parallel build issue, maybe?

>          arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/89101289474d51e48f80e353aa4e4449113c083b/

checking for a usable libatomic_ops implementation... no
configure: error: No usable libatomic_ops implementation found
configure: error: /bin/bash '/home/peko/autobuild/instance-2/output/build/erlang-17.4/erts/configure' failed for erts

There are some patches from Frank pending about this, but I am not
entirely convinced yet. We had some discussion about it last night with
Yann. To be investigated.

>          arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/c1fdc7df0821641a0876da4f3138f6854d9d989a/

../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `powl'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `fmodl'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `ceill'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `log10l'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `floorl'
collect2: error: ld returned 1 exit status

Forgets to link with libm? Weird because it's not a static link configuration.

>         bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/0a74f37517f9944018d343361575479496a9bc6e/

/ssd1/thomas/autobuild/instance-2/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): In function `strdup_locale_from_utf8':
/ssd1/thomas/autobuild/instance-2/output/build/popt-1.16/poptint.c:93: undefined reference to `_libiconv_open'
/ssd1/thomas/autobuild/instance-2/output/build/popt-1.16/poptint.c:108: undefined reference to `_libiconv'
/ssd1/thomas/autobuild/instance-2/output/build/popt-1.16/poptint.c:111: undefined reference to `_libiconv'
/ssd1/thomas/autobuild/instance-2/output/build/popt-1.16/poptint.c:138: undefined reference to `_libiconv_close'
collect2: ld returned 1 exit status

Forgets to link against libiconv in static linking situation.

>     mips64el |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/f1c1b05223fd62b96b9f2f4d780650c4d2d634b4/

Corrupted tarball, should be resolved thanks to the addition of hash
files for all Sourceforge packages.

>          arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/1d3839229c11979210d6a8ad440a66d0587ea546/

Same.

>         bfin |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/964f98fafdcd7e994ea25cf0993915d81537c31c/

Static linking issue: it doesn't take into account the fact that
libxml2 is linked against libz and libm.

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7a6ca3c1f6b7bae6365fac0ffba9c16542cb9255/

Not sure, but it seems it is trying to build a shared library on a FLAT
system.

>       xtensa |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e648ed8e7d96d2727c4446d12f5864e5691a4210/

Would be fixed by http://patchwork.ozlabs.org/patch/424327/.

>       xtensa |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e92cf4025b0f573d4a9ade30025954168d8469f6/

Ditto.

>          arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/be20dec9ffe7de3adc46a834852b20353d39baff/

Ditto.

>     mips64el |                mpdecimal-2.4.0 | TIM | http://autobuild.buildroot.net/results/d5d13915a57503d0df5fec6d10ae23b04946c120/

Ignore.

>         bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/3815ba4ff4d43b53bd5b6195b9d3174e424672b5/
>         bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/b4c2a802946e75c6e50da68cef71e5d3cc2b2552/

/ssd1/thomas/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libc.a(strchrnul.o): In function `*___GI_strchrnul':
/usr/src/packages/BUILD/blackfin-toolchain-uclibc-full-2014R1/uClibc/libc/string/generic/strchrnul.c:33: multiple definition of `_strchrnul'
obj/mingw_fixes.o:src/mingw_fixes.c:(.text+0x0): first defined here

>          arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e822d62bbf21f8a9ef6cffbf888947fb0d09a861/
>          arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e5e9ed8277dda1dcefbae4b75c673693a85ea422/

operf.cpp: In function ???end_code_t _run()???:
operf.cpp:668:33: error: ???nanosleep??? was not declared in this scope
    (void)nanosleep(&ts_req, NULL);

>       mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/dd78faeaffe79bb4ed14e8d06ac7033fcb0341c1/

Project ERROR: Package gstreamer-app-0.10 not found
make[2]: *** [WebCore/Makefile.WebKit] Error 2
make[2]: *** Waiting for unfinished jobs....

Not sure what's going on here.

>       x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/b9770aabb317d2e123a26b9c642a72759de836f1/

mpglib.c:147:9: error: overflow in implicit constant conversion [-Werror=overflow]
         SDL_RWseek(internal->rw, -sizeof (mp3_magic), SEEK_CUR);
         ^
cc1: all warnings being treated as errors

>     mips64el |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/1efca09d28f3724abe6973016d654af6c594752e/
>          arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/21e30bcb6df9b2b6170ecf0dc9d0ed157fd5e018/
>         i686 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/0e993cab4b2923631909ad47eb11ca50e23f6bcd/
> microblazeel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/fcb0cf4bf8e8e739162877a9ba74ce8df8ea4ba6/

Download issues, also fixed by the addition of Sourceforge hashes.

>         bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/d58de379451a175b9eeda63535c17d6f2034639a/
>         bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/ad7bff258854f11a0921a583e2f756f75f512f48/

Weird issue, I know Yann was looking into it.

>          arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5955a3415ecf1c420249ac02b86321221463a43c/

Temporary download issue. Maybe we should mirror the toolchains on sources.buildroot.net ?

>         bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0c0ff63aef4d92c57d203e32740b48f971870785/

Download issue, fixed by the addition of hashes for Blackfin toolchains.

>     mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/4b3a5246a02fcfe0971698cc33248e4f62c25556/
>      powerpc |                    wvdial-1.61 | TIM | http://autobuild.buildroot.net/results/27189e551008f4fe10bd029b1058e1fd2d70865f/
>         sh4a |                 yaml-cpp-0.5.1 | TIM | http://autobuild.buildroot.net/results/94555403981dad96ceab660f681a0ae069becc7b/

Ignore.

>         bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/1a85103724ccb7d2b5a4a39dd054b8491d6bc077/

Missing atomic operations.

>         bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/fefe865edebf4627e92a8bca3ac0b3c8dbac6cd6/

Weird C++ issues.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
