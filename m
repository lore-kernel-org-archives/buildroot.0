From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 May 2013 18:48:59 +0200
Subject: [Buildroot] [PATCH v9 03/14] libgtk2: bump to version 2.24.18
In-Reply-To: <1369931437-12445-4-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-4-git-send-email-spenser@gillilanding.com>
Message-ID: <20130530184859.3ace3c42@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 30 May 2013 11:30:26 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libgtk2/Config.in                         |   13 ++----
>  package/libgtk2/libgtk2-reduce-dependencies.patch |   51 +++++++++++----------
>  package/libgtk2/libgtk2.mk                        |    2 +-
>  3 files changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> index 88f4cc1..462b0b6 100644
> --- a/package/libgtk2/Config.in
> +++ b/package/libgtk2/Config.in
> @@ -8,11 +8,11 @@ config BR2_PACKAGE_LIBGTK2
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_PANGO
>  	select BR2_PACKAGE_GDK_PIXBUF
> -	select BR2_PACKAGE_FONTCONFIG if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_XORG7
> -	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXRENDER
> +	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_WCHAR # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	help
> @@ -29,6 +29,3 @@ config BR2_PACKAGE_LIBGTK2_DEMO
>  
>  comment "libgtk2 requires a toolchain with WCHAR and C++ support"
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> -
> -comment "WARNING: Libgtk2 directfb backend is deprecated"
> -	depends on BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_XORG7

Please mention explicitly in the commit log that you are dropping
DirectFB support for good. Generally speaking, your commit log would
need to be a little bit more detailed about what you're doing. No need
to give gazillion of details, but highlighting the important changes is
good when the bump is not simply a mechanical bump.

Also, I believe more parts of libgtk2.mk can be removed if you remove
DirectFB support:

ifeq ($(BR2_PACKAGE_DIRECTFB),y)
        LIBGTK2_CONF_OPT += --with-gdktarget=directfb
        LIBGTK2_DEPENDENCIES += directfb
endif

and also all the code that was enclosed in a ifeq
($(BR2_PACKAGE_XORG7),y) can now go out of this conditional.

Or maybe you want to do two separate patches: one that drops the
DirectFB support, and then one that bumps to 2.24.18.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
