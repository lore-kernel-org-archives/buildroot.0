From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:55:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: bump to version 0.23.20
In-Reply-To: <20200308074516.25306-1-james.hilliard1@gmail.com>
References: <20200308074516.25306-1-james.hilliard1@gmail.com>
Message-ID: <20200411155503.782e4b93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sun,  8 Mar 2020 00:45:16 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index 50afc4cdf9..bde1aaaf36 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -14,3 +14,4 @@ LIBTASN1_INSTALL_STAGING = YES
>  LIBTASN1_CONF_ENV = MAKEINFO="true"
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

This should be in a separate patch.

> -P11_KIT_VERSION = 0.23.16.1
> +P11_KIT_VERSION = 0.23.20
>  P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
> -P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
> +P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
> +P11_KIT_DEPENDENCIES = host-pkgconf host-libtasn1 libffi libtasn1
>  P11_KIT_INSTALL_STAGING = YES
> -P11_KIT_CONF_OPTS = --disable-static
> -P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
> -	ac_cv_have_decl___progname=no
> +P11_KIT_CONF_OPTS = -Dlibffi=enabled -Dtrust_module=enabled -Dsystemd=disabled

Why are you unconditionally enabling libffi and trust_module support?
If these features are optional in p11-kit, they should be optional in
Buildroot as well. Making the trust_module feature optional allows to
make the libtasn1 dependency optional.

Could you have a look into this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
