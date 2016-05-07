From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:22:31 +0200
Subject: [Buildroot] [PATCH 13/34] reproducibility/libtool: fix
 reproducibility issues
In-Reply-To: <1462002570-14706-13-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-13-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507222231.56f0e905@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This probably should be several separate patches.

On Sat, 30 Apr 2016 09:49:09 +0200, Gilles Chanteperdrix wrote:
> - remove libtool and libtoolize; they are full of references to the
>   build environment tools, and unlikely to be needed on target;
> - do not use /etc/ld.so.conf contents in libtool search path: they are
>   not relevant on target, and cause a useless dependency of libltdl
>   on the build environment.
> ---
>  package/libtool/0001-fix-cross-compilation.patch | 11 +++++++++++
>  package/libtool/libtool.mk                       |  8 ++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 package/libtool/0001-fix-cross-compilation.patch
> 
> diff --git a/package/libtool/0001-fix-cross-compilation.patch b/package/libtool/0001-fix-cross-compilation.patch
> new file mode 100644
> index 0000000..c203371
> --- /dev/null
> +++ b/package/libtool/0001-fix-cross-compilation.patch

This patch should have a description + Signed-off-by.

However, libtool is really a core package, and not a simple one, so I'm
a bit uneasy with the idea of carrying patches against it. What are the
chances of having something like this submitted upstream?

> +   fi
> diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
> index 8688f8b..c177626 100644
> --- a/package/libtool/libtool.mk
> +++ b/package/libtool/libtool.mk
> @@ -8,7 +8,7 @@ LIBTOOL_VERSION = 2.4.6
>  LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
>  LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
>  LIBTOOL_INSTALL_STAGING = YES
> -LIBTOOL_CONF_ENV = HELP2MAN=true
> +LIBTOOL_CONF_OPTS = HELP2MAN=true

Why?

>  LIBTOOL_DEPENDENCIES = host-m4
>  LIBTOOL_LICENSE = GPLv2+
>  LIBTOOL_LICENSE_FILES = COPYING
> @@ -33,9 +33,13 @@ define LIBTOOL_AVOID_AUTORECONF_HOOK
>  	find $(@D) -name configure -exec touch '{}' \;
>  	find $(@D) -name Makefile.in -exec touch '{}' \;
>  endef
> -LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK

Why?

>  HOST_LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
>  
> +define LIBTOOL_REMOVE_LIBTOOL
> +	rm $(TARGET_DIR)/usr/bin/libtool $(TARGET_DIR)/usr/bin/libtoolize
> +endef
> +LIBTOOL_POST_INSTALL_TARGET_HOOKS += LIBTOOL_REMOVE_LIBTOOL

This part could be a separate patch that would be easy to apply today,
so don't hesitate to resend just this part, with your Signed-off-by
line, of course.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
