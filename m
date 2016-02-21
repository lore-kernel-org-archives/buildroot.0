From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 13:48:34 +0100
Subject: [Buildroot] [PATCH 3/7] package/cairo: add optional support for
 lzo
In-Reply-To: <1456051888-2047-3-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
 <1456051888-2047-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56C9B222.7040703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/16 11:51, Bernd Kuhls wrote:
> When lzo was compiled before, cairo will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cairo-sphinx | grep NEEDED | sort
> [...]
>  0x0000000000000001 (NEEDED)             Shared library: [liblzo2.so.2]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/cairo/cairo.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index 205250d..49cf921 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -142,6 +142,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
>  CAIRO_CONF_OPTS += --enable-tee
> +ifeq ($(BR2_PACKAGE_LZO),y)
> +CAIRO_DEPENDENCIES += lzo
> +endif

 I don't see why this would only be in the --enable-tee case.

 In fact, it looks like it is rather bound to the script option than to the tee
option (at least, when looking at the source). But just to be safe I'd put this
dependency outside of any conditions.


 Regards,
 Arnout

>  else
>  CAIRO_CONF_OPTS += --disable-tee
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
