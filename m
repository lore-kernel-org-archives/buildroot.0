From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Feb 2020 11:17:42 +0100
Subject: [Buildroot] [PATCH] package/lvm2: lvmetad systemd integration
In-Reply-To: <20200228081859.4237-1-p.debruijn@unilogic.nl>
References: <20200228081859.4237-1-p.debruijn@unilogic.nl>
Message-ID: <20200228111742.0c9ec807@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal!

On Fri, 28 Feb 2020 09:18:59 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 43370b03bf..6b866ce92b 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -54,6 +54,14 @@ else
>  LVM2_CONF_OPTS += --disable-applib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install install_systemd_units install_systemd_generators
> +endif

This should be in a separate change, as it's unrelated.

Also, I'd prefer:

LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
endif

> +ifeq ($(BR2_PACKAGE_LVM2_LVMETAD),y)
> +LVM2_CONF_OPTS += --enable-lvmetad

else

LVM2_CONF_OPTS += --disable-lvmetad


> +endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
