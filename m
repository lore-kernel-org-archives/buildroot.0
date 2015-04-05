From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 23:31:09 +0200
Subject: [Buildroot] [PATCH/RFC 01/27] package/libsquish: New package
In-Reply-To: <1427913380-14808-2-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150405213109.GJ4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-01 20:35 +0200, Bernd Kuhls spake thusly:
> Needed for Kodi 15.0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/libsquish/Config.in b/package/libsquish/Config.in
> new file mode 100644
> index 0000000..10af979
> --- /dev/null
> +++ b/package/libsquish/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBSQUISH
> +	bool "libsquish"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  The squish library (abbreviated to libsquish) is an open source DXT
> +	  compression library written in C++
> +
> +	  https://code.google.com/p/libsquish

Don;t we have a better homepage for libsquish? Google code is slated for
retirement later this year (or early next year). It would be a pity to
have a dangling URL especially as we already know about that.

> +comment "libsquish needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
> new file mode 100644
> index 0000000..d381370
> --- /dev/null
> +++ b/package/libsquish/libsquish.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libsquish
> +#
> +################################################################################
> +
> +LIBSQUISH_VERSION = 1.10-openelec
> +LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tar.gz
> +LIBSQUISH_SITE = http://sources.openelec.tv/devel

I'm a bit uneasy at pointing to Google code as the homepage, and at the
same time using a third-party to get the archive from, especially since
it looks like this version has been modified by OpenELEC.

> +LIBSQUISH_INSTALL_STAGING = YES
> +LIBSQUISH_LICENSE = MIT
> +LIBSQUISH_LICENSE_FILES = README

You do not provide build commands. Is that on purpose, or did you
forget? ;-)

> +define LIBSQUISH_INSTALL_STAGING_CMDS
> +	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \

Please use $(TARGET_CONFIGURE_OPTS) as it already contains all those
defines, plus many others.

> +	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
> +endef
> +
> +define LIBSQUISH_INSTALL_TARGET_CMDS
> +	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \

Ditto $(TARGET_CONFIGURE_OPTS).

> +	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
> +endef
> +
> +$(eval $(generic-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
