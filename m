From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 12:33:58 +0100
Subject: [Buildroot] [PATCH v2 2/9] use host-systemctl preset all to
 enable units
In-Reply-To: <20191111172443.6874-3-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-3-jeremy.rosen@smile.fr>
Message-ID: <20191205113358.GD2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> since v234 upstream recommands using systemctl preset-all to enable units.
[--SNIP--]
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index aef39abe27..58c7696d65 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_KMOD_TOOLS
>  	select BR2_TARGET_TZ_INFO
>  	select BR2_NEEDS_HOST_UTF8_LOCALE
> +	select BR2_PACKAGE_HOST_SYSTEMD

Here you select a symbol that no longer exists in your v2, but if you
follow what I suggest in my reply to the previous patch, you'll have to
keep it as it is here (but add a comment why it is needed, like we do
in eudev and host-eudev):

    select BR2_PACKAGE_HOST_SYSTEMD # for systemctl, during target-finalize

and...

[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index d1db60b5ef..dc2ed80e7d 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -12,6 +12,7 @@ SYSTEMD_INSTALL_STAGING = YES
>  SYSTEMD_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
>  	host-gperf \
> +	host-systemd \

... you'll have to remove this build-order dependency.

[--SNIP--]
> +define SYSTEMD_PRESET_ALL
> +	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
> +endef
> +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL

As I already noted in my previous review, and as we discussed on IRC:
this actually changes the current behaviour of a few packages, which so
far installed their unit files but did not explicitly enable them.

With this patch, these units are now enabled by default.

This is an acceptable change in behaviour: installing units but not
enabling them is probably on oversight, as no such package have
explanations why this is so, neither in their .mk, nor in the commit
log introducing the unit installation (or the package as a whole).

This change of behaviour should however be explained prominently in
the commit log.

Thanks! :-)

Regards,
Yann E. MORIN.

> +
> +
>  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
>  
> -- 
> 2.24.0.rc1
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
