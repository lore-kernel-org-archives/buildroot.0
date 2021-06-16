From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Jun 2021 21:54:47 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add config option
 for DRI3 support
In-Reply-To: <091fecfd-f83c-291c-76ed-75d3b2a496d6@mind.be>
References: <20210612223011.26118-1-ps.report@gmx.net>
 <689f1497-624c-01b3-d69a-97a5efd01740@mind.be>
 <20210614235410.636c5e27@gmx.net>
 <091fecfd-f83c-291c-76ed-75d3b2a496d6@mind.be>
Message-ID: <20210616215447.3c84c29c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 15 Jun 2021 22:19:11 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 14/06/2021 23:54, Peter Seiderer wrote:
> > Hello Arnout,
> >
> > On Sun, 13 Jun 2021 11:25:36 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >>  Hi Peter,
> >>
> >> On 13/06/2021 00:30, Peter Seiderer wrote:
> >>> Add config option for DRI3 support and use it instead
> >>> of DRI3 enable/disable logic in *.mk file.
> >>>
> >>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >>> ---
> >>>  package/mesa3d/Config.in |  8 ++++++++
> >>>  package/mesa3d/mesa3d.mk | 12 +++++++-----
> >>>  2 files changed, 15 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> >>> index d1b3af2054..36acd9758c 100644
> >>> --- a/package/mesa3d/Config.in
> >>> +++ b/package/mesa3d/Config.in
> >>> @@ -16,6 +16,11 @@ menuconfig BR2_PACKAGE_MESA3D
> >>>
> >>>  if BR2_PACKAGE_MESA3D
> >>>
> >>> +config BR2_PACKAGE_MESA3D_DRI3
> >>> +	bool "Enable DRI3 support"
> >>
> >>  Does it make sense to have this as a user-selectable option? Wouldn't it be
> >> better to make this a blind option? (The latter has the advantage that we can
> >> easily refactor it later, without legacy handling and stuff.)
> >
> > As it is an feature option exposed by mesa3d I believe it makes sense...
>
>  I think putting "option exposed by mesa3d" and "make sense" in the same
> sentence is a bit of a stretch :-) The proper thing for mesa3d to do would be to
> enable dri3 automatically if a driver needs it. That we have to pass it
> explicitly is just silly IMHO.
>
>
> >>  I just did a build with just DRI3 selected and it didn't install anything to
> >> target or staging. This suggests that the option isn't useful on its own.
> >
> > Same for numerous other options in buildroot which enable/disable compile time
> > feature include in packages, see e.g. the BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5,
> > BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2, ... and many others...
>
>  BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5 *will* install libcrypto to staging and
> target, so I fail to see your point.

With:

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL=y
BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH="linux-aarch64"
# BR2_PACKAGE_LIBOPENSSL_BIN is not set
# BR2_PACKAGE_LIBOPENSSL_ENGINES is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST is not set
# BR2_PACKAGE_LIBOPENSSL_UNSECURE is not set
# BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP is not set

	$ grep libcrypto build/libopenssl-1.1.1k/.files-list.txt
libopenssl,./usr/lib/libcrypto.so.1.1
libopenssl,./usr/lib/libcrypto.a
libopenssl,./usr/lib/libcrypto.so
libopenssl,./usr/lib/pkgconfig/libcrypto.pc


With:

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL=y
BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH="linux-aarch64"
# BR2_PACKAGE_LIBOPENSSL_BIN is not set
# BR2_PACKAGE_LIBOPENSSL_ENGINES is not set
BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_DES=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK=y
BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST=y
# BR2_PACKAGE_LIBOPENSSL_UNSECURE is not set
# BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE is not set
BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP=y

	$ grep libcrypto build/libopenssl-1.1.1k/.files-list.txt
libopenssl,./usr/lib/libcrypto.so.1.1
libopenssl,./usr/lib/libcrypto.a
libopenssl,./usr/lib/libcrypto.so
libopenssl,./usr/lib/pkgconfig/libcrypto.pc


I would describe the _ENABLE_... options as enabling/disabling (compile time)
features of libcrypto...

Regards,
Peter


