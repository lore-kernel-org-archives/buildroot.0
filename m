From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 10:21:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-15
In-Reply-To: <CALdGskKtWsQOyKehenpwZHyaMuYHQ600kiMr4w080DNYGRcBKQ@mail.gmail.com>
References: <20170216072900.AAE4920BC6@mail.free-electrons.com>
 <CALdGskKtWsQOyKehenpwZHyaMuYHQ600kiMr4w080DNYGRcBKQ@mail.gmail.com>
Message-ID: <20170216102154.4f896bea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding the Buildroot mailing list in Cc, as well as Waldemar (uClibc-ng
maintainer).

On Thu, 16 Feb 2017 09:44:39 +0200, Olivier Schonken wrote:
> Hi Thomas
> 
> This looks like it might be a uclibc toolchain issue. Maybe the sequence of
> including/linking? Looks like a function declaration and definition mixup...
> 
> /home/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.4.0/libgcc.a(libunwind.o):
> In function `_Unwind_Resume':
> /opt/toolchain-build/build/host-gcc-final-5.4.0/build/arm-buildroot-linux-uclibcgnueabi/libgcc/../../../libgcc/config/arm/libunwind.S:357:
> multiple definition of `_Unwind_Resume'
> /home/buildroot/buildroot-test/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(pt-arm-unwind-resume.os):pt-arm-unwind-resume.c:(.text+0x0):
> first defined here
> /home/buildroot/buildroot-test/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(pt-arm-unwind-resume.os):
> In function `_Unwind_Resume':
> pt-arm-unwind-resume.c:(.text+0x2c): undefined reference to
> `pthread_cancel_init'
> pt-arm-unwind-resume.c:(.text+0x3c): undefined reference to `__libgcc_s_resume'
> collect2: error: ld returned 1 exit status
> make[4]: *** [pdftocairo] Error 1
> make[3]: *** [all-recursive] Error 1
> make[2]: *** [all] Error 2
> make[1]: *** [/home/buildroot/buildroot-test/instance-0/output/build/poppler-0.51.0/.stamp_built]
> Error 2
> make: *** [_all] Error 2
> make: Leaving directory `/home/buildroot/buildroot-test/instance-0/buildroot'

The exact same build error occurs for czmq:

  http://autobuild.buildroot.net/results/517/5179aade1ddfe3975b17f49b534e84ba1a55bdab/build-end.log

/opt/toolchain-build/build/host-gcc-final-5.4.0/build/arm-buildroot-linux-uclibcgnueabi/libgcc/../../../libgcc/config/arm/libunwind.S:357: multiple definition of `_Unwind_Resume'
/home/test/autobuild/run/instance-3/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(pt-arm-unwind-resume.os):pt-arm-unwind-resume.c:(.text+0x0): first defined here
/home/test/autobuild/run/instance-3/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(pt-arm-unwind-resume.os): In function `_Unwind_Resume':
pt-arm-unwind-resume.c:(.text+0x2c): undefined reference to `pthread_cancel_init'
pt-arm-unwind-resume.c:(.text+0x3c): undefined reference to `__libgcc_s_resume'

We have the same issue for glibmm:

  http://autobuild.buildroot.net/results/fb1/fb14e37aaf453874d1c33e5ed73b9c751ace5ae3/build-end.log

For enchant:

  http://autobuild.buildroot.net/results/70d/70d72b5e767965726a1e5eca437f3efc4af92c86/build-end.log

so that would indeed suggest a toolchain issue rather than a package
issue. Waldemar, do you understand what's going on here?

Looking at the glibmm failures:

  http://autobuild.buildroot.net/?reason=glibmm-2.50.0

it happens only with the fully static ARM toolchain, and since December
25, 2016. Enchant started failing on December, 10, and czmq on December
6. Looking more precisely at the build failures, we can see  that:

 * The earlier build failures from December/January all take place with
   an internal toolchain configuration, for which BR2_STATIC_LIBS was
   added.

 * Some of the newer build failures are using a pre-built ARM
   static-only external toolchain. It's only since my rebuild a few
   days ago that we started seeing those.

Bottom line: a toolchain change around early December started to cause
those build failures, and we are now seeing more of them because of the
recent rebuild of the Buildroot toolchains.

With all those informations at end, I would suspect the following
commit to be the culprit:

commit a44d7f2dbb19a54a8f2beb5c0f0adb0680999319
Author: Waldemar Brodkorb <wbx@openadk.org>
Date:   Sun Dec 4 12:20:27 2016 +0100

    uclibc: update to 1.0.20
    
    The test suite is removed from the package and is already a separate
    package in buildroot. All patches are upstream, so remove them.
    The UCLIBC_HAS_LFS option is removed upstream.
    
    Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
    [Thomas: remove BR2_UCLIBC_INSTALL_TEST_SUITE option, add it to
    Config.in.legacy.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
