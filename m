From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:12:19 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/tiff: Rework tiff utilities
 handling
In-Reply-To: <1429816903-2484-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429816903-2484-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <55396033.1000003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 21:21, Bernd Kuhls wrote:
> Remove all utility-specific options in favour of a generic
> option which select either all or no packages. If users
> want something more fine-grained than that, they can always
> remove the unnecessary tools in a post-build script.
> 
> Since tiff has no configure option or Makefile target to prevent
> the build/install of its utilities specific Makefile targets are
> called to build the libtiff and, optionally, the utilities.
> 
> --
> v4: rebased
> v3: rebased
> v2: Replaced submenu with a new all-or-nothing option (Thomas)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, see below for a wild idea for a more compact alternative...

> ---
[snip]
> diff --git a/package/tiff/Config.in b/package/tiff/Config.in
> index 3a929f7..957bbce 100644
> --- a/package/tiff/Config.in
> +++ b/package/tiff/Config.in
> @@ -60,14 +60,9 @@ config BR2_PACKAGE_TIFF_JBIG
>  	default y
>  endmenu
>  
> -config BR2_PACKAGE_TIFF_TIFF2PDF
> -	bool "tiff2pdf"
> +config BR2_PACKAGE_TIFF_UTILITIES
> +	bool "tiffutils"

 I'd say "tiff utilities" to match the config symbol.

>  	help
> -	  tiff2pdf utility
> -
> -config BR2_PACKAGE_TIFF_TIFFCP
> -	bool "tiffcp"
> -	help
> -	  tiffcp utility
> +	  install tiff utilities

 Perhaps make it more explicit: install all tiff utilities

>  
>  endif
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index 06f0e34..9016a21 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -15,36 +15,6 @@ TIFF_CONF_OPTS = \
>  
>  TIFF_DEPENDENCIES = host-pkgconf
>  
> -TIFF_TOOLS_TO_DELETE = \
> -	bmp2tiff \
> -	fax2ps \
> -	fax2tiff \
> -	gif2tiff \
> -	pal2rgb \
> -	ppm2tiff \
> -	ras2tiff \
> -	raw2tiff \
> -	rgb2ycbcr \
> -	thumbnail \
> -	tiff2bw \
> -	tiff2ps \
> -	tiff2rgba \
> -	tiffcmp \
> -	tiffcrop \
> -	tiffdither \
> -	tiffdump \
> -	tiffinfo \
> -	tiffmedian \
> -	tiffset \
> -	tiffsplit \
> -
> -ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),)
> -TIFF_TOOLS_TO_DELETE += tiff2pdf
> -endif
> -ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),)
> -TIFF_TOOLS_TO_DELETE += tiffcp
> -endif
> -
>  ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
>  TIFF_CONF_OPTS += --disable-ccitt
>  endif
> @@ -97,10 +67,33 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
>  TIFF_CONF_OPTS += --disable-jbig
>  endif
>  
> -define TIFF_REMOVE_TOOLS_FIXUP
> -	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(TIFF_TOOLS_TO_DELETE))
> +ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
> +define TIFF_MAKE_TOOLS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools
>  endef
> +define TIFF_INSTALL_STAGING_TOOLS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools DESTDIR=$(STAGING_DIR) install
> +endef
> +define TIFF_INSTALL_TARGET_TOOLS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools DESTDIR=$(TARGET_DIR) install
> +endef
> +endif

 Okay, so here's the wild idea:

TIFF_SUBDIRS = port libtiff
ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
TIFF_SUBDIRS += tools
endif

TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"

 Build test seems to work, I'll resubmit so tell me what you think.


 Regards,
 Arnout

>  
> -TIFF_POST_INSTALL_TARGET_HOOKS += TIFF_REMOVE_TOOLS_FIXUP
> +define TIFF_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/port
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libtiff
> +	$(TIFF_MAKE_TOOLS)
> +endef
> +
> +define TIFF_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libtiff DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install-pkgconfigDATA
> +	$(TIFF_INSTALL_STAGING_TOOLS)
> +endef
> +
> +define TIFF_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libtiff DESTDIR=$(TARGET_DIR) install
> +	$(TIFF_INSTALL_TARGET_TOOLS)
> +endef
>  
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
