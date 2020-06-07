From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 13:10:58 +0200
Subject: [Buildroot] [PATCH 02/10] package/systemd: add libnss-systemd
 to name resolution
In-Reply-To: <20200206093633.251413-3-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-3-nolange79@gmail.com>
Message-ID: <CAFvCimV8L4aNeTx+4AShTtzD5LzOcOD4QQ5mvzx1-sE-D3rz0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't have enough knowledge of nss, to vet this patch, but
adding nss-systemd in nsswitch by itself is a great idea

Le jeu. 6 f?vr. 2020 ? 10:36, Norbert Lange <nolange79@gmail.com> a ?crit :

> The feature DynamicUser creates users/groups without
> touching the /etc/{passwd,group} files on disk.
> Adding the dynamic resolver to /etc/nsswitch.conf
> ensures the Names are resolved consistently.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 05b07cfd1b..a390cdd1a9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -409,7 +409,15 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>         touch $(TARGET_DIR)/etc/machine-id
>  endef
>
> +define SYSTEMD_ADD_NSSCONFIG_HOOK
> +       grep >/dev/null '^passwd:.*systemd'
> $(TARGET_DIR)/etc/nsswitch.conf || \
> +               sed '/^passwd:/ s/$$/ systemd/'
> $(TARGET_DIR)/etc/nsswitch.conf
> +       grep >/dev/null '^group:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf
> || \
> +               sed '/^group:/ s/$$/ systemd/'
> $(TARGET_DIR)/etc/nsswitch.conf
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +       SYSTEMD_ADD_NSSCONFIG_HOOK \
>         SYSTEMD_INSTALL_INIT_HOOK \
>         SYSTEMD_INSTALL_MACHINEID_HOOK \
>         SYSTEMD_INSTALL_RESOLVCONF_HOOK
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/7428896a/attachment.html>
