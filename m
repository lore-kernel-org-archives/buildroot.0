From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2011 11:55:51 +0200
Subject: [Buildroot] [PATCH] use same kernel in buildroot and in
 crosstool-ng
In-Reply-To: <1316684171-24580-1-git-send-email-sinseman44@gmail.com>
References: <1316684171-24580-1-git-send-email-sinseman44@gmail.com>
Message-ID: <20110922115551.57b5c6fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Sep 2011 11:36:11 +0200,
sinseman44 <sinseman44@gmail.com> a ?crit :

> + config KERNEL_LINUX_CUSTOM_TARBALL

Presumably the name of this option needs to be changed.
KERNEL_LINUX_CUSTOM_LOCATION or something like that.

> -HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache)
> +HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_TOOLCHAIN_CTNG_BUILDROOT_KERNEL), \
> +								   $(LINUX_TARGET_SOURCE) $(LINUX_TARGET_EXTRACT) $(LINUX_TARGET_PATCH) $(LINUX_TARGET_CONFIGURE)) \
> +								 host-gawk \
> +								 host-automake \
> +								 $(if $(BR2_CCACHE),host-ccache) 

Something like:

HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache)

ifeq ($(BR2_TOOLCHAIN_CTNG_BUILDROOT_KERNEL),y)
HOST_CROSSTOOL_NG_DEPENDENCIES += linux-configure
endif

Would be a lot better.

> +config BR2_TOOLCHAIN_CTNG_BUILDROOT_KERNEL
> +	bool "Buildroot kernel version"

Missing:

	depends on BR2_LINUX_KERNEL

> +	help
> +		Use buildroot kernel version in crosstool-Ng
> +
> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_KERNEL_LINUX_CUSTOM_TARBALL)=.*:\1="$(BUILD_DIR)/linux-$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))":;

$(LINUX_DIR) ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
