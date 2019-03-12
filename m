From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 01:25:05 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain: check the SSP option is known
In-Reply-To: <8928_1552286905_5C8604B9_8928_93_1_836f3203-3172-44de-a772-1825aafd915d@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_93_1_836f3203-3172-44de-a772-1825aafd915d@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <f8725159-1dae-da34-de01-dbf681de2169@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/03/2019 07:48, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Some toolchain vendors may have backported those options to older gcc
> versions, and we have no way to know, so we have to check that the
> user's selection is acceptable.
> 
> Extend the macro that currently checks for SSP in the toolchain, with
> a new test that the actual SSP option is recognised and accepted.
> 
> Note that the SSP option is either totaly empty, or an already-quoted
> string, so we can safely and easily assign it to a shell variable to
> test and use it.

 I notice that in vlc.mk, we have

ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)

without an actual check that stack-protector=strong really is available... Maybe
we need BR2_TOOLCHAIN_HAS_SSP_STRONG after all?

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  toolchain/helpers.mk                                   | 8 ++++++++
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index e5520c00c3..ba097e83cf 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -415,6 +415,7 @@ check_unusable_toolchain = \
>  # Check if the toolchain has SSP (stack smashing protector) support
>  #
>  # $1: cross-gcc path
> +# $2: gcc ssp option
>  #
>  check_toolchain_ssp = \
>  	__CROSS_CC=$(strip $1) ; \
> @@ -427,6 +428,13 @@ check_toolchain_ssp = \
>  		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
>  		exit 1 ; \
>  	fi ; \
> +	__SSP_OPTION=$(2); \
> +	if [ -n "$${__SSP_OPTION}" ] ; then \
> +		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
> +			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
> +			exit 1 ; \
> +		fi; \
> +	fi; \
>  	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
>  
>  #
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index db3570d96f..00cbd7b17a 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -549,7 +549,7 @@ define $(2)_CONFIGURE_CMDS
>  	else \
>  		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
>  	fi
> -	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC))
> +	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))
>  endef
>  
>  $(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
> 
