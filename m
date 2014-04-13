From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 14:00:19 +0200
Subject: [Buildroot] [PATCH 2/2] mutt: Add options for imap/pop3 support,
 enable optional iconv/OpenSSL support
In-Reply-To: <1397381763-15489-2-git-send-email-bernd.kuhls@t-online.de>
References: <1397381763-15489-1-git-send-email-bernd.kuhls@t-online.de>
 <1397381763-15489-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140413140019.6fce5bf2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Apr 2014 11:36:03 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +MUTT_DEPENDENCIES += libiconv
> +MUTT_CONF_OPT += --enable-iconv
> +else
> +MUTT_CONF_OPT += --disable-iconv
> +endif

The libiconv package provides libiconv support for uClibc toolchains
that don't have locale enabled.

But if you're using an uClibc toolchain with locale support enabled, or
a glibc toolchain, then iconv support *is* available, without the
libiconv package enabled. However, with your code, iconv support will
be disabled in mutt in such cases.

Maybe this is an area we need to improve a bit, by providing a Kconfig
option or something like that.

> +# SSL support is only used by imap or pop3 module
> +ifeq ($(findstring xy,x$(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3)),xy)

This could maybe be:

ifneq ($(BR2_PACKAGET_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +MUTT_DEPENDENCIES += openssl
> +MUTT_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr
> +else
> +MUTT_CONF_OPT += --without-ssl
> +endif
> +else
> +MUTT_CONF_OPT += --without-ssl
> +endif
> +
>  $(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
