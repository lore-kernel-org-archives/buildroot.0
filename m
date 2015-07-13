From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 20:44:09 +0200
Subject: [Buildroot] [PATCH 33/38] vsftpd: systemd support
In-Reply-To: <63144b95f35408d9343a649ed057e2cb1eb3041e.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <63144b95f35408d9343a649ed057e2cb1eb3041e.1432332802.git.alex.suykov@gmail.com>
Message-ID: <CAGduivxXP5L5XgPuqc4vqDZ4UHVufYuWFZN3bT9f2iaP7tj-nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, all

On Sat, May 23, 2015 at 12:14 PM, Alex Suykov <alex.suykov@gmail.com> wrote:
> Foreground/background mode can be set either way in the config file,
> so command line override is used to force foreground.
>
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/vsftpd/vsftpd.mk      |  8 ++++++++
>  package/vsftpd/vsftpd.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/vsftpd/vsftpd.service
>
> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
> index 3091f06..6f6964a 100644
> --- a/package/vsftpd/vsftpd.mk
> +++ b/package/vsftpd/vsftpd.mk
> @@ -55,4 +55,12 @@ define VSFTPD_INSTALL_TARGET_CMDS
>         $(INSTALL) -d -m 700 $(TARGET_DIR)/usr/share/empty
>  endef
>
> +define VSFTPD_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/vsftpd/vsftpd.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/vsftpd.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf /usr/lib/systemd/system/vsftpd.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vsftpd.service
> +endef
> +
>  $(eval $(generic-package))
> diff --git a/package/vsftpd/vsftpd.service b/package/vsftpd/vsftpd.service
> new file mode 100644
> index 0000000..a1c370a
> --- /dev/null
> +++ b/package/vsftpd/vsftpd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=FTP daemon
> +After=syslog.target network.target auditd.target
Why would run after audit.target ? It doesn't make much sense.
> +
> +[Service]
> +ExecStart=/usr/bin/vsftpd /etc/vsftpd.conf -obackground=NO
You don't need to pass '/etc/vsftpd.conf' since it's the default and
background is not specified into the configuration file so it will not
be overridden.

Your patch will be marked as "Changes Requested" in patchwork.
> +Restart=always
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
