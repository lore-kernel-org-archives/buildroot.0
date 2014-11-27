From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:13:23 +0100
Subject: [Buildroot] [PATCH v2 1/9] freescale-imx: Add helper to extract
 self-extractible binaries
In-Reply-To: <1416432642-26005-2-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
 <1416432642-26005-2-git-send-email-jezz@sysmic.org>
Message-ID: <20141127181323.GF3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-19 22:30 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/freescale-imx.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index c52fc11..ba5a786 100644
> --- a/package/freescale-imx/freescale-imx.mk
> +++ b/package/freescale-imx/freescale-imx.mk
> @@ -7,4 +7,25 @@
>  FREESCALE_IMX_VERSION = 3.10.17-1.0.0
>  FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
>  
> +# Helper for self-extracting binaries distributed by Freescale.
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info
> +# Since there's a EULA in the bin file, extract it
> +# If you use this macro, don't forget to add "EULA" to LICENSE_FILES and set
> +# REDISTRIBUTE to "NO". Indeed, this is a legal minefield:
> +# the EULA specifies that the Board Support Package includes software
> +# and hardware (sic!) for which a separate license is needed...

It would have been great to add to the comment the expected argument:

    # $(1): full path to the archive file

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +define FREESCALE_IMX_EXTRACT_HELPER
> +	awk 'BEGIN      { start = 0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start = 1; }' \
> +	    $(1) > $(@D)/EULA
> +	cd $(@D) && sh $(1) --force --auto-accept;
> +	find $(@D)/$(basename $(1)) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> +	rmdir $(@D)/$(basename $(1))
> +endef
> +
> +
>  include $(sort $(wildcard package/freescale-imx/*/*.mk))
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
