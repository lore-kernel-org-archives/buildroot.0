From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2018 22:37:58 +0100
Subject: [Buildroot] [PATCH next v4 4/6] Makefile: move .NOTPARALLEL
 statement after including .config file
In-Reply-To: <20181114105557.12599-5-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-5-thomas.petazzoni@bootlin.com>
Message-ID: <20181115213758.GS10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-14 11:55 +0100, Thomas Petazzoni spake thusly:
> In a follow-up commit, we will make the .NOTPARALLEL statement
> conditional on a Config.in option, so we need to move it further down.

Ultimately, I don't see why we do need a config option to turn top-level
parallel build on/off. It will ultimately be the user's choice to do so
when calling 'make -jN' no?

However, what we do need for now, is a config option that enabled
per-package directories (PPD, formerly known as PPS, per-package
staging). When that is turned off, we must not allow top-level
parallel build.

I was thinking that we would not need that option either, because we
would enable PPD when we detect that the user is doing top-level parllel
build, by inspecting $(MAKEFLAGS) to see if they contained -j.

However, make is our fiend here, because it does not include -j in the
MAKFLAGS variable, but the one that is exported:

    $ cat Makefile
    $(info var MAKEFLAGS='$(MAKEFLAGS)')
    all:
        @echo "env MAKEFLAGS='$${MAKEFLAGS}'"

    $ make -j1
    var MAKEFLAGS=''
    env MAKEFLAGS=''

    $ make -j3
    var MAKEFLAGS=''
    env MAKEFLAGS=' -j --jobserver-fds=3,4'

    $ make -j
    var MAKEFLAGS=''
    env MAKEFLAGS=' -j'

And there is no other variable in make that specifies that either...

So yes, this means we have no way from the Makefile to detect whether
we're parallel or not. Sigh. :-(

So we do need that option for PPD.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
