From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 11:56:35 +0100
Subject: [Buildroot] [PATCH] toolchain: fix installing gconv libs with
 multi-arch toolchain
In-Reply-To: <1424469922-6306-1-git-send-email-yann.morin.1998@free.fr>
References: <1424469922-6306-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150221105635.GA4246@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-02-20 23:05 +0100, Yann E. MORIN spake thusly:
> For a multi-arch toolchain, gconv modules are in a sub-directory named
> after the machine gcc targets. This is the case, for example, for the
> Linaro ARM 2014.09 toolchain, wihch has the gconv modules in (relative
> to the sysroot):
>     /usr/lib/arm-linux-gnueabihf/gconv
> 
> while the Sourcery CodeBench ARM 2014.05 (non-multi-arch) has them in:
>     /usr/lib/gconv
> 
> So, to catter for both cases, search both paths. We want to favour the
> machine-specific gconv modules over potentially existign "genereic"
> ones, so we first search that (if it exists) and fallback to looking in
> the generic location.

Forget about this patch, I mised half of the fix... :-/

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  toolchain/toolchain.mk | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> index 3f9900b..f43b8f9 100644
> --- a/toolchain/toolchain.mk
> +++ b/toolchain/toolchain.mk
> @@ -18,11 +18,20 @@ ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
>  GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
>  define COPY_GCONV_LIBS
>  	$(Q)if [ -z "$(GCONV_LIBS)" ]; then \
> -		$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
> -				      $(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
> -		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
> -				   $(TARGET_DIR)/usr/lib/gconv \
> -		|| exit 1; \
> +		found_gconv=no; \
> +		machine=$$($(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -dumpmachine); \
> +		for d in $${machine} ''; do \
> +			[ -d "$(STAGING_DIR)/usr/lib/$${d}/gconv" ] || continue; \
> +			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
> +					      $(TARGET_DIR)/usr/lib/gconv/gconv-modules && \
> +			$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/$${d}/gconv/*.so \
> +					   $(TARGET_DIR)/usr/lib/gconv \
> +			|| exit 1; \
> +			[ -z "$${d}" ] || ln -sf . $(TARGET_DIR)/usr/lib/$${d}; \
> +			found_gconv=yes; \
> +		done; \
> +		[ "$${found_gconv}" = "yes" ] \
> +		|| { printf "Unable to find gconv modules\n" >&2; exit 1; } \
>  	else \
>  		for l in $(GCONV_LIBS); do \
>  			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${l}.so \
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
