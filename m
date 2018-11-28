From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 11:55:47 +0100
Subject: [Buildroot] [PATCH 2/3] arch: add support for Andes 32-bit
 (nds32) architecture
In-Reply-To: <20181128101542.9561-3-nylon7@andestech.com>
References: <20181128101542.9561-1-nylon7@andestech.com>
 <20181128101542.9561-3-nylon7@andestech.com>
Message-ID: <20181128115547.62591827@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 18:15:41 +0800, Nylon Chen wrote:
> This enables a nds32 system to be built with a Buildroot generated
> toolchain (gcc >= 8.0.1, binutils >= 2.30, glibc only).

Ah, so there is upstream support for NDS, good!

This patch should be the first in the series.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7cc5b0fe6e..a2bcaeb035 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2267,3 +2267,7 @@ N:	Greentime Hu <greentime@andestech.com>
>  N:	Nylon Chen <nylon7@andestech.com>
>  F:	toolchain/toolchain-external/toolchain-external-andes-nds32
>  F:	toolchain/toolchain-external
> +F:	toolchain/toolchain-buildroot
> +F:	arch/Config.in
> +F:	arch/Config.in.nds32

Again, one entry per person, I don't think the get-developers script
supports having multiple names in the same entry (or at least, verify
if it does).

> diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
> new file mode 100644
> index 0000000000..5803568337
> --- /dev/null
> +++ b/arch/Config.in.nds32
> @@ -0,0 +1,13 @@
> +config BR2_ARCH
> +	default "nds32"
> +
> +config BR2_ENDIAN
> +	default "LITTLE"
> +
> +config BR2_READELF_ARCH_NAME
> +	default "Andes Technology compact code size embedded RISC processor family"

Do you have several variants of the CPU architecture, which correspond
to some gcc march/mcpu flags ? If so they should be listed here, as a
Config.in choice..endchoice block.

> +config BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	bool

This should not be here, this Config.in option already exists elsewhere.

Also, in this patch introducing the architecture you need to:

 - Restrict the gcc version that can be used for NDS32, so that people
   cannot try to build with a gcc version that didn't had NDS32
   support. This must be done in package/gcc/Config.in.host

 - Allow glibc to be selected for the NDS32 architecture by changing
   BR2_TOOLCHAIN_BUILDROOT_GLIBC in
   toolchain/toolchain-buildroot/Config.in.

 - Restrict the binutils version that can be used for NDS32, which must
   be done in package/binutils/Config.in.host

 - Restrict the kernel headers version that can be used, which msut be
   done in package/linux-headers/Config.in.host

As a separate patch, could you add a snippet of configuration in
support/config-fragments/autobuild/ for your architecture, so that it
gets tested by our autobuilder infrastructure ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
