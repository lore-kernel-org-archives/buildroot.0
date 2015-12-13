From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 17:32:40 +0100
Subject: [Buildroot] [PATCH 7/8] package/libfreeglut: new package
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
 <1449945103-23715-7-git-send-email-bernd.kuhls@t-online.de>
 <20151213144626.5a7db29f@free-electrons.com>
Message-ID: <86j0kcx3eu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 13 Dec 2015 14:46:26 +0100 schrieb Thomas Petazzoni:

> Bernd,
> 
> On Sat, 12 Dec 2015 19:31:42 +0100, Bernd Kuhls wrote:
> 
>> diff --git a/package/libfreeglut/Config.in
>> b/package/libfreeglut/Config.in new file mode 100644 index
>> 0000000..e67fdae --- /dev/null +++ b/package/libfreeglut/Config.in @@
>> -0,0 +1,19 @@
>> +config BR2_PACKAGE_LIBFREEGLUT +	bool "libfreeglut"
>> +	select BR2_PACKAGE_LIBGLU +	select BR2_PACKAGE_XLIB_LIBXI
> 
> Are you sure about this dependency? I don't see any reference to libXi
> in the libfreeglut source code? However, I do see a reference to
> libXxf86vm:
> 
>   SET(PC_LIBS_PRIVATE "-lX11 -lXxf86vm -lXrandr -lGL -lm")

Yes, libXi is needed:
http://sourceforge.net/p/freeglut/code/HEAD/tree/tags/FG_3_0_0/
README.cmake#l45
http://sourceforge.net/p/freeglut/code/HEAD/tree/tags/FG_3_0_0/src/x11/
fg_internal_x11.h#l42

V2 of the patch added libXxf86vm as dependency.

>> +	select BR2_PACKAGE_XLIB_LIBXRANDR +	depends on 
BR2_PACKAGE_HAS_LIBGL
> 
> There seems to be provisions for using OpenGLES and not only full
> OpenGL:
> 
> # OpenGL ES support OPTION(FREEGLUT_GLES "Use OpenGL ES (requires EGL)"
> OFF)

After seeing this note in the Gentoo package
https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/freeglut/
freeglut-3.0.0.ebuild#n17
I did not bother to handle OpenGLES support atm.

> Also, have you test static/shared build ? There are some options to
> control this:
> 
> OPTION(FREEGLUT_BUILD_SHARED_LIBS "Build FreeGLUT shared library." ON)
> OPTION(FREEGLUT_BUILD_STATIC_LIBS "Build FreeGLUT static library." ON)
> 
> But it's true you depend on BR2_PACKAGE_XORG7, so a pure static lib
> build is not possible. But what about BR2_STATIC_SHARED_LIBS vs.
> BR2_SHARED_LIBS ?

I just sent v2 of the patch handling the shared-only case:
http://patchwork.ozlabs.org/patch/556195/

Thanks for the review!

Regards, Bernd
