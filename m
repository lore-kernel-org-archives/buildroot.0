From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Feb 2017 11:26:44 +0100
Subject: [Buildroot] [PATCHv2 01/10] toolchain-external: clarify rsync
 excludes in copy_toolchain_sysroot
In-Reply-To: <20170204134214.20592-2-patrickdepinguin@gmail.com>
References: <20170204134214.20592-1-patrickdepinguin@gmail.com>
 <20170204134214.20592-2-patrickdepinguin@gmail.com>
Message-ID: <bd99d910-e960-466f-f0ff-ed772ccd80bf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 04/02/2017 ? 14:42, Thomas De Schampheleire a ?crit :
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The copy_toolchain_sysroot helper features a complex rsync loop that copies
> various directories from the extracted toolchain to the staging directory.
> The complexity mainly stems from the fact that we support multilib toolchain
> tarballs but only copy one of the multilib variants into staging.
> 
> Increase understandability of this logic by explicitly restricting the
> rsync excludes to the iteration of the for loop they are relevant for.
> Additionally, update the function comment.
> 
> Note: all attempts to reduce duplication between both rsync while keeping
> things nice and readable failed. One has to be extremely careful regarding
> line continuation, indentation, and single vs double quoting. In the end, a
> split up rsync seemed most clean.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: no changes
> 
>  toolchain/helpers.mk | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 72e7292..06dc197 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -39,11 +39,16 @@ copy_toolchain_lib_root = \
>  # dir. The operation of this function is rendered a little bit
>  # complicated by the support for multilib toolchains.
>  #
> -# We start by copying etc, lib, sbin and usr from the sysroot of the
> -# selected architecture variant (as pointed by ARCH_SYSROOT_DIR). This
> -# allows to import into the staging directory the C library and
> -# companion libraries for the correct architecture variant. We
> -# explictly only copy etc, lib, sbin and usr since other directories
> +# We start by copying etc, 'lib', sbin, usr and usr/'lib' from the
> +# sysroot of the selected architecture variant (as pointed to by
> +# ARCH_SYSROOT_DIR). This allows to import into the staging directory
> +# the C library and companion libraries for the correct architecture
> +# variant. 'lib' may not be literally 'lib' but could be something else,
> +# e.g. lib32-fp (as determined by ARCH_LIB_DIR) and we only want to copy
> +# that lib directory and no other. When copying usr, we therefore need
> +# to be extra careful not to include usr/lib* but we _do_ want to
> +# include usr/libexec.
> +# We are selective in the directories we copy since other directories
>  # might exist for other architecture variants (on Codesourcery
>  # toolchain, the sysroot for the default architecture variant contains
>  # the armv4t and thumb2 subdirectories, which are the sysroot for the
> @@ -90,9 +95,14 @@ copy_toolchain_sysroot = \
>  	SUPPORT_LIB_DIR="$(strip $5)" ; \
>  	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>  		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
> -			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
> -				--include '/libexec*/' --exclude '/lib*/' \
> -				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
> +			if [ "$$i" = "usr" ]; then \
> +				rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale'\
> +					--include '/libexec*/' --exclude '/lib*/' \
> +					$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
> +			else \
> +				rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale'\

Not related to your patch but I'm wondering if --exclude 'usr/lib/locale' is
still relevant. It was added to rsync with commit [1] but in seems to be already
excluded while extracting the toolchain (BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y case).
Maybe we still need it for BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y case.

Also, in "$$i" != "usr" case it's seems not needed.

Best regards,
Romain

[1] 2c23e937660f43131f68f6cbf2ff3fe3d0417032

> +					$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
> +			fi ; \
>  		fi ; \
>  	done ; \
>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
> 
