From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 30 Oct 2020 10:25:37 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <20201030101559.0a1fb98c@windsurf.home>
References: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
 <57-5f9bc680-3-4a87f08@125885651> <20201030091929.18f77130@windsurf.home>
 <CAMRc=MexG_jDoNuuVzRmNqHD56yYJmwzq43JgGo38equmPiqzQ@mail.gmail.com>
 <20201030101559.0a1fb98c@windsurf.home>
Message-ID: <CAMRc=MfwZVv10O2DsQitxDsXdpXRSC29VpvqTkC81CkOBUFoLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 30, 2020 at 10:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Bartosz,
>
> On Fri, 30 Oct 2020 09:42:01 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > > What worries a bit with supporting both 1.4 and 1.6, and in the future
> > > say 1.4, 1.6 and 2.0 is that newer versions are likely to introduce new
> > > APIs. Applications may rely on such new APIs. When the kernel headers
> > > are recent enough, a recent version of libgpiod will be used, and such
> > > applications will build properly. But as soon as soon builds a system
> > > with older kernel headers, libgpiod will downgrade to an older version,
> > > providing potentially less APIs, and therefore breaking any application
> > > using them.
> >
> > In yocto this can be handled by providing multiple versions of a
> > package and then making any recipes that need it depend on at-least
> > certain version of it - is buildroot capable of doing something like
> > this?
>
> No, what we typically do is have separate packages for libraries which
> have major versions with significantly different APIs.
>
> > I don't entirely agree. v1.6 is backward compatible with v1.4 (API-
> > and ABI-wise) - programs linked against v1.4 will work with v1.6. v1.6
> > will still work with older kernels (granted it's built with v5.5
> > headers) but any operations that require new kernel features will
> > simply fail at the kernel level. If users don't use these new
> > features, the library works the same.
> >
> > The whole goal of developing a new major release (v2.0) is to rework
> > the public API entirely and also use uAPI v2. Otherwise it would be
> > impossible to support new kernel features. This kind of API breakage
> > has been done by many projects: look at gtk2 & gtk3, gstreamer0 and
> > gstreamer1, python2 and python3 and probably many others. And libgpiod
> > is a rather small library with not many reverse dependencies so far.
> >
> > Libgpiod v2.0 will use the new kernel uAPI and thus require at least
> > the kernel version where this uAPI first appeared. Just like libgpiod
> > v1.x won't work with kernels pre v4.6, libgpiod v2.x won't work with
> > kernels pre v5.10. I don't see how that's a problem.
> >
> > > I am still highly doubtful of the strategy chosen by upstream libgpiod
> > > here.
> > >
> >
> > I think you're overestimating the impact here. For now the master
> > branch moves forward towards a stable v2.0 API. Users are definitely
> > not encouraged to use it ATM. v1.4 and v1.6 are the currently
> > supported stable branches. v1.4 builds and works with linux v4.6. v1.6
> > builds with linux v5.5 but still works with v4.6 unless the user calls
> > new functions (set_config, bias flags, etc.) where it will fail at
> > run-time but older user programs can still link against it.
> >
> > Let me know if I'm missing something but I really prefer to avoid an
> > ifdef hell and QA mess with supporting earlier kernels with v2.0.
>
> I think as long as there's really a 1.x series that is entirely API
> compatible, and then another 2.x series that is entirely API
> compatible, but different than 1.x, then it's fine indeed.
>
> We can use the 1.4/1.6 conditional in libgpiod.mk, as 1.4 and 1.6 are
> guaranteed to offer the same API to users of the libraries.
>

Unless the users use symbols that only first appeared in v1.6. v1.4 is
compatible with v1.6 (v1.6 doesn't change/remove any symbols), not the
other way around (v1.6 added new symbols).

> And once libgpiod2 is out, we'll have a separate libgpiod2.mk.
>
> Would that work ?
>

I think so. Just please note that SONAME of libgpiod right now is
libgpiod.so.2 because of an ABI change early in the development. So
SONAME for libgpiod2 will actually be libgpiod.so.3 - nothing we can
do about it I'm afraid. I'll surely guarantee ABI and API stability
over all minor releases of v2.x series.

> If so, then it's fine for me.
>
> Thanks for explaining your strategy. It's great to have upstream
> directly on-board in these discussions!
>

Sure! One thing I forgot to mention: I actually consider writing a
compatibility layer for libgpiod - a one that would allow users to
link against the compatibility library as if they were using libgpiod
v1.x but it would actually translate the calls to libgpiod v2.x.
Something that libusb did.

Bartosz
