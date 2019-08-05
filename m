From: Alexandre PAYEN <alexandre.payen@smile.fr>
Date: Mon, 5 Aug 2019 14:49:42 +0200
Subject: [Buildroot] [PATCH 2/5] package/liblapack: add liblapack as
 virtual package with lapack and clapack as providers.
In-Reply-To: <CAAXf6LW9yFWy5em_NyP1mgWWBQdcWXs=LJsMhXD73=sZogEegQ@mail.gmail.com>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-2-romain.naour@smile.fr>
 <90898cde-8ddf-8b6a-196e-5e42f7f9fa55@mind.be>
 <CAAXf6LW9yFWy5em_NyP1mgWWBQdcWXs=LJsMhXD73=sZogEegQ@mail.gmail.com>
Message-ID: <CAC5PdM3UfOYLiPQ=nF_8N_vp=oNdvsmhn=+mmXZAhTcCkShTug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all.

Le lun. 5 ao?t 2019 ? 14:27, Thomas De Schampheleire <
patrickdepinguin@gmail.com> a ?crit :

> El s?b., 3 ago. 2019 a las 12:23, Arnout Vandecappelle
> (<arnout@mind.be>) escribi?:
> >
> >  Hi Alex, Romain,
> >
> > On 01/08/2019 23:09, Romain Naour wrote:
> > > lapack and clapack are both generating the same liblapack.so but does
> not have
> > > the same symbols. So the run-time is broke. They have to exclude each
> other.
> >
> >  We discussed this at the hackaton and reviewed all the options that were
> > discussed before on the mailing list, and we concluded that the simplest
> > solution is to remove clapack entirely. Everything that uses clapack
> (i.e.,
> > armadillo and numpy) can use lapack as well, as you mention, so the only
> reason
> > to keep clapack would be to support toolchains without Fortran compiler.
> Most of
> > our external toolchains do have Fortran support, and I expect that
> anybody who
> > cares about maths wouldn't mind enabling Fortran in their toolchains.
> >
> >  If anybody disagrees with that, now is the time to speak up :-)
> >
>
> There may be cases where a toolchain is provided by a third-party,
> e.g. a silicon vendor like Marvell.
> In this case, Fortran is not necessarily provided. Depending on that
> third-party, it may or may not be easy to get this fixed.
>
> In our case, we have some boards with a toolchain from Marvell (no
> Fortran) and others where we build the toolchains ourselves. In both
> cases we have armadillo with clapack. Recently, we wanted to use
> openblas, and getting clapack to work as lapack backend for openblas
> did not seem to work. So for those boards were it mattered, we enabled
> fortran and let openblas use its own lapack implementation. For the
> boards with Marvell toolchain, we planned to keep the existing
> armadillo+clapack situation.
>
> So removing clapack altogether would not be desirable for that case.
>
> Note also that openblas also has lapack inside its sources. So it
> could also a provider for liblapack in the case of a virtual-package
> situation.
>
Okay, good to know, I will check in this way also. I will check which
package use
libopenblas.so and how it use it.

>
> I searched but could not find extensive discussion on the mailing list
> regarding this topic.
> What is the actual problem with introducing a virtual-package?
>
So, for want I know and understand :
- lapack and clapack generate the same library files : liblapack.so and
libblas.so.
- lapack generate libcblas.so and clapack does not.
- lapack can be built with complex support. It double the size of the
library so it
should add a lot of symbols. I guess clapack is already built with complex
support but I'm not sure ...

A new idee is to introduce virtual package to generate :
- liblapack.so
- libblas.so
- libcblas.so
with lapack and clapack as providers.
As you said Thomas, openblas has it own lapack implementation so,
we could add openblas as a provider and create a symbolic link to
liblapack.so.
I will inspect those implementations using readefl or a similar tool and
try to
assert that we can use this solution.

Regards,
Aalx.


> Thanks,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190805/b428865f/attachment.html>
