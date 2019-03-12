From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 01:02:18 +0100
Subject: [Buildroot] [PATCH 1/4] toolchain: set the ssp gcc option in
 kconfig
In-Reply-To: <8928_1552286905_5C8604B9_8928_92_1_1b5ea6bb-0d36-4857-888c-c65dd93bff8b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_92_1_1b5ea6bb-0d36-4857-888c-c65dd93bff8b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <309c4824-97d8-e946-79b2-7e4c722ed601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/03/2019 07:48, yann.morin at orange.com wrote:
[snip]
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 613f5f6c56..e48e765a8e 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -51,12 +51,8 @@ else ifeq ($(BR2_RELRO_FULL),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
>  endif
>  
> -ifeq ($(BR2_SSP_REGULAR),y)
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_REGULAR
> -else ifeq ($(BR2_SSP_STRONG),y)
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_STRONG
> -else ifeq ($(BR2_SSP_ALL),y)
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_ALL
> +ifneq ($(BR2_SSP_OPTION),)
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_OPTION='$(BR2_SSP_OPTION)'
>  endif

 I try to mention this every time someone touches the toolchain wrapper:

 I'd really like to use the BR_ADDITIONAL_CFLAGS instead, by changing the
definition in the .mk file to something like:

TOOLCHAIN_WRAPPER_OPTS = \
        $(call qstrip,$(BR2_TARGET_OPTIMIZATION)) \
	$(call qstrip,$(BR2_SSP_OPTION))

TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TOOLCHAIN_WRAPPER_OPTS),"$(f)"$(comma))'

(note that I preferred the qstrip instead of the ifdef here, and adding quotes
explicitly in the foreach, but you may want to implement it differently).

 Regards,
 Arnout
