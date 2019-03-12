From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2019 00:13:54 +0100
Subject: [Buildroot] [PATCH 1/5 v2] toolchain: prepare to pass more
 additional CFLAGS via the wrapper
In-Reply-To: <17089_1552392582_5C87A186_17089_129_1_a5ce0b38-3ef0-45ac-a336-7985a6490f2b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <17089_1552392582_5C87A186_17089_129_1_a5ce0b38-3ef0-45ac-a336-7985a6490f2b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <d1db6821-41d5-6d91-6c0e-e35c2b0a4e47@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 13:09, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, we pass the user-supplied so-called target optimisation flags
> to the wrapper.
> 
> We're going to have additional such CFLAGS to pass, so push-back the
> formatting loop to quote the options at the last moment.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  toolchain/toolchain-wrapper.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 613f5f6c56..c9e6fd3f3d 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -16,11 +16,13 @@ endif
>  TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
>  
> +TOOLCHAIN_WRAPPER_OPTS = \
> +	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> +
>  # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
>  # separate argument when used in execv() by the toolchain wrapper.
> -TOOLCHAIN_WRAPPER_OPTS = \
> -	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
> +TOOLCHAIN_WRAPPER_ARGS += \
> +	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TOOLCHAIN_WRAPPER_OPTS),"$(f)"$(comma))'
>  
>  ifeq ($(BR2_CCACHE),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
> 
