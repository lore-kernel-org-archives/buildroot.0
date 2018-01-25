From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 25 Jan 2018 21:03:13 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-21
In-Reply-To: <87fu6vn0ud.fsf@dell.be.48ers.dk>
References: <20180122070014.D5074206F0@mail.free-electrons.com>
 <20180123152143.GD14919@momiji> <87fu6vn0ud.fsf@dell.be.48ers.dk>
Message-ID: <20180125210313.GD14023@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

A quick update regarding this WebKitGTK+ build failure...

On Wed, 24 Jan 2018 08:59:54 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > Hi,
>  > On Mon, 22 Jan 2018 08:00:14 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
>  >> x86_64 | webkitgtk-2.18.5 | NOK |
>  >> http://autobuild.buildroot.net/results/57b77520d3a3fcfa683406e223771d0ccf8733df
>  >> |
> 
>  > The configuration used for this build has an EGL provider but both OpenGL and
>  > OpenGL ES are disabled:
> 
>  >  - BR2_PACKAGE_HAS_LIBEGL is chosen.
>  >  - Both BR2_PACKAGE_HAS_LIBGL and BR2_PACKAGE_HAS_LIBGLES are undefined.
> 
>  > It seems to me that the CMake build files for WebKit should disable all the
>  > OpenGL support if EGL is found but a GL/GLES implementation is not found.
>  > I have filed a bug upstream to look into that:
> 
>  >   https://bugs.webkit.org/show_bug.cgi?id=181986
> 
> Sounds sensible, yes.
> 
>  > In the meantime, I'll make a patch for checking in the Buildroot package
>  > whether an OpenGL(ES) implementation is being built, and if not pass the
>  > needed build flags to CMake in order to disable using OpenGL(ES) even if
>  > EGL is present.
> 
> Thanks!

It turns out that Buildroot it already doing the correct thing, and it's
passing ?-DENABLE_OPENGL=OFF? when there is only an EGL provider but no
GL/GLES provider. As soon as I have a fix for the WebKit CMake files I can
send a patch to add it to Buildroot. In the meantime I am afraid that trying
to build WebKitGTK+ when the target only has EGL but no GL/GLES will be
broken ? this is not expected to affect real-world uses, though; I imagine
whenever EGL is chosen there will be also GL/GLES as well.

I have also posted a set of two patches to get WebKitGTK+ updated to 2.18.6;
note that this build issue is still present in that new release.

Cheers,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180125/4b723fe1/attachment.asc>
