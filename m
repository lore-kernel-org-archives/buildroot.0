From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 12:44:39 +0200
Subject: [Buildroot] [PATCH 3/4] package/openssh: seperate sd service
 for host key generation
In-Reply-To: <20200605225905.14082-3-nolange79@gmail.com>
References: <20200605225905.14082-1-nolange79@gmail.com>
 <20200605225905.14082-3-nolange79@gmail.com>
Message-ID: <CAFvCimUz5XVA9roApaXTqzkW4QMO4d_Qcy_aY5GjUY9Hbid5Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Why the RemainAfterExit ?
This is a "real oneshot", it doesn't need a state to stay behind.
Moreover it would only stay behind when actually generating the key. in all
followup boot the unit would not be started at all

Appart from that, Looks good to me...

Le sam. 6 juin 2020 ? 00:59, Norbert Lange <nolange79@gmail.com> a ?crit :

> split out generationg of host keys into an optional service
> that can easily be removed or deactivated.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/openssh/openssh.mk               |  5 +++--
>  package/openssh/sshd-host-keygen.service | 20 ++++++++++++++++++++
>  package/openssh/sshd.service             |  1 -
>  3 files changed, 23 insertions(+), 3 deletions(-)
>  create mode 100644 package/openssh/sshd-host-keygen.service
>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index d425db1428..6b3ee1f5f4 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -114,8 +114,9 @@ endef
>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
>
>  define OPENSSH_INSTALL_INIT_SYSTEMD
> -       $(INSTALL) -D -m 644 package/openssh/sshd.service \
> -               $(TARGET_DIR)/usr/lib/systemd/system/sshd.service
> +       mkdir $(TARGET_DIR)/usr/lib/systemd/system
> +       $(INSTALL) -m 644 package/openssh/sshd*.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/
>         $(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
>  endef
>
> diff --git a/package/openssh/sshd-host-keygen.service
> b/package/openssh/sshd-host-keygen.service
> new file mode 100644
> index 0000000000..058e671c44
> --- /dev/null
> +++ b/package/openssh/sshd-host-keygen.service
> @@ -0,0 +1,20 @@
> +[Unit]
> +Description=SSH Key Generation
> +Before=sshd.service
> +
> +ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key.pub
> +ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key.pub
> +ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key.pub
> +ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
> +ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key.pub
> +
> +[Service]
> +ExecStart=/usr/bin/ssh-keygen -A
> +Type=oneshot
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=sshd.service
> diff --git a/package/openssh/sshd.service b/package/openssh/sshd.service
> index 715bd3f7eb..797e249d8d 100644
> --- a/package/openssh/sshd.service
> +++ b/package/openssh/sshd.service
> @@ -4,7 +4,6 @@ Documentation=man:sshd(8) man:sshd_config(5)
>  After=network.target auditd.service
>
>  [Service]
> -ExecStartPre=/usr/bin/ssh-keygen -A
>  ExecStartPre=/usr/sbin/sshd -t
>  ExecStart=/usr/sbin/sshd -D
>  ExecReload=/usr/sbin/sshd -t
> --
> 2.26.2
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/cc602538/attachment.html>
