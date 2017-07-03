From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 23:04:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/tz: fix variable name
In-Reply-To: <cf57d9e4fbce228070e160c52aaf5c1173ba4999.1499109719.git.yann.morin.1998@free.fr>
References: <cover.1499109719.git.yann.morin.1998@free.fr>
 <cf57d9e4fbce228070e160c52aaf5c1173ba4999.1499109719.git.yann.morin.1998@free.fr>
Message-ID: <58ab2650-b2ae-7eb0-1ace-d2037c981237@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 21:22, Yann E. MORIN wrote:
> The tz packages mizes its own variable with the one fro the tzdata
> package...
> 
> Fix the variable name in tz.

 Hey, you also sneaked in a whitespace fix! :-)

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alexandre BELLONI <alexandre.belloni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It's a bit silly that the same variable is qstripped in 3 different places (tz,
tzdata and php). It would be better to strip it once and use it in all those
places. system/system.mk would be the obvious place, because it's defined in
system/Config.in, but unfortunately system/system.mk doesn't exist.

 But of course, that's for another patch :-)

 Regards,
 Arnout

> ---
>  package/tz/tz.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tz/tz.mk b/package/tz/tz.mk
> index 4d1c8c4d61..6b1f9f4d24 100644
> --- a/package/tz/tz.mk
> +++ b/package/tz/tz.mk
> @@ -26,13 +26,13 @@ define TZ_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
>  	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
>  	if [ -n "$(TZ_LOCALTIME)" ]; then \
> -		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
> +		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) ]; then \
>  			printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
> -			"$(TZDATA_LOCALTIME)"; \
> +				"$(TZ_LOCALTIME)"; \
>  			exit 1; \
>  		fi; \
>  		cd $(TARGET_DIR)/etc; \
> -		ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
> +		ln -sf ../usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) TZ; \
>  	fi
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
