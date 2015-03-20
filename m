From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 09:06:14 -0400
Subject: [Buildroot] [PATCH] package/haveged: add systemd units
In-Reply-To: <1426798923-13980-1-git-send-email-steven@uplinklabs.net>
References: <1426798923-13980-1-git-send-email-steven@uplinklabs.net>
Message-ID: <CANPyyuO-L5V_XJCxfm0XbmCoQE00EnDFV4c4-TG5CfXmWZ2d+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Mike Williams <mike@mikebwilliams.com>

On Thu, Mar 19, 2015 at 5:02 PM, Steven Noonan <steven@uplinklabs.net> wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/haveged/haveged.mk      |  8 ++++++++
>  package/haveged/haveged.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/haveged/haveged.service
>
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index 88d85cd..c68f766 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -14,4 +14,12 @@ define HAVEGED_INSTALL_INIT_SYSV
>                 $(TARGET_DIR)/etc/init.d/S21haveged
>  endef
>
> +define HAVEGED_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/haveged/haveged.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/haveged.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -fs /usr/lib/systemd/system/haveged.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/haveged.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
> new file mode 100644
> index 0000000..d87fe5b
> --- /dev/null
> +++ b/package/haveged/haveged.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Entropy Harvesting Daemon
> +Documentation=man:haveged(8)
> +
> +[Service]
> +ExecStart=/usr/bin/haveged -F -w 1024 -v 1
> +SuccessExitStatus=143
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 2.3.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
