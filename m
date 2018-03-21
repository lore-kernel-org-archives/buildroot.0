From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 07:39:27 +0200
Subject: [Buildroot] [V2 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180320195649.5309-1-francois.perrad@gadz.org>
References: <20180320195649.5309-1-francois.perrad@gadz.org>
Message-ID: <20180321053927.zwtbohigenottppb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Mar 20, 2018 at 08:56:48PM +0100, Francois Perrad wrote:
> with this new version:
>   - "configure --enable-static" should now be used instead of
>     "make STATIC=1"
>   - any customised options should be put in localoptions.h
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

One small nit below.

[...]

>  define DROPBEAR_ENABLE_REVERSE_DNS
> -	$(SED) 's:.*\(#define DO_HOST_LOOKUP\).*:\1:' $(@D)/options.h
> +	echo '#define DO_HOST_LOOKUP 1'         >> $(@D)/localoptions.h
>  endef
>  
>  define DROPBEAR_BUILD_SMALL
> -	$(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
> +	echo '#define DROPBEAR_SMALL_CODE 1'    >> $(@D)/localoptions.h

This is the default. Since we already rely on the default in the 
DO_HOST_LOOKUP case above, maybe we can do the same here.

But that's for another patch, anyway.

>  endef
>  
>  define DROPBEAR_BUILD_FEATURED
> -	$(SED) 's:^#define DROPBEAR_SMALL_CODE::' $(@D)/options.h
> -	$(SED) 's:.*\(#define DROPBEAR_BLOWFISH\).*:\1:' $(@D)/options.h
> -	$(SED) 's:.*\(#define DROPBEAR_TWOFISH128\).*:\1:' $(@D)/options.h
> -	$(SED) 's:.*\(#define DROPBEAR_TWOFISH256\).*:\1:' $(@D)/options.h
> +	echo '#define DROPBEAR_SMALL_CODE 0'    >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_BLOWFISH 1'      >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_TWOFISH128 1'    >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_TWOFISH256 1'    >> $(@D)/localoptions.h
>  endef
>  
>  define DROPBEAR_DISABLE_STANDALONE
> -	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
> +	echo '#define NON_INETD_MODE 0'         >> $(@D)/localoptions.h
>  endef
>  
>  define DROPBEAR_INSTALL_INIT_SYSTEMD

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
