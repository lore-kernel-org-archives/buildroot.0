From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Feb 2017 21:07:00 +0100
Subject: [Buildroot] [RFC: PATCH 3/3] system: enable predictable net
 interface names
In-Reply-To: <1474113519-24713-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CACXmVibUnH38chTyOboc0fJMN2kn3NWm2Dnhg8xbi82ddPotZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 17, 2016 at 1:58 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:

Hi and sorry for the slow response.

> Since v197, udev and eudev automatically assign predictable, stable
> network interface names for all local Ethernet, WLAN and WWAN
> interfaces.

Are you sure about eudev? I don't seem to find any references to that
rules file (or anything related) in eudev-3.2.1.

> This is a departure from the traditional interface naming scheme
> (eth0, eth1, etc).
>
> Add a configuration option to enable or disable this feature, which is
> disabled by default to be coherent with the behavior set when udev is
> not used.
>
> See https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
> for details.

This document talks about adding a symlink to /dev/null from
/etc/systemd/network/99-default.link, but that is not what you are
doing. Why?

> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 1000161..74b0636 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -242,6 +242,17 @@ endif
>  TARGET_FINALIZE_HOOKS += SKELETON_REMOUNT_RW
>  endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
>
> +ifeq ($(BR2_SYSTEM_PREDICTABLE_NETIF_NAMES),y)
> +define SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
> +       rm -f $(TARGET_DIR)/etc/udev/rules.d/80-net-setup-links.rules
> +endef
> +else
> +define SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
> +       touch $(TARGET_DIR)/etc/udev/rules.d/80-net-setup-links.rules
> +endef
> +endif

I take it that the idea is for this file to "shadow" a file of the
same name in /lib/udev/rules? Looking in systemd-232 there is only a
80-net-setup-link.rules file (link not links)?

If it all boils down to it being a systemd specific option that can be
handled by a single symlink in an overlay/post-build script, then I
don't think it is worth to have it.

-- 
Bye, Peter Korsgaard
