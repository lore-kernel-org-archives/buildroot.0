From: Alexandre PAYEN <alexandre.payen@smile.fr>
Date: Mon, 23 Sep 2019 10:32:35 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/python-scipy: new package
In-Reply-To: <8736gn7arz.fsf@geanix.com>
References: <20190920163656.6388-1-esben@geanix.com>
 <20190920163656.6388-4-esben@geanix.com>
 <da494137-121b-101c-b71a-04601589e55d@smile.fr> <8736gn7arz.fsf@geanix.com>
Message-ID: <CAC5PdM1xvXGA8NkXxYwwi9sEDhyQMO_MEOJ5aLcOfrJD3BK20g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Esben.

Le lun. 23 sept. 2019 ? 09:05, Esben Haabendal <esben@geanix.com> a ?crit :

> Hi Romain
>
> Romain Naour <romain.naour@smile.fr> writes:
>
> > There is a previous contribution to add python-scipy from Alexandre
> Payen:
> > http://patchwork.ozlabs.org/patch/1141144/
> >
> > It would be great if you can work with Alexandre on python-scipy package.
>
> Sounds good.
>
> Alexandre, do you have time to work on this?
>
I have some time if you need yes.

>
> > Le 20/09/2019 ? 18:36, Esben Haabendal a ?crit :
> >> ---
> >>  DEVELOPERS                             |  1 +
> >>  package/Config.in                      |  1 +
> >>  package/python-scipy/Config.in         | 21 +++++++++++++++
> >>  package/python-scipy/python-scipy.hash |  9 +++++++
> >>  package/python-scipy/python-scipy.mk   | 37 ++++++++++++++++++++++++++
> >>  5 files changed, 69 insertions(+)
> >>  create mode 100644 package/python-scipy/Config.in
> >>  create mode 100644 package/python-scipy/python-scipy.hash
> >>  create mode 100644 package/python-scipy/python-scipy.mk
> >>
> >> diff --git a/DEVELOPERS b/DEVELOPERS
> >> index 67a0fef0886d..975a197404bb 100644
> >> --- a/DEVELOPERS
> >> +++ b/DEVELOPERS
> >> @@ -723,6 +723,7 @@ F:       package/szip/
> >>  N:  Esben Haabendal <esben@haabendal.dk>
> >>  F:  boot/gummiboot/
> >>  F:  package/python-kiwisolver/
> >> +F:  package/python-scipy/
> >>
> >>  N:  Etienne Carriere <etienne.carriere@linaro.org>
> >>  F:  boot/optee-os/
> >> diff --git a/package/Config.in b/package/Config.in
> >> index dbf297f4df39..818a2abca591 100644
> >> --- a/package/Config.in
> >> +++ b/package/Config.in
> >> @@ -1056,6 +1056,7 @@ menu "External python modules"
> >>      source "package/python-scapy/Config.in"
> >>      source "package/python-scapy3k/Config.in"
> >>      source "package/python-schedule/Config.in"
> >> +    source "package/python-scipy/Config.in"
> >>      source "package/python-sdnotify/Config.in"
> >>      source "package/python-secretstorage/Config.in"
> >>      source "package/python-see/Config.in"
> >> diff --git a/package/python-scipy/Config.in
> b/package/python-scipy/Config.in
> >> new file mode 100644
> >> index 000000000000..5b8192266843
> >> --- /dev/null
> >> +++ b/package/python-scipy/Config.in
> >> @@ -0,0 +1,21 @@
> >> +config BR2_PACKAGE_PYTHON_SCIPY
> >> +    bool "python-scipy"
> >> +    depends on BR2_PACKAGE_PYTHON3
> >> +    depends on BR2_TOOLCHAIN_HAS_FORTRAN
> >> +    depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> >> +    depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> >> +    select BR2_PACKAGE_HOST_PYTHON_CYTHON
> >> +    select BR2_PACKAGE_HOST_PYTHON_NUMPY
> >
> > There is no such option, the dependency is trigged by adding
> host-python-numpy
> > in DEPENDENCIES;
>
> Ah, I wasn't aware of how host-foo packages in DEPENDENCIES works.
> I will remove the bogus select.
>
> >> +    select BR2_PACKAGE_PYTHON_NUMPY
> >> +    select BR2_PACKAGE_OPENBLAS
> >> +    select BR2_PACKAGE_CLAPACK
> >
> > Python-scipy can be used with lapack instead of Clapack.
> > Clapack is not maintained any more and really out of date.
>
> Yes, but as we currently only supports clapack for python-numpy builds,
> It seems a bit odd to do it different for python-scipy.
>
> What about adding python-scipy first, and then extending both
> python-numpy and python-scipy to support lapack as (an up-to-date)
> alternative to clapack afterwards?
>
This is exatcly what I did. I propose a virtual package for lapack/clapack.
But after digging into lapack/clapack, we realise this is much harder than
just adding a virtual package.

>
> > OpenBlas is using a bundled version of Lapack when gFortran compiler
> > is available. Clapack is an old f2c'ed version of lapack, so it can be
> > used without a Fortran Compiler. Since Python-scipy depends on
> > Fortran, Clapack can be removed from python-scipy.
> >
> > Actually there is an existing issue (discussed during the Buildroot
> > hackathon) on *blas providers. We need to fix this before adding new
> > packages using *blas libraries :-/
>
> Ok, so where does this place this work on python-scipy for now?
> Is it a 100% no-go until *blas providers are reworked?
>
For me, yes, the first setp is to fix those blas providers.
There is libflame[1], a lapack implementation and Blis[2], a blas
implementation.
`libflame includes a compatibility layer, lapack2flame, which includes a
complete LAPACK implementation.`
`While BLIS exports a new BLAS-like API, it also includes a BLAS
compatibility layer which gives application developers access to BLIS
implementations via traditional BLAS routine calls.`

This have to be test but I guess it could replace lapack/clapack and blas
implementation.
I suggest you to read the previous work on lapack/clapack and blas[3].

>
> I think it would be a shame to block python-scipy, as it is pretty
> useful package, and the effort to take it in (looking at this patch
> series) is pretty minimal.
>
> /Esben
>

Cheers,
Alexandre.

[1] : https://github.com/flame/libflame
[2] : https://github.com/flame/blis
[3] :
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-5-package-python-numpy-fix-occasional-build-and-run-time-failure-with-lapack-td228787.html#a228788
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/c7880a74/attachment.html>
