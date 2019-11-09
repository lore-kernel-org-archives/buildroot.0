From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Nov 2019 22:33:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-06
In-Reply-To: <569eeff2-f02f-3506-5cdc-1f02a8e3c325@gmail.com>
References: <5dc3c4b8.1c69fb81.ff4f2.2a4cSMTPIN_ADDED_MISSING@mx.google.com>
 <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
 <20191109120151.GO3419@scaer>
 <569eeff2-f02f-3506-5cdc-1f02a8e3c325@gmail.com>
Message-ID: <20191109213357.GP3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-11-09 14:09 +0100, Romain Naour spake thusly:
> Le 09/11/2019 ? 13:01, Yann E. MORIN a ?crit?:
> > On 2019-11-09 11:40 +0100, Romain Naour spake thusly:
> >>>   mips64el   |        host-llvm-9.0.0         | http://autobuild.buildroot.net/results/d3aa03ca7085727d0794228178c7744859900137
> >> This is weird since mips is not (yet) supported by Buildroot's llvm package (see
> >> BR2_PACKAGE_LLVM_ARCH_SUPPORTS).
> >>
> >> host-llvm dependency seems trigged by another package at Makefile level without
> >> being llvm/clang at Kconfig level.
> >>
> >> Yann, the issue seems related to qt5tools for Qt 5.12 [1].
> >> Since it now depends on libclang, BR2_PACKAGE_QT5TOOLS_QDOC_TOOL must depends on
> >> BR2_PACKAGE_LLVM_ARCH_SUPPORTS (at least).
> > 
> > This is a serious limitation in the host-llvm package, then.
> > 
> > qt5tools wants llvm to build a tool (namely, qdoc) for the host, not
> > the target. So it should not be bothered by whatever the target is.
> 
> Well, It's the same problem as for using llvm/clang on the host to build some
> host tools. For your case you have to build hos-llvm with your host variant
> (x86_64 for example) (LLVM_TARGETS_TO_BUILD).

qdoc is a host tool that scans qt-based source code, extracts the
special comments, and generates the documentation. It does not generate
target binary (afaik). It is only linked with libclang:

    $ readelf -d build/qt5tools-5.12.5/bin/qdoc
    Dynamic section at offset 0x229680 contains 34 entries:
      Tag        Type                         Name/Value
     0x0000000000000001 (NEEDED)             Shared library: [libclang.so.9]
     0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
     0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
     0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
     0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
     0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
     0x0000000000000001 (NEEDED)             Shared library: [ld-linux-x86-64.so.2]

> But since we use the same LLVM_TARGET_ARCH for the host-llvm and llvm, we need
> to use -target x86_64-linux-gnu when using clang.

But if there is no target llvm built, we could just fallback to the host
machine, then, no?

Regards,
Yann E. MORIN.

> See: http://lists.busybox.net/pipermail/buildroot/2019-November/265490.html
> 
> Initially llvm was packaged as a cross-toolchain only. Here you want to use it
> as a native compiler. It's like if you want to build a host-gcc for you build
> machine instead of using the compiler provided by you distribution.
> 
> In this case we probably can use clang provided by the build machine ?
> 
> Best regards,
> Romain
> 
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
