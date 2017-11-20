From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 23:32:53 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-19
In-Reply-To: <20171120070004.B482020743@mail.free-electrons.com>
References: <20171120070004.B482020743@mail.free-electrons.com>
Message-ID: <20171120233253.541c48ad@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Let's look at the results for the master branch. If you're in To:,
there are some questions/topics for you below! :-)

On Mon, 20 Nov 2017 08:00:04 +0100 (CET), Thomas Petazzoni wrote:

>       mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/bf800f2de69cedced594d60b4012a45c27e49698 |     
>       mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/0439790b6f472e3d4b2d5431a05aa5b408f62e56 |

/tmp/ccfDMgDL.s:1480: Error: opcode not supported on this processor: mips32 (mips32) `pause'

Not sure what's going on here. Was this happening before? Any idea?
     
>          sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7d2cd95bc75250b47f5c9947cd996852925f6e0b | ORPH

/tmp/ccFVFYgX.s: Assembler messages:
/tmp/ccFVFYgX.s:34102: Error: pcrel too far

Toolchain issue that nobody is ever going to fix I guess.

This issue was reported a long time ago on binutils (for SuperH), and
was apparently fixed. But now it appears again.

What should we do?

>     mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/f6260a8d53ccffc1e51326bb5e3c375aeacacd12 |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=17299cd0182df1b4202429a9c567765b3d2510bc.

>          arm | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/6380341dbb6c114e4452c5cda37da6b44b80d178 |     
>      aarch64 | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/4ecf770df7c984a62082d59f8fab632d3efbe06b |     
>       mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e1473a12cf38ccf4dd3ed0f26a8ff9e6b57f0810 |     

This is a build issue caused by glibc 2.26. Pascal, since you added
google-breakpad, could you have a look? Perhaps Romain Naour can help
as well, since he bumped glibc to 2.26.

>          arc |                       icu-59.1 | NOK | http://autobuild.buildroot.net/results/09b2f38adf0ed6b8c646125c75f8ab89f110adcb | ORPH

/usr/bin/install -c -m 644 ./config/mh-linux /home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-gnu/sysroot/usr/share/icu/59.1/config/mh-linux
/usr/bin/install -c -m 644 ./config/mh-linux /home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-gnu/sysroot/usr/share/icu/59.1/config/mh-linux
/usr/bin/install: cannot create regular file '/home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-gnu/sysroot/usr/share/icu/59.1/config/mh-linux': File exists
make[3]: *** [install-icu] Error 1

Trying to install two times the same file ? What's going on here ?

>      powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/00d5a4b809922f8fa42c0de9d461c9754d2f8098 |     

I've submitted a patch to fix this, waiting for review:

  http://lists.busybox.net/pipermail/buildroot/2017-November/207427.html

>          arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/06beee7473d1730903b86e2f62498a56e5ea3f05 | ORPH

Weird issue:

src/KompexSQLiteBlob.cpp:108:1: fatal error: opening dependency file build/shared/KompexSQLiteBlob.o.d: No such file or directory

Parallel build problem, perhaps?

>    powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/5ddc852a238f39a1f9b1d43ec6e68662f6d957ab |     
>  powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/1ecee82c8da51277272990d10c781dfe5a9bc5d1 |     
>  powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a7e3e6d39b5b1b2cbf8b9a578041127ab317cfbb |     
>  powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/16024e16655a919599f096322a19c70b7fdbac26 |     

Hopefully all fixed by https://git.buildroot.org/buildroot/commit/?id=041715cc5337bbd7311da4f5b0fd97da1b902a38

>      powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/a89d3249486f0cdd06c5e28f8492dad337937dcf |     

/usr/lfs/v0/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-ctng_e500v2-linux-gnuspe/4.7.3/../../../../powerpc-ctng_e500v2-linux-gnuspe/bin/ld: cannot find -latomic

Bernd, could you have a look at this one ?

>          arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9e3a0b5b8f2506fb2ce2fcc3d5d3a494a14439cb | ORPH
>          arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/42e53c8451949d36540d60ca4b2a422ea878b6c5 | ORPH

I fixed this in https://git.buildroot.org/buildroot/commit/?id=317b72f469867bd3e1765418e325515d6065d45f

>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/84bf2eb1b7888040a866cbcda1cb03b8738bda0a | ORPH
>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/23f5af34ad48fb4139a2b964baca752d1ab1732f | ORPH

Compiler blows up:

tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in validate_condition_mode, at config/rs6000/rs6000.c:18074

>          arc |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/69032f10edcfd65fd81d62a6854a4c06fa204d76 |     

/usr/lfs/v0/rc-buildroot-test/scripts/instance-0/output/build/supertux-0.5.1/external/squirrel/sq/sq.c:42: undefined reference to `__mcount'

Alexey, is there something special about __mcount on ARC ?

>        nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/db5d8c14705b6b05eb467c413195d4cc0c03b281 |     

The freerdp/libxkbcommon issue that Yann/Adam are discussing.

>         i686 |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/14391727e980e69234f379174c80c267410b09f3 | ORPH

/home/dawncrow/buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/i686-buildroot-linux-uclibc/include/c++/6.4.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>

Meh? What is this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
