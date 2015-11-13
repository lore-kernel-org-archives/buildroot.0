From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Fri, 13 Nov 2015 19:52:07 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: Your message of Tue, 10 Nov 2015 18:22:47 +0900.
 <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
Message-ID: <201511131052.tADAq7Nj017399@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear maintenaer, Thomas.

So if no further objection, please pull up this.

Regards,
Kawashima

Hiroshi Kawashima writes:
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
> diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> index b887c6a..8406774 100644
> --- a/package/gauche/gauche.mk
> +++ b/package/gauche/gauche.mk
> @@ -4,7 +4,8 @@
>  #
>  ############################################################################
> ####
>  
> -GAUCHE_VERSION = 0.9.4
> +GAUCHE_VERSION_MAJOR = 0.9
> +GAUCHE_VERSION = $(GAUCHE_VERSION_MAJOR).4
>  GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
>  GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
>  GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
> @@ -23,10 +24,24 @@ endif
>  # Detection of c99 support in configure fails without WCHAR. To enable
>  # automatic detection of c99 support by configure, we need to enable
>  # WCHAR in toolchain. But actually we do not need WCHAR at gauche
> -# runtime. So reuesting WCHAR in toolchain just for automatic detection
> +# runtime. So requesting WCHAR in toolchain just for automatic detection
>  # will be overkill. To solve this, explicitly -std=gnu99 is specified
>  # here.
>  GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
>  
> +define GAUCHE_REMOVE_UNNEEDED
> +	for i in gauche-config gauche-install gauche-package ; do \
> +		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
> +		rm -f $(TARGET_DIR)/usr/lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GA
> UCHE_VERSION)/$(GNU_TARGET_NAME)/$$i ; \
> +	done
> +	for i in gencomp genstub precomp ; do \
> +		rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(
> GAUCHE_VERSION)/lib/$$i ; \
> +	done
> +	rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_V
> ERSION)/aclocal.m4
> +	rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_V
> ERSION)/template.*
> +	rm -fr $(TARGET_DIR)/usr/lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VE
> RSION)/include
> +endef
> +GAUCHE_POST_INSTALL_TARGET_HOOKS += GAUCHE_REMOVE_UNNEEDED
> +
>  $(eval $(host-autotools-package))
>  $(eval $(autotools-package))
============================================================
    Hiroshi Kawashima
