From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@collabora.com>
Date: Tue, 13 Aug 2019 08:51:05 -0400
Subject: [Buildroot] [PATCH] igt-gpu-tools: add new package
In-Reply-To: <962ad6f9-74d0-efc9-a48e-7a6fdb93965f@mind.be>
References: <20181204022701.28095-1-gael.portay@collabora.com>
 <962ad6f9-74d0-efc9-a48e-7a6fdb93965f@mind.be>
Message-ID: <20190813125104.lloh7c3po5o7rlzu@archlinux.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, Aug 02, 2019 at 11:50:16AM +0200, Arnout Vandecappelle wrote:
>  Hi Ga?l,
> 
>  Sorry it took so long to get feedback on this...
> 
> On 04/12/2018 03:27, Ga?l PORTAY wrote:
> [snip]
> > +config BR2_PACKAGE_IGT_GPU_TOOLS
> > +	bool "igt-gpu-tools"
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm libunwind
> 
>  Please separate with commas: libdrm, libglib2, libunwind
> 
> > +	depends on !BR2_STATIC_LIBS # kmod libunwind
> 
>  BR2_STATIC_LIBS sorts before BR2_TOOLCHAIN_HAS_THREADS :-)
> 
>  You'll also need to add:
> 
> depends on BR2_USE_WCHAR # libglib2 -> gettext
> 
>  However, the README says that libglib2 is optional (only for chamelium support,
> whatever that may be).
> 
> > +	depends on BR2_USE_MMU # procps-ng
> 
>  This is considered an arch dependency so it should be first.
> 
> > +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
> 
>  We use select for that instead of depends. Cfr. tovid.
> 
> > +	depends on BR2_PACKAGE_HAS_OPENSSL
> 
>  It is possible to select openssl because there's a choice for libopenssl/libressl.
> 
> > +	depends on BR2_PACKAGE_HAS_UDEV
> 
>  It is strange that you have this dependency here, but not in .mk. Could you
> explain that in the commit message? Or maybe add "# runtime" here? Or add the
> dependency in .mk, of course :-)
> 
> 
> > +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> 
>  This is also an arch dependency so should be first.
> 
> > +	select BR2_PACKAGE_CAIRO
> > +	select BR2_PACKAGE_CAIRO_PNG
> > +	select BR2_PACKAGE_KMOD
> > +	select BR2_PACKAGE_LIBDRM
> > +	select BR2_PACKAGE_LIBUNWIND
> > +	select BR2_PACKAGE_LIBPCIACCESS
> > +	select BR2_PACKAGE_PIXMAN
> > +	select BR2_PACKAGE_PROCPS_NG
> > +	select BR2_PACKAGE_ZLIB
> > +	help
> > +	  IGT GPU Tools is a collection of tools for development and
> > +	  testing of the DRM drivers.
> > +
> > +	  https://cgit.freedesktop.org/drm/igt-gpu-tools/
> 
>  This is now https://gitlab.freedesktop.org/drm/igt-gpu-tools
> 
> > +
> > +comment "igt-gpu-tools needs udev /dev management and openssl library"
> > +        depends on !BR2_PACKAGE_IGT_GPU_TOOLS
> > +        depends on !BR2_PACKAGE_HAS_UDEV || !BR2_PACKAGE_HAS_OPENSSL
> 
>  This is completely wrong. It should be
> 
> comment "igt-gpu-tools needs udev /dev management and a toolchain w/ threads,
> wchar, dynamic library"
> 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> 	depends on BR2_USE_MMU
> 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
> 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> 	
> 
> > +IGT_GPU_TOOLS_VERSION = 1.23
> 
>  There's a 1.24 now (not surprising, when we wait 9 months to look at this patch :-)
> 
> > +IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION)
> 
>  So you did know about the gitlab site!
> 
>  Note that this will be the first package that uses the auto-archive feature of
> gitlab. Let's see how that goes...
> 
>  Oh, I would also add
> 
> IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.bz2
> 
> which should be a bit smaller.
> 
> 
> 
> > +IGT_GPU_TOOLS_LICENSE = MIT
> > +IGT_GPU_TOOLS_LICENSE_FILES = COPYING
> > +IGT_GPU_TOOLS_INSTALL_STAGING = YES
> 
>  Why install in staging?
> 
> > +IGT_GPU_TOOLS_DEPENDENCIES = host-pkgconf cairo kmod libdrm libopenssl libglib2 libpciaccess libunwind pixman procps-ng zlib
> 
>  Does it really need libopenssl and not libressl?
> 
>  If yes, you should select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL.
> 
> 
>  Obviously, I've marked this patch as Changes Requested :-)
> 
>  Thanks!
> 
>  Regards,
>  Arnout
> 
> 
> > +IGT_GPU_TOOLS_CONF_OPTS += -Dbuild_docs=false
> > +
> > +$(eval $(meson-package))
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks for you review. I will address them ASAP.

Regards,
Gael
