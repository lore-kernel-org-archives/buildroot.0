From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Feb 2017 12:04:23 +0100
Subject: [Buildroot] [PATCHv2 02/10] toolchain-external: handle ld.so
 fixups centrally
In-Reply-To: <20170204134214.20592-3-patrickdepinguin@gmail.com>
References: <20170204134214.20592-1-patrickdepinguin@gmail.com>
 <20170204134214.20592-3-patrickdepinguin@gmail.com>
Message-ID: <f666d254-78cc-2a4a-8d5a-497aa157f775@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 04/02/2017 ? 14:42, Thomas De Schampheleire a ?crit :
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Normally, the Buildroot toolchain logic copies all required libraries from
> the external toolchain to the staging directory, including the dynamic
> loader ld-*.so.
> There are cases, however, where the dynamic loader is _not_ automatically
> copied to staging. This happens when the dynamic loader is not inside
> ARCH_LIB_DIR itself (e.g. lib64), but instead resides in 'lib' (assume, of
> course, that ARCH_LIB_DIR != 'lib').
> 
> Currently, this is fixed in a toolchain-specific fixup, e.g. by recreating a
> missing symlink or copying over a missing file. Such toolchain specific
> fixups are not very nice.

Indeed, like the one I introduced in [1]. The CodeSourcery AArch64 toolchain
(which is still in Buildroot) was broken for more than one year, then ThomasP
applied the patch...

[1] 4d39ca1c2ab19766abf0430abe9b65ba0e16602b

> 
> Moreover, in a subsequent patch, the value of ARCH_LIB_DIR changes for some
> toolchains, causing them to have the same problem of a missing dynamic
> loader. This used to be the case for older Linaro toolchains with libraries
> in 'lib/<tuple>': Buildroot used to set ARCH_LIB_DIR=lib but the mentioned
> patch changes it to 'lib/<tuple>' instead. As a result, the files directly
> under 'lib/' will no longer be copied. There should be none, but the dynamic
> loader is a notable exception.
> [Note: support for these older Linaro toolchain has been removed in 2016.11]
> 
> Instead, copy over the ld.so file(s)/link(s) from the extracted toolchain
> into staging, in the central copy_toolchain_sysroot function. The existing
> toolchain logic will then handle the copy of these files from staging to
> target.
> This means the toolchain-specific fixups can be removed.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: no changes
> 
>  toolchain/helpers.mk                                          | 11 +++++++++++
>  .../toolchain-external-codesourcery-aarch64.mk                | 10 ----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 06dc197..6720629 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -55,6 +55,11 @@ copy_toolchain_lib_root = \
>  # corresponding architecture variants), and we don't want to import
>  # them.
>  #
> +# It is possible that ARCH_LIB_DIR does not contain the dynamic loader
> +# (ld*.so or similar) because it (or the main symlink to it) normally
> +# resides in /lib while ARCH_LIB_DIR may be something else (e.g. lib64).
> +# Therefore, copy the dynamic loader separately.
> +#
>  # Then, if the selected architecture variant is not the default one
>  # (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR), then we :
>  #
> @@ -105,6 +110,12 @@ copy_toolchain_sysroot = \
>  			fi ; \
>  		fi ; \
>  	done ; \
> +	if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so ]; then \
> +		cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so $(STAGING_DIR)/lib/ ; \
> +	fi ; \
> +	if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
> +		cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
> +	fi ; \

It's far better than having ld-*.so version hardcoded in the .mk...

Best regards,
Romain


>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
>  			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> index bc58c44..5f4453a 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> @@ -9,14 +9,4 @@ TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION = 2014.11-95
>  TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SOURCE = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
>  TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_ACTUAL_SOURCE_TARBALL = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
>  
> -define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> -	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
> -endef
> -TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> -
> -define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
> -	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
> -endef
> -TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
> -
>  $(eval $(toolchain-external-package))
> 
