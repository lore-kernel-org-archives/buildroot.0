From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 14:50:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ghostscript: add cups support
In-Reply-To: <20200501082617.14510-1-skif@skif-web.ru>
References: <20200501082617.14510-1-skif@skif-web.ru>
Message-ID: <20200501125026.GY11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2020-05-01 11:26 +0300, Alexey Lukyanchuk spake thusly:
> Ghostscript can be used for cups printing.
> 
> In current version it's disabled, but may be needed for some customers.
> 
> This patch add cups support if cups enabled.
> Also patch fix configure.ac for cross-compilation.



> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> 
> ---
> Changes v1 -> v2:
>  - use $(STAGING_DIR) for GHOSTSCRIPT_CUPS_CONFIG_FIX
> ---
>  .../ghostscript/0002-add-cups-support.patch   | 54 +++++++++++++++++++
>  package/ghostscript/ghostscript.mk            | 13 +++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 package/ghostscript/0002-add-cups-support.patch
> 
> diff --git a/package/ghostscript/0002-add-cups-support.patch b/package/ghostscript/0002-add-cups-support.patch
> new file mode 100644
> index 0000000000..262a06c102
> --- /dev/null
> +++ b/package/ghostscript/0002-add-cups-support.patch

This patch must have a subject and a commit log, and must bear your SoB
line as well. And sicne ghostscript is hosted in a git repository, thios
patch should be a proper git commit exported with 'git format-patch'.

[--SNIP--]
> +@@ -1473,7 +1443,6 @@
> +                 else
> +                   CUPSDATA="`$CUPSCONFIG --datadir`"
> +                 fi
> +-

This hunk is most probably useless...

> +                 CUPSINCLUDE="include $srcdir/cups/cups.mak"
> +                 CUPSDEV="cups"
> + 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 1d6f8d04a0..b515d8987a 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -10,6 +10,7 @@ GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
>  GHOSTSCRIPT_LICENSE_FILES = LICENSE
>  # 0001-Fix-cross-compilation-issue.patch
> +GHOSTSCRIPT_INSTALL_STAGING = YES
>  GHOSTSCRIPT_AUTORECONF = YES
>  GHOSTSCRIPT_DEPENDENCIES = \
>  	host-lcms2 \
> @@ -68,6 +69,18 @@ else
>  GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
>  endif
>  
> +define GHOSTSCRIPT_CUPS_CONFIG_FIX
> +cp $(STAGING_DIR)/usr/bin/cups-config  $(HOST_DIR)/usr/bin/
> +endef

You must not do that; instead pass:

    GHOSTSCRIPT_CONF_OPTS += \
        CUPSCONFIG=$(STAGING_DIR)/usr/bin/cups-config \
        --enable-cups

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_CUPS),y)
> +GHOSTSCRIPT_DEPENDENCIES += cups
> +GHOSTSCRIPT_PRE_CONFIGURE_HOOKS += GHOSTSCRIPT_CUPS_CONFIG_FIX
> +GHOSTSCRIPT_CONF_OPTS += --enable-cups
> +else
> +GHOSTSCRIPT_CONF_OPTS += --disable-cups
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
>  GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
>  GHOSTSCRIPT_CONF_OPTS += --with-x
> -- 
> 2.17.1
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
