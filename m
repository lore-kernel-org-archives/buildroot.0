From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 24 Feb 2009 19:15:46 +0100
Subject: [Buildroot] Buildroot 2009.02 released
References: <759168.10229.qm@web56905.mail.re3.yahoo.com>
Message-ID: <900CE22475EF47D0A5A712625604317D@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
  From: Frank Hoeflich 
  To: Ulf Samuelsson 
  Cc: buildroot at busybox.net 
  Sent: Sunday, February 22, 2009 8:22 AM
  Subject: Re: [Buildroot] Buildroot 2009.02 released


        Ulf:

        >fre 2009-02-20 klockan 09:23 +0100 skrev Peter Korsgaard:
        >> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
        >> 
        >> Hi,
        >> 
        >>  >> Some testing was certainly done, but more is ofcourse always welcome.
        >> 
        >>  Ulf> I am not aware that anyone but myself has published any test results.
        >> 
        >> I did for the toolchains, and for everything else I just fixed the
        >> problems when I found any.
        >> 
        >>  Ulf> There is no recommended way to publish test results.
        >>  Ulf> No recommended format etc.
        >> 
        >> Sure, like with all other issues - Add an issue to the tracker or mail
        >> the list, both preferably with a patch.
        >
        >You REALLY dont get it , do you?
        >
        >If you for once stopped seeing Buildroot as a hobby
        >and take the view of someone wanting to build 
        >a root file system without digging deep into 
        >the internals of Buildroot, then you would realize
        >that Bugzilla is NOT the way this shoudl be communicated.
        >
            OK, enough.  Ulf, I am asking you to stop taking this tone with Peter (and for that matter the rest of us).

            FWIW I agree with you (and more) that:
            1. Buildroot needs a real test plan for the new releases, and some method of
                distributing the test suite so that list members can contribute new individual tests as
                they see fit in order to fill out the BR test suite.

        The traditional way of testing buildroot is to make a "defconfig".
        I came to the conclusion that doing this is no good, since this will crash 
        on the first build error, and you will lose valuable time.
        It is also hard to get a nice log for each package.

        make <package> from the command line should work (assuming the .config file is OK)
        and that is why I generated the build script which goes through a number of packages
        and builds them printing out the result.

        I think the first decision we need to make, is if we can use defconfigs or not
        to fulfil a testplan.

        If we decide not to use the defconfigs, then we need to decide 
        how to implement package specific testing.
        Do we continue to use bash scripts, or do we use python or similar.

        My build script creates a result file which indicates if the package built OK or not OK.
        Not in html/xml format, which is a weakness,at first sight.
        We need to decide on the format of the test reports as well as the format of the
        documentation.

        For each package, it creates a build log which is moved to either
        log/OK or log/FAIL depending on success.
        I think we should consider making build reports available on a web server.

            2. Buildroot should meet its (reasonable) release test plan criteria before a release goes
                out the door, like any other software package worth its salt.  For now these could be
                pretty modest.

        So we need to agree on which host distributions we want to support,
        and then we need to have a list of reasonable combinations of packages/kernels

        Once the list of packages is available, then you could make a number of defconfigs,
        or you can forceenable each package by a select statement in the test harness.
        By introducing a package specific depend on !BR2_PACKAGE_<PACKAGE>_DISABLE
        you will have total control and ensure that you build identically root file systems
        for each archtiecture/host
        That is also a key decision.

        What is then lacking is any real test on H/W.
        It is nice if the package, build but that is no good, if the 
        end result does not boot, or does not behave as expected.

        Since some people may lack hardware but still be interested in helping
        building on a host, it would be good to publish binaries,
        which can be downloaded to targets and tested by others
        having access to the board

        We need to develop some kind of tests that uses the key functionality.


            3. Buildroot test results should be published and visible on the web and should cleanly
                hyperlink or otherwise refer back to test plan requirements.  Once the list agrees on a
                format for results it should be documented in the test plan.


            4. Buildroot test vectors should certainly include a reasonable selection of default
                configs, a representative set of architectures, host distributions and more.

            However, I do *not* agree that:
            1. Anyone active on this list is treating BR like a hobby.  Nor is it like a commercial
                product for which users may expect polished manuals and 24x7 support for their
                RTFM questions.  It's an open source project; users need to be willing and able to
                follow the list and/or query Bugzilla in order to check that something they're seeing is
                a known issue.

        Your comments above certainly shows that you see the problem with the current approach.
        I believe that the goal should be that noone sees any issues at all, unless they are
        interested in becoming a developer and contribute.
        This goal might not be shared by others, but it is sad, if people are against making
        Buildroot easier to use.

        For this to work, I think there is a need for configuration of user properties in buildroot.
        User properties are distinct from project properties, and should therefore not be 
        in the defconfigs.


            2. Issues posted to Bugzilla are not `in a usable format'.  They are searchable, are
                capable of being well-documented, may contain descriptive attachments as needed
                and have adequate flags for prioritisation and status.

        The context for this discussion, is how users perceive Buildroot.
        Bugzilla/mailing list is excellent to help resolve a problem, but is fairly 
        useless/timeconsuming if you want to figure out what will run and what will not.

            3. BR development should be targeted toward users `without too much knowledge'.
                Such users can always hire an active developer as an interpreter/jungle guide.  Linux
                and most of the open source world do not lend themselves at all well to users without
                a reasonable amount of hands-on knowledge.  `Fixing' that would mean grinding a
                much larger axe, I think.

        When design decisions are made, you often have a several ways to implement things.
        Some decisions will result in high maintenance and high learning threshold,
        and some will result in low maintenance and a low learning treshold.
        I want to see more of the latter, or a good argument why not.

            4. All of the testing and documentation issues mentioned should have been addressed
                in Buildroot's first release in years.  If this release serves 80%+ of the BR public
                with workaroundable annoyance only pending a next release of better stability, it will
                have done its job.  Getting to metricatable quality may take quite some time.


        Rome was not built in a day, but I think you can agree that there was *zero* effort
        to document anything for the first "release".

        I think that if this had gotten *any* priority, we would have now have a list of combinations
        host/arch/filesystems where this had been tested without delaying the release.
        There would certainly be holes, but since these would be visible, it would allow
        people to put in some effort to fill these holes.


            It may be that buildbot can nearly accommodate all of this now, or it may be that a good deal of further development is needed.
        --Frank

        BTW, Thanks for a constructive email!


        BR
        Ulf Samuelsson

       


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090224/776084c3/attachment.htm>
