From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 12:33:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix hard float error
In-Reply-To: <1421010259-10281-1-git-send-email-jkrause@posteo.de>
References: <1421010259-10281-1-git-send-email-jkrause@posteo.de>
Message-ID: <20150112123342.5b5a616c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 11 Jan 2015 22:04:19 +0100, J?rg Krause wrote:

> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index ad598d9..3389c3c 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -56,14 +56,16 @@ else ifeq ($(BR2_mipsel),y)
>  NODEJS_CPU = mipsel
>  else ifeq ($(BR2_arm),y)
>  NODEJS_CPU = arm
> -# V8 needs to know what floating point ABI the target is using.  There's also
> -# a 'hard' option which we're not exposing here at the moment, because
> -# buildroot itself doesn't really support it at present.
> +# V8 needs to know what floating point ABI the target is using.
> +ifeq ($(BR2_ARM_EABIHF),y)
> +NODEJS_ARM_FP = hard
> +else
>  ifeq ($(BR2_SOFT_FLOAT),y)
>  NODEJS_ARM_FP = soft
>  else
>  NODEJS_ARM_FP = softfp
> -endif
> +endif # BR2_SOFT_FLOAT
> +endif # BR2_ARM_EABIHF
>  endif

Why don't we simply do:

NODEJS_ARM_FP = $(BR2_GCC_TARGET_FLOAT_ABI)

 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
