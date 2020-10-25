From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:29:18 +0100
Subject: [Buildroot] [PATCH] configs/arcturus_ucp1020: Enabling gcc-8.x
 & support for BR2_powerpc_8548 cores
In-Reply-To: <977a0251-8239-1ec8-268c-4bf9b1c0498a@ArcturusNetworks.com>
References: <977a0251-8239-1ec8-268c-4bf9b1c0498a@ArcturusNetworks.com>
Message-ID: <20201025102918.4a8819f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Thu, 15 Oct 2020 10:48:33 -0400
Michael Durrant <mdurrant@ArcturusNetworks.com> wrote:

> diff --git a/configs/arcturus_ucp1020_defconfig
> b/configs/arcturus_ucp1020_defconfig
> index 8b90f44750..4e4a84f9e9 100644
> --- a/configs/arcturus_ucp1020_defconfig
> +++ b/configs/arcturus_ucp1020_defconfig
> @@ -6,6 +6,7 @@ BR2_powerpc_8548=y
> ?BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> ?
> ?# System settings
> +BR2_EXTRA_GCC_CONFIG_OPTIONS="--enable-obsolete"
> ?BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
> ?BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
> ?BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 74999c800b..a21ba006ce 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -27,7 +27,7 @@ config BR2_GCC_VERSION_8_X
> ??????? depends on !BR2_or1k
> ??????? # powerpc spe support has been deprecated since gcc 8.x.
> ??????? # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> -?????? depends on !BR2_powerpc_SPE
> +?????? depends on !BR2_powerpc_SPE || BR2_powerpc_8548
> ??????? select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> ?
> ?config BR2_GCC_VERSION_9_X

Thanks for proposing a fix, but your fix is not correct: it will only
work for your own defconfig. Your fix makes gcc 8.x selectable again
for BR2_powerpc_8548, but only if building your defconfig will
--enable-obsolete be passed.

So instead, I would suggest to re-enable gcc 8.x for BR2_powerpc_SPE,
and have package/gcc/gcc.mk pass --enable-obsolete when on a
BR2_powerpc_SPE platform.

Could you have a look at doing this ?

Also, what is your plan to support this platform moving forward ? gcc
upstream has dropped SPE support entirely as of gcc 9.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
