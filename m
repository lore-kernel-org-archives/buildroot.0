From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 22:34:34 +0200
Subject: [Buildroot] [PATCH 16/38] netatalk: systemd support
In-Reply-To: <65f17c0367cfd65343d8529bca5be912b0484ed8.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <65f17c0367cfd65343d8529bca5be912b0484ed8.1432332802.git.alex.suykov@gmail.com>
Message-ID: <CAGduivwzwbFg2o7CGHg3NqdPK3vXHSawwsbYWtbUJ-SekudreA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, all

On Sat, May 23, 2015 at 12:05 PM, Alex Suykov <alex.suykov@gmail.com> wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/netatalk/netatalk.mk      |  8 ++++++++
>  package/netatalk/netatalk.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/netatalk/netatalk.service
>
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index a882b3c..c1fe440 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -57,4 +57,12 @@ define NETATALK_INSTALL_INIT_SYSV
>                 $(TARGET_DIR)/etc/init.d/S50netatalk
>  endef
>
> +define NETATALK_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/netatalk/netatalk.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/netatalk.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
You need to fix the path of this link.
> +       ln -sf /usr/lib/systemd/system/netatalk.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/netatalk.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/netatalk/netatalk.service b/package/netatalk/netatalk.service
> new file mode 100644
> index 0000000..e31bfd1
> --- /dev/null
> +++ b/package/netatalk/netatalk.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Netatalk
> +After=network.target
> +
> +[Service]
> +ExecStart=/usr/sbin/netatalk -d
I don't think you need '-d' if I look at the source in
'etc/netatalk/netatalk.c' I see that '-d' is for debug, why would we
want that ?

Your patch is marked as "Changes Requested" in the patchwork.
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
