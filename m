From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 11:03:56 +0100
Subject: [Buildroot] [PATCH v1] qt5base: disable gold linker
In-Reply-To: <20150211153232.2dcd2b32@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 11 Feb 2015 15:32:32 +0100")
References: <1423637231-4145-1-git-send-email-ps.report@gmx.net>
 <20150211153232.2dcd2b32@free-electrons.com>
Message-ID: <87oaozzbsj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Seiderer,
 > On Wed, 11 Feb 2015 07:47:11 +0100, Peter Seiderer wrote:
 >> Fixes [1],[2]:
 >> powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized command line option '-fuse-ld=gold'
 >> Makefile:1192: recipe for target '../../lib/libQt5Core.so.5.4.0' failed

 > The Qt configure script has some logic to detect whether the compiler
 > supports -fuse-ld=gold or not. Do you know why this logic is not
 > properly working, and not detecting that this specific compiler doesn't
 > support this?

 > Disabling unconditionally this feature is maybe OK, but I'd like to
 > understand why the configure script logic to auto-detect this is not
 > working.

The problem is that the configure script is confused. While this is
related to linking, -fuse-ld=gold is an argument to the compiler driver
to tell it what linker to execute, NOT an option to tell the linker to
behave differently. So it shouldn't get prefixed with -Wl when passed
though the compiler driver.

Qt does the right thing when it uses it, but the configure script does:

    if linkerSupportsFlag $TEST_COMPILER -fuse-ld=gold; then
       CFG_USE_GOLD_LINKER=yes

This should be compilerSupportsFlag instead.

I'll create a patch and apply / send upstream.

-- 
Bye, Peter Korsgaard
