From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Sep 2011 09:17:30 +0200
Subject: [Buildroot] [PATCH] toolchain: fix build with empty
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
In-Reply-To: <6a4325eb6bbe6622b6a8b7d1bc3a7279866e6716.1317019552.git.baruch@tkos.co.il>
References: <6a4325eb6bbe6622b6a8b7d1bc3a7279866e6716.1317019552.git.baruch@tkos.co.il>
Message-ID: <20110926091730.3609c1fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 26 Sep 2011 09:46:43 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

>  # march/mtune/floating point mode needs to be passed to the external toolchain
>  # to select the right multilib variant
> -ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
> +ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),"")
>  TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
>  endif

We typically use qstrip for this kind of things:

TOOLCHAIN_EXTERNAL_CUSTOM_ARGS = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS))
ifneq ($(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
TOOLCHAIN_EXTERNAL_CFLAGS += $(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
