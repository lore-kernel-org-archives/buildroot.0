From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Mar 2016 18:09:22 +0200
Subject: [Buildroot] [PATCH] toolchain-external: Commonize /lib/<tuple>
 symlinks
In-Reply-To: <a7c3e2bed5654819b3ad564f7d28d233@ex13amer-00-ah.ad.mathworks.com>
References: <a7c3e2bed5654819b3ad564f7d28d233@ex13amer-00-ah.ad.mathworks.com>
Message-ID: <56F805B2.40703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Matt,

  An external toolchain patch as your first contribution, that's... ambitious... 
The external toolchain support is pretty fragile, we are careful about touching 
it, so it could take months before your patch gets applied.

On 03/22/16 21:22, Matt Fornero wrote:
> Commonize the creation of symlinks from {/usr}/lib to
> {/usr}/lib/<tuple>.
>
> These were originally defined on a per-toolchain basis for the Linaro
> toolchains, but there is currently no support for creating symlinks
> for custom toolchains that may have been based on Linaro (or older
> versions of the Linaro toolchain).
>
> Add common code for all supported Linaro toolchains and add a new
> config option, BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK to enable custom
> toolchains to enable the symbolic link creation.
>
> Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
> ---
>   toolchain/toolchain-external/Config.in             |   15 +++++++++++
>   toolchain/toolchain-external/toolchain-external.mk |   26 ++++++--------------
>   2 files changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index ff759a0..2e2ec03 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -745,6 +745,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>   	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
>   					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>
> +config BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK
> +	bool
> +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM && BR2_HOSTARCH = "x86"

  The HOSTARCH condition is unnecessary.

> +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64 && BR2_HOSTARCH = "x86"
> +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB && BR2_HOSTARCH = "x86"
> +	default y if BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> +	default n

  default n is not necessary.

> +
>   config BR2_TOOLCHAIN_EXTERNAL_GLIBC
>   	bool
>   	select BR2_TOOLCHAIN_USES_GLIBC
> @@ -1055,6 +1063,13 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
>   	  here, separated by spaces. They will be copied to the
>   	  target's /lib directory.
>
> +config BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> +	bool "Symlink /lib/<tuple>?"

  I would leave out the ? at the end. The HAS options above have it, but that's 
about the only situation we ever have a question mark.

  I was also thinking if we shouldn't just create the symlink unconditionally. 
But it's really just the Linaro toolchains that need it, so it doesn't make that 
much sense.

  But basically, it looks good to me.

  Regards,
  Arnout

> +	help
> +	  Select this option if your external toolchain needs a symlink
> +	  from the /lib directory to the /lib/<tuple> directory. This is
> +	  may be required if your toolchain is based on one from Linaro.
> +
>   endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>
>   config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 37e1a2e..66cf449 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -244,23 +244,16 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>   TOOLCHAIN_EXTERNAL_DEPENDENCIES += netbsd-queue
>   endif
>
> -# The Linaro ARMhf toolchain expects the libraries in
> -# {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
> +# Some toolchains, such as Linaro, expect the libraries in
> +# {/usr,}/lib/<tuple>, but Buildroot copies them to
>   # {/usr,}/lib, so we need to create a symbolic link.
> -define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
> -	ln -snf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
> -	ln -snf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
> -endef
> -
> -define TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
> -	ln -snf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
> -	ln -snf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
> -endef
> -
> -define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
> -	ln -snf . $(TARGET_DIR)/lib/aarch64-linux-gnu
> -	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK),y)
> +define TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> +	ln -snf . $(TARGET_DIR)/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
> +	ln -snf . $(TARGET_DIR)/usr/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
>   endef
> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> +endif
>
>   # Special handling for Blackfin toolchain, because of the split in two
>   # tarballs, and the organization of tarball contents. The tarballs
> @@ -298,7 +291,6 @@ ifeq ($(HOSTARCH),x86)
>   TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>   TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>   TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
>   else
>   TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/arm-linux-gnueabihf
>   TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
> @@ -308,7 +300,6 @@ ifeq ($(HOSTARCH),x86)
>   TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>   TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>   TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
>   else
>   TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/armeb-linux-gnueabihf
>   TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_armeb-linux-gnueabihf.tar.xz
> @@ -353,7 +344,6 @@ ifeq ($(HOSTARCH),x86)
>   TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>   TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
>   TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>   else
>   TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/aarch64-linux-gnu
>   TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