>
>  What I'm saying is: having it as a user-visible option only makes sense if a
> user can do something with that option. Since mesa3d doesn't install anything
> when dri3 is selected, I suspect that it's useless as a user-visible option. And
> as I wrote, making it user-visible has a cost: it means that changing/removing
> the option later becomes more difficult (legacy handling and all that).
>
>  Of course, I could still be wrong. Maybe dri3 does something useful. But to me
> it looks more like the shared-glapi option, that is meaningless by itself but
> that enables a subsystem that is required by some drivers.
>
>
> >>  More importantly: have you checked that DRI3 doesn't have any dependencies of
> >> itself? Check the meson files to see if there are dependencies that are implied
> >> directly by dri3 (i.e., maybe the xshmfence dependency comes from dri3 rather
> >> than the individual dri driver). Those things should be moved around as well,
> >> similar how they are put in BR2_PACKAGE_MESA3D_DRI_DRIVER instead of the
> >> individual drivers.
> >
> > But this mimics the mesa3d internal logic (without an mesa3d exposed feature
> > option)....
>
>  I'm not sure what you mean. What I mean is: in meson.build there is:
>
> if with_platform_x11
> ...
>   if (with_egl or
>       with_dri3 or (
>       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
>       with_gallium_omx != 'disabled'))
>     dep_xcb_xfixes = dependency('xcb-xfixes')
>   endif
>
>
>  This means, IMHO, that in Config.in we need:
>
> config BR2_PACKAGE_MESA3D_DRI3
> 	bool
> 	depends on ...
> 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
>
> and there are a bunch more like that.
>
>
>  Regards,
>  Arnout
>
> >
> > Regards,
> > Peter
> >
> >>
> >>
> >>  Series marked as Changes Requested.
> >>
> >>  Regards,
> >>  Arnout
> >>
> >>> +	help
> >>> +	  Enable DRI3 support.
> >>> +
> >>>  # Some Gallium driver needs libelf when built with LLVM support
> >>>  config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
> >>>  	bool
> >>> @@ -65,6 +70,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
> >>>  		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
> >>>  		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
> >>>  		!BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
> >>> +	select BR2_PACKAGE_MESA3D_DRI3 if \
> >>> +		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
> >>>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
> >>>  		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
> >>>
> >>> @@ -359,6 +366,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
> >>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
> >>>  	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
> >>>  	depends on BR2_PACKAGE_XORG7 # xorgproto
> >>> +	select BR2_PACKAGE_MESA3D_DRI3
> >>>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> >>>  	select BR2_PACKAGE_XORGPROTO
> >>>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
> >>> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> >>> index 5c5f8a33f3..da6e55bf93 100644
> >>> --- a/package/mesa3d/mesa3d.mk
> >>> +++ b/package/mesa3d/mesa3d.mk
> >>> @@ -35,6 +35,12 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
> >>>  MESA3D_CONF_OPTS += -Db_asneeded=false
> >>>  endif
> >>>
> >>> +ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
> >>> +MESA3D_CONF_OPTS += -Ddri3=enabled
> >>> +else
> >>> +MESA3D_CONF_OPTS += -Ddri3=disabled
> >>> +endif
> >>> +
> >>>  ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
> >>>  MESA3D_DEPENDENCIES += host-llvm llvm
> >>>  MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
> >>> @@ -122,13 +128,10 @@ endif
> >>>
> >>>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> >>>  MESA3D_CONF_OPTS += \
> >>> -	-Ddri-drivers= -Ddri3=disabled
> >>> +	-Ddri-drivers=
> >>>  else
> >>>  ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
> >>>  MESA3D_DEPENDENCIES += xlib_libxshmfence
> >>> -MESA3D_CONF_OPTS += -Ddri3=enabled
> >>> -else
> >>> -MESA3D_CONF_OPTS += -Ddri3=disabled
> >>>  endif
> >>>  MESA3D_CONF_OPTS += \
> >>>  	-Dshared-glapi=enabled \
> >>> @@ -142,7 +145,6 @@ MESA3D_CONF_OPTS += \
> >>>  else
> >>>  MESA3D_DEPENDENCIES += xlib_libxshmfence
> >>>  MESA3D_CONF_OPTS += \
> >>> -	-Ddri3=enabled \
> >>>  	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
> >>>  endif
> >>>
> >>>
> >
