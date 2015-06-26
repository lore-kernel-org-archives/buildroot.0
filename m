From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 26 Jun 2015 18:20:33 +0200 (CEST)
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <558D745D.6010606@andin.de>
Message-ID: <499323654.2188387.1435335633378.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

more answers in the mail below, but we have a trainee working on an
automated test framework based on "Robot Framework" this summer and
we planned to upstream it when we have something to show...

Fortunately the work we are doing is not solving the same problem 
as yours but at this point it's really worth discussing so the 
two aspects can work together.

Our approch was mainly to have each package (on the buildroot side
have its own RFW scriptlet and have buildroot assemble these 
scriptlets at make time to provide a test for the resulting system
that would only contain the tests for whatever package was actually
compiled in.

We don't intend to automate the testing itself. Once a RFW script is
available, running it is not too complicated. The hard part is 
connecting to the target and that is very target dependant.

At this point it would be possible for us to switch back to any test
framework if RFW is not the one the buildroot project wants to use
but I personally think that RFW is really a good framework for high
level system testing (opposed to single-software unit testing) it
is very simple to learn by looking at examples, the keyword approch
is very readable and adding our own modules in python is fairly 
easy


> 
> Am 25.06.2015 um 20:02 schrieb Thomas Petazzoni:
> > Hello,
> >
> > Our http://autobuild.buildroot.org tests are great, but they are
> > only
> > build-time tests, and they only test random configurations of
> > packages.
> > Things like bootloader packages, filesystem images, kernel build
> > are
> > never tested in an automated way, and no runtime testing is done. I
> > also want to be able to build small test programs exercising
> > specific
> > features and run them on the target.
> 
> this is something I have been looking into for a while. Our goal was
> to
> have some kind of acceptance test for our BSPs. I started testing
> internals with qemu, but soon the focus shifted to physical boards
> and
> real IO, so the qemu target is hardly maintained any more.
> Anyway, in the beginning I took a similar approach to the JUnit
> framework, writing the testcases in Python using the TAP (test
> anything
> protocol) for output and creating a number of actor objects to
> control
> the input/output of the DUT (UART, RS485, telnet, ssh, powerswitch,
> CAN
> transceiver, ...).

I second that need. This is the big motivation behind the job. The 
systematic testing and retesting of system functionalities is very
long and tedious. Some manual testing will always be needed, but
being able to check things like "there is a running ssh server" or
"a specific user was created" would save us a huge amount of time.
It is very important for us that those tests can be tuned to match
our specific tuning of the distro (i.e when we overlay config file
for a daemon, we need to do the corresponding tests)

> While this worked well for the developers, it became apparent that
> understanding what was tested and how was rather difficult for people
> that dont do this 100% of the time. In addition, documentation, test
> reports, reusability of test-steps was less than ideal. We then toyed
> a
> little with a self invented test language, but discarded all those
> efforts once we discovered the Python based 'Robot Framework'.
> Their keyword-driven approach fits our needs very well because of the
> resulting abstraction and readability of testcases, the
> configurability,
> the many available libraries (most important for us ssh and telnet,
> easy
> extensible with Python modules), the testcase editor RIDE, Jenkins
> plugin, xUnit output if needed ...
> 

This repeats our story perfectly, though I had never heard of RIDE. i'll
have a look.

RFW is also able to export its test results (including the keywords which
is the source code of the test for all practical purpose) as XML. We used
that to autogenerate complete test reports.


> Maybe it's too high level for the buildroot project and I'm not an
> expert in the xUnit world so I cant really compare. But anyway Robot
> provides functionality and structure that matches the need of
> embedded
> testing quite well, so you may want to give their Quickstart a try.
> 

As said above, I highly second that. RFW is really targeting system 
testing and it would be a shame not to use it where its strength is...


Again, we have a trainee working on that, which means things can get 
done here, and the point is to upstream. So feel free to discuss what you
want and we will do our best to fit it in our own approch

best regards

J?r?my

> 
> best regards,
> Andreas
> 
> 
> >
> > Since a while, I wanted to setup a small infrastructure to be able
> > to
> > describe specific test cases: a Buildroot configuration to build,
> > with
> > the ability to boot some of those configurations automatically in
> > Qemu.
> >
> > So I finally went ahead and create such a small infrastructure.
> > It's
> > very basic and minimal right now, and should be considered as an
> > experiment. It's available at:
> >
> >     https://github.com/tpetazzoni/buildroot-runtime-test
> >
> > It's based on the Python unittest mechanism, and allows to describe
> > test cases that consist in a Buildroot defconfig, plus a Python
> > function that can do some checks on the resulting build, boot the
> > system under Qemu, run some commands inside the Qemu system and
> > check
> > their results.
> >
> > I've written a few tests to show how it could work: simple tests
> > for
> > Dropbear and Python (on the package side) and several tests for
> > filesystem images: ext2/3/4, squashfs, jffs2, ubi, iso9660, yaffs2
> > (all
> > of them are boot tested, except yaffs2).
> >
> > For now, it's very crude and basic. The README file explains how it
> > works, and gives a TODO listing some of the things that for sure
> > need
> > to be improved.
> >
> > Currently, this runtime test infrastructure is not set up to be
> > executed every day on the latest Git, but it is obviously the goal.
> >
> > Contributions, comments and suggestions are welcome.
> >
> > Best regards,
> >
> > Thomas
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
