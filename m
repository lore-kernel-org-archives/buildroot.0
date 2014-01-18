From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Sat, 18 Jan 2014 20:19:56 -0200
Subject: [Buildroot] [PATCH 07/10] connman: add systemd unit file
In-Reply-To: <1390073027-14239-8-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-8-git-send-email-s.martin49@gmail.com>
Message-ID: <CAKi4VAKwCWt6MvkWXHdMQ0RT7=QU+qbj+5zVHvh7tr+6GxCEtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jan 18, 2014 5:24 PM, "Samuel Martin" <s.martin49@gmail.com> wrote:
>
> This patch cleans up the init material installation:
> - it uses the *_INSTALL_INIT_SYSV infra instead of the custom hook;
> - it add and install the systemd unit file
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/connman/connman.mk      | 10 ++++++++--
>  package/connman/connman.service | 12 ++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 package/connman/connman.service

Why not enable the configure flag to install the systemd service from
upstream?

Lucas De Marchi

>
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 64c1f0e..9161cce 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -24,11 +24,17 @@ CONNMAN_DEPENDENCIES += \
>         $(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
>         $(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono)
>
> -define CONNMAN_INSTALL_INITSCRIPT
> +define CONNMAN_INSTALL_INIT_SYSV
>         $(INSTALL) -m 0755 -D package/connman/S45connman
$(TARGET_DIR)/etc/init.d/S45connman
>  endef
>
> -CONNMAN_POST_INSTALL_TARGET_HOOKS = CONNMAN_INSTALL_INITSCRIPT
> +define CONNMAN_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/connman/connman.service \
> +               $(TARGET_DIR)/etc/systemd/system/connman.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -fs ../connman.service \
> +
$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
> +endef
>
>  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
>  CONNMAN_CONF_OPT += --enable-client
> diff --git a/package/connman/connman.service
b/package/connman/connman.service
> new file mode 100644
> index 0000000..bb6b3c0
> --- /dev/null
> +++ b/package/connman/connman.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=Connection service
> +After=syslog.target
> +
> +[Service]
> +Type=dbus
> +BusName=net.connman
> +Restart=on-failure
> +ExecStart=/usr/bin/connmand -n
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 1.8.5.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140118/cf96d51f/attachment.html>
