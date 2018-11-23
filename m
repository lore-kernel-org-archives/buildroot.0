From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Nov 2018 19:09:12 +0100
Subject: [Buildroot] [PATCH next v6 06/10] package/pkg-generic: adjust
 config scripts tweaks for per-package directories
In-Reply-To: <20181123145815.13008-7-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-7-thomas.petazzoni@bootlin.com>
Message-ID: <20181123180912.GC14050@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-23 15:58 +0100, Thomas Petazzoni spake thusly:
> This commit adjusts the logic in pkg-generic.mk that tweaks the
> *-config shell scripts installed by various libraries to make it
> compatible with per-package directories.
[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This reviewed tag does stand after your explanations on your previous
iteration. Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 309fd8cd48..9b4db845b6 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -275,12 +275,13 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>  	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
>  	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
>  		$(call MESSAGE,"Fixing package configuration files") ;\
> -			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
> -				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
> +			$(SED)  "s,$(HOST_DIR), at HOST_DIR@,g" \
> +				-e "s,$(BASE_DIR), at BASE_DIR@,g" \
>  				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
>  				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
>  				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
> -				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
> +				-e 's, at STAGING_DIR@,$$(dirname $$0)/../..,g' \
> +				-e 's, at HOST_DIR@,$$(dirname $$0)/../../../..,g' \
>  				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
>  				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
>  	fi
> -- 
> 2.19.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
