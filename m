From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 4 Mar 2016 14:10:58 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
In-Reply-To: <20160304121347.5f73916e@free-electrons.com>
References: <20160304095534.GA16799@kwain>
 <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
 <20160304121347.5f73916e@free-electrons.com>
Message-ID: <CAAMH-yu=iTaYySHSDDzK1kGeQR5WJNYNLdZ3E_OYagLv48o9YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Fri, Mar 4, 2016 at 12:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Gary,
>
> On Fri, 4 Mar 2016 12:02:31 +0100, Gary Bisson wrote:
>
>> > I understand this configuration can't work, but as this leads to a
>> > build issue we might need to think about a solution. We could disallow
>> > such a configuration tuple, or fix the build.
>> >
>> > Any idea?
>>
>> I'm afraid forcing the imx-gpu-viv package output format depending on
>> qt5 graphical back end would bring many "recursive dependency" issues.
>
> I don't see why it would create recursive dependency issues.

Well my thought process was that it was kind of forbidden to modify
the qtbase package for a i.MX-specific corner case.

So I tried to force it in imx-gpu-viv to use fb depending on
BR2_PACKAGE_QT5BASE_EGLFS but it only brought those recursive issues.

> However, it would violate the principle of virtual packages, since Qt5
> is not supposed to have some dependencies that are specific to certain
> OpenGL implementations. It should normally just use dependencies on the
> OpenGL ES / EGL packages, and nothing else.
>
> However, we could probably add some exceptions to this rule. Or rework
> the virtual package logic so that consumers of OpenGL can now whether
> the FB or X11 support is available.

Well if we are allowed to modify qtbase I guess it would be way
easier. Would something like this be acceptable?
index 64a7f65..aa54b3e 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -201,10 +201,14 @@ config BR2_PACKAGE_QT5BASE_EGLFS
        select BR2_PACKAGE_QT5BASE_OPENGL
        depends on BR2_PACKAGE_HAS_LIBEGL
        depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+       depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11

 comment "eglfs backend available if OpenGL and EGL are enabled"
        depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT5_GL_AVAILABLE

+comment "eglfs backend not available for X11 version of i.MX 3D libraries"
+       depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+
 config BR2_PACKAGE_QT5BASE_DEFAULT_QPA
        string "Default graphical platform"
        help

Regards,
Gary
