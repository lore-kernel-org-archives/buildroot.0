From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Mon, 23 Sep 2013 12:47:36 +0200
Subject: [Buildroot] [PATCH] Add lesstif package
In-Reply-To: <87zjr59rgu.fsf@dell.be.48ers.dk>
References: <523A9EE2.9050701@wanadoo.fr> <87zjr59rgu.fsf@dell.be.48ers.dk>
Message-ID: <52401C48.7090402@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

thanks for your review :

Le 22/09/2013 10:43, Peter Korsgaard a ?crit :
>>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:
> 
>  Thierry> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
>  Thierry> ---
>  Thierry> Adds support for lesstif.
>  Thierry> Quite old thing but useful for porting applications based on xmotif
>  Thierry> ---
>  Thierry> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
>  Thierry> index 205079c..c6d48b3 100644
>  Thierry> --- a/package/x11r7/Config.in
>  Thierry> +++ b/package/x11r7/Config.in
>  Thierry> @@ -12,6 +12,7 @@ if BR2_PACKAGE_XORG7
>  Thierry>  		source package/x11r7/xserver_xorg-server/Config.in
>  Thierry>  	endmenu
>  Thierry>  	menu "X11R7 Libraries"
>  Thierry> +		source package/x11r7/lesstif/Config.in
>  Thierry>  		source package/x11r7/libxcb/Config.in
>  Thierry>  		source package/x11r7/mesa3d/Config.in
>  Thierry>  		source package/x11r7/xcb-util/Config.in
>  Thierry> diff --git a/package/x11r7/lesstif/Config.in b/package/x11r7/lesstif/Config.in
>  Thierry> new file mode 100644
>  Thierry> index 0000000..5d7cb11
>  Thierry> --- /dev/null
>  Thierry> +++ b/package/x11r7/lesstif/Config.in
>  Thierry> @@ -0,0 +1,7 @@
>  Thierry> +config BR2_PACKAGE_LESSTIF
>  Thierry> +        bool "lesstif"
>  Thierry> +	select BR2_PACKAGE_XLIB_LIBXP
>  Thierry> +        help
> 
> You have a mix of spaces and tabs here. The rule for Config.in is to
> indent with tab (and help text with tab+space+space).
> 
> We don't have a XLIB_LIBXP package in Buildroot?

ack
This is a mistake.
Taking your notes below in account, this should be

    select BR2_PACKAGE_XLIB_LIBXT
    select BR2_PACKAGE_XLIB_LIBXEXT

I wonder if I should not add "depends on BR2_PACKAGE_XORG7" as well ?
Else the needed libraries will not be built at all.


> 
>  Thierry> +          lesstif is the Hungry Programmers' version of OSF/Motif
>  Thierry> +
>  Thierry> +          http://lesstif.sourceforge.net/
>  Thierry> diff --git a/package/x11r7/lesstif/lesstif.mk b/package/x11r7/lesstif/lesstif.mk
>  Thierry> new file mode 100644
>  Thierry> index 0000000..ed09581
>  Thierry> --- /dev/null
>  Thierry> +++ b/package/x11r7/lesstif/lesstif.mk
>  Thierry> @@ -0,0 +1,39 @@
>  Thierry> +
>  Thierry> +#############################################################
> 
> No empty line before the banner and the #### line should be 80 chars.
> 
>  Thierry> +#
>  Thierry> +# lesstif
>  Thierry> +#
>  Thierry> +#############################################################
>  Thierry> +LESSTIF_VERSION = 0.95.2
>  Thierry> +LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
>  Thierry> +LESSTIF_SITE =  http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
>  Thierry> +LESSTIF_INSTALL_STAGING = YES
>  Thierry> +LESSTIF_INSTALL_TARGET = YES
> 
> _INSTALL_TARGET defaults to YES, so you can drop that line.
> 
>  Thierry> +LESSTIF_DEPENDENCIES = xlib_libXt xlib_libXext
> 
> This doesn't match the Config.in. You need to select
> BR2_PACKAGE_XLIB_LIBX{T,EXT} in Config.in as well.
> 
>  Thierry> +
>  Thierry> +LESSTIF_CONF_OPT = \
>  Thierry> +	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config	\

you're right.
lesstif definitively needs freetype.
Adding it to deps.

> 
> You don't have freetype in _DEPENDENCIES. Either drop it here if it
> isn't used or add it to dependenciees.
> 
>  Thierry> +	--with-gnu-ld							\
>  Thierry> +	--enable-debug=no						\
>  Thierry> +	--enable-production=yes						\
>  Thierry> +	--enable-build-tests=no
>  Thierry> +
>  Thierry> +# Reduces the buggy makefile to the smallest possible (and working) thing
>  Thierry> +define LESSTIF_NOMAN2HTML
>  Thierry> +	echo "all:" 	> $(@D)/doc/Makefile
>  Thierry> +	echo "" 		>> $(@D)/doc/Makefile
>  Thierry> +	echo "install:" >> $(@D)/doc/Makefile
>  Thierry> +	echo "" 		>> $(@D)/doc/Makefile
>  Thierry> +	echo "clean:" 	>> $(@D)/doc/Makefile
>  Thierry> +endef
>  Thierry> +
>  Thierry> +# Remove the ac_find_motif.m4 that is copied on target
>  Thierry> +define LESSTIF_FIXACLOCAL
>  Thierry> +	rm -rf $(TARGET_DIR)/$(HOME)
>  Thierry> +endef
> 
> HOME?

yes, current user $(HOME).
This is weird indeed but lesstif actually creates

$(TARGET_DIR)/$(HOME)/$(TOPDIR)/output/host/usr/share/aclocal/ac_find_motif.m4


> 
>  Thierry> +
>  Thierry> +LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_NOMAN2HTML
>  Thierry> +LESSTIF_POST_INSTALL_TARGET_HOOKS += LESSTIF_FIXACLOCAL
>  Thierry> +
>  Thierry> +$(eval $(autotools-package))
>  Thierry> +
> 
> No empty line after autotools-package.
> 
> Care to fix and resend?
> 

Sure, once we are ok with the all points above

Regards
Thierry
