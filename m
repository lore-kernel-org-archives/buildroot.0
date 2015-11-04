From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Wed, 4 Nov 2015 14:35:35 +0100
Subject: [Buildroot] [PATCH v3 13/13] package/dhcp: systemd: add
	dhcrelay service file
In-Reply-To: <CAGduivzruYhUvjMdxw12EB+FaemiJX3p=zsfUra-Ma4dbkEC8g@mail.gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-13-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivzruYhUvjMdxw12EB+FaemiJX3p=zsfUra-Ma4dbkEC8g@mail.gmail.com>
Message-ID: <563A09A7.10002@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

On 04/11/2015 12:24, Maxime Hadjinlian wrote:
> On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com>> wrote:
> 
>     Add a systemd service file to start dhcrelay.
> 
>     The network interfaces to listen on must be set via the variable IFCMD
>     in /etc/default/dhcrelay, e.g.:
> 
>         IFCMD="-i eth0 -i eth1"
> 
>     The "upstream" servers to pass the queries along to must be set via the
>     variable SERVERS in the same file, e.g.:
> 
>         SERVERS="server0 server1"
> 
>     Extra command line options can be set via the variable OPTIONS in the
>     same file.
> 
>     Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com>>
> 
>     ---
>     Changes v2 -> v3: new patch.
>     ---
>      package/dhcp/dhcp.mk <http://dhcp.mk>          | 45 ++++++++++++++++++++++++++++---------------
>      package/dhcp/dhcrelay.service | 13 +++++++++++++
>      2 files changed, 42 insertions(+), 16 deletions(-)
>      create mode 100644 package/dhcp/dhcrelay.service
> 
>     diff --git a/package/dhcp/dhcp.mk <http://dhcp.mk> b/package/dhcp/dhcp.mk <http://dhcp.mk>
>     index 3aa1577..4ba302b 100644
>     --- a/package/dhcp/dhcp.mk <http://dhcp.mk>
>     +++ b/package/dhcp/dhcp.mk <http://dhcp.mk>
>     @@ -37,6 +37,23 @@ define DHCP_INSTALL_SERVER
>             $(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
>                     $(TARGET_DIR)/etc/dhcp/dhcpd.conf
>      endef
>     +
>     +define DHCP_INSTALL_SERVER_INIT_SYSTEMD
>     +       $(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
>     +               $(TARGET_DIR)/usr/lib/systemd/system/dhcpd.service
>     +
>     +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>     +
>     +       ln -sf ../../../../usr/lib/systemd/system/dhcpd.service \
>     +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
>     +
>     +       echo "d /var/lib/dhcp 0755 - - - -" > \
>     +               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     +       echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
>     +               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     +       echo "f /var/lib/dhcp/dhcpd6.leases - - - - -" >> \
>     +               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     +endef
>      endif
> 
>      ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
>     @@ -46,6 +63,16 @@ define DHCP_INSTALL_RELAY
>             $(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
>                     $(TARGET_DIR)/usr/sbin/dhcrelay
>      endef
>     +
>     +define DHCP_INSTALL_RELAY_INIT_SYSTEMD
>     +       $(INSTALL) -D -m 644 package/dhcp/dhcrelay.service \
>     +               $(TARGET_DIR)/usr/lib/systemd/system/dhcrelay.service
>     +
>     +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>     +
>     +       ln -sf ../../../../usr/lib/systemd/system/dhcrelay.service \
>     +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcrelay.service
>     +endef
>      endif
> 
>      ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
>     @@ -69,24 +96,10 @@ define DHCP_INSTALL_INIT_SYSV
>                     $(TARGET_DIR)/etc/init.d/S80dhcp-relay
>      endef
> 
>     -ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
>      define DHCP_INSTALL_INIT_SYSTEMD
>     -       $(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
>     -               $(TARGET_DIR)/usr/lib/systemd/system/dhcpd.service
>     -
>     -       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>     -
>     -       ln -sf ../../../../usr/lib/systemd/system/dhcpd.service \
>     -               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
>     -
>     -       echo "d /var/lib/dhcp 0755 - - - -" > \
>     -               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     -       echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
>     -               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     -       echo "f /var/lib/dhcp/dhcpd6.leases - - - - -" >> \
>     -               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     +       $(DHCP_INSTALL_SERVER_INIT_SYSTEMD)
>     +       $(DHCP_INSTALL_RELAY_INIT_SYSTEMD)
>      endef
>     -endif
> 
>      define DHCP_INSTALL_TARGET_CMDS
>             $(DHCP_INSTALL_RELAY)
>     diff --git a/package/dhcp/dhcrelay.service b/package/dhcp/dhcrelay.service
>     new file mode 100644
>     index 0000000..5a1410e
>     --- /dev/null
>     +++ b/package/dhcp/dhcrelay.service
>     @@ -0,0 +1,13 @@
>     +[Unit]
>     +Description=DHCP relay
>     +After=network.target
>     +
>     +[Service]
>     +Type=forking
>     +PIDFile=/run/dhcrelay.pid
>     +ExecStart=/usr/sbin/dhcrelay -q -pf /run/dhcrelay.pid $OPTIONS $IFCMD $SERVERS
> 
> Why don't we want /var/run/dhcrelay.pid which is the default ? 

I did that to be consistent with what had been done for dhcpd.service.

/run is the new norm, but Buildroot configures the dhcp package to use /var/run
as the default, and the SysV init scripts stick to that.

I don't know Buildroot's rules about that if any. Maybe dhcp.mk should just be
updated to use /run. Thomas?

>     +KillSignal=SIGINT
> 
> I did not try to run it, but it doesn't react to SIGTERM ? I did not see anything in the code to prevent it but I only looked at it pretty quickly.

It's also from dhcpd.service. I've searched around and I've not found a good
reason for it, but there must be one. I'll try and dig more.

>     +EnvironmentFile=/etc/default/dhcrelay
> 
> Should be 'EnvironmentFile=-/etc/default/dhcrelay'

This is on purpose. This file is required because IFCMD and SERVERS are required
too.

>     +
>     +[Install]
>     +WantedBy=multi-user.target
>     --
>     2.1.4

Best regards,
Beno?t
