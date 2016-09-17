From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 17 Sep 2016 22:30:36 +0200
Subject: [Buildroot] [PATCH 4/4] package/efl: add Evas GL DRM Engine
 support
In-Reply-To: <20160917191442.7ea32f90@free-electrons.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
 <1473282523-12796-4-git-send-email-romain.naour@gmail.com>
 <20160917191442.7ea32f90@free-electrons.com>
Message-ID: <7ef61cae-b591-5901-c124-81b4e4171d03@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/09/2016 ? 19:14, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Wed,  7 Sep 2016 23:08:43 +0200, Romain Naour wrote:
> 
>> diff --git a/package/efl/Config.in b/package/efl/Config.in
>> index 6171b29..c6c26d8 100644
>> --- a/package/efl/Config.in
>> +++ b/package/efl/Config.in
>> @@ -208,6 +208,16 @@ comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
>>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
>>  	depends on BR2_PACKAGE_EFL_ELPUT
>>  
>> +config BR2_PACKAGE_EFL_GL_DRM
> 
> Is it useful to have it as a separate option from BR2_PACKAGE_EFL_DRM ?

You mean enable evas gl-drm engine only when all dependencies are available
without using a separate option? Yes why not.

> In which case can BR2_PACKAGE_EFL_DRM without BR2_PACKAGE_EFL_GL_DRM be
> useful ?

I don't know. The evas gl-drm (opengl based DRM) engine can be enabled
separately from ecore drm for some reason, so I tried to reproduce this
possibility on the packaging.
Anyway my goal is the test EFL/E with Wayland and --enable-gl-drm and
--enable-drm are required together for this [1].

[1] https://phab.enlightenment.org/w/wayland/

> 
>> +	bool "Evas GL DRM Engine"
>> +	depends on BR2_PACKAGE_EFL_DRM
>> +	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
> 
> So perhaps "BR2_PAKCAGE_EFL_GLES_DRM" is a better name? "GL" usually
> refers to "full OpenGL", as opposed to OpenGL ES.

Ok, I'll fix this.

> 
>> +	help
>> +	  This option enable building support for the Evas DRM Engine.
> 
> This help text is wrong, as it is just a copy/paste of the one of
> BR2_PACKAGE_EFL_DRM.

Indeed, sorry...
The help text should precise that this support the Evas DRM based on OpenGL ES.

[2]
https://git.enlightenment.org/core/efl.git/commit/?id=f5b81093978fbbe411f9fb509617b6f4081f8da8

> 
>> +
>> +comment "Evas GL DRM Engine needs Evas DRM Engine, OpenGL ES w/ EGL"
>> +	depends on BR2_PACKAGE_EFL_DRM && !BR2_PACKAGE_EFL_OPENGLES
> 
> I find all those DRM/OpenGLES options in the efl package very
> confusing. Are all those options needed? What are the use cases for the
> different possible cases?

Well, the packaging is confusing because theses options are already confusing at
configure.ac level. Do we want a fine grained options choices for theses or a
"global" OpenGLES + DRM options?

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
