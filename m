From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:46:20 +0100
Subject: [Buildroot] [PATCH] acpid: Add systemd service
In-Reply-To: <20181111150652.17459-5-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-5-alexander.sverdlin@gmail.com>
Message-ID: <20181111214620.4ca260d4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

Thanks for this contribution!

On Sun, 11 Nov 2018 16:06:50 +0100, Alexander Sverdlin wrote:

> +define ACPID_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0755 package/acpid/acpid.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/acpid.service
> +	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants
> +	ln -sf /usr/lib/systemd/system/acpid.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants/acpid.service

We normally create the link under /etc, and use a relative path for the
target of the symlink, i.e like this:

define DHCPCD_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0644 package/dhcpcd/dhcpcd.service \
                $(TARGET_DIR)/usr/lib/systemd/system/dhcpcd.service
        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
        ln -sf ../../../../usr/lib/systemd/system/dhcpcd.service \
                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpcd.service
endef

Could you adjust your patch accordingly ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
