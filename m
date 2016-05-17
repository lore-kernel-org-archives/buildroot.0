From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 21:19:05 +0200
Subject: [Buildroot] [PATCH 2/4] fmlib: add powerpc e6500 support
In-Reply-To: <1463511883-27657-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1463511883-27657-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160517211905.58a63674@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 14:04:41 -0500, Matt Weber wrote:

> +if BR2_PACKAGE_FMLIB

One empty new line here.

> +choice
> +	prompt "QORIQ Target Family"

QORIQ -> QorIQ

> +	default BR2_FMLIB_QORIQ_FAMILY_P4080

I would suggest to remove this "default" statement. By default, kconfig
will select the first available choice, which is good enough for this
case.

> +	help
> +	  Select the family of QORIQ processor.

QorIQ

> +
> +config BR2_FMLIB_QORIQ_FAMILY_P4080
> +	bool "p40xx"
> +	depends on BR2_powerpc_e500mc
> +
> +config BR2_FMLIB_QORIQ_FAMILY_T4240
> +	bool "t42xx"
> +	depends on BR2_powerpc_e500mc
> +
> +config BR2_FMLIB_QORIQ_FAMILY_T2080
> +	bool "t208x"
> +	depends on BR2_powerpc_e6500

Empty new line.

> +endchoice

Ditto.

> +endif

I would probably suggest to do something like this as well:

config BR2_PACKAGE_FMLIB_ARCHTYPE
	string
	default "e500mc" if BR2_powerpc_e500mc
	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc

config BR2_PACKAGE_FMLIB_PLATFORM
	string
	default "P4080" if BR2_FMLIB_QORIQ_FAMILY_P4080
	default "T4240" if ...
	default "..." if "..."

> diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
> index 978810b..a4d28d0 100644
> --- a/package/fmlib/fmlib.mk
> +++ b/package/fmlib/fmlib.mk
> @@ -25,6 +25,21 @@ ifeq ($(BR2_powerpc_e500mc),y)
>  FMLIB_ARCHTYPE = ppce500mc
>  endif
>  
> +ifeq ($(BR2_powerpc_e6500),y)
> +ifeq ($(BR2_powerpc64), y)
> +	FMLIB_ARCHTYPE = ppc64e6500
> +else ifeq ($(BR2_powerpc), y)
> +	FMLIB_ARCHTYPE = ppc32e6500
> +endif
> +endif

Replace all this with:

FMLIB_ARCHTYPE = $(call qstrip,$(BR2_PACKAGE_FMLIB_ARCHTYPE))

> +
> +FMLIB_PLATFORM=P4080
> +ifeq ($(BR2_FMLIB_QORIQ_FAMILY_T4240),y)
> +	FMLIB_PLATFORM=T4240
> +else ifeq ($(BR2_FMLIB_QORIQ_FAMILY_T2080),y)
> +	FMLIB_PLATFORM=FMAN_V3H
> +endif

I don't see this variable being used anywhere in your code.

Also, for the record, we don't indent variable assignments.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
