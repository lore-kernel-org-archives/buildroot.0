From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 17 Sep 2018 22:10:02 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/piglit: new package
In-Reply-To: <20180916233840.79495eba@windsurf>
References: <20180211162136.15605-1-romain.naour@gmail.com>
 <20180211162136.15605-3-romain.naour@gmail.com>
 <20180916233840.79495eba@windsurf>
Message-ID: <84ded507-27f9-9e33-a116-becc8dda57f0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 16/09/2018 ? 23:38, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sun, 11 Feb 2018 17:21:36 +0100, Romain Naour wrote:
> 
>> diff --git a/package/piglit/Config.in b/package/piglit/Config.in
>> new file mode 100644
>> index 0000000000..eaa19c17ba
>> --- /dev/null
>> +++ b/package/piglit/Config.in
>> @@ -0,0 +1,35 @@
>> +config BR2_PACKAGE_PIGLIT
>> +	bool "piglit"
>> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
>> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL
> 
> So we would have to rework this to use the dependencies I have
> suggested for waffle. Maybe we need to simply "depends on
> BR2_PACKAGE_WAFFLE", because it is such a mess to express waffle
> dependencies in a correct way ?
> 
> If we don't do a "depends on BR2_PACKAGE_WAFFLE", we would have to
> replicate waffle dependencies, which is possible. But since for waffle
> I suggested to not add a Config.in comment about those dependencies
> because they are too complicated, we would also not have a Config.in
> comment about those dependencies in piglit. So having the "depends on
> BR2_PACKAGE_WAFFLE" is maybe good enough.

Ok

> 
>> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>> +	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
> 
> The xproto-glproto package no longer exists, this needs to be rebased.

Indeed, I noticed It while rebasing my development branch on master.

> 
>> +	select BR2_PACKAGE_ZLIB
>> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
>> +	select BR2_PACKAGE_LIBPNG
>> +	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
>> +	select BR2_PACKAGE_PYTHON_MAKO
>> +	select BR2_PACKAGE_PYTHON_NUMPY
>> +	select BR2_PACKAGE_PYTHON_SIX
>> +	select BR2_PACKAGE_PYTHON3_BZIP2
>> +	select BR2_PACKAGE_PYTHON3_PYEXPAT
>> +	select BR2_PACKAGE_PYTHON3_XZ
>> +	select BR2_PACKAGE_PYTHON3_ZLIB
>> +	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
>> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES # require real dmesg tool
>> +	select BR2_PACKAGE_WAFFLE # wflinfo
> 
> Well, I guess it needs waffle for more than wflinfo, no?

It's correct, piglit link with libwaffle-1.

> 
>> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
>> new file mode 100644
>> index 0000000000..c33a8f9022
>> --- /dev/null
>> +++ b/package/piglit/piglit.mk
>> @@ -0,0 +1,69 @@
>> +################################################################################
>> +#
>> +# piglit
>> +#
>> +################################################################################
>> +
>> +PIGLIT_VERSION = 5153c0bd89ca78e4dd56cc0917930909fa085eb0
>> +PIGLIT_SITE = https://anongit.freedesktop.org/git/piglit.git
>> +PIGLIT_SITE_METHOD = git
>> +PIGLIT_LICENSE = MIT (code), \
>> +	LGPL-2.0+ (libpiglit*.so), \
>> +	GPL-3.0 (tests/glslparsertest/glsl2/norsetto-*), \
>> +	GPL-2.0+ (tests/glslparsertest/glsl2/gst-gl-*), \
>> +	BSD-3-Clause (tests/glslparsertest/shaders/*)
>> +PIGLIT_LICENSE_FILES = COPYING licences/GPL-2 licences/GPL-3 licences/LGPL-2
>> +
>> +PIGLIT_DEPENDENCIES = host-pkgconf \
>> +	host-python-mako \
>> +	host-python-numpy \
>> +	host-python-six \
> 
> This is surprising, what does it do on the host during the build
> process that requires those tools ? Or is it that piglit generates a
> report on the target, and then provides a bunch of host tool to process
> such reports ?

Reports can be processed on the target directly.
I believe it's for the same reason that we need host-numpy.
I think the build system is checking the host-python instead of python for the
target.

I'm not sure how to fix this...

> 
>> +	libpng \
>> +	python-mako \
>> +	python-numpy \
>> +	python-six \
>> +	waffle \
>> +	zlib
>> +
>> +PIGLIT_CONF_OPTS += \
>> +	-DPIGLIT_USE_WAFFLE=ON \
>> +	-DPIGLIT_BUILD_CL_TESTS=OFF \
>> +	-DPIGLIT_BUILD_WGL_TESTS=OFF
>> +
>> +ifeq ($(BR2_PACKAGE_XORG7),y)
>> +# libxcb for xcb-dri2
>> +PIGLIT_DEPENDENCIES += \
>> +	xlib_libX11 \
>> +	xlib_libXext \
>> +	xproto_glproto \
> 
> Also needs adjustment now that xproto_glproto has been removed.
> 
> Other than those comments, looks pretty good to me.
> 
> Could you address those comments and send an updated version?

Ok, Thanks for the review.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
