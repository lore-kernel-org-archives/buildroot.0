From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Mar 2016 14:43:56 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
In-Reply-To: <CAAMH-ytxJVmVc_D0aREVisnsU-UPX1-po6WtX4HYHz85XOA+Wg@mail.gmail.com>
References: <20160304095534.GA16799@kwain>
 <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
 <20160304121347.5f73916e@free-electrons.com>
 <CAAMH-yu=iTaYySHSDDzK1kGeQR5WJNYNLdZ3E_OYagLv48o9YQ@mail.gmail.com>
 <20160304141915.547758f0@free-electrons.com>
 <CAAMH-ytxJVmVc_D0aREVisnsU-UPX1-po6WtX4HYHz85XOA+Wg@mail.gmail.com>
Message-ID: <20160304144356.4f463489@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Fri, 4 Mar 2016 14:35:55 +0100, Gary Bisson wrote:

> >> Well if we are allowed to modify qtbase I guess it would be way
> >> easier. Would something like this be acceptable?
> >> index 64a7f65..aa54b3e 100644
> >> --- a/package/qt5/qt5base/Config.in
> >> +++ b/package/qt5/qt5base/Config.in
> >> @@ -201,10 +201,14 @@ config BR2_PACKAGE_QT5BASE_EGLFS
> >>         select BR2_PACKAGE_QT5BASE_OPENGL
> >>         depends on BR2_PACKAGE_HAS_LIBEGL
> >>         depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> >> +       depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
> >>
> >>  comment "eglfs backend available if OpenGL and EGL are enabled"
> >>         depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT5_GL_AVAILABLE
> >>
> >> +comment "eglfs backend not available for X11 version of i.MX 3D libraries"
> >> +       depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
> >> +
> >
> > No this is not good, because there are other OpenGL implementations
> > than imx-gpu-viv. So at the very least, you would need something like
> > the below. I also believe it makes more sense to use positive
> > condition, i.e express a dependency on the FB output, rather than a
> > dependency on not having the X11 output.
> >
> >         # If the imx-gpu-viv implementation is used, we need its FB variant
> >         depends on !BR2_PACKAGE_IMX_GPU_VIV || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
> >
> > comment "eglfs backend needs the FB output of i.MX GPU libraries"
> >         depends on BR2_PACKAGE_IMX_GPU_VIV && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
> 
> I agree using the positive condition is better. However I'm not sure
> to understand why !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 wouldn't work
> with other OpenGL implementations. This variable is only set when
> selecting the vivante package + x11 output. So for any other
> implementation it wouldn't be set. It's just out of curiosity that I'd
> like to understand the difference.

Aah, yes, you're right. Your version is functionally equivalent to mine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
