From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Apr 2016 17:03:55 +0200
Subject: [Buildroot] [PATCH v14 01/27] package/freeswitch: new package
In-Reply-To: <1460804118-4900-2-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
 <1460804118-4900-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5713A5DB.2040309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/16/16 12:54, Bernd Kuhls wrote:
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

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Build test on arm-musl and sh4-glibc.

  I've never seen a package before that puts advertising in the build output :-)

  There is one small weird thing: the build ends with:
.../output/build/freeswitch-1.6.7/build/modcheck.sh: line 17: cd: 
/usr/lib/freeswitch/mod: No such file or directory

  If a script is searching for things in /usr/lib, that doesn't give a warm 
fuzzy feeling... But at least I couldn't find any weird path references in the 
target directory, so I guess it's OK.


  But again a small nit about the licensing, see below.


> ---

[snip]
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> new file mode 100644
> index 0000000..a6d5de3
> --- /dev/null
> +++ b/package/freeswitch/freeswitch.mk
> @@ -0,0 +1,97 @@
> +################################################################################
> +#
> +# freeswitch
> +#
> +################################################################################
> +
> +FREESWITCH_VERSION = 1.6.7
> +FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_LICENSE = MPLv1.1, \
> +	Apache-2.0 (apr, apr-util) \
> +	LGPLv2+ (sofia-sip), \
> +	LGPLv2.1, GPLv2 (spandsp), \
> +	BSD-3c (libsrtp), \
> +	tiff license

  I'm not 100% sure about the licensing bit (even with fossology, it's a huge 
amount of work to really vet it). But now at least the license statement looks 
sufficiently complicated so that the appropriate alarm bells start ringing when 
someone looks at legal-info output. Also none of the potentially problematic 
licenses seem to be missing. Except... GPLv3. The following should be added.

	GPLv3+ with font exception (fonts), \

  Perhaps that can be added while committing? This is v14 already...

  With that:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


Regards,
Arnout

> +
> +FREESWITCH_LICENSE_FILES = \
> +	COPYING \
> +	libs/apr/LICENSE \
> +	libs/apr-util/LICENSE \
> +	libs/sofia-sip/COPYING \
> +	libs/sofia-sip/COPYRIGHTS \
> +	libs/spandsp/COPYING \
> +	libs/srtp/LICENSE \
> +	libs/tiff-4.0.2/COPYRIGHT
> +
> +# required dependencies
> +FREESWITCH_DEPENDENCIES = \
> +	host-pkgconf \
> +	jpeg \
> +	libcurl \
> +	openssl \
> +	pcre \
> +	speex \
> +	sqlite \
> +	util-linux \
> +	zlib
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
> +FREESWITCH_LICENSE += AGPLv3 (libzrtp)
> +FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c
> +FREESWITCH_CONF_OPTS += --disable-zrtp
> +endif
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
