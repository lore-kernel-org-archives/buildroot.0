From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 12:46:12 +0200
Subject: [Buildroot] [PATCH 1/1] mp4v2: new package
In-Reply-To: <1413445387-12764-1-git-send-email-jkrause@posteo.de>
References: <1413445387-12764-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141019104612.GS4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-10-16 09:43 +0200, J?rg Krause spake thusly:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
> new file mode 100644
> index 0000000..bd0ddda
> --- /dev/null
> +++ b/package/mp4v2/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_MP4V2
> +	bool "mp4v2"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  The MP4v2 library provides functions to read, create, and modify mp4 files.

Keep the line below the 80-char limit, please.

> +
> +	  https://code.google.com/p/mp4v2/
> +
> +if BR2_PACKAGE_MP4V2
> +
> +config BR2_PACKAGE_MP4V2_UTIL
> +	bool "Install mp4 command line tools"
> +	help
> +	  Enable to install the mp4 command line tools mp4art, mp4chaps, mp4extract,

Ditto.

> +	  mp4info, mp4subtitle, mp4tags, and mp4trackdump.
> +
> +endif
> +
> +comment "mp4v2 needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
> new file mode 100644
> index 0000000..d5a49c4
> --- /dev/null
> +++ b/package/mp4v2/mp4v2.hash
> @@ -0,0 +1,2 @@
> +# From https://code.google.com/p/mp4v2/downloads/detail?name=mp4v2-2.0.0.tar.bz2
> +sha1 193260cfb7201e6ec250137bcca1468d4d20e2f0 mp4v2-2.0.0.tar.bz2
> diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
> new file mode 100644
> index 0000000..b1f1740
> --- /dev/null
> +++ b/package/mp4v2/mp4v2.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# mp4v2
> +#
> +################################################################################
> +
> +MP4V2_VERSION = 2.0.0
> +MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
> +MP4V2_SITE = https://mp4v2.googlecode.com/files
> +MP4V2_INSTALL_STAGING = YES
> +MP4V2_LICENSE = MPLv1.1
> +MP4V2_LICENSE_FILES = COPYING
> +MP4V2_CONF_OPTS = --disable-debug

This will soone to be removed, as the pkg-autotools infrastructure will
soon be responsible for providing this.

> +
> +ifneq ($(BR2_PACKAGE_MP4V2_UTIL),y)
> +MP4V2_CONF_OPTS += --disable-util
> +endif

We prefer using positive logic, and have the pending enable/disable
flags passed:

    ifeq ($(BR2_PACKAGE_MP4V2_UTIL),y)
    MP4V2_CONF_OPTS += --enable-util
    else
    MP4V2_CONF_OPTS += --disable-util
    endif

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
