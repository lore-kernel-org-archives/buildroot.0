From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:21:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] ncurses: bump to 6.0
In-Reply-To: <20170306150101.4374-1-aduskett@codeblue.com>
References: <20170306150101.4374-1-aduskett@codeblue.com>
Message-ID: <20170312232146.46571729@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 10:01:01 -0500, Adam Duskett wrote:

> v1 -> v2:
>   - Updated to work with Thomas Petazzoni's changes.

Are you sure?


> -config BR2_PACKAGE_NCURSES_TARGET_PANEL
> -	bool "ncurses libpanel in target"
> -	help
> -	  Includes ncurses dynamic libpanel in target
> -
> -config BR2_PACKAGE_NCURSES_TARGET_FORM
> -	bool "ncurses libform in target"
> -	help
> -	  Includes ncurses dynamic libform in target
> -
> -config BR2_PACKAGE_NCURSES_TARGET_MENU
> -	bool "ncurses libmenu in target"
> -	help
> -	  Includes ncurses dynamic libmenu in target
> -

This repeats my commit.

> -NCURSES_LIBS-y = ncurses
> -NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += menu
> -NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += panel
> -NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
> -
>  NCURSES_TERMINFO_FILES = \
>  	a/ansi \
>  	l/linux \
> @@ -73,41 +68,38 @@ NCURSES_TERMINFO_FILES = \
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
>  NCURSES_CONF_OPTS += --enable-widec
>  NCURSES_LIB_SUFFIX = w
> +NCURSES_LIBS = ncurses menu panel form
>  
>  define NCURSES_LINK_LIBS_STATIC
> -	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
> -		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).a $(1)/usr/lib/$(lib).a
> +	$(foreach lib,$(NCURSES_LIBS:%=lib%), \
> +		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).a $(STAGING_DIR)/usr/lib/$(lib).a
>  	)
>  	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
> -		$(1)/usr/lib/libcurses.a
> +		$(STAGING_DIR)/usr/lib/libcurses.a
>  endef
>  
>  define NCURSES_LINK_LIBS_SHARED
> -	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
> -		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(1)/usr/lib/$(lib).so
> +	$(foreach lib,$(NCURSES_LIBS:%=lib%), \
> +		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(STAGING_DIR)/usr/lib/$(lib).so
>  	)
>  	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
> -		$(1)/usr/lib/libcurses.so
> +		$(STAGING_DIR)/usr/lib/libcurses.so
>  endef
>  
>  define NCURSES_LINK_PC
> -	$(foreach pc,$(NCURSES_LIBS-y), \
> +	$(foreach pc,$(NCURSES_LIBS), \
>  		ln -sf $(pc)$(NCURSES_LIB_SUFFIX).pc \
> -			$(1)/usr/lib/pkgconfig/$(pc).pc
> +			$(STAGING_DIR)/usr/lib/pkgconfig/$(pc).pc
>  	)
>  endef
>  
> -NCURSES_LINK_TARGET_LIBS = \
> -	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(TARGET_DIR));) \
> -	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(TARGET_DIR)))
>  NCURSES_LINK_STAGING_LIBS = \
> -	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(STAGING_DIR));) \
> -	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(STAGING_DIR)))
> +	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC);) \
> +	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED))
>  
> -NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
> +NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC)

And all of this as well.

So clearly, this patch does not apply on master. Please provide a patch
that applies on master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
