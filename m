From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Jul 2018 13:16:39 +0200
Subject: [Buildroot] [PATCH 1/1] imx-gpu-viv: add a missing backslash
In-Reply-To: <87effy8cqw.fsf@dell.be.48ers.dk>
References: <20180720091629.5723-1-laurent.hartanerot@gmail.com>
 <87effy8cqw.fsf@dell.be.48ers.dk>
Message-ID: <20180720131639.373130b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Jul 2018 11:42:15 +0200, Peter Korsgaard wrote:
> >>>>> "Laurent" == Laurent Hartanerot <laurent.hartanerot@gmail.com> writes:  
> 
>  > From: Laurent Hartanerot <laurent.hartanerot@atos.net>
>  > Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
>  > ---
>  >  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
>  > diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>  > index 511e3b3b6c..25d25e1871 100644
>  > --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>  > +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>  > @@ -79,7 +79,7 @@ endif
>  >  ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
>  >  define IMX_GPU_VIV_FIXUP_PKGCONFIG
>  >  	for lib in egl gbm glesv1_cm glesv2 vg; do \
>  > -		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc
>  > +		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \  
> 
> A semicolon is also missing. I've changed it to do  '|| exit 1; \' like
> we do elsewhere to catch failures and committed, thanks.

Actually, in this sort of case, I would prefer to use a make for loop:

	$(foreach lib,egl gbm glesv1_cm glesv2 vg, \
		ln -sf $(lib)_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$(lib).pc
	)

make automatically aborts the loop if there's an error, and $(lib) is
more readable than $${lib}.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
