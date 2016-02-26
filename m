From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 Feb 2016 00:33:41 +0100
Subject: [Buildroot] [PATCH v8 01/28] package/freeswitch: new package
In-Reply-To: <1456007008-5200-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
 <1456007008-5200-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56D0E0D5.3020603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 20/02/2016 23:23, Bernd Kuhls a ?crit :
> This commit adds freeswitch without any configured modules and with a
> minimal set of non-optional dependencies. All other dependencies and
> modules will be added by further patches in this series.

I looked at the build system and freeswitch bundle several external libraries
and some of them are already packaged in Buildroot.

Can you try to add optional/mandatory dependencies on theses packages:
BR2_PACKAGE_LIBSRTP
BR2_PACKAGE_APR
BR2_PACKAGE_APR_UTIL
BR2_PACKAGE_SOFIA_SIP
BR2_PACKAGE_TIFF

I'm not sure that the freeswitch build system will allow you to do that :-/
At least explain why we can't use them.

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

[snip]

> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> new file mode 100644
> index 0000000..b52d469
> --- /dev/null
> +++ b/package/freeswitch/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_FREESWITCH
> +	bool "freeswitch"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # apr, included in freeswitch source
> +	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_SPEEX
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  FreeSWITCH is a scalable open source cross-platform telephony
> +	  platform designed to route and interconnect popular communication
> +	  protocols using audio, video, text or any other form of media.
> +
> +	  https://www.freeswitch.org
> +
> +comment "freeswitch needs a toolchain w/ C++, dynamic library, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| BR2_STATIC_LIBS
> diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
> new file mode 100644
> index 0000000..ebee17f
> --- /dev/null
> +++ b/package/freeswitch/freeswitch.hash
> @@ -0,0 +1,2 @@
> +# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.6.tar.xz.sha256
> +sha256	397b9c63c2c1f7008a2cc269f2e0e9a935d862b3fb074a6044819bcaea02ebc0	freeswitch-1.6.6.tar.xz
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> new file mode 100644
> index 0000000..ba3f2e9
> --- /dev/null
> +++ b/package/freeswitch/freeswitch.mk
> @@ -0,0 +1,89 @@
> +################################################################################
> +#
> +# freeswitch
> +#
> +################################################################################
> +
> +FREESWITCH_VERSION = 1.6.6
> +FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_LICENSE = MPL v1.1
> +FREESWITCH_LICENSE_FILES = COPYING
> +
> +# required dependencies
> +FREESWITCH_DEPENDENCIES = \
> +	host-autoconf host-automake host-libtool host-pkgconf jpeg \
> +	libcurl openssl pcre speex sqlite zlib
> +
> +# needed after
> +# https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/c74237ad3cbd1974ae70f1a8d0d5d2cfe4d7b446
> +FREESWITCH_DEPENDENCIES += host-autoconf-archive
> +define FREESWITCH_NEEDS_MEMMOVE_M4
> +	ln -sfv \
> +		$(HOST_DIR)/usr/share/autoconf-archive/ax_func_memmove.m4 \
> +		$(@D)/libs/spandsp/m4/ax_func_memmove.m4
> +endef
> +FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_NEEDS_MEMMOVE_M4
> +
> +# autoreconf now is necessary to avoid broken autoreconf after configure
> +# we also patch configure.ac twice
> +define FREESWITCH_BOOTSTRAP
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./rebootstrap.sh
> +endef
> +FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_BOOTSTRAP

Can you use PRE_CONFIGURE_HOOKS instead ?
We need to restart autoreconf when make freeswitch-reconfigure is used

> +
> +# freeswitch comes with pre-enabled modules, since we want to control
> +# the modules ourselves reset the upstream configuration
> +define FREESWITCH_RESET_MODULES
> +	> $(@D)/modules.conf
> +endef
> +FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_RESET_MODULES

Same here, use PRE_CONFIGURE_HOOKS in order to reset the module list.

> +
> +# we neither need host-perl nor host-php
> +FREESWITCH_CONF_ENV += \
> +	ac_cv_prog_PERL=false \
> +	ac_cv_have_perl=no \
> +	ac_cv_prog_PHP=false \
> +	ac_cv_have_php=no \
> +	ac_cv_prog_PHP_CONFIG=false \
> +	ac_cv_have_php_config=no
> +
> +# copied from freeswitch/configure.ac, line 258+
> +FREESWITCH_CONF_ENV += \
> +	ac_cv_file__dev_ptmx=yes \
> +	ac_cv_va_copy=yes \
> +	ac_cv_file__dev_urandom=yes \
> +	ac_cv_func_realloc_0_nonnull=yes \
> +	ac_cv_func_malloc_0_nonnull=yes \
> +	ac_cv_func_setpgrp_void=yes \
> +	ac_cv_file__dev_zero=yes \
> +	apr_cv_tcp_nodelay_with_cork=yes \
> +	ac_cv_file_dbd_apr_dbd_mysql_c=no \
> +	ac_cv_sizeof_ssize_t=4 \
> +	apr_cv_mutex_recursive=yes \
> +	ac_cv_func_pthread_rwlock_init=yes \
> +	apr_cv_type_rwlock_t=yes \
> +	apr_cv_process_shared_works=yes \
> +	apr_cv_mutex_robust_shared=yes
> +
> +# build breaks with -Werror enabled
> +FREESWITCH_CONF_ENV += \
> +	ac_cv_gcc_supports_w_no_unused_result=no
> +
> +FREESWITCH_CONF_OPTS = \
> +	--disable-core-libedit-support \
> +	--disable-core-odbc-support \
> +	--without-erlang \
> +	--enable-fhs \
> +	--without-python \
> +	--disable-system-xmlrpc-c
> +
> +# zrtp supports a limited set of archs, sparc support is also broken due
> +# to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
> +ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
> +FREESWITCH_CONF_OPTS += --enable-zrtp
> +else
> +FREESWITCH_CONF_OPTS += --disable-zrtp
> +endif

It would be better to have an zrtp Buildroot package with an
BR2_PACKAGE_LIBZRTP_ARCH_SUPPORTS symbol.

I noticed at the end of the build that modcheck.sh look at the host path:
/usr/lib/freeswitch/mod which shouldn't exist. Since this script is not useful
except to produces warnings, we can either disable it or fix the $1 argument
with $(TARGET_DIR)/usr/lib/freeswitch/mod ?

Freeswitch seems very difficult to package if we don't want to use bundled
libraries...

Best regards,
Romain

> +
> +$(eval $(autotools-package))
> 
