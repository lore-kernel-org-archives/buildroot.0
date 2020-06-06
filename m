From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:38:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/dbus: remove /usr/lib/dbus-1.0
 if empty
In-Reply-To: <20200605225247.13350-2-nolange79@gmail.com>
References: <20200605225247.13350-1-nolange79@gmail.com>
 <20200605225247.13350-2-nolange79@gmail.com>
Message-ID: <20200606223808.5797eb98@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 00:52:46 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> ---
>  package/dbus/dbus.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Your Signed-off-by is missing, and there is no commit log. We clearly
need a better explanation. And your commit title is wrong: you're not
just removing /usr/lib/dbus-1.0 is empty: you're changing from removing
it unconditionally to removing just /usr/lib/dbus-1.0/include and then
removing /usr/lib/dbus-1.0 if it's empty.

So it means that you have installed *something* in /usr/lib/dbus-1.0
that you want Buildroot to keep on the target. But what? This is not
explained in your commit log.

> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index bb9f17a5e0..7a7762f537 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -80,7 +80,8 @@ endef
>  DBUS_PRE_INSTALL_TARGET_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
>  
>  define DBUS_REMOVE_DEVFILES
> -	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
> +	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0/include
> +	-rmdir $(TARGET_DIR)/usr/lib/dbus-1.0 2>/dev/null

Can we use --ignore-fail-on-non-empty instead ? Yann, is this option
reasonably available even on old distributions ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
