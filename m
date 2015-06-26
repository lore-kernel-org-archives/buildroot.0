From: Andreas Naumann <dev@andin.de>
Date: Fri, 26 Jun 2015 17:48:45 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <20150625200235.083eaf34@free-electrons.com>
References: <20150625200235.083eaf34@free-electrons.com>
Message-ID: <558D745D.6010606@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,


Am 25.06.2015 um 20:02 schrieb Thomas Petazzoni:
> Hello,
>
> Our http://autobuild.buildroot.org tests are great, but they are only
> build-time tests, and they only test random configurations of packages.
> Things like bootloader packages, filesystem images, kernel build are
> never tested in an automated way, and no runtime testing is done. I
> also want to be able to build small test programs exercising specific
> features and run them on the target.

this is something I have been looking into for a while. Our goal was to
have some kind of acceptance test for our BSPs. I started testing
internals with qemu, but soon the focus shifted to physical boards and
real IO, so the qemu target is hardly maintained any more.
Anyway, in the beginning I took a similar approach to the JUnit
framework, writing the testcases in Python using the TAP (test anything
protocol) for output and creating a number of actor objects to control
the input/output of the DUT (UART, RS485, telnet, ssh, powerswitch, CAN
transceiver, ...).
While this worked well for the developers, it became apparent that
understanding what was tested and how was rather difficult for people
that dont do this 100% of the time. In addition, documentation, test
reports, reusability of test-steps was less than ideal. We then toyed a
little with a self invented test language, but discarded all those
efforts once we discovered the Python based 'Robot Framework'.
Their keyword-driven approach fits our needs very well because of the
resulting abstraction and readability of testcases, the configurability,
the many available libraries (most important for us ssh and telnet, easy
extensible with Python modules), the testcase editor RIDE, Jenkins
plugin, xUnit output if needed ...

Maybe it's too high level for the buildroot project and I'm not an
expert in the xUnit world so I cant really compare. But anyway Robot
provides functionality and structure that matches the need of embedded
testing quite well, so you may want to give their Quickstart a try.


best regards,
Andreas


>
> Since a while, I wanted to setup a small infrastructure to be able to
> describe specific test cases: a Buildroot configuration to build, with
> the ability to boot some of those configurations automatically in Qemu.
>
> So I finally went ahead and create such a small infrastructure. It's
> very basic and minimal right now, and should be considered as an
> experiment. It's available at:
>
>     https://github.com/tpetazzoni/buildroot-runtime-test
>
> It's based on the Python unittest mechanism, and allows to describe
> test cases that consist in a Buildroot defconfig, plus a Python
> function that can do some checks on the resulting build, boot the
> system under Qemu, run some commands inside the Qemu system and check
> their results.
>
> I've written a few tests to show how it could work: simple tests for
> Dropbear and Python (on the package side) and several tests for
> filesystem images: ext2/3/4, squashfs, jffs2, ubi, iso9660, yaffs2 (all
> of them are boot tested, except yaffs2).
>
> For now, it's very crude and basic. The README file explains how it
> works, and gives a TODO listing some of the things that for sure need
> to be improved.
>
> Currently, this runtime test infrastructure is not set up to be
> executed every day on the latest Git, but it is obviously the goal.
>
> Contributions, comments and suggestions are welcome.
>
> Best regards,
>
> Thomas
>
