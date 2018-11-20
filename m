From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2018 21:53:57 +0100
Subject: [Buildroot] [PATCH next v5 6/9] package/pkg-generic: adjust
 config scripts tweaks for per-package folders
In-Reply-To: <20181120163522.4281-7-thomas.petazzoni@bootlin.com>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-7-thomas.petazzoni@bootlin.com>
Message-ID: <20181120205357.GK2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-20 17:35 +0100, Thomas Petazzoni spake thusly:
> This commit adjusts the logic in pkg-generic.mk that tweaks the
> *-config shell scripts installed by various libraries to make it
> compatible with per-package folders.
> 
> This requires two fixes:
> 
>  - replacing $(STAGING_DIR) with a relative path from the config script
>    to the staging directory, rather than using an absolute path of the
>    staging directory.

Note [0], see below...

[--SNIP--]
>  - Some *-config scripts, such as the apr-1-config script, contain
>    references to host tools:
> 
>    CC=".../output/per-package/apr/hosr/bin/arm-linux-gcc"
>    CCP=".../output/per-package/apr/hosr/bin/arm-linux-cpp"
> 
>    We also want to replace those with proper relative paths. To

Note [1], see below...

>    achieve this, we need to also replace $(HOST_DIR) with a relative
>    path. Since $(STAGING_DIR) is inside $(HOST_DIR), the first
>    replacement of $(STAGING_DIR) by @STAGING_DIR@ is no longer needed:
>    replacing $(HOST_DIR) by @HOST_DIR@ is sufficient. We still need to
>    replace @STAGING_DIR@ by the proper path though, as we introduce
>    @STAGING_DIR@ references in exec_prefix and prefix variables, as
>    well as -I and -L flags.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Previously, BASE_DIR was the very first thing replaced, but now it no
longer is.

I'm not sure if I follow it all, but is the reason for that inversion
hidden behhinde notes [0] and [1], being the need to create relative
symlinks?

As far as I understand, if BASE_DIR is kept as the first replacement,
then we lose HOST_DIR as it (usually) is a subdir of BASE_DIR, so we end
up with just @BASE_DIR@/host and thus can't easily replace it with
relative paths anymore.

Right?

If so, then:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

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
