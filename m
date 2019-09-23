From: Alexandre PAYEN <alexandre.payen@smile.fr>
Date: Mon, 23 Sep 2019 14:55:04 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/python-scipy: new package
In-Reply-To: <874l135ge8.fsf@geanix.com>
References: <20190920163656.6388-1-esben@geanix.com>
 <20190920163656.6388-4-esben@geanix.com>
 <da494137-121b-101c-b71a-04601589e55d@smile.fr> <8736gn7arz.fsf@geanix.com>
 <CAC5PdM1xvXGA8NkXxYwwi9sEDhyQMO_MEOJ5aLcOfrJD3BK20g@mail.gmail.com>
 <878sqf5rai.fsf@geanix.com>
 <CAC5PdM2rfL0eLcQ33RLwcqT5-vr-ZRM+mmffPA9ZQDRsi39ahg@mail.gmail.com>
 <874l135ge8.fsf@geanix.com>
Message-ID: <CAC5PdM3VTFNL6HYjG15ytLGLD8o1fK7t9FCPfzcQ2sNQp9rvDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Esben,

Le lun. 23 sept. 2019 ? 14:46, Esben Haabendal <esben@geanix.com> a ?crit :

> Hi Alexandre
>
> Alexandre PAYEN <alexandre.payen@smile.fr> writes:
>
> > Le lun. 23 sept. 2019 ? 10:51, Esben Haabendal <esben@geanix.com> a
> ?crit :
> >
> >> Alexandre PAYEN <alexandre.payen@smile.fr> writes:
> >>
> >>> This is exatcly what I did. I propose a virtual package for
> >>> lapack/clapack.  But after digging into lapack/clapack, we realise
> >>> this is much harder than just adding a virtual package.
> >>
> >> What is harder, adding python-scipy first?
> >>
> > No, lapack/clapack and blas.
>
> Ok.  So while delaying addition of python-scipy with a relatively simple
> virtual package change, we now have a much harder task at hand.
>
> >> If so, I think you might been hindered by a cross-compilation unfriendly
> >> mechanism in numpy distutils, which I have got a fix into numpy for.
> >> Please take a look at
> >>
> >>
> https://github.com/numpy/numpy/pull/14495/commits/153fc148eec60e5cbec0e80617f75a3a5dd2a3f8
> >>
> >> and how I use that in my python-scipy recipe sent to this list.
> >>
> >> With that, I think the python-scipy recipe looks pretty simple and
> >> innocent, and I don't think that merging it should be a problem for
> >> reworking lapack/clpack/*blas later on.
> >
> > Yes, there was a cross-compilation problem. But we fix it poorly, I
> assume
> > your commit do the job.
>
> I believe it does.
>
> > I think adding python-scipy is not relevant because we don't understand
> > lapack/clapack and blas properly.
>
> Well, addition of python-scipy is relevant for me, as I need to have
> support for it.  It is a firm product requirement, so the lack of it
> requires me to carry it in an overlay or to maintain patches for it.
>
> > We need to fix blas/lapack before adding packages which uses it.
>
> It might be old, but clapack seems to do the job for python-scipy.  So I
> don't see that we *need* to do something to blas/lapack before adding
> python-scipy, but it definitely sounds like it would be good to do
> something about it, with or without python-scipy.
>
> >> >> > OpenBlas is using a bundled version of Lapack when gFortran
> compiler
> >> >> > is available. Clapack is an old f2c'ed version of lapack, so it
> can be
> >> >> > used without a Fortran Compiler. Since Python-scipy depends on
> >> >> > Fortran, Clapack can be removed from python-scipy.
> >> >> >
> >> >> > Actually there is an existing issue (discussed during the Buildroot
> >> >> > hackathon) on *blas providers. We need to fix this before adding
> new
> >> >> > packages using *blas libraries :-/
> >> >>
> >> >> Ok, so where does this place this work on python-scipy for now?
> >> >> Is it a 100% no-go until *blas providers are reworked?
> >> >>
> >> > For me, yes, the first setp is to fix those blas providers.
> >>
> >> Ok, but wouldn't it help having the python-scipy in here to have a good
> >> use-case for working with all this?
> >
> > Yes, why not.
>
> Ok, let's try to get a simple and clean python-scipy recipe in.
>
> >> > There is libflame[1], a lapack implementation and Blis[2], a blas
> >> > implementation.
> >> > `libflame includes a compatibility layer, lapack2flame, which
> includes a
> >> > complete LAPACK implementation.`
> >> > `While BLIS exports a new BLAS-like API, it also includes a BLAS
> >> > compatibility layer which gives application developers access to BLIS
> >> > implementations via traditional BLAS routine calls.`
> >> >
> >> > This have to be test but I guess it could replace lapack/clapack and
> blas
> >> > implementation.
> >> > I suggest you to read the previous work on lapack/clapack and blas[3].
> >>
> >> I am not at all a lapack user/developer, just trying to build something
> >> with it, so please bear with me.
> >>
> > No one really use lapack, python-scipy use it, by building python-scipy,
> > you kind of become a lapack user.
>
> True.  But, but it does not make me any more knowledgeable of the API or
> internals.
>
> >> You write that the python-scipy requires lapack (and thus implicitl that
> >> it does not work with clapack).  Why is that?  It seems to WORKSFORME,
> >> so what am I missing?
> >>
> > No, clapack is just a C implementation of lapack. It had been generated
> in
> > C from fortran code with f2c.
> > Clapack is not maintained any more as lapack but there are still old.
>
> I am with you so far.
>
> > Also, lapack need a fortran compiler as python-numpy/python-scipy then
> > you should use lapack instead of clapack.
>
> Well, I don't *have* to use lapack instead of clapack.  I could, and you
> could argue I should.
>
> But with this patch series, buildroot can build python-numpy and
> python-scipy using clapack, for a working numpy/scipy enabled rootfs.
> That sounds quite useful to me.
>
> If I send a slightly modified version of this patch series, will you
> give it a review and see if we can agree on a form that can get merged
> now?
>
Please, proceed, I will review it.

>
> /Esben
>

Alexandre
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/0586da5a/attachment.html>
