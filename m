From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 4 Mar 2016 12:02:31 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
In-Reply-To: <20160304095534.GA16799@kwain>
References: <20160304095534.GA16799@kwain>
Message-ID: <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

Adding J?r?me in cc since he's the one behind the x11/fb selection as
well as qt5 graphics support for i.MX.

On Fri, Mar 4, 2016 at 10:55 AM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:
> Hi all,
>
> I've run into a build failure while compiling an image, when building
> QT5. I made some build tests to narrow down the issue and found the
> configuration leading to this: when compiling an image with both
> BR2_PACKAGE_QT5BASE_EGLFS and BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 the
> build fails with the following error:
>
> http://code.bulix.org/qxj1bn-92391?raw

Indeed that's a problem. It looks like the question has been raised in
the Yocto community not so long ago:
https://github.com/Freescale/meta-fsl-arm/commit/da8f520a

It looks like their patch is to define EGL_API_FB although X11 is in
use. I imagine we could do the same using J?r?me's approach but
depending on EGLFS define:
https://git.buildroot.net/buildroot/tree/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk#n55

However I guess that would only fix the build but would cause issues
at runtime which might be confusing for users.

> I understand this configuration can't work, but as this leads to a
> build issue we might need to think about a solution. We could disallow
> such a configuration tuple, or fix the build.
>
> Any idea?

I'm afraid forcing the imx-gpu-viv package output format depending on
qt5 graphical back end would bring many "recursive dependency" issues.

J?r?me, what are your thoughts?

Thanks,
Gary
