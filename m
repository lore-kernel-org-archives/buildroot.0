From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2016 14:55:18 +0100
Subject: [Buildroot] [PATCH v3] toolchain: improve SSP logic
In-Reply-To: <1457517127-4560-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1457517127-4560-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160315145518.4fe83329@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Wed, 9 Mar 2016 09:52:07 +0000, Vicente Olivert Riera wrote:
> Don't enable SSP support on external toolchains just because they use
> glibc or musl. Instead of that, make the external toolchains explictily
> declare if they support SSP or not. And also add a check to detect SSP
> support when using custom external toolchains.
> 
> For internal toolchains we always enable SSP support for glibc and musl,
> and for uClibc we provide a kconfig option so the user can choose if he
> wants SSP support or not.

Why? We already have BR2_TOOLCHAIN_BUILDROOT_USE_SSP for this.

> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 16bf89c..a8d9229 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -22,6 +22,14 @@ config BR2_UCLIBC_CONFIG_FRAGMENT_FILES
>  	  A space-separated list of configuration fragment files,
>  	  that will be merged to the main uClibc configuration file.
>  
> +config BR2_TOOLCHAIN_BUILDROOT_HAS_SSP
> +	bool "Enable SSP support"
> +	default y
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	help
> +	  Enable this option if you want your toolchain to support
> +	  SSP (stack smashing protector).

This is doing exactly the same as:

config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
        bool "Enable stack protection support"
        select BR2_TOOLCHAIN_HAS_SSP
        help
          Enable stack smashing protection support using GCCs
          -fstack-protector-all option in uClibc.

          See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
          for details.

So your new option seems a bit useless.

Moreover, from a naming point of view, the xyz_HAS_baz options are
generally hidden booleans that indicate whether a feature is supported.
They are then selected by other Config.in options to be enabled, and
depended on by other Config.in options. But such a naming for the option that actually enables the feature is a bit weird, IMO.

>  #
> +# Check if the toolchain has SSP (stack smashing protector) support
> +#
> +# $1: cross-gcc path
> +#
> +check_toolchain_ssp = \
> +	__CROSS_CC=$(strip $1) ; \
> +	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -fstack-protector -x c - > /dev/null 2>&1 && echo y` ; \

Look at check_arm_abi how we are doing a compile test. We are not using
the -x c - trick because it fails for some toolchains. See commit
375bc18850f0f8fec90e1e478c0e9d2159377a64.

>  gen_gdbinit_file = \
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 0b0a1cb..7764a2b 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -22,6 +22,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>  	depends on BR2_ARM_EABIHF
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP

You should select BR2_TOOLCHAIN_HAS_SSP here, not
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP.

The BR2_TOOLCHAIN_EXTERNAL_HAS_xyz options are only visible when a
custom external toolchain is used, i.e when
BR2_TOOLCHAIN_EXTERNAL_CUSTOM is defined. So in fact here you are
selecting a Config.in option that does not exist, because you can't
have BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM and
BR2_TOOLCHAIN_EXTERNAL_CUSTOM selected at the same time.

>  endif # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
>  
> +endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
>  	bool "Toolchain has SSP support?"
>  	select BR2_TOOLCHAIN_HAS_SSP
> +	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_EXTERNAL_MUSL

Cosmetic, but you could write this as:

	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
	default y if BR2_TOOLCHAIN_EXTERNAL_MUSL

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
