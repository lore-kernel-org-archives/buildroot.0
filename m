From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 23:24:31 +0200
Subject: [Buildroot] [PATCH 1/1] google-material-design-icons: new
 package
In-Reply-To: <BLU436-SMTP9129508AA06E650D8450A5A0AF0@phx.gbl>
References: <BLU436-SMTP9129508AA06E650D8450A5A0AF0@phx.gbl>
Message-ID: <20150628232431.3d1ea7af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Wed, 24 Jun 2015 08:59:32 -0400, James Knight wrote:

> diff --git a/package/Config.in b/package/Config.in
> index fac632f..5cf41e2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1125,6 +1125,7 @@ menu "Miscellaneous"
>  	source "package/empty/Config.in"
>  	source "package/gnuradio/Config.in"
>  	source "package/googlefontdirectory/Config.in"
> +	source "package/google-material-design-icons/Config.in"

It should probably go in the "Fonts, icons, sounds and themes" menu,
"Icons" submenu instead.


> +if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
> +
> +choice
> +	bool "Icon type"
> +	default BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
> +	help
> +	  Choose the icon type to install on the target system.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
> +	bool "png"
> +	help
> +	  Use PNG icon types.
> +
> +	  The default. Traditional format; simplicity and compatibility.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG
> +	bool "svg"
> +	help
> +	  Use SVG icon types.
> +
> +	  Vector format that is limitlessly scalable.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
> +	bool "none"
> +	help
> +	  Do not install icons.
> +
> +	  Select this option if you want to only use other components
> +	  available in the google-material-design-icons package.

Instead of a choice here, please use simply two options:

	[ ] Install SVG icons
	[ ] Install PNG icons

This is simpler, allows to install both, any of the two, or none.

> +endchoice # Type selection.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE
> +	string
> +	default "png"  if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
> +	default "svg"  if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
> +	default "none" if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE

This is not used anywhere, please remove.

> +if !BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_LIST
> +	string "list of icons to install"
> +	default "action alert av communication content device editor file hardware image maps navigation notification social toggle"
> +	help
> +	  Specify a space-separated list of icon groups to install.
> +
> +endif

I think you should just install them all, and leave it to post-build
scripts to remove the unneeded icons.

> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT
> +	bool "Install TrueType font"
> +	default n

Not needed, default to n is the default.

> +	help
> +	  Install the Material TrueType font (ttf) on the target system.
> +
> +choice
> +	bool "Sprites"
> +	default BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_NONE
> +	help
> +	  Choose the icon type to install on the target system.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_NONE
> +	bool "none"
> +	help
> +	  Do not install Material sprites on the target system.
> +
> +	  The default. Material icon sprites are useful for html-based
> +	  development.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
> +	bool "css"
> +	help
> +	  Install CSS (PNG) spritesheets.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
> +	bool "svg"
> +	help
> +	  Install SVG spritesheets.
> +
> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS_SVG
> +	bool "css_svg"
> +	help
> +	  Install CSS (PNG) and SVG spritesheets.

Ditto here: please use two options instead of a choice:

	[ ] Install CSS sprites
	[ ] Install SVG sprites

This is simpler, and allows to install none, any of the two, or both.

> +config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_TYPE
> +	string
> +	default "none"    if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_NONE
> +	default "css"     if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
> +	default "svg"     if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
> +	default "css_svg" if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS_SVG

This is not used anywhere, please remove.


> diff --git a/package/google-material-design-icons/google-material-design-icons.mk b/package/google-material-design-icons/google-material-design-icons.mk
> new file mode 100644
> index 0000000..f8b447f
> --- /dev/null
> +++ b/package/google-material-design-icons/google-material-design-icons.mk
> @@ -0,0 +1,79 @@
> +################################################################################
> +#
> +# google-material-design-icons
> +#
> +################################################################################
> +
> +GOOGLE_MATERIAL_DESIGN_ICONS_VERSION = 2.0.0
> +GOOGLE_MATERIAL_DESIGN_ICONS_SOURCE = \
> +	$(GOOGLE_MATERIAL_DESIGN_ICONS_VERSION).tar.gz
> +GOOGLE_MATERIAL_DESIGN_ICONS_SITE = \
> +	https://github.com/google/material-design-icons/archive
> +GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE = CC-BY-4.0
> +GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE_FILES = LICENSE
> +
> +GOOGLE_MATERIAL_DESIGN_ICONS_LIST = \
> +	$(call qstrip,$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_LIST))
> +
> +ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG),y)
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS
> +	@for i in $(GOOGLE_MATERIAL_DESIGN_ICONS_LIST); \
> +	do \
> +		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
> +		$(INSTALL) -D -m 0644 $(@D)/$$i/1x_web/*.png \
> +			$(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
> +	done
> +endef
> +else ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),y)
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS
> +	@for i in $(GOOGLE_MATERIAL_DESIGN_ICONS_LIST); \
> +	do \
> +		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
> +		$(INSTALL) -D -m 0644 $(@D)/$$i/svg/production/*.svg \
> +			$(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
> +	done
> +endef
> +endif

Please refactor this to use the same code for both PNG and SVG, and use
a make foreach loop instead. Untested code:

GOOGLE_MATERIAL_DESIGN_ICONS_LIST = \
	action alert av communication content device editor file \
	hardware image maps navigation notification social toggle

define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS
	$(foreach family,$(GOOGLE_MATERIAL_DESIGN_ICONS_LIST),\
		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$(family) \
		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG),
			$(INSTALL) -D -m 0644 $(@D)/$(family)/1x_web/*.png) \
		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),
			$(INSTALL) -D -m 0644 $(@D)/$(family)/svg/*.png) \
	)
endef

> +ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT),y)
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT
> +	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/google-material
> +	$(INSTALL) -D -m 0644 $(@D)/iconfont/MaterialIcons-Regular.ttf \
> +		$(TARGET_DIR)/usr/share/fonts/google-material

No need for both $(INSTALL) commands, the second one is sufficient,
provided you give a full path as the second argument:

	$(INSTALL) -D -m 0644 $(@D)/iconfont/MaterialIcons-Regular.ttf \
		$(TARGET_DIR)/usr/share/fonts/google-material/MaterialIcons-Regular.ttf


> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_CSS
> +	$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/css-sprite
> +	$(INSTALL) -D -m 0644 $(@D)/sprites/css-sprite/* \
> +		$(TARGET_DIR)/usr/share/google-material/css-sprite
> +endef
> +
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_SVG
> +	$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/svg-sprite
> +	$(INSTALL) -D -m 0644 $(@D)/sprites/svg-sprite/* \
> +		$(TARGET_DIR)/usr/share/google-material/svg-sprite
> +endef
> +
> +ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS),y)
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
> +	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_CSS)
> +endef
> +else ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG),y)
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
> +	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_SVG)
> +endef
> +else ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS_SVG),y)
> +define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
> +	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_CSS)
> +	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_SVG)
> +endef
> +endif

A lot of simplification is possible here, by using the simpler option
logic I've suggested above.

Could you rework your patch with those suggestions? In the mean time,
I'll mark it as Changes Requested in our patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
