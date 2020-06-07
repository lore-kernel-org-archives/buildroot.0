From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 13:14:01 +0200
Subject: [Buildroot] [PATCH 08/10] package/systemd: add hook to update
 journalctl catalogs
In-Reply-To: <20200206093633.251413-9-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-9-nolange79@gmail.com>
Message-ID: <CAFvCimXFDJPuaORT85xynX6pTTTXpeox5kFhewsAZHOo3=o+pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LGTM

Le jeu. 6 f?vr. 2020 ? 10:37, Norbert Lange <nolange79@gmail.com> a ?crit :

> journald supports catalog files, or rather a binary database of
> those.
> This add a hook to create said database from the available
> catalog source files (which are not needed afterwards).
>
> One ugly workaround is or ensuring that PURGE_LOCALES is
> called before, we do this by adding this hook
> (will then run twice during the finalize target step).
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 6ea25e3363..8db3a1b117 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -500,6 +500,16 @@ define SYSTEMD_PRESET_ALL
>  endef
>  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
>
> +define SYSTEMD_UPDATE_CATALOGS
> +       $(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
> +endef
> +
> +# SYSTEMD_UPDATE_CATALOGS needs to run after PURGE_LOCALES
> +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> +SYSTEMD_TARGET_FINALIZE_HOOKS += PURGE_LOCALES
> +endif
> +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_UPDATE_CATALOGS
> +
>  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
>
> @@ -577,6 +587,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
>  #   $(HOST_DIR)/lib
>  # * thus re-tweak rpath after the installation for all binaries that need
> it
>  HOST_SYSTEMD_HOST_TOOLS = \
> +       journalctl \
>         systemd-analyze \
>         systemd-mount \
>         systemctl \
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/7bbb23c0/attachment.html>
