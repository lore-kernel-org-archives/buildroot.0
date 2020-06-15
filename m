From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 15 Jun 2020 16:27:59 +0200
Subject: [Buildroot] [PATCH v2 09/14] package/systemd: option to delete
 all catalog files
In-Reply-To: <20200615072055.2083-10-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-10-nolange79@gmail.com>
Message-ID: <CAFvCimV2ySTfDVweTMQ7aQpX1PMHATGtKosQDCuvsukhBctxAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Norbert

this is similar to the way hwdb source files are handled and,
if my understanding is correct, the general buildroot
philosophy is that that sort of files are not needed on the
target at all, since buildroot does not support on-target
updates. So i don't think an option is required, just
remove the files. (I'm a bit fuzzy on the buildroot philosophy,
but that's my understanding. If a real dev disagree, follow their
advice...)

Le lun. 15 juin 2020 ? 09:21, Norbert Lange <nolange79@gmail.com> a ?crit :

> Unless you need to rebuild the database, there is
> no need for the (source) catalog files.
>
> This option removes the files, and the service
> in a ROOTFS_PRE_CMD_HOOK.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in  | 12 ++++++++++++
>  package/systemd/systemd.mk | 10 ++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index dd3b8c534d..b09bd36ab6 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -251,6 +251,18 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
>
>
> http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
>
> +config BR2_PACKAGE_SYSTEMD_RETAIN_CATALOGS
> +       bool "retain source catalog files"
> +       help
> +         catalog files are used to provide extended and potentially
> localized
> +         messages for the journal.
> +         The files reside in /usr/lib/systemd/catalog, but arent used
> directly,
> +         instead a binary database will be built using these files.
> +
> +         Only if the database needs to be rebuilt later they need to be
> retained.
> +
> +         https://www.freedesktop.org/wiki/Software/systemd/catalog/
> +
>  config BR2_PACKAGE_SYSTEMD_LOCALED
>         bool "enable locale daemon"
>         help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index d3be92b78c..e117e3a082 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -464,6 +464,16 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
>  SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
>  endif
>
> +ifneq ($(BR2_PACKAGE_SYSTEMD_RETAIN_CATALOGS),y)
> +define SYSTEMD_RM_SOURCE_CATALOGS_HOOK
> +       rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog
> +       find $(TARGET_DIR)/usr/lib/systemd/system \
> +               -name systemd-journal-catalog-update.service -delete
> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_SOURCE_CATALOGS_HOOK
> +endif
> +
>  define SYSTEMD_INSTALL_INIT_HOOK
>         ln -fs multi-user.target \
>                 $(TARGET_DIR)/usr/lib/systemd/system/default.target
> --
> 2.27.0
>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200615/d363d117/attachment.html>
