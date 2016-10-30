From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 19:38:20 +0100
Subject: [Buildroot] [PATCH v2 23/23] toolchain-external: introduce and
 use external toolchain infra
In-Reply-To: <1477742948-11490-24-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-24-git-send-email-romain.naour@gmail.com>
Message-ID: <28350dcb-4c46-22ce-63aa-5d4ff8902b47@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 29/10/2016 ? 14:09, Romain Naour a ?crit :
> This fairly large commit is needed to switch in one atomic change from
> the old single package based external toolchain handling, to a
> mechanism based on a common external toolchain package infrastructure
> and separate packages for each toolchain family. The purpose is to
> clearly separate the common external toolchain logic from the
> toolchain-specific details and generally make the external toolchain
> code hopefully easier to maintain.
> 
> To achieve this, this commit:
> 
>  - Introduce in pkg-toolchain-external.mk the
>      'toolchain-external-package' macro, which is the core of the
>      external toolchain package infrastructure. Like any other package
>      infrastructure, it defines a number of variables and provides a
>      behavior for the configure, build and install steps.
> 
>    - Turn the toolchain-external.mk file in a simple virtual package,
>      which automatically depends on the selected external
>      toolchain. Like any other virtual package, the Kconfig variable
>      BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL indicates which package is
>      providing the currently selected toolchain.
> 
>    - Removes all the toolchain-specific definitions from
>      toolchain/toolchain-external/Config.in as well as the hash file,
>      and instead use the per-toolchain packages in the subdirectories
>      toolchain/toolchain-external/*/.
> 
>    - Wine: Use $(TOOLCHAIN_EXTERNAL_PREFIX) instead of
>      $(BR2_TOOLCHAIN_EXTERNAL_PREFIX) which was removed.
> 
>    - Remove the old toolchain-external.hash file. The hash is now
>      provided by the toolchain package.
> 
> Notes:
>    - The hack for setting TOOLCHAIN_EXTERNAL_BIN for the ADI bfin
>      toolchain is no longer needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: - merge all pkg-toolchain-external* into pkg-toolchain-external.mk (Arnout)
>     - rebase on master
> 
>     fix two big issue:
>     1) TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS were not included in the
>        toolchain wrapper.
>     2) TOOLCHAIN_EXTERNAL_CFLAGS wasn't included in $(2)_CFLAGS, same
>        for TOOLCHAIN_EXTERNAL_LIBS and $(2)_LIBS. So no libraries were
>        intalled in target.
> ---

[...]

> +source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"

The codesourcery toolchains were named sourcery in a previous version of this
series, but now it's not sorted alphabetically.
Also, for ARM the default toochain choice is arago which is an very old
toolchain (2011), do we want to keep the default ARM choice to linaro or
codesourcery toolchain ?

With the change, some existing defconfig will not use the same toolchain.

Best regards,
Romain

> +source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
> +
> +# Kept last, so it remains the non-default choice, unless there isn't
> +# any available toolchain profile for the currently selected
> +# architecture.
> +source "toolchain/toolchain-external/toolchain-external-custom/Config.in"



[...]

> +source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
> +
> +source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
>  
