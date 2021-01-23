From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 23:18:53 +0100
Subject: [Buildroot] [PATCH] package/ft8_lib: new package
In-Reply-To: <20210112134453.937629-1-friedtj@free.fr>
References: <20210112134453.937629-1-friedtj@free.fr>
Message-ID: <20210123221853.GI926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Michel, All,

On 2021-01-12 14:44 +0100, jmfriedt spake thusly:
> From: jfriedt <jean-michel.friedt@femto-st.fr>

Please use your "Real Name" as author, not your "username"; I'd guess
that would be:

    Jean-Michel Friedt <jean-michel.friedt@femto-st.fr>

> A C++ implementation of FT8 protocol, mostly intended for
> experimental use on microcontrollers.
> 
> Signed-off-by: jfriedt <jean-michel.friedt@femto-st.fr>

Ditto, use your Real Name.

[--SNIP--]
> diff --git a/package/ft8_lib/Config.in b/package/ft8_lib/Config.in
> new file mode 100644
> index 0000000000..b0e449789b
> --- /dev/null
> +++ b/package/ft8_lib/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FT8_LIB
> +	bool "ft8_lib"

It's a C++ library; it should:  depends on BR2_INSTALL_LIBSTDCPP

> +	help
> +	  A C++ implementation of FT8 protocol, mostly intended for
> +	  experimental use on microcontrollers.
> +
> +	  https://github.com/kgoba/ft8_lib

... and so a comment should be added:

    comment "ft8_lib needs a toolchain w/ C++"
        depends on !BR2_INSTALL_LIBSTDCPP

Also, I see that this only installs a static library, so it should:
    depends on !BR2_SHARED_LIBS

See:

    https://buildroot.org/downloads/manual/manual.html#depends-on-vs-select

> diff --git a/package/ft8_lib/ft8_lib.hash b/package/ft8_lib/ft8_lib.hash
> new file mode 100644
> index 0000000000..52b0df7aac
> --- /dev/null
> +++ b/package/ft8_lib/ft8_lib.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated after checking pgp signature
> +sha256  0b9a575eded512eca39e4118697dfbb38f2666e7070504e65f5e05e31fffed4f  ft8_lib-c6d79b961cd5425ede48ba5e5f3c279d0932c806.tar.gz
> +# License files, locally calculated
> +sha256  4c816505e73feef31f1ffafcf70d51e2aae65a88296e77d6c37715f31ce63230  LICENSE
> diff --git a/package/ft8_lib/ft8_lib.mk b/package/ft8_lib/ft8_lib.mk
> new file mode 100644
> index 0000000000..5c0c2d5d25
> --- /dev/null
> +++ b/package/ft8_lib/ft8_lib.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# ft8_lib
> +#
> +################################################################################
> +
> +FT8_LIB_VERSION = c6d79b961cd5425ede48ba5e5f3c279d0932c806
> +FT8_LIB_SITE = $(call github,kgoba,ft8_lib,$(FT8_LIB_VERSION))
> +
> +FT8_LIB_INSTALL_STAGING = YES
> +FT8_LIB_LICENSE = MIT
> +FT8_LIB_LICENSE_FILES = LICENSE
> +
> +define FT8_LIB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_AR) rc $(@D)/libft8.a $(@D)/ft8/constants.o $(@D)/ft8/encode.o $(@D)/ft8/pack.o \
> +		$(@D)/ft8/text.o $(@D)/common/wave.o

Direct calls to TARGET_AR are not something we see everyday, so maybe a
little blurb in the commit log would be in order to explain why this is
needed...

> +endef
> +
> +define FT8_LIB_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libft8.a $(STAGING_DIR)/usr/lib/libft8.a

A static library should proably be 0644, not 0755 (it does not need to
be executable!)

> +	mkdir -p $(STAGING_DIR)/usr/include/ft8

Just for consistence, use INSTALL to also create the directory:
    $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/ft8

> +	$(INSTALL) -D -m 0755 $(@D)/ft8/*.h $(STAGING_DIR)/usr/include/ft8/
> +	$(INSTALL) -D -m 0755 $(@D)/common/wave.h $(STAGING_DIR)/usr/include/ft8/

When INSTALLing multiple files with a glob, the -D option is not needed,
(and does not make sense).

Also, headers should 0644, not 0755 (they don't need to be executable!)

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
