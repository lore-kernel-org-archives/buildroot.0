From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Feb 2014 19:05:34 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <20140207174355.383b6bb3@skate>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
 <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
 <20140207162934.01acfe5a@skate>
 <CAHkwnC-pAGs0DCu80X3_AQgrsxcOO82GMY7NwmegxT6V0_kwJw@mail.gmail.com>
 <20140207174355.383b6bb3@skate>
Message-ID: <CAHkwnC9Ayss7OYdSTbSp07LKy0GQ801TCdgxiVSNPpKew8i0OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 7, 2014 at 5:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 7 Feb 2014 16:54:20 +0100, Fabio Porcedda wrote:
>
>> > And in practice, how do you achieve this? When building in parallel,
>> > how do you record the fact that the test for libfoo in package A
>> > configure script was run before or after the installation of libfoo in
>> > the global sysroot? It's not only about recording the order of the
>> > build of the package: it's knowing whether each specific test of a
>> > configure script was run before or after the corresponding library was
>> > installed in the global sysroot.
>>
>> Well i admit i haven't thought about that corner case, I don't know an
>> easy solution for that.
>
> IMO this is not a corner case, this is precisely the problem we have
> been pointing out since the beginning when mixing a global sysroot with
> top-level parallelization.

With speaking about the corner case i mean the overlapping of the
configuration and installation steps,
because even when configurations and installations steps do not
overlap  there is still the problem of the building order,
the solution of replaying the steps solve only this issue, as you pointed out.

>> > I think we should really not minimize the support problem that
>> > parallelization without per-package sysroot is going to cause.
>>
>> My suggestion was based on the assumption that there is a way to
>> reproduce the exact build order.
>> But if that is not true i agree with you.
>
> I don't really see how to reproduce the exact build order, so the
> support problem will be here. That's really why I have been a bit
> skeptical and resistant to this patch series from the very beginning. I
> am obviously very interested in ways to reduce the build time. But
> doing that at the expense of reliability is not a good idea in my
> opinion, as users will face spurious failures that we will not be able
> to reproduce and fix.

About the spurious failures when building packages in parallel  IMHO
they depends only on the building order of the finished steps.
If a build fails IMHO it depends on something that is not available so
those failures can be reproduced considering only the finished steps
and ignoring the overlapping unfinished steps.
What do you think about that?

> If we want to get this to the next level, someone need to experiment
> with per-package sysroot. Of course, this would be a long experiment,
> without necessarily at the end the guarantee that we will accept it,
> because it may be too complex to match Buildroot simplicity principle.

Best regards
-- 
Fabio Porcedda
