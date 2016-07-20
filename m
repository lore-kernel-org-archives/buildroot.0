From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 23:07:25 +0200
Subject: [Buildroot] [PATCH v3] igd2-for-linux: new package
In-Reply-To: <1468915282-28317-1-git-send-email-fabrice.fontaine@orange.com>
References: <1468915282-28317-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160720230725.3d6b5e80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jul 2016 10:01:22 +0200, Fabrice Fontaine wrote:
> This is The Linux UPnP Internet Gateway Device 2. It is
> modified from the original Linux UPnP Internet Gateway Device
> [http://linux-igd.sourceforge.net/] according to UPnP
> InternetGatewayDevice:2 specifications.
> 
> It implements the UPnP Internet Gateway Device version 2
> specification (IGDv2) and allows UPnP aware clients, such as
> MSN Messenger, Azureus or Miranda to work properly from behind
> a NAT firewall.
> 
> Please edit /etc/upnpd.conf before using upnpd!
> 
> https://github.com/ffontaine/igd2-for-linux
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Thanks for this new iteration. It looks pretty good, but I have both
some questions and comments, see below.

> diff --git a/package/igd2-for-linux/S99upnpd b/package/igd2-for-linux/S99upnpd
> new file mode 100644
> index 0000000..3a5b20a
> --- /dev/null
> +++ b/package/igd2-for-linux/S99upnpd
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +NAME=upnpd
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON=/usr/sbin/$NAME
> +LAN=eth0
> +WAN=eth0

So we really need to hardcode the interface here? This means it will
not work out of the box for everyone, but maybe this is something we
cannot do anything about.

But at least, we should source /etc/default/upnpd to allow the user to
easily override those values.

> +DAEMON_ARGS="-f $WAN $LAN"
> +
> +start() {
> +	printf "Starting $NAME: "
> +	route add -net 239.0.0.0 netmask 255.0.0.0 $LAN

Should this be configurable? I'm worried about other init scripts doing
the same route addition.

> +IGD2_FOR_LINUX_VERSION = v1.1
> +IGD2_FOR_LINUX_SITE = \
> +	$(call github,ffontaine,igd2-for-linux,$(IGD2_FOR_LINUX_VERSION))
> +
> +IGD2_FOR_LINUX_LICENSE = GPLv2
> +IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE
> +
> +IGD2_FOR_LINUX_DEPENDENCIES = libupnp
> +
> +IGD2_FOR_LINUX_BUILD_DIR = $(@D)/linuxigd2
> +IGD2_FOR_LINUX_CONF_DIR = $(IGD2_FOR_LINUX_BUILD_DIR)/configs
> +
> +define IGD2_FOR_LINUX_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(IGD2_FOR_LINUX_BUILD_DIR) \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	LIBUPNP_PREFIX="$(STAGING_DIR)/usr" \
> +	all

Please indent the continuation lines:

	$(TARGET_MAKE_ENV) $(MAKE) -C $($(IGD2_FOR_LINUX_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		... \
		...

> +endef
> +
> +define IGD2_FOR_LINUX_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(IGD2_FOR_LINUX_BUILD_DIR)/bin/upnpd \
> +		$(TARGET_DIR)/usr/sbin/upnpd
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/ligd.png \
> +		$(TARGET_DIR)/etc/linuxigd/ligd.png
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/dummy.xml \
> +		$(TARGET_DIR)/etc/linuxigd/dummy.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/gateconnSCPD.xml \
> +		$(TARGET_DIR)/etc/linuxigd/gateconnSCPD.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/gatedesc1.xml \
> +		$(TARGET_DIR)/etc/linuxigd/gatedesc1.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/gatedesc.xml \
> +		$(TARGET_DIR)/etc/linuxigd/gatedesc.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/gateEthlcfgSCPD.xml \
> +		$(TARGET_DIR)/etc/linuxigd/gateEthlcfgSCPD.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/gateicfgSCPD.xml \
> +		$(TARGET_DIR)/etc/linuxigd/gateicfgSCPD.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/lanhostconfigSCPD.xml \
> +		$(TARGET_DIR)/etc/linuxigd/lanhostconfigSCPD.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/wanipv6fwctrlSCPD.xml \
> +		$(TARGET_DIR)/etc/linuxigd/wanipv6fwctrlSCPD.xml
> +	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/upnpd.conf \
> +		$(TARGET_DIR)/etc/upnpd.conf

Can you write instead:

	$(INSTALL) -D -m 0755 $(IGD2_FOR_LINUX_BUILD_DIR)/bin/upnpd \
		$(TARGET_DIR)/usr/sbin/upnpd
	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/upnpd.conf \
		$(TARGET_DIR)/etc/upnpd.conf
	mkdir -p $(TARGET_DIR)/etc/linuxigd/
	cp -dpfr $(IGD2_FOR_LINUX_CONF_DIR)/*.{xml,png} \
		$(TARGET_DIR)/etc/linuxigd/

or alternatively, if you really want to copy explicitly each file one
by one to /etc/linuxigd, define a variable like
IGD2_FOR_LINUX_ETC_LINUXIGD_FILES, that lists all the filenames, and
then use a foreach loop.

> +define IGD2_FOR_LINUX_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 package/domoticz/upnpd.service \

Hum, really package/domoticz ?



> +		$(TARGET_DIR)/usr/lib/systemd/system/upnpd.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/upnpd.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upnpd.service
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/igd2-for-linux/upnpd.service b/package/igd2-for-linux/upnpd.service
> new file mode 100644
> index 0000000..479f5b2
> --- /dev/null
> +++ b/package/igd2-for-linux/upnpd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=UPnP Internet Gateway Device version 2 daemon
> +After=network.target
> +
> +[Service]
> +ExecStartPre=/sbin/route add -net 239.0.0.0 netmask 255.0.0.0 eth0
> +ExecStart=/usr/sbin/upnpd -f eth0 eth0
> +Restart=always
> +ExecStopPost=/sbin/route del -net 239.0.0.0 netmask 255.0.0.0 eth0

Same questions about the customization of eth0 and 239.0.0.0.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
