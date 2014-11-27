From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:19:32 +0100
Subject: [Buildroot] [PATCH v2 5/9] libfslparser: Use self-extractible
	helper
In-Reply-To: <1416432642-26005-6-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
 <1416432642-26005-6-git-send-email-jezz@sysmic.org>
Message-ID: <20141127181932.GJ3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-19 22:30 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Ditto the variable re-ordering.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libfslparser/libfslparser.mk | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
> index d52b151..b980ba0 100644
> --- a/package/libfslparser/libfslparser.mk
> +++ b/package/libfslparser/libfslparser.mk
> @@ -7,30 +7,15 @@
>  LIBFSLPARSER_VERSION = 3.0.11
>  LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
>  LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
> +LIBFSLPARSER_INSTALL_STAGING = YES
> +
> +# See freescale-imx.mk
>  LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
>  LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
> -# This is a legal minefield: the EULA in the bin file specifies that
> -# the Board Support Package includes software and hardware (sic!)
> -# for which a separate license is needed...
>  LIBFSLPARSER_REDISTRIBUTE = NO
>  
> -LIBFSLPARSER_INSTALL_STAGING = YES
> -
> -# The archive is a shell-self-extractor of a bzipped tar. It happens
> -# to extract in the correct directory (libfslparser-x.y.z)
> -# The --force makes sure it doesn't fail if the source dir already exists.
> -# The --auto-accept skips the license check - not needed for us
> -# because we have legal-info
> -# Since the EULA in the bin file differs from the one in the tar file,
> -# extract the one from the bin file as well.
>  define LIBFSLPARSER_EXTRACT_CMDS
> -	awk 'BEGIN      { start=0; } \
> -	     /^EOEULA/  { start = 0; } \
> -	                { if (start) print; } \
> -	     /<<EOEULA/ { start=1; }'\
> -	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
> -	cd $(BUILD_DIR); \
> -	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLPARSER_SOURCE))
>  endef
>  
>  # The Makefile installs several versions of the libraries, but we only
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
