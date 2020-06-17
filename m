From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:59:33 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/iwd: add basic configuration
 file
In-Reply-To: <20200616063431.9041-1-ps.report@gmx.net>
References: <20200616063431.9041-1-ps.report@gmx.net>
Message-ID: <20200617215933.15dc43d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2020 08:34:30 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add basic /etc/iwd/main.conf configuration file to enable
> network configuration (use built-in dhcp client).
> 
> For the non systemd-resolved case select the openresolv package
> to fulfill the iwd resolvconf requirement (and adjust the
> configuration file accordingly).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied, but I found things a bit too complicated, so I did some
simplifications.

> +define IWD_INSTALL_CONFIG_FILE
> +	mkdir -p $(TARGET_DIR)/etc/iwd

This is not needed if you use the -D option in $(INSTALL)

> +	$(INSTALL) -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
> +endef
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
> +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> +	printf "[Network]\nNameResolvingService=systemd\n" \
> +		>> $(TARGET_DIR)/etc/iwd/main.conf
> +endef
> +else
> +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> +	printf "[Network]\nNameResolvingService=resolvconf\n" \
> +		>> $(TARGET_DIR)/etc/iwd/main.conf
> +endef
> +endif
> +
> +IWD_POST_INSTALL_TARGET_HOOKS += \
> +	IWD_INSTALL_CONFIG_FILE \
> +	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE

This felt too complicated. I simplified like this:

ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
IWD_RESOLV_SERVICE = systemd
else
IWD_RESOLV_SERVICE = resolvconf
endif

define IWD_INSTALL_CONFIG_FILE
	$(INSTALL) -D -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
	$(SED) 's,__RESOLV_SERVICE__,$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
endef

IWD_POST_INSTALL_TARGET_HOOKS += IWD_INSTALL_CONFIG_FILE

with of course main.conf containing:

# use built-in dhcp client
[General]
EnableNetworkConfiguration=true
[Network]
NameResolvingService=__RESOLV_SERVICE__

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
