From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 6 Feb 2018 15:56:32 +0100
Subject: [Buildroot] [PATCH] package/avahi: Add sysusers.d snippet
In-Reply-To: <20180123232005.6005-1-chris.lesiak@licor.com>
References: <20180123232005.6005-1-chris.lesiak@licor.com>
Message-ID: <CAHXCMM+azgogE7evpT6aJ_pdh18b3m0XkA2H2zDwy9eLFXM1Yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, all,

On Wed, Jan 24, 2018 at 12:20 AM, Chris Lesiak <chris.lesiak@licor.com> wrote:
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> ---
>  package/avahi/avahi.mk            | 9 +++++++++
>  package/avahi/avahi_sysusers.conf | 5 +++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 package/avahi/avahi_sysusers.conf
>
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index ef621620f0..baffe3cb69 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -190,6 +190,13 @@ endif
>
>  ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
>
> +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
> +define AVAHI_INSTALL_SYSTEMD_SYSUSERS
> +       $(INSTALL) -D -m 644 package/avahi/avahi_sysusers.conf \
> +               $(TARGET_DIR)/usr/lib/sysusers.d/avahi.conf
> +endef
> +endif
> +
>  define AVAHI_INSTALL_INIT_SYSTEMD
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>
> @@ -201,6 +208,8 @@ define AVAHI_INSTALL_INIT_SYSTEMD
>
>         $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
>                 $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
> +
> +       $(AVAHI_INSTALL_SYSTEMD_SYSUSERS)
>  endef
>
>  define AVAHI_INSTALL_DAEMON_INIT_SYSV
> diff --git a/package/avahi/avahi_sysusers.conf b/package/avahi/avahi_sysusers.conf
> new file mode 100644
> index 0000000000..463ce97cea
> --- /dev/null
> +++ b/package/avahi/avahi_sysusers.conf
> @@ -0,0 +1,5 @@
> +# sysusers.d snippet for creating the avahi system user automatically
> +# at boot on systemd-based systems that ship with an unpopulated
> +# /etc. See sysusers.d(5) for details.
> +
> +u avahi - "Avahi mDNS/DNS-SD Stack"
> --
> 2.13.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
