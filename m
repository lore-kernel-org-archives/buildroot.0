From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 23:07:40 +0200
Subject: [Buildroot] [PATCH 10/34] reproducibility/sysstat: override gcc
 macros
In-Reply-To: <1462002570-14706-10-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-10-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <b1e39f6f-9fad-e51a-0917-012d2a63e74a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/16 09:49, Gilles Chanteperdrix wrote:
> Override the __DATE__ and __TIME__ macros with values obtained from
> the package SOURCE_DATE_EPOCH.
> ---
>  package/sysstat/sysstat.mk | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index 7568a4b..5cc6cd6 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -17,6 +17,25 @@ SYSSTAT_DEPENDENCIES += gettext
>  SYSSTAT_MAKE_OPTS += LFLAGS="$(TARGET_LDFLAGS) -lintl"
>  endif
>
> +SYSSTAT_CONF_OPTS += \
> +	sa_lib_dir=/usr/lib/sa
> +
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +SYSSTAT_SOURCE_DATE = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%b %_d %Y'`
> +SYSSTAT_SOURCE_TIME = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%T'`
> +
> +SYSSTAT_CONF_OPTS += \
> +	CFLAGS="$(TARGET_CFLAGS) -Wno-builtin-macro-redefined -include $(SYSSTAT_DIR)/.br_date_override.h"
> +
> +define SYSSTAT_OVERRIDE_DATE_HOOK
> +	echo "#define buildroot_stringify(x) #x" > $(SYSSTAT_DIR)/.br_date_override.h
> +	echo "#define __DATE__ buildroot_stringify($(SYSSTAT_SOURCE_DATE))" >> $(SYSSTAT_DIR)/.br_date_override.h
> +	echo "#define __TIME__ buildroot_stringify($(SYSSTAT_SOURCE_TIME))" >> $(SYSSTAT_DIR)/.br_date_override.h

  Actually, we have the toolchain wrapper that could do this override much more 
elegantly, and globally for all packages.

  Regards,
  Arnout

> +endef
> +
> +SYSSTAT_POST_PATCH_HOOKS += SYSSTAT_OVERRIDE_DATE_HOOK
> +endif
> +
>  # The isag tool is a post processing script that depends on tcl/tk
>  # among other things. So we don't install it.
>  SYSSTAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
