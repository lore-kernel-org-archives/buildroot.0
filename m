From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 7 Mar 2016 11:38:00 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
In-Reply-To: <20160307101854.GD25875@kwain>
References: <20160304095534.GA16799@kwain>
 <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
 <20160304135016.GB16799@kwain>
 <CAAMH-yuNZfDaQC9QwMC5gJ2Rp2YiDmZvRWL4wY_Fni5+VckJAw@mail.gmail.com>
 <20160307101854.GD25875@kwain>
Message-ID: <CAAMH-yvXYFD2V-EHsmkyvWehQeCJD4AYYYPraQWsE1cLTrmpHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On Mon, Mar 7, 2016 at 11:18 AM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:
>
> On Fri, Mar 04, 2016 at 02:58:37PM +0100, Gary Bisson wrote:
> > On Fri, Mar 4, 2016 at 2:50 PM, Antoine Tenart
> > <antoine.tenart@free-electrons.com> wrote:
> > > On Fri, Mar 04, 2016 at 12:02:31PM +0100, Gary Bisson wrote:
> > >> On Fri, Mar 4, 2016 at 10:55 AM, Antoine Tenart
> > >> <antoine.tenart@free-electrons.com> wrote:
> > >> >
> > >> > I've run into a build failure while compiling an image, when building
> > >> > QT5. I made some build tests to narrow down the issue and found the
> > >> > configuration leading to this: when compiling an image with both
> > >> > BR2_PACKAGE_QT5BASE_EGLFS and BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 the
> > >> > build fails with the following error:
> > >> >
> > >> > http://code.bulix.org/qxj1bn-92391?raw
> > >>
> > >> Indeed that's a problem. It looks like the question has been raised in
> > >> the Yocto community not so long ago:
> > >> https://github.com/Freescale/meta-fsl-arm/commit/da8f520a
> > >>
> > >> It looks like their patch is to define EGL_API_FB although X11 is in
> > >> use. I imagine we could do the same using J?r?me's approach but
> > >> depending on EGLFS define:
> > >> https://git.buildroot.net/buildroot/tree/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk#n55
> > >>
> > >> However I guess that would only fix the build but would cause issues
> > >> at runtime which might be confusing for users.
> > >
> > > It's not possible to ensure every possible configuration will be
> > > working. A simple example would be to compile a bootloader for a board A
> > > and a kernel for a completely different board B.
> > >
> > > Here, the configuration leading to this build error does not make sense.
> > > So if we only fix the build, leading to an unusable image I guess that
> > > would be OK. (And fixing the build is important, for build bots for
> > > example).
> >
> > I agree but here Thomas gave a green light on modifying the qtbase
> > package directly for this corner case which fixes both the build and
> > possible runtime issues.
>
> Reading Thomas' mail, I don't think he gave a green light on this.

Green light might be an overstatement indeed, but let's say he's not
against this kind of solution.

> So we still have to choose a solution to fix this (which may be the one
> directly modifying the qt5base package, but we first need to agree on
> the solution).

I agree, I think we have 2 viable solutions so far:
1) modifying the qt5base for this corner which fixes both the build
and runtime issues
2) modifying the eglvivante.h which is a more elegant solution but
only fixes the build, not the runtime issues.

I'm in favor of #1 because it's easy to implement, fixes both runtime
and build plus I personally don't have much time to test #2.

Regards,
Gary
