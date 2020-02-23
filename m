From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 21:41:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/gobject-introspection: fix
 host-linking
In-Reply-To: <20200221224313.854089-2-aduskett@gmail.com>
References: <20200221224313.854089-1-aduskett@gmail.com>
 <20200221224313.854089-2-aduskett@gmail.com>
Message-ID: <20200223204155.GT8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-02-21 14:43 -0800, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> The host-variant of gobject-introspection currently links against the host
> libraries. To resolve this, specify the LD_LIBRARY_PATH in
> HOST_GOBJECT_INTROSPECTION_NINJA_ENV.
> 
> This fix has the added benefit of allowing the host gobject-introspection to
> build the host .gir, .rnc, and .typelib files, which some packages may require.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gobject-introspection/gobject-introspection.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index 67e5e37dee..e719588437 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -33,11 +33,11 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
>  GOBJECT_INTROSPECTION_NINJA_ENV += \
>  	CC="$(TARGET_CC)"
>  
> -# Disable introspection data on the host, as it is not needed and
> -# the package will attempt to use the systems libglib2 which will fail
> -# if the systems libglib2 version is older than 2.60.
> -HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
> -	-Denable-introspection-data=false
> +# g-ir-scanner will default to /usr/bin/ld for linking if this is not set,
> +# which will cause gobject-introspection to attempt to link against the hosts
> +# libglib2
> +HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +	LD_LIBRARY_PATH="$(HOST_DIR)/lib"

As discussed on IRC: I am not too fond of using LD_LIBRARY_PATH.

In the past, we had problems because of LD_LIBRARY_PATH, so we ditched
it and switched to using DT_RPATH embedded in the ELF files.

The real problem here, is to understand why our HOST_LDFLAGS are not
passed down through the g-ir toolset. But as someone famously said: "We
can always expect GOI to do the wrong thing".

Still LD_LIBRARY_PATH slightly irks me... Instead, I suggest we use
LD_RUN_PATH (which existed at least as far back as binutils-2.10,
relased in 2000), and you said on IRC that it seemed to work.

Care to dig deeper and respin, please?

Thanks! :-)

Regards,
Yann E. MORIN.

>  # Use the host gi-scanner to prevent the scanner from generating incorrect
>  # elf classes.
> -- 
> 2.24.1
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
