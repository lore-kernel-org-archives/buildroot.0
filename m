From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 23:53:17 +0200
Subject: [Buildroot] [PATCH v12 01/31] package/freeswitch: new package
In-Reply-To: <1460281299-2385-2-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
 <1460281299-2385-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <570EBFCD.5030604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/16 11:41, Bernd Kuhls wrote:
> This commit adds freeswitch without any configured modules and with a
> minimal set of non-optional dependencies. All other dependencies and
> modules will be added by further patches in this series.
>
> PLease note that freeswitch source repo bundles some libraries which are
> also available as buildroot packages. The freeswitch build system does
> not allow to use system libraries in these cases:
>
> apr, apr-util, libsrtp, libvpx, libyuv, sofia-sip, tiff
>
> The reason are patches to these packages by the freeswitch project which
> are not yet upstream. There is an open JIRA report for this situation:
> https://freeswitch.org/jira/si/jira.issueviews:issue-html/FS-353/FS-353.html
>
> More historic infos can be found here:
> http://article.gmane.org/gmane.comp.telephony.freeswitch.devel/2715
> https://freeswitch.org/the-missing-link/
>
> In the 1.6.7 version bump libvpx & libyuv were also moved in-tree:
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/febe0f8dacea2d2a31902b3dc469be757f8c3c4d
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/44da905b4f6b3b35e94b4948fb70dec7b5071ded
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

[snip]

> +# required dependencies
> +FREESWITCH_DEPENDENCIES = \
> +	host-autoconf host-automake host-libtool host-pkgconf jpeg \

  host-autoconf and host-automake? That's surprising when you don't 
autoreconf... An explanatory comment would be nice.

> +	libcurl openssl pcre speex sqlite zlib

  I prefer one dependency per line, so it's easier to update the dependencies 
while keeping them sorted.

> +
> +# freeswitch comes with pre-enabled modules, since we want to control
> +# the modules ourselves reset the upstream configuration
> +define FREESWITCH_RESET_MODULES
> +	> $(@D)/modules.conf
> +endef
> +FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_RESET_MODULES
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
> +	--disable-libvpx \
> +	--disable-libyuv \
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

  Given the problems with compiling zrtp, perhaps start out without it and add 
patch 32 to enable it? :-)


  Regards,
  Arnout

> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
