From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:16:48 +0200
Subject: [Buildroot] [RFC: PATCH 1/3] systemd: configure DHCP via
 networkd
In-Reply-To: <1474113519-24713-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160917141648.792a5754@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Adding in Cc more people interested in systemd)

On Sat, 17 Sep 2016 13:58:37 +0200, Eric Le Bihan wrote:
> If systemd-networkd is enabled and $BR2_SYSTEM_DHCP is set, then create
> a .network file to configure the selected network interface via DHCP.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

The idea looks good to me, so unless the people interested in systemd
raise their voice, I'm going to apply something like this. However, I
have one suggestion below.

> ---
>  package/systemd/systemd.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index fb07819..5062750 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -275,6 +275,18 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
>  	ln -sf ../run/systemd/resolve/resolv.conf \
>  		$(TARGET_DIR)/etc/resolv.conf
>  endef
> +SYSTEMD_NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
> +ifneq ($(SYSTEMD_NETWORK_DHCP_IFACE),)
> +define SYSTEMD_INSTALL_NETWORK_CONFS
> +	( \
> +		echo "[Match]"; \
> +		echo "Name=$(SYSTEMD_NETWORK_DHCP_IFACE)"; \
> +		echo; \
> +		echo "[Network]"; \
> +		echo "DHCP=ipv4"; \
> +	) > $(TARGET_DIR)/etc/systemd/network/dhcp.network
> +endef

I find having all those echo lines in the middle of the .mk file not
very pretty. What about instead:

package/systemd/dhcp.network containing:

[Match]
Name=SYSTEMD_NETWORK_DHCP_IFACE
[Network]
DHCP=ipv4

package/systemd/systemd.mk doing:

define SYSTEMD_INSTALL_NETWORK_CONF
	sed s/SYSTEMD_NETWORK_DHCP_IFACE/$(SYSTEMD_NETWORK_DHCP_IFACE)/ \
		package/systemd/dhcp.network > \
		$(TARGET_DIR)/etc/systemd/network/dhcp.network
endef

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
