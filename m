From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 23:58:47 +0200
Subject: [Buildroot] [PATCH 2/2] odroid-mali: add support for X11 driver
In-Reply-To: <20161013174124.9639-2-daggs@gmx.com>
References: <20161013174124.9639-1-daggs@gmx.com>
 <20161013174124.9639-2-daggs@gmx.com>
Message-ID: <4b3c5ef0-c62c-fce6-cce5-3cf4c091997b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 The Vivante driver has a similar issue as this one: there are different binary
blobs for X11 and for fbdev, and only one of them can be installed. For the
Vivante driver, we offer a choice to the user, and the x11-video driver depends
on the user making the right choice. I don't really like that option. However,
this one is not ideal either, because there is a two-way interdependence between
the odroid-mali and the xdriver-video package. In fact, the way it is now, the
two patches have to be squashed because the previoius one doesn't work without
this one.

 So here is my idea: introduce a blind symbol BR2_PACKAGE_ODROID_MALI_X11 in
this package, and let that option steer the choice between X11 or fbdev. It's
blind, it's not part of a choice, so it can be selected from the xdriver-video
package. So from the user's POV, they just have to select the xdriver-video
package and not worry about the rest. This way, you can first have this patch,
and then add the xdriver-video package in a second patch.


On 13-10-16 19:41, Dagg Stompler wrote:
> as the X11 odroidc2 driver requires special mali opengl	implmentation,
> use the mentoned above mali version if driver is selected.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/odroid-mali/Config.in      |  2 ++
>  package/odroid-mali/odroid-mali.mk | 19 +++++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
> index 2cd8e0d..edda615 100644
> --- a/package/odroid-mali/Config.in
> +++ b/package/odroid-mali/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_ODROID_MALI
>  	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_aarch64 || BR2_ARM_EABIHF
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2

 This requires some explanation (e.g. in a comment above it). Since the package
itself is just binaries and header files that get installed, it's weird that
other packages get selected.

 My guess is that the header files include stuff from these two packages, so I
do think that what you do is correct.

>  	help
>  	  Install the ARM Mali drivers for odroidc2 based systems.
>  
> diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
> index 7b8e511..3649bbc 100644
> --- a/package/odroid-mali/odroid-mali.mk
> +++ b/package/odroid-mali/odroid-mali.mk
> @@ -12,21 +12,36 @@ ODROID_MALI_LICENSE_FILES = README.md
>  ODROID_MALI_INSTALL_STAGING = YES
>  ODROID_MALI_PROVIDES = libegl libgles
>  
> +ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2),y)
> +ODROID_MALI_INSTALL_FOLDER = x11

 INSTALL_FOLDER is not a great name, because it is not where it gets installed,
it's where we find it in the source. So SRC_FOLDER would be better. However, we
already have INSTALL_ARCH that suffers from the same problem, so let's keep it.

> +ODROID_MALI_INSTALL_ARCH = mali_libs

 This bit is incorrect. Except if the x11 binaries are only available in
mali_libs and not in 32bit_libs. In the latter case, however, I would make the
BR2_PACKAGE_ODROID_MALI_X11 depend on aarch64 in Config.in itself (and add a
comment why). Then the logic to choose between mali_libs and 32bit_libs that
exists below still applies.

> +else
> +ODROID_MALI_INSTALL_FOLDER = fbdev
>  ifeq ($(BR2_aarch64),y)
>  ODROID_MALI_INSTALL_ARCH = mali_libs
>  else
>  ODROID_MALI_INSTALL_ARCH = 32bit_libs
>  endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +ODROID_MALI_DEPENDENCIES += libdrm

 I guess the intention here is: if we install the X11 odroid-mali headers, they
include libdrm headers. So a package that depends on odroid-mali should also
depend on libdrm. Then, of course, the better approach is to encode that
dependency here.

 However, in that case, the way you do it here is not correct, because the
dependency only exists if the X11 stuff gets installed. So, this should be
merged in the condition above.


 Regards,
 Arnout

> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
> +ODROID_MALI_DEPENDENCIES += xlib_libXdamage
> +endif
> +
>  
>  define ODROID_MALI_INSTALL_LIBS
> -	cp -dpfr $(@D)/fbdev/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
> +	cp -dpfr $(@D)/$(ODROID_MALI_INSTALL_FOLDER)/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
>  endef
>  
>  define ODROID_MALI_INSTALL_STAGING_CMDS
>  	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
>  	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
>  	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
> -	cp -dpfr $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
> +	cp -dpfr $(@D)/$(ODROID_MALI_INSTALL_FOLDER)/mali_headers/* $(STAGING_DIR)/usr/include
>  endef
>  
>  define ODROID_MALI_INSTALL_TARGET_CMDS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
