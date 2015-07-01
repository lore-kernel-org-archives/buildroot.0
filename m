From: Denis Thulin <denis.thulin@openwide.fr>
Date: Wed, 1 Jul 2015 12:28:56 +0200 (CEST)
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <5593970D.3000707@andin.de>
Message-ID: <1090488407.2399576.1435746536696.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,

I'm answering your two emails inside this one

----- Mail original -----
> Hi Jeremy,
> 
> Am 30.06.2015 um 18:06 schrieb Jeremy Rosen:
> 
> >>> Our approch was mainly to have each package (on the buildroot
> >>> side
> >>> have its own RFW scriptlet and have buildroot assemble these
> >>> scriptlets at make time to provide a test for the resulting
> >>> system
> >>> that would only contain the tests for whatever package was
> >>> actually
> >>> compiled in.
> >>
> >> At some point I indeed though of having some per-package test
> >> cases
> >> directly in package/<foo>/, for each package. But you also anyway
> >> need
> >> to describe a complete Buildroot configuration for each test, in
> >> order
> >> to have a complete system that actually boots and make sense.
> >>
> >
> > yes and no... your approch is targeting the autobuild system, I was
> > more
> > thinking of providing tests for a user's own configuration or a
> > semi-randomly generated config. Easily testing on real hardware was
> > also part of the idea.
> >
> > If we want to combine the two, there would be a need for a base,
> > bootable
> > config (for example based on qemu) with a randomized overlay.
> >
> > The per-package part would help mainly with the randomly added
> > packages.
> > That would not prevent to also have a package independant base of
> > test
> > for the most basic functionalities. Per-Package also has the
> > advantage
> > that the tests will be maintained with the packages, thus by the
> > people
> > with the knowhow of what is being tested.
> >
> > overall I don't really see a reason not to have both approch. they
> > are
> > not really exclusive...
> >
> > now, one of the big difference is that you have host tests and
> > target
> > tests intermixed. That is a bit problematic if one wants to use
> > your
> > framework on a real board since the part responsible for starting
> > the card and login is intermixed with the test. Again, my use-case
> > is
> > slightly different from yours. Having host-side tests is
> > interesting
> > and something we hadn't thought of. It should not be very hard to
> > add
> > with a RFW approch if we go in that direction
> 
> I agree with most things above and indeed, what to test is not
> exactly
> that same in our approach and buildroots. But I think it's very
> possible
> and beneficial to combine the efforts.
> E.g. the deploy routines for our boards differ quite a bit. We solved
> this by implementing the same keyword in different (target-specific)
> resources, so the testcases using it doesnt need to change. When
> running
> the tests, we supply a DUT-specific variable file which then takes
> care
> of importing the correct resources with the applicable deploy step
> (and
> setting HW capabilities, and so on).
> 
> >
> > separating the target and host test (whatever approch is taken)
> > seems
> > like a good idea to me, a way to override/disable the boot/login
> > part
> > would allow users to run your tests on real hardware. That seems
> > like
> > a good idea independantly of the framework used.
> 
> This is something that can easily be done via tags and then just run
> --include host* or --include target*
> 
> 
> >> I've released my code with the intent that others can have a look
> >> and
> >> get a clear view of what the prototype looks like. Without seeing
> >> how
> >> it looks with RFW, I can't really make up my mind on whether it is
> >> a
> >> good alternate solution or not.
> >>
> >
> > Denis reimplemented an infrastructure to redo your tests. The
> > complete
> > infrastructure can be found here :
> >
> > https://github.com/etkaDT/Rfw-buildroot-tests
> >
> > Note that this is still a quick and dirty job that is not
> > integrated
> > into buildroot, but it can start the custom qemu to test things on
> > the target. A better integration could lead to easier keywords etc.
> >
> > Denis also included the output of running the python package test
> > in
> > the output/ subdirectory. The RFW specific XML is quite interesting
> > because it contains the complete decomposition of keywords and how
> > they failed (there is a failed test in the example)
> >
> > (Denis is the Open Wide trainee working on buildroot this summer,
> > he is the one pushing the scanpypy patch and the related
> > robotframework package)
> >
> > We hope this helps with the overall debate.
> 
> Well, great to have another RFW implementation to look at and learn!
> Remarkable also that you guys implemented the qemu part while I did
> the
> building part without even talking about it :)
> One obvious difference is that you create a large number of small
> almost
> atomic testcases while my testcase contain more of the steps that you
> probably would put into the prepare step. But I like the much more
> detailed report this approach leads to. Since RFW provides only for
> one
> keyword in the prepare step, this probably leads to having one
> prepare-keyword for almost every suite.
> So far I'm using a global keyword 'Connect And Login' in all my
> suites,

