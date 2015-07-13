From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 17:34:44 +0200
Subject: [Buildroot] [PATCH 01/38] at: systemd support
In-Reply-To: <f3aa3efc49568ce60fa774f02c3f031ccbf40da2.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <f3aa3efc49568ce60fa774f02c3f031ccbf40da2.1432332802.git.alex.suykov@gmail.com>
Message-ID: <CAGduivzrtdTGoHgZKZJJ0ELTcw89uePTUC0S8xEh13-EYHukow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, all

On Sat, May 23, 2015 at 12:02 PM, Alex Suykov <alex.suykov@gmail.com> wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/at/at.mk       |  8 ++++++++
>  package/at/atd.service | 11 +++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/at/atd.service
>
> diff --git a/package/at/at.mk b/package/at/at.mk
> index 1504e32..be4c0b2 100644
> --- a/package/at/at.mk
> +++ b/package/at/at.mk
> @@ -25,4 +25,12 @@ define AT_INSTALL_INIT_SYSV
>         $(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
>  endef
>
> +define AT_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/at/atd.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/atd.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf /usr/lib/systemd/system/atd.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/atd.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/at/atd.service b/package/at/atd.service
> new file mode 100644
> index 0000000..543cbc3
> --- /dev/null
> +++ b/package/at/atd.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Run jobs queued for later execution
> +After=syslog.target
> +
> +[Service]
> +UMask=077
> +ExecStart=/usr/sbin/atd -f
> +Restart=always
If I look at the service file from Arch Linux, which is a pretty long
time systemd users, they don't have the UMask directive (I don't know
why you would need it).

Also they use "Type=forking" and without the -f so systemd will take
care of the daemon itself.
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
