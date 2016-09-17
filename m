From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:20:16 +0200
Subject: [Buildroot] [RFC: PATCH 3/3] system: enable predictable net
 interface names
In-Reply-To: <1474113519-24713-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160917142016.685aec6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 13:58:39 +0200, Eric Le Bihan wrote:
> Since v197, udev and eudev automatically assign predictable, stable
> network interface names for all local Ethernet, WLAN and WWAN
> interfaces.
> 
> This is a departure from the traditional interface naming scheme
> (eth0, eth1, etc).
> 
> Add a configuration option to enable or disable this feature, which is
> disabled by default to be coherent with the behavior set when udev is
> not used.
> 
> See https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
> for details.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

While I am happy with the principles of patches 1/3 and 2/3, I'm a lot
less convinced by this one. Indeed, the "System configuration" menu
already has a good number of options, and I'm not a fan of adding yet
another option for just a relatively minor system configuration detail.
I'd prefer to leave this to per-project customization through
post-build scripts, and just use the upstream default (i.e predictable
interface names).

I'll keep this patch in patchwork for some time in order to allow
others to raise their voice. I've also Cc'ed a bunch of people so they
can give their opinion.

> +ifeq ($(BR2_SYSTEM_PREDICTABLE_NETIF_NAMES),y)
> +define SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
> +	rm -f $(TARGET_DIR)/etc/udev/rules.d/80-net-setup-links.rules
> +endef
> +else
> +define SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
> +	touch $(TARGET_DIR)/etc/udev/rules.d/80-net-setup-links.rules

Why are you touching the file here?

> +config BR2_SYSTEM_PREDICTABLE_NETIF_NAMES
> +	bool "Predictable network interface names"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	default n

"default n" is never needed: the default for an option is to be
disabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
