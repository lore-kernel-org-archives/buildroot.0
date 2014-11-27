From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:18:12 +0100
Subject: [Buildroot] [PATCH v2 4/9] libfslcodec: Use self-extractible
	helper
In-Reply-To: <1416432642-26005-5-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
 <1416432642-26005-5-git-send-email-jezz@sysmic.org>
Message-ID: <20141127181812.GI3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-19 22:30 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

The variable re-ordering is a bit superfluous, but OK:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libfslcodec/libfslcodec.mk | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
> index 1a364bb..cf943a8 100644
> --- a/package/libfslcodec/libfslcodec.mk
> +++ b/package/libfslcodec/libfslcodec.mk
> @@ -7,30 +7,15 @@
>  LIBFSLCODEC_VERSION = 3.0.11
>  LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
>  LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
> +LIBFSLCODEC_INSTALL_STAGING = YES
> +
> +# See freescale-imx.mk
>  LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
>  LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
> -# This is a legal minefield: the EULA in the bin file specifies that
> -# the Board Support Package includes software and hardware (sic!)
> -# for which a separate license is needed...
>  LIBFSLCODEC_REDISTRIBUTE = NO
>  
> -LIBFSLCODEC_INSTALL_STAGING = YES
> -
> -# The archive is a shell-self-extractor of a bzipped tar. It happens
> -# to extract in the correct directory (libfslcodec-x.y.z)
> -# The --force makes sure it doesn't fail if the source dir already exists.
> -# The --auto-accept skips the license check - not needed for us
> -# because we have legal-info.
> -# Since the EULA in the bin file differs from the one in the tar file,
> -# extract the one from the bin file as well.
>  define LIBFSLCODEC_EXTRACT_CMDS
> -	awk 'BEGIN      { start=0; } \
> -	     /^EOEULA/  { start = 0; } \
> -	                { if (start) print; } \
> -	     /<<EOEULA/ { start=1; }'\
> -	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
> -	cd $(BUILD_DIR); \
> -	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLCODEC_SOURCE))
>  endef
>  
>  # FIXME The Makefile installs both the arm9 and arm11 versions of the
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
