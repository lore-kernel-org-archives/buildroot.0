From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Nov 2010 08:56:42 +0100
Subject: [Buildroot] [PATCH] inetutils: new package for random network
 tools
In-Reply-To: <1290145160-21033-1-git-send-email-vapier@gentoo.org>
References: <1290145160-21033-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101119085642.188850bf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Nov 2010 00:39:20 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> +config BR2_PACKAGE_INETUTILS_RCP
> +	bool "rcp"
> +	depends on BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_REXEC
> +	bool "rexec"
> +	depends on BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_REXECD
> +	bool "rexecd"
> +	depends on BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_RLOGIN
> +	bool "rlogin"
> +	depends on BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_RLOGIND
> +	bool "rlogind"
> +	depends on BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_RSH
> +	bool "rsh"
> +	depends on BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_RSHD
> +	bool "rshd"
> +	depends on BR2_PACKAGE_INETUTILS

Instead of all these "depends on" we generally enclose the options in a
"if BR2_PACKAGE_INETUTILS ... endif" statement.

> index 0000000..e6c8cd9
> --- /dev/null
> +++ b/package/inetutils/inetutils.mk
> @@ -0,0 +1,35 @@
> +#############################################################
> +#
> +# inetutils
> +#
> +#############################################################
> +
> +INETUTILS_VERSION = 1.8
> +INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.gz
> +INETUTILS_SITE = $(BR2_GNU_MIRROR)/inetutils/
> +# patches update many autotool files, and then we need to touch all
> +# the man pages to keep from `help2man` running on the binaries
> +INETUTILS_AUTORECONF = YES
> +define INETUTILS_AUTORECONF_HOOK
> +	touch $(INETUTILS_SRCDIR)/*/*.[0-9]
> +endef
> +INETUTILS_CONF_OPT = \
> +	--libexecdir=/usr/sbin \
> +	--program-transform-name= \
> +	--without-included-regex \
> +	--disable-libls \
> +	--disable-servers --disable-clients \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_RCP,rcp) \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_REXEC,rexec) \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_REXECD,rexecd) \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_RLOGIN,rlogin) \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_RLOGIND,rlogind) \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_RSH,rsh) \
> +	$(call USE_ENABLE,PACKAGE_INETUTILS_RSHD,rshd)
> +
> +$(eval $(call AUTOTARGETS,package,inetutils))
> +
> +# append after autotools generation so we get autoreconf then touch
> +INETUTILS_PRE_CONFIGURE_HOOKS += INETUTILS_AUTORECONF_HOOK
> +
> +INETUTILS_INSTALL_TARGET_OPT += SUIDMODE="-m 4775"

Both of these should be before the evaluation of AUTOTARGETS.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
