From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2018 21:18:10 +0100
Subject: [Buildroot] [PATCH next v5 4/9] Makefile: move .NOTPARALLEL
 statement after including .config file
In-Reply-To: <20181120163522.4281-5-thomas.petazzoni@bootlin.com>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-5-thomas.petazzoni@bootlin.com>
Message-ID: <20181120201810.GG2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-20 17:35 +0100, Thomas Petazzoni spake thusly:
> In a follow-up commit, we will make the .NOTPARALLEL statement
> conditional on a Config.in option, so we need to move it further down.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

You forgot to carry my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(Granted, it was hiding below a long rant/research about the need of a
config option ;-] )

Regards,
Yann E. MORIN.

> ---
>  Makefile | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e675ac26aa..24c803872d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -105,22 +105,6 @@ ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MA
>  $(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
>  endif
>  
> -# Parallel execution of this Makefile is disabled because it changes
> -# the packages building order, that can be a problem for two reasons:
> -# - If a package has an unspecified optional dependency and that
> -#   dependency is present when the package is built, it is used,
> -#   otherwise it isn't (but compilation happily proceeds) so the end
> -#   result will differ if the order is swapped due to parallel
> -#   building.
> -# - Also changing the building order can be a problem if two packages
> -#   manipulate the same file in the target directory.
> -#
> -# Taking into account the above considerations, if you still want to execute
> -# this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
> -# use the -j<jobs> option when building, e.g:
> -#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
> -.NOTPARALLEL:
> -
>  # absolute path
>  TOPDIR := $(CURDIR)
>  CONFIG_CONFIG_IN = Config.in
> @@ -246,6 +230,22 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  -include $(BR2_CONFIG)
>  endif
>  
> +# Parallel execution of this Makefile is disabled because it changes
> +# the packages building order, that can be a problem for two reasons:
> +# - If a package has an unspecified optional dependency and that
> +#   dependency is present when the package is built, it is used,
> +#   otherwise it isn't (but compilation happily proceeds) so the end
> +#   result will differ if the order is swapped due to parallel
> +#   building.
> +# - Also changing the building order can be a problem if two packages
> +#   manipulate the same file in the target directory.
> +#
> +# Taking into account the above considerations, if you still want to execute
> +# this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
> +# use the -j<jobs> option when building, e.g:
> +#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
> +.NOTPARALLEL:
> +
>  # timezone and locale may affect build output
>  ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ = UTC
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
