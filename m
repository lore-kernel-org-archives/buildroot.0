From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:30:06 +0200
Subject: [Buildroot] [PATCH 11/34] reproducibility/vim: make vim
 reproducible
In-Reply-To: <1462002570-14706-11-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-11-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507153006.16624d0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:07 +0200, Gilles Chanteperdrix wrote:

> +ifeq ($(BR2_REPRODUCIBLE),y)
> +VIM_SOURCE_DATE = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%b %_d %Y'`
> +VIM_SOURCE_TIME = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%T'`
> +
> +VIM_CONF_OPTS += \
> +	--with-compiledby=buildroot \
> +	CFLAGS="$(TARGET_CFLAGS) -Wno-builtin-macro-redefined -include $(VIM_DIR)/.br_date_override.h"
> +
> +define VIM_OVERRIDE_DATE_HOOK
> +	echo "#define buildroot_stringify(x) #x" > $(VIM_DIR)/.br_date_override.h
> +	echo "#define __DATE__ buildroot_stringify($(VIM_SOURCE_DATE))" >> $(VIM_DIR)/.br_date_override.h
> +	echo "#define __TIME__ buildroot_stringify($(VIM_SOURCE_TIME))" >> $(VIM_DIR)/.br_date_override.h
> +endef
> +
> +VIM_POST_PATCH_HOOKS += VIM_OVERRIDE_DATE_HOOK

As you say yourself, this seems to be needed in many packages, so I
think a more generic solution is needed. At the very least,
the .br_date_override.h file should be generated once in a generic
place.

> +define VIM_FIX_AWK_REFERENCE
> +	sed -i 's,^#!.*awk,#!/usr/bin/awk,' $(TARGET_DIR)/usr/share/vim/vim74/tools/mve.awk
> +endef
> +
> +VIM_POST_INSTALL_TARGET_HOOKS += VIM_FIX_AWK_REFERENCE

Do we even need this awk script installed?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
