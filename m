From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 22:44:45 +0200
Subject: [Buildroot] [PATCH] dhcp: add systemd service file
In-Reply-To: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140921204445.GB28325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-09-15 23:04 +0200, Eric Le Bihan spake thusly:
> Add a systemd service file to start dhcpd.
> 
> The network interfaces to listen on can be set via the variable
> INTERFACES in /etc/default/dhcpd.conf. Example:
> 
>   INTERFACES="eth0 eth1"
> 
> Also install a tmpfiles.d file to create /var/lib/dhcp/dhcpd.leases
> (needed at dhcpd start-up).
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/dhcp/dhcp.mk       | 15 +++++++++++++++
>  package/dhcp/dhcpd.service | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/dhcp/dhcpd.service
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 9251185..1b914a8 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -74,6 +74,21 @@ define DHCP_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
>  endef
>  
> +define DHCP_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
> +		$(TARGET_DIR)/lib/systemd/system/dhcpd.service
> +
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +
> +	ln -sf ../../../../lib/systemd/system/dhcpd.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
> +
> +	echo "d /var/lib/dhcp 0755 - - - -" > \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> +	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf

I'm not sure to understand those two. Are they needed on the target?

They suspiciously look like our 'makedev' syntax. Does systemd recognise
this too?

Regards,
Yann E. MORIN.

> +endef
> +
>  define DHCP_INSTALL_TARGET_CMDS
>  	$(DHCP_INSTALL_RELAY)
>  	$(DHCP_INSTALL_SERVER)
> diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
> new file mode 100644
> index 0000000..7b265cb
> --- /dev/null
> +++ b/package/dhcp/dhcpd.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=DHCP server
> +After=network.target
> +
> +[Service]
> +Type=forking
> +PIDFile=/run/dhcpd.pid
> +ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
> +KillSignal=SIGINT
> +EnvironmentFile=/etc/default/dhcpd.conf
> +
> +[Install]
> +WantedBy=multi-user.target
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
