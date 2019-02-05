From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 19:12:34 -0600
Subject: [Buildroot] [PATCH v5 02/10] testing/infra: split runtime test
 from BRTest
In-Reply-To: <5c58e02dcb189_290e3faf9e14bcec12638@ultri5.mail>
References: <3f24bc0c-1e66-b4e5-760b-6ff354092c9e@mind.be>
 <5c58e02dcb189_290e3faf9e14bcec12638@ultri5.mail>
Message-ID: <CANQCQpbtW+uTx1pq4QNwwZWtNHU4eP57q6Y0j2ZGkKtb70NDdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,
On Mon, Feb 4, 2019 at 7:00 PM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Hello,
>
> + Matt
>
> On Mon, Feb 04, 2019 at 01:55 PM, Arnout Vandecappelle wrote:
>
> > On 12/05/2018 04:58, Ricardo Martincoski wrote:
> >> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> >>
> >> Move the setup of emulator to a new class, RuntimeTestBase, that bahaves
> >> exactly like BRTest currently does.
> >> It will avoid duplicating code when adding a common class to test the
> >> git download infra.
> >>
> >> Change all current test cases to use the new class.
> >> Do this by first using automatic replace:
> >> $ find support/testing/ -name '*.py' | \
> >>   xargs grep -l BRTest | \
> >>   xargs sed -i \
> >>     -e 's,import infra.basetest,\0\nimport infra.runtimetest,g' \
> >>     -e 's,infra.basetest.BRTest,infra.runtimetest.RuntimeTestBase,g'
> >> and then manually add code to import runtimetest in test_external.py to
> >> avoid this error:
> >>  AttributeError: 'module' object has no attribute 'LoadTestsFailure'
> >> This explicit import was not need before because run-tests imports
> >> BRTest and this is the only test file that do not use the defconfig
> >> fragments from basetest.py in its code.
> >>
> >> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> >> Cc: Arnout Vandecappelle <arnout@mind.be>
> >> ---
> >> WARNING: this patch changes all current test cases, so if a new test case was
> >> applied after this patch was sent, 'git am' will apply this patch cleanly, yet
> >> any testcase created in the meantime will be broken.
> >> But I can refresh it if need. It will probably only need the automatic replace
> >> from the commit log to be re-run.
> >
> >  This seems to be an optimisation rather than a requirement for the other
> > patches, so I haven't applied this - it needs to be refreshed first.
>
> It's an optimisation, but I failed to describe why it should be done first...
>
> The download test cases do not need to build anything before they run, so by
> splitting the two classes and making test_git to inherit from the new BRTest
> instead of RuntimeTestBase makes the download test cases to run really fast.
> The two test cases already on master, after applying and refreshing this patch,
> run in 35 seconds total in my machine.
> Less than 2 minutes each in the Gitlab CI auto-scale runners:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/156194310
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/156194313

If I understand correctly those are the only two at this point that
should use the BRTest class instead of the RuntimeTestBase, right?

> Unfortunately there is still some problem in my WIP refresh of the patch, so I
> can't send it now.
>
> >
> >  If you do so before Wednesday, we might still apply it.
>
> Unfortunately it's unlikely I can do in time.
>

I might be in the same situation after looking at the build failures.
I'll spend a bit more on it tonight but there are a lot of tests to
either spot check or run all.  I'm not sure yet if it is my build
machine's OS and python version or qemu at this point.

Matt
