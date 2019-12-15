From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Dec 2019 12:50:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsemanage: add option to
 manually define policy version
In-Reply-To: <20191215011517.1977342-2-aduskett@gmail.com>
References: <20191215011517.1977342-1-aduskett@gmail.com>
 <20191215011517.1977342-2-aduskett@gmail.com>
Message-ID: <20191215125026.1c484b08@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Thanks for this patch. With the explanations of the commit log and the
cover letter, I understand a bit better what's going on.

On Sat, 14 Dec 2019 17:15:16 -0800
aduskett at gmail.com wrote:

> +if BR2_PACKAGE_LIBSEMANAGE
> +
> +config BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
> +	bool "Manually specify the policy version"
> +	help
> +	  Manually specify the policy version to build.

Do we really need this boolean ? Why not always have the option BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION ?

> +if BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
> +
> +config BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION
> +	int "maximum policy version"
> +	default 25
> +	range 25 31
> +	help
> +	  The maximum SELinux policy version your kernel supports.
> +
> +	  Here's a handy table to help you choose:
> +	  kernel version   SElinux policy max version
> +	  <= 2.6.x         25
> +	  > 2.6 <= 3.5     26
> +	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
> +	  > 3.14 <= 4.3    29
> +	  > 4.3 <= 4.13    30
> +	  > 4.13 <= 5.5    31

I think on top of PATCH 1/2, another patch could be added to make
things a little bit smarter in terms of defaults:

	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
	default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
	default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
	default 25

This would@least allow the default value to be a bit more sensible
than just using "25", which is ancient.

> +# This default value may be overwrriten by setting the policy-version = line in
> +# /etc/semanage/semanage.conf.
> +LIBSEMANAGE_MAX_POLICY_VERSION = 31

Here, what you're basically doing is assuming that if
BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION is not enabled, we
default to "31". But "31" may be wrong. That's why I suggest to drop BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION and always have a BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION option.

> +ifeq ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
> +LIBSEMANAGE_MAX_POLICY_VERSION = $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION)
> +endif
> +
> +define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
> +	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
> +		$(TARGET_DIR)/etc/selinux/semanage.conf
> +endef
> +LIBSEMANAGE_POST_INSTALL_TARGET_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
> +HOST_LIBSEMANAGE_POST_INSTALL_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY

The host hook is not appropriate: it tweaks a file in $(TARGET_DIR),
which is not good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
