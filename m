From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 23:49:21 +0200
Subject: [Buildroot] [PATCH 18/38] netsnmp: systemd support
In-Reply-To: <3163c13927d94a844be0b4a1b3a5f2123f09aec1.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <3163c13927d94a844be0b4a1b3a5f2123f09aec1.1432332802.git.alex.suykov@gmail.com>
Message-ID: <CAGduivwL3SM11qgbVMWBzVjRxfVid822fbi4-RdGn7sMPo-wqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, all

On Sat, May 23, 2015 at 12:06 PM, Alex Suykov <alex.suykov@gmail.com> wrote:
> The service file follows sysv startup script with 127.0.0.1
> and the rest of the options hardcoded.
>
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/netsnmp/netsnmp.mk    |  7 +++++++
>  package/netsnmp/snmpd.service | 10 ++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/netsnmp/snmpd.service
>
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 6eff5e3..b364c5c 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -94,6 +94,13 @@ define NETSNMP_INSTALL_INIT_SYSV
>         $(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
>                 $(TARGET_DIR)/etc/init.d/S59snmpd
>  endef
> +define NETSNMP_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/netsnmp/snmpd.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/snmpd.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -sf /usr/lib/systemd/system/snmpd.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/snmpd.service
> +endef
The snmp server is not mandatory, you need to check before installing
the service file.
>  endif
>
>  define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
> diff --git a/package/netsnmp/snmpd.service b/package/netsnmp/snmpd.service
> new file mode 100644
> index 0000000..6926b9b
> --- /dev/null
> +++ b/package/netsnmp/snmpd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=SNMP daemon
> +After=syslog.target network.target
> +
> +[Service]
> +ExecStart=/usr/sbin/snmpd -f -M /usr/share/snmp/mibs -Lsd 127.0.0.1
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
Maybe add the support of snmptrapd ?

In the meantime, your patch will be marked as "changes requested" in
the patchwork.
> --
> 2.0.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
