From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:29:26 +0200
Subject: [Buildroot] [PATCH 19/34] reproducibility/python: make python
 reproducible
In-Reply-To: <1462002570-14706-19-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-19-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507222926.33bded73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:15 +0200, Gilles Chanteperdrix wrote:
> python build is not reproducible for two reasons:
> - the libpython library embeds the build timestamps, fix this by
>   overriding the __DATE__ and __TIME__ macro using SOURCE_DATE_EPOCH;
> - _sysconfigdata.py and config/Makefile on target includes references
>   through INSTALL and MKDIR_P variables to host tools, fix this by
>   overriding these variables values with the corresponding paths on
>   buildroot rootfs.

For this second part, are you really aiming at having reproducible
builds with different build directories ? As you say in your cover
letter, that's an even more complicated problem.

> +ifeq ($(BR2_REPRODUCIBLE),y)
> +PYTHON_SOURCE_DATE = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%b %_d %Y'`
> +PYTHON_SOURCE_TIME = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%T'`
> +
> +PYTHON_CONF_OPTS += \
> +	CFLAGS="$(TARGET_CFLAGS) -Wno-builtin-macro-redefined -include $(PYTHON_DIR)/.br_date_override.h"
> +
> +define PYTHON_OVERRIDE_DATE_HOOK
> +	echo "#define buildroot_stringify(x) #x" > $(PYTHON_DIR)/.br_date_override.h
> +	echo "#define __DATE__ buildroot_stringify($(PYTHON_SOURCE_DATE))" >> $(PYTHON_DIR)/.br_date_override.h
> +	echo "#define __TIME__ buildroot_stringify($(PYTHON_SOURCE_TIME))" >> $(PYTHON_DIR)/.br_date_override.h
> +endef
> +
> +PYTHON_POST_PATCH_HOOKS += PYTHON_OVERRIDE_DATE_HOOK
> +endif

This really needs to be factored out somewhere. Maybe our compiler
wrapper should take of this. Arnout?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
