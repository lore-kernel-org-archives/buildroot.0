From: Esben Haabendal <esben@geanix.com>
Date: Mon, 23 Sep 2019 10:51:33 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/python-scipy: new package
In-Reply-To: <CAC5PdM1xvXGA8NkXxYwwi9sEDhyQMO_MEOJ5aLcOfrJD3BK20g@mail.gmail.com>
 (Alexandre PAYEN's message of "Mon, 23 Sep 2019 10:32:35 +0200")
References: <20190920163656.6388-1-esben@geanix.com>
 <20190920163656.6388-4-esben@geanix.com>
 <da494137-121b-101c-b71a-04601589e55d@smile.fr>
 <8736gn7arz.fsf@geanix.com>
 <CAC5PdM1xvXGA8NkXxYwwi9sEDhyQMO_MEOJ5aLcOfrJD3BK20g@mail.gmail.com>
Message-ID: <878sqf5rai.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre

Alexandre PAYEN <alexandre.payen@smile.fr> writes:

>> Alexandre, do you have time to work on this?
>>
> I have some time if you need yes.

Great :)

>> >> +    select BR2_PACKAGE_PYTHON_NUMPY
>> >> +    select BR2_PACKAGE_OPENBLAS
>> >> +    select BR2_PACKAGE_CLAPACK
>> >
>> > Python-scipy can be used with lapack instead of Clapack.
>> > Clapack is not maintained any more and really out of date.
>>
>> Yes, but as we currently only supports clapack for python-numpy builds,
>> It seems a bit odd to do it different for python-scipy.
>>
>> What about adding python-scipy first, and then extending both
>> python-numpy and python-scipy to support lapack as (an up-to-date)
>> alternative to clapack afterwards?
>>
> This is exatcly what I did. I propose a virtual package for lapack/clapack.
> But after digging into lapack/clapack, we realise this is much harder than
> just adding a virtual package.

What is harder, adding python-scipy first?

If so, I think you might been hindered by a cross-compilation unfriendly
mechanism in numpy distutils, which I have got a fix into numpy for.
Please take a look at 
https://github.com/numpy/numpy/pull/14495/commits/153fc148eec60e5cbec0e80617f75a3a5dd2a3f8

and how I use that in my python-scipy recipe sent to this list.

With that, I think the python-scipy recipe looks pretty simple and
innocent, and I don't think that merging it should be a problem for
reworking lapack/clpack/*blas later on.

>> > OpenBlas is using a bundled version of Lapack when gFortran compiler
>> > is available. Clapack is an old f2c'ed version of lapack, so it can be
>> > used without a Fortran Compiler. Since Python-scipy depends on
>> > Fortran, Clapack can be removed from python-scipy.
>> >
>> > Actually there is an existing issue (discussed during the Buildroot
>> > hackathon) on *blas providers. We need to fix this before adding new
>> > packages using *blas libraries :-/
>>
>> Ok, so where does this place this work on python-scipy for now?
>> Is it a 100% no-go until *blas providers are reworked?
>>
> For me, yes, the first setp is to fix those blas providers.

Ok, but wouldn't it help having the python-scipy in here to have a good
use-case for working with all this?

> There is libflame[1], a lapack implementation and Blis[2], a blas
> implementation.
> `libflame includes a compatibility layer, lapack2flame, which includes a
> complete LAPACK implementation.`
> `While BLIS exports a new BLAS-like API, it also includes a BLAS
> compatibility layer which gives application developers access to BLIS
> implementations via traditional BLAS routine calls.`
>
> This have to be test but I guess it could replace lapack/clapack and blas
> implementation.
> I suggest you to read the previous work on lapack/clapack and blas[3].

I am not at all a lapack user/developer, just trying to build something
with it, so please bear with me.

You write that the python-scipy requires lapack (and thus implicitl that
it does not work with clapack).  Why is that?  It seems to WORKSFORME,
so what am I missing?

>> I think it would be a shame to block python-scipy, as it is pretty
>> useful package, and the effort to take it in (looking at this patch
>> series) is pretty minimal.

> [3] :
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-5-package-python-numpy-fix-occasional-build-and-run-time-failure-with-lapack-td228787.html#a228788


/Esben
