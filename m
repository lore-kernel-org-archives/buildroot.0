From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 23:08:25 +0100
Subject: [Buildroot] [PATCH 1/7] freescale-imx: Add helper to extract
 self-extractible binaries
In-Reply-To: <1415376207-23292-2-git-send-email-jezz@sysmic.org>
References: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
 <1415376207-23292-2-git-send-email-jezz@sysmic.org>
Message-ID: <20141118220825.GN4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

Coming back on that one...

On 2014-11-07 17:03 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/freescale-imx.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index c52fc11..38774ca 100644
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
> +define FREESCALE_IMX_EXTRACT_HELPER
> +	awk 'BEGIN      { start = 0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start = 1; }' \
> +	    $(DL_DIR)/$(1) > $(@D)/EULA

I wonder if we would not be better off passing the full path to the
firmware file, from the caller, i.e.:

    $(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(firmware_file))

Regards,
Yann E. MORIN.

> +	cd $(@D) && sh $(DL_DIR)/$(1) --force --auto-accept;
> +	find $(@D)/$(basename $(1)) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> +	rmdir $(@D)/$(basename $(1))
> +endef
> +
> +
>  include $(sort $(wildcard package/freescale-imx/*/*.mk))
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