Well, I like having tests as atomic as possible and since the log
file gives a detailed report of everything including setups and
teardowns you can find easily why it failed.

I Also have a 'Boot And Connect'(it logs in too) keyword that I use
almost everywhere. It needs some variable to be set in each test
suite and a Keyword


> but it may be helpful to change that.
> 
> Btw, what Editor did you use for the creation?
> 

I used Vim with the robotframework plugin.
Unfortunately, the plugin only does syntax highlighting.

https://github.com/mfukar/robotframework-vim

Don't stop reading here, answer to your other mail is bellow

> 
> regards,
> Andreas
> 
> 
> 
> >
> >
> >> Best regards,
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Free Electrons
> >> Embedded Linux, Kernel and Android engineering
> >> http://free-electrons.com
> >>
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 



> Hi Thomas, Jeremy,
> 
> here is my first shot:
> https://bitbucket.org/anaum/br_robot

I noticed you used the Operating System library's keyword
"Run And Return Rc" but I read in the Process Library's documentation
that using Operating System for running programs was no longer
recommanded and that functionnality would most likely become
deprecated. It seems like using Process was the correct way to go.
See:
http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
and
http://robotframework.org/robotframework/latest/libraries/Process.html

> 
> For now I have implemented building a config and running the ext2/3/4
> filesystem checks. Didnt get around doing the qemu part yet, but it
> should be enough to get the idea. Just follow the README.
> Install the RIDE editor if you can, even though it crashes sometimes
> it
> makes the structure very clear and provides additional debug output
> while executing the tests.
> 
> Also I have not invested in test documentation, but look at the
> report/log.html and see if that's suitable. Comments on other
> interesting features below...
> 
> 
> >> syntax you have to learn, while Python is known by a large number
> >> of
> >> people already.
> True to some extend, and I must admit that the variable syntax takes
> a
> little getting used to.
> But besides that the API documentation for the libraries is very good
> and what's more, if you use RIDE editor to write the testcases (which
> I
> do almost exclusively), you hardly have to worry about the syntax. It
> works a bit Excel-like, suggests keywords and shows their
> documentation
> in a tooltip when pressing CTRL). Helps in navigation from testcases
> to
> keyword implementation, does global rename...
> 
> 
> > pretty good, RFW can report in an xunit-compatible xml which can be
> > easily parsed by whatever tool you prefer. I have been
> > autogenerating
> > reports with it for quite some time
> 
> I'd be interested, how is that different from the report.html that
> you
> mention below? What tools are you using?

Just pybot with option '-x filename' create a xunit file in addition to the
usual log/output/report file.


Regards,

Denis

> 
> > RFW also generates some HTML pages ready to be pushed on a server,
> > but that's less usefull for the buildroot use-case.
> 
> On feature that I really like is the html linkage of the test report
> to
> the log, so often it's possible to find the problematic spot without
> digging through ascii-logfiles. Have a look at that and maybe make a
> testcase fail.
> >
> >> Can it run tests in parallel?
> >
> > no, RFW core has no parallel testing capabilities by itself. There
> > are plugins to do that, though...
> 
> Well I havnt looked at any parallel plugin, but you can start the
> pybot
> execution as often as you like. It's just a matter of defining
> different
> tests for different runs. I think the tagging feature helps a lot
> with
> that. E.g. each package specific tests would be tagged with their
> package name and then you would have a run for each tag starting with
> a*, b*, ... so about 26 threads running side by side.
> Another solution could be running each suite separatly.
> 
> There's a tool called rebot which can be used to combine the results
> (output.xml) of the different runs.
> 
> And there's an option in pybot to run just tests that either failed
> or
> have not been executed in a previous run (using the previous
> output.xml).
> 
> >> Can we
> >> easily integrate the tests with Jenkins to have them run everyday?
> 
> The jenkins plugin works great, we use it in combination with jenkins
> matrix jobs to get the parallelization. At the moment we run about 10
> different targets in our testbed, but they mostly do the same tests
> with
> different configuration data. Anyway there's a job at the end that
> accumulates all the results into one report.
> 
> And finally we are interested in getting more coverage in that report
> as
> well as we would be able to provide results from real HW instead of
> qemu
> only. So of course I'd be happy to see a way of integrating
> buildroots
> test with our system...
> 
> 
> regards,
> Andreas
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
