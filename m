From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 16:35:37 +0100
Subject: [Buildroot] [PATCH] package/gauche: fix 'dlfcn.h: No such file'
 on autobuild
In-Reply-To: <201511171528.tAHFSVrN027653@ms-omx02.plus.so-net.ne.jp>
References: <201511171528.tAHFSVrN027653@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20151117163537.224d1cdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Wed, 18 Nov 2015 00:28:31 +0900, Hiroshi Kawashima wrote:

> diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> index b887c6a..400c2a3 100644
> --- a/package/gauche/gauche.mk
> +++ b/package/gauche/gauche.mk
> @@ -20,13 +20,18 @@ else
>  GAUCHE_CONF_OPTS += --without-zlib
>  endif
>  
> +GAUCHE_CFLAGS = $(TARGET_CFLAGS)
> +ifeq ($(BR2_STATIC_LIBS),y)
> +GAUCHE_CFLAGS += -DGC_NO_DLOPEN
> +endif
> +
>  # Detection of c99 support in configure fails without WCHAR. To enable
>  # automatic detection of c99 support by configure, we need to enable
>  # WCHAR in toolchain. But actually we do not need WCHAR at gauche
>  # runtime. So reuesting WCHAR in toolchain just for automatic detection
>  # will be overkill. To solve this, explicitly -std=gnu99 is specified
>  # here.
> -GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> +GAUCHE_CONF_ENV = CFLAGS="$(GAUCHE_CFLAGS) -std=gnu99"

If you do this, then add -std=gnu99 in GAUCHE_CFLAGS. Like:

GAUCHE_CFLAGS = $(TARGET_CFLAGS)

# Detection of c99 support in configure fails without WCHAR. To enable
# automatic detection of c99 support by configure, we need to enable
# WCHAR in toolchain. But actually we do not need WCHAR at gauche
# runtime. So reuesting WCHAR in toolchain just for automatic detection
# will be overkill. To solve this, explicitly -std=gnu99 is specified
# here.
GAUCHE_CFLAGS += -std=gnu99

ifeq ($(BR2_STATIC_LIBS),y)
GAUCHE_CFLAGS += -DGC_NO_DLOPEN
endif

GAUCHE_CONF_ENV = CFLAGS="$(GAUCHE_CFLAGS)"

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
