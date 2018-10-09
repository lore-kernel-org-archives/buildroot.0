From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:05:38 +0200
Subject: [Buildroot] [PATCH] poco: disable fpenvironment for MIPS
 without FPU
In-Reply-To: <20181009122326.12174-1-yegorslists@googlemail.com>
References: <20181009122326.12174-1-yegorslists@googlemail.com>
Message-ID: <20181009150538.09658891@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 14:23:26 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> glibc fixed a bug, that defined FPU capabilities not

This is a bit vague. Which bug? Which commit? Do you have some more
details ?

> available for MIPS without FPU. So add --no-fpenvironment
> to the configuration options for this case.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/poco/poco.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index 018344d5c7..1f3eabd009 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -42,6 +42,13 @@ ifeq ($(BR2_sh4a)$(BR2_nios2),y)
>  POCO_CONF_OPTS += --no-fpenvironment
>  endif
>  
> +# MIPS without FPU
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +ifeq ($(BR2_MIPS_SOFT_FLOAT),y)

Perhaps:

ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el):$(BR2_MIPS_SOFT_FLOAT),y:y)

I'm wondering if we shouldn't introduce some global BR2_ARCH_IS_MIPS
option, or something like that, because we have a lot of places where
we repeat those mips/mipsel/mips64/mips64el conditions. But that is of
course a completely separate discussion.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
