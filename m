From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 00:15:55 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-09
In-Reply-To: <20180810060017.0EEFE20719@mail.bootlin.com>
References: <20180810060017.0EEFE20719@mail.bootlin.com>
Message-ID: <20180811001555.0b515e22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 08:00:17 +0200 (CEST), Thomas Petazzoni wrote:

> Build statistics for 2018-08-09
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  10 |   1 |   0 |  11 |
>    2018.05.x |  14 |   1 |   0 |  15 |
>       master | 123 |  10 |   3 | 136 |

This we've got only 10 failures on master, let's have a look at them.

>         m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bd77b0be062f273e336b4ef578d17b9c9bdd38cd |     

This is another instance of "libboost_atomic shouldn't have been
installed: missing select in boost/Config.in". Fabrice, you had sent
patches for this, but I made some comments explaining the patches were
not correct. Do you intend to work on this again in the near future ?

>        sparc |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/cf71468807f496a3d2fca1405989ebfce08a4900 |     
>      aarch64 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/c826f38e321b999d0fc21ad9aae5e1d713f20417 |     

Hollis: your autobuilder is consistently timing out on f2fs-tools,
during the download step:
http://autobuild.buildroot.net/?reason=f2fs-tools. Could you
investigate what's going on ?

>      aarch64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/66c03506e10071ec44ca509304595f4f5150e4d9 |     
>       mipsel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2b41afe7841feba626fc29c9474e82d9934e6173 |     

Due to the use of atomic built-ins, not available in old compilers. I
would suggest to make all packages that depend on host-libselinux to
depend on the appropriate host gcc version.

>  powerpc64le |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/c35ac4bbc5fb04aabf5a719eddeedf55f7f1f4eb |     

dyncall_call_ppc64.S: Assembler messages:
dyncall_call_ppc64.S:135: Error: operand out of range (5 is not between 0 and 1)
dyncall_call_ppc64.S:135: Error: missing operand

Fran?ois, could you report this upstream ?

>     mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/20942b594b08dabbfd6e14f4a2b257b2eb0a24e1 |     
>     mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/13a079965b2b3d246a647152b6ec33e1ec5fd51b |     

Weird C++ issue, occurring since a while:
http://autobuild.buildroot.net/?reason=ncmpc-0.30. Fabrice, you're
listed in the DEVELOPERS file for ncmpc, could you have a look ?

>          arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/d23103a6fa18cb77e14fa901e9475e53382be6db |     

/home/naourr/work/instance-1/output/build/python-pyqt5-5.7/QtTest/sipQtTestQTest.cpp: In function 'PyObject* meth_QTest_waitForEvents(PyObject*, PyObject*)':
/home/naourr/work/instance-1/output/build/python-pyqt5-5.7/QtTest/sipQtTestQTest.cpp:263:20: error: 'waitForEvents' is not a member of 'QTest'
             QTest::waitForEvents();

Manuel, you added support for python-pyqt5. Could you have a look at this ?


>   aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/1fe2be0f26e5b92db57a5cfb5646dd253b731a5c |     

This is just about adapting the Double-Conversion header to support AArch64 BE.

>         i686 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/8b5531e44c4f4258c950902b2cd92d1ac8a8491e |     

Some crazy C++ error. Peter (Seiderer), could you have a look ?

>       mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/0fa860faa1cc5d007574bed4517c3e9db9ab389c |     

Some crazy MIPS issue. We simply need to disable on the problematic
MIPS sub-architecture. The same issue was already reported in February
2016 in
http://lists.busybox.net/pipermail/buildroot/2016-February/153612.html,
we were using qt5webkit 5.5 back then. The issue still hasn't been
resolved, so let's disable this package on MIPS32r6 and MIPS64r6.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
