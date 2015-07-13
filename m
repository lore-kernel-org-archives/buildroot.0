From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 20:01:29 +0200
Subject: [Buildroot] [PATCH 15/38] neard: systemd support
In-Reply-To: <fa0bed763359b6b38358e16ee82ef281878ec8c1.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <fa0bed763359b6b38358e16ee82ef281878ec8c1.1432332802.git.alex.suykov@gmail.com>
Message-ID: <CAGduivwv5+eMxpHGc5jZHwBzLHH=tU3eXoN7ZZ=7gti7EhAZfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, all

On Sat, May 23, 2015 at 12:05 PM, Alex Suykov <alex.suykov@gmail.com> wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/neard/neard.mk      |  8 ++++++++
>  package/neard/neard.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/neard/neard.service
>
> diff --git a/package/neard/neard.mk b/package/neard/neard.mk
> index fc92421..dd18b0a 100644
> --- a/package/neard/neard.mk
> +++ b/package/neard/neard.mk
> @@ -23,4 +23,12 @@ define NEARD_INSTALL_INIT_SYSV
>                 $(TARGET_DIR)/etc/init.d/S53neard
>  endef
>
> +define NEARD_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/neard/neard.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/neard.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf /usr/lib/systemd/system/neard.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/neard.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/neard/neard.service b/package/neard/neard.service
> new file mode 100644
> index 0000000..978163d
> --- /dev/null
> +++ b/package/neard/neard.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Near-field communication daemon
> +After=syslog.target
> +
> +[Service]
> +ExecStart=/usr/libexec/nfc/neard -d '*'
> +Restart=always
If you use neard like that, it will fork, so you need to tell systemd
with a Type=forking and specify the PID through PIDFile=

What would be more coherent with what we currently have is simply by
passing -n (--nodaemon)

You patch will be marked as "ChangesRequested" in patchwork
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 2.0.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
