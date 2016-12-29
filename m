From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 29 Dec 2016 17:20:10 +0100
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
In-Reply-To: <20161229145650.4013-1-barbieri@profusion.mobi>
References: <20161229145650.4013-1-barbieri@profusion.mobi>
Message-ID: <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 29/12/2016 ? 15:56, Gustavo Sverzut Barbieri a ?crit :
> Ecore will reach 'upower' using D-Bus in order to detect if the system
> state changes. This is optional, but done by default and if D-Bus
> itself fails, then an error message will be presented.

What's the error message ?
I don't see any dbus message related to upower.

> 
> Since we do not ship upower target package, just remove that from
> target. Since it's useless for host, remove it as well.

The efl upower module is used by the enlightenment battery module.
It's started here but I'm not sure it's really working (100% Battery).

Also, the efl package install several build tools and files on the target.
It would be difficult to update all of these hooks between release.
I recommend to use a post-build script in this case.

I admit, I didn't noticed this module until now :p

Maybe it easier to package upower and add it to efl dependencies ?

Best regards,
Romain

> 
> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> ---
>  package/efl/efl.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index 7a8e47f4c..f7c99a965 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -272,6 +272,11 @@ else
>  EFL_CONF_OPTS += --disable-librsvg
>  endif
>  
> +define EFL_HOOK_REMOVE_UPOWER
> +	rm -fr $(TARGET_DIR)/usr/lib/ecore/system/upower
> +endef
> +EFL_POST_INSTALL_TARGET_HOOKS = EFL_HOOK_REMOVE_UPOWER
> +
>  $(eval $(autotools-package))
>  
>  ################################################################################
> @@ -352,4 +357,9 @@ else
>  HOST_EFL_CONF_OPTS += --disable-cxx-bindings
>  endif
>  
> +define HOST_EFL_HOOK_REMOVE_UPOWER
> +	rm -fr $(HOST_DIR)/usr/lib/ecore/system/upower
> +endef
> +HOST_EFL_POST_INSTALL_HOOKS = HOST_EFL_HOOK_REMOVE_UPOWER
> +
>  $(eval $(host-autotools-package))
> 
