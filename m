From: Ormund Williams <ormundw@panix.com>
Date: Tue, 26 Aug 2008 09:42:38 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <20080826121930.77B8B3C79C@busybox.net>
References: <20080826121930.77B8B3C79C@busybox.net>
Message-ID: <1219758158.3307.64.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2008-08-26 at 05:19 -0700, laird at uclibc.org wrote:
> Author: laird
> Date: 2008-08-26 05:19:29 -0700 (Tue, 26 Aug 2008)
> New Revision: 23204
> 
> Log:
> The changes below add better support for DirectFB and libgtk2.
> Should be no different for X builds.
> 
>  Config.in  |    3 +--
>  libgtk2.mk |    7 +++----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> Signed-off-by: daniel.j.laird at nxp.com
> 
> package/libgtk2/Config.in
> Allow DirectFB to turn on LIBGTK2 support without X being enabled.
> Disable autoselection of cups.  May not be wanted (Can cause crosscompilation issues).
> 
> package/libgtk2/libgtk2.mk
> Remove unnessary redefine of PKG_CONFIG_*
> Pass $(DISABLE_LARGEFILE) to configure (supports large file or not)
> Move 'cups' to X extra dependencies instead of general.
> 
> 
> 
> 
> 
> 
> Modified:
>    trunk/buildroot/package/libgtk2/Config.in
>    trunk/buildroot/package/libgtk2/libgtk2.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/libgtk2/Config.in
> ===================================================================
> --- trunk/buildroot/package/libgtk2/Config.in	2008-08-26 01:32:33 UTC (rev 23203)
> +++ trunk/buildroot/package/libgtk2/Config.in	2008-08-26 12:19:29 UTC (rev 23204)
> @@ -2,14 +2,13 @@
>  	bool "libgtk2"
>  	select BR2_PACKAGE_ATK
>  	select BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_CUPS
>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_PANGO
>  	select BR2_PACKAGE_PKGCONFIG
>  	select BR2_PACKAGE_TIFF
> -	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
> +	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
>  	help
>  	  The GTK+ version 2 graphical user interface library
>  
> 
> Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
> ===================================================================
> --- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-08-26 01:32:33 UTC (rev 23203)
> +++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-08-26 12:19:29 UTC (rev 23204)
> @@ -92,8 +92,7 @@
>  		--disable-glibtest \
>  		--enable-explicit-deps=no \
>  		--disable-debug \
> -		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
> -		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
> +		$(DISABLE_LARGEFILE) \
>  		$(LIBGTK2_CONF_OPT_X)  \
>  		$(LIBGTK2_CONF_OPT_DFB)
>  
> @@ -109,11 +108,11 @@
>  		--x-includes=$(STAGING_DIR)/usr/include/X11 \
>  		--x-libraries=$(STAGING_DIR)/usr/lib \
>  		--with-gdktarget=x11
> -	LIBGTK2_DEPENDENCIES_EXTRA = xlib_libXcomposite $(XSERVER)
> +	LIBGTK2_DEPENDENCIES_EXTRA = xlib_libXcomposite $(XSERVER) cups
>  else
>  	LIBGTK2_CONF_OPT += --without-x
>  endif
>  
> -LIBGTK2_DEPENDENCIES = uclibc pkgconfig png jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cups cairo pango atk
> +LIBGTK2_DEPENDENCIES = uclibc pkgconfig png jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cairo pango atk
>  
>  $(eval $(call AUTOTARGETS,package,libgtk2))
> 
I also had to up the version to 2.12.11 to get a correct build.

__
Ormund
