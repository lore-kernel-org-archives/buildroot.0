From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 12:00:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: Add optional libiconv
 support
In-Reply-To: <1428775279-20078-2-git-send-email-bernd.kuhls@t-online.de>
References: <1428775279-20078-1-git-send-email-bernd.kuhls@t-online.de>
 <1428775279-20078-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150715120020.77db122d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 20:01:19 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +EXIM_DEPENDENCIES += libiconv
> +define EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV
> +	$(call exim-config-change,HAVE_ICONV,yes)
> +	$(call exim-config-add,EXTRALIBS_EXIM,-liconv)
> +endef
> +else
> +define EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV
> +	$(call exim-config-change,HAVE_ICONV,no)
> +endef
> +endif

This is actually not correct: you can very well have iconv() available
with libiconv.

libiconv is only a replacement library providing iconv() when the C
library doesn't provide, which only happens when using uClibc with
locales disabled.

So I think your patch should probably look like:

# We have iconv() support either if the toolchain has locale support or
# if libiconv is enabled. Both cannot be true at the same time since
# libiconv is only available when the toolchain doesn't provide locale
# support. In the case where iconv is provided by libiconv, we need to
# link explicitly with libiconv.

ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_ENABLE_LOCALE),y)
EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV += $(call exim-config-change,HAVE_ICONV,yes)
EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV += $(if $(BR2_PACKAGE_LIBICONV),$(call exim-config-add,EXTRALIBS_EXIM,-liconv))
else
EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV += $(call exim-config-change,HAVE_ICONV,no)
endif

Could you test something like that with a non-locale enabled toolchain
config, a non-locale enabled toolchain config that has libiconv
enabled, and a locale-enabled toolchain?

In the mean time, I'll mark your patch as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
