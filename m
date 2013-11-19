From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 23:47:24 +0100
Subject: [Buildroot] [PATCH] pciutils: install static lib with shared
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C663264BB0@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C663264BB0@ex-mb1.corp.adtran.com>
Message-ID: <528BEA7C.8040700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/13 21:02, ANDY KENNEDY wrote:
> When building pciutils as shared, also include the static libraries for
> a more rounded staging directory (useful when PREFER_STATIC_LIB is not
> set, but should provide a static library for when static linking with
> libpci is preferred).
>
> Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
> ---
> diff -Naur a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
> --- a/package/pciutils/pciutils.mk	2013-09-17 06:42:07.000000000 -0500
> +++ b/package/pciutils/pciutils.mk	2013-11-18 13:49:31.000000000 -0600
> @@ -17,7 +17,26 @@
>   	PCIUTILS_ZLIB=no
>   endif
>   PCIUTILS_DNS=no
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +PCIUTILS_SHARED=no
> +PCIUTILS_DO_SHARED_BUILD =
> +else
>   PCIUTILS_SHARED=yes
> +define PCIUTILS_DO_SHARED_BUILD
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
> +		HOST="$(KERNEL_ARCH)-linux" \
> +		OPT="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		RANLIB=$(TARGET_RANLIB) \
> +		AR=$(TARGET_AR) \
> +		-C $(PCIUTILS_DIR) \
> +		SHARED=yes \
> +		ZLIB=$(PCIUTILS_ZLIB) \
> +		DNS=$(PCIUTILS_DNS) \
> +		LIBKMOD=$(PCIUTILS_KMOD) \
> +		PREFIX=/usr

  This should be refactored so the long list of arguments isn't repeated. 
E.g.

PCIUTILS_MAKE_OPTS = \
	CC="$(TARGET_CC)" \
	...

define PCIUTILS_DO_SHARED_BUILD
	$(TARGET_MAKE_ENV) $(MAKE) -C @(D) \
		$(PCIUTILS_MAKE_OPTS) SHARED=yes
endef

> +endef
> +endif
>
>   # Build after busybox since it's got a lightweight lspci
>   ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> @@ -47,11 +66,12 @@
>   		RANLIB=$(TARGET_RANLIB) \
>   		AR=$(TARGET_AR) \
>   		-C $(PCIUTILS_DIR) \
> -		SHARED=$(PCIUTILS_SHARED) \
> +		SHARED=no \
>   		ZLIB=$(PCIUTILS_ZLIB) \
>   		DNS=$(PCIUTILS_DNS) \
>   		LIBKMOD=$(PCIUTILS_KMOD) \
>   		PREFIX=/usr
> +	$(PCIUTILS_DO_SHARED_BUILD)
>   endef
>
>   # Ditch install-lib if SHARED is an option in the future

  As this comment says, for the static case, install-lib is not necessary 
for the target install.

  Wouldn't the install commands have to be done twice as well for staging?


  Regards,
  Arnout


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
