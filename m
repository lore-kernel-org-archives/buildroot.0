From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri, 4 Mar 2016 14:50:16 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
In-Reply-To: <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
References: <20160304095534.GA16799@kwain>
 <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
Message-ID: <20160304135016.GB16799@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 04, 2016 at 12:02:31PM +0100, Gary Bisson wrote:
> On Fri, Mar 4, 2016 at 10:55 AM, Antoine Tenart
> <antoine.tenart@free-electrons.com> wrote:
> >
> > I've run into a build failure while compiling an image, when building
> > QT5. I made some build tests to narrow down the issue and found the
> > configuration leading to this: when compiling an image with both
> > BR2_PACKAGE_QT5BASE_EGLFS and BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 the
> > build fails with the following error:
> >
> > http://code.bulix.org/qxj1bn-92391?raw
> 
> Indeed that's a problem. It looks like the question has been raised in
> the Yocto community not so long ago:
> https://github.com/Freescale/meta-fsl-arm/commit/da8f520a
> 
> It looks like their patch is to define EGL_API_FB although X11 is in
> use. I imagine we could do the same using J?r?me's approach but
> depending on EGLFS define:
> https://git.buildroot.net/buildroot/tree/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk#n55
> 
> However I guess that would only fix the build but would cause issues
> at runtime which might be confusing for users.

It's not possible to ensure every possible configuration will be
working. A simple example would be to compile a bootloader for a board A
and a kernel for a completely different board B.

Here, the configuration leading to this build error does not make sense.
So if we only fix the build, leading to an unusable image I guess that
would be OK. (And fixing the build is important, for build bots for
example).

Another solution, fixing both the build and the generated image could be
to define other virtual packages for the EGL implementation. We could
end up with the following for imx-gpu-viv:

	select BR2_PACKAGE_HAS_LIBEGL
	select BR2_PACKAGE_HAS_LIBEGL_X11

and

	select BR2_PACKAGE_HAS_LIBEGL
	select BR2_PACKAGE_HAS_LIBEGL_FB

This would still allow packages to depend on BR2_PACKAGE_HAS_LIBEGL,
while allowing a fine dependency check given the EGL output.

Exact implementation of these new virtual packages can be debated if
the solution is approved. (Like do we make them select
BR2_PACKAGE_HAS_LIBEGL or do we still select it manually in all the
packages providing an EGL implementation).

The drawback is we need to patch all EGL implementations, to fix a
build issue introduced by only one of them.

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160304/032c60cb/attachment.asc>
