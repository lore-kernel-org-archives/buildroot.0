From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 Jun 2019 02:41:46 +0300
Subject: [Buildroot] [RFC PATCH/next 1/2] package/wlroots: new package
In-Reply-To: <20190517094823.4dab419d@windsurf>
References: <20190516220836.24543-1-aperez@igalia.com>
 <20190516220836.24543-2-aperez@igalia.com>	<20190517094823.4dab419d@windsurf>
Message-ID: <20190613024146.GD11182@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 May 2019 09:48:23 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Fri, 17 May 2019 01:08:35 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
> > new file mode 100644
> > index 0000000000..45db63f62c
> > --- /dev/null
> > +++ b/package/wlroots/Config.in
> > @@ -0,0 +1,65 @@
> > +config BR2_PACKAGE_WLROOTS
> > +	bool "wlroots"
> > +	depends on !BR2_STATIC_LIBS # mesa3d, wayland
> 
> You're not selecting "mesa3d", so this "mesa3d" comment doesn't make
> sense.
> 
> > +	depends on BR2_INSTALL_LIBSTDCPP # freedrp, mesa3d
> 
> You're not selecting freerdp nor mesa3d, so the comment doesn't make
> sense either. This dependency doesn't seem to be needed at all.
> 
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
> > +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
> 
> This dependency doesn't seem to be needed, at least you don't use
> mesa3d, and none of the packages you select has a "depends on
> BR2_TOOLCHAIN_HAS_SYNC".
> 
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
> 
> Same.
> 
> 
> > +if BR2_PACKAGE_WLROOTS
> > +
> > +config BR2_PACKAGE_WLROOTS_RDP
> > +	bool "RDP backend support"
> > +	depends on BR2_PACKAGE_FREERDP
> 
> If you "depends on" something...
> 
> > +	depends on BR2_USE_WCHAR # freerdp
> > +	depends on BR2_USE_MMU # libglib2
> > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # freerdp
> 
> ... there's no point in replicating its dependencies.
> 
> > +WLROOTS_VERSION = 0.6.0
> > +WLROOTS_SITE = https://github.com/swaywm/wlroots/archive
> > +WLROOTS_SOURCE = $(WLROOTS_VERSION).tar.gz
> > +WLROOTS_LICENSE = MIT
> > +WLROOTS_INSTALL_STAGING = YES
> > +
> > +WLROOTS_DEPENDENCIES = host-pkgconf host-wayland libegl libinput \
> > +					   libxkbcommon mesa3d pixman udev \
> 
> Ah, so you have mesa3d in your dependencies, but you don't select it ?

I was just double checking now and... it's complicated. While in theory
Mesa is not strictly needed (any EGL driver with Wayland support should
do), then wlroots wants to *also* have libgbm which is part of Mesa...

While in theory other implementations of libgbm should work, there is none
other than Mesa's in Buildroot. Probably the best option here is to use:

    depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
	depends on BR2_PACKAGE_MESA3D_OPENGL_ES

At least that's what other packages do ?\_(?)_/?

?Adri?n


P.S: I'll fix the depends/selects before submitting v2 of the patchset.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190613/df430892/attachment.asc>
