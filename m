From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Fri, 9 Jul 2021 21:24:57 +0200
Subject: [Buildroot] [PATCH v2 1/2] board/stm32mp157c-dk2: fix U-Boot
 corruption on the first boot
In-Reply-To: <20210704154515.431798-2-geomatsi@gmail.com>
References: <20210704154515.431798-1-geomatsi@gmail.com>
 <20210704154515.431798-2-geomatsi@gmail.com>
Message-ID: <28c67abf-3ac7-5301-de56-bf505e089a3e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

Le 04/07/2021 ? 17:45, Sergey Matyukevich a ?crit?:
> The stm32mp157c-dk2 image successfully boots only once. Subsequent boot
> attempts fail to reach U-Boot. The root cause turns out to be in U-Boot
> corruption during the first boot. The stm32mp1 U-Boot stores its
> environment at the end of GPT partition named 'ssbl' since v2020.10-rc2.
> However Buildroot genimage template for stm32mp157 boards creates 'ssbl'
> partition w/o extra space for U-Boot primary and redundant environments.
> This patch explicitly specifies 'ssbl' partition size that should be
> enough for both u-boot.stm32 image (~1M) and both environments (16K).
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Tested-by: Pierre-Jean Texier <texier.pj2@gmail.com>

> ---
>   board/stmicroelectronics/common/stm32mp157/genimage.cfg.template | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
> index f341c19f2f..03fba8daf0 100644
> --- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
> +++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
> @@ -13,6 +13,7 @@ image sdcard.img {
>   
>   	partition ssbl {
>   		image = "u-boot.stm32"
> +		size = 2M
>   	}
>   
>   	partition rootfs {
> 

Thanks !
--
Pierre-Jean Texier
