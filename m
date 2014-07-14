From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 23:51:13 +0200
Subject: [Buildroot] [PATCH 1/1] upmpdcli: new package
In-Reply-To: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
References: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
Message-ID: <20140714215113.GO3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joerg, All,

BTW, is it Joerg, or J?rg? Ah, those multiple personalities! ;-)

On 2014-07-14 22:52 +0200, Joerg Krause spake thusly:
> This patch adds support for the package upmpdcli. 

Thanks for this new package! :-)
A few comments below...

[--SNIP--]
> diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
> new file mode 100644
> index 0000000..d878bfc
> --- /dev/null
> +++ b/package/upmpdcli/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_UPMPDCLI
> +	bool "upmpdcli"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBUPNP
> +	select BR2_PACKAGE_LIBMPDCLIENT
> +	depends on BR2_INSTALL_LIBSTDCPP

libupnp depends on LARGEFILES and HAS_THREADS, so you need to duplicate
these dependencies here, too (the comment is the name of the package(s)
that need this dependency):

    depends on BR2_LARGEFILE # libupnp
    depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp

> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/upmpdcli/S99upmpdcli b/package/upmpdcli/S99upmpdcli
> new file mode 100644
> index 0000000..314ea32
> --- /dev/null
> +++ b/package/upmpdcli/S99upmpdcli
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +
> +NAME=upmpdcli
> +DAEMON=/usr/bin/$NAME
> +CONFFILE=/etc/$NAME.conf

Who's responsible for installing this upmpdcli.conf file?

[--SNIP--]
> diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
> new file mode 100644
> index 0000000..fa03fd4
> --- /dev/null
> +++ b/package/upmpdcli/upmpdcli.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# upmpdcli
> +#
> +################################################################################
> +
> +UPMPDCLI_VERSION = 0.7.1
> +UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
> +UPMPDCLI_LICENSE = GPLv2
> +UPMPDCLI_LICENSE_FILES = COPYING
> +UPMPDCLI_DEPENDENCIES = expat libupnp libmpdclient
> +
> +# Upmpdcli only runs if user upmpdcli exists
> +define UPMPDCLI_USERS
> +	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli: MPD UPnP Renderer Front-End

You're adding this user, but nowhere do you seem to use it to run the
upmpdcli daemon. What am I missing?

Also, as stated in the manual, no filed should contain a colon ':', not
even the comment field, see the manual:
    http://buildroot.org/downloads/manual/manual.html#makeuser-syntax

since the colon is used to separate the fields in the passwd file:
    https://en.wikipedia.org/wiki/Passwd
    man 5 passwd

> +endef
> +
> +define UPMPDCLI_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
> +endef
> +
> +$(eval $(autotools-package))

Otherwise, looks good.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
