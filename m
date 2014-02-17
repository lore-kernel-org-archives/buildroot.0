From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 11:49:06 +0100
Subject: [Buildroot] [PATCH 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140217114906.5b6aab4a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 17 Feb 2014 11:22:15 +0100, Eric Le Bihan wrote:

> -ifeq ($(BR2_PACKAGE_EUDEV),y)
> -UDEV_DEPENDENCIES += eudev
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -UDEV_DEPENDENCIES += systemd
> -endif
> +UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))
>  
>  ifeq ($(UDEV_DEPENDENCIES),)
>  define UDEV_CONFIGURE_CMDS
> -	echo "No Udev implementation selected. Configuration error."
> +	$(error No Udev implementation selected. Configuration error)
>  	exit 1
>  endef
>  endif

Why are we doing this check in UDEV_CONFIGURE_CMDS ? I believe we can
simply do:

ifeq ($(<foo>_DEPENDENCIES),)
$(error No <foo> implementation selected)
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
