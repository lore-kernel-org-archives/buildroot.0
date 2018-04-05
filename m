From: Stefan Becker <chemobejk@gmail.com>
Date: Thu, 5 Apr 2018 09:20:51 +0300
Subject: [Buildroot] [PATCH 1/1] core: enhance printvars for variables
 with newlines
In-Reply-To: <20180403143151.13372-1-chemobejk@gmail.com>
References: <20180403143151.13372-1-chemobejk@gmail.com>
Message-ID: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P+-tWYJYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping?

Is there anything left which prevents this from getting merged to master?

Regards, Stefan

On Tue, Apr 3, 2018 at 5:31 PM, Stefan Becker <chemobejk@gmail.com> wrote:
> If the variable content has newlines in it then the currently dumped
> content can't be fed again to GNU make. Add the option DEFINE_VARS which
> causes the variables to be dumped using
>
>    define VAR
>    ... line 1 ...
>    ... line 2 ...
>    ...
>    endef
>
> Updated the manual accordingly.
>
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  Makefile                  | 10 +++++++---
>  docs/manual/make-tips.txt | 20 ++++++++++++++++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 0724f28f45..3e27195de0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -974,9 +974,13 @@ printvars:
>                 $(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>                 $(if $(filter-out environment% default automatic, \
>                                 $(origin $V)), \
> -               $(if $(QUOTED_VARS),\
> -                       $(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> -                       $(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
> +               $(if $(DEFINE_VARS), \
> +                       $(info define $V) \
> +                       $(info $(if $(RAW_VARS),$(value $V),$($V))) \
> +                       $(info endef), \
> +                       $(if $(QUOTED_VARS),\
> +                               $(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> +                               $(info $V=$(if $(RAW_VARS),$(value $V),$($V)))))))
>  # ' Syntax colouring...
>
>  .PHONY: clean
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index ea1d825bef..ba87e5d873 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -92,6 +92,8 @@ It is possible to tweak the output using some variables:
>
>  - +VARS+ will limit the listing to variables which names match the
>    specified make-pattern
> +- +DEFINE_VARS+, if set to +YES+, will use define...endef to preserve
> +  newlines in the value
>  - +QUOTED_VARS+, if set to +YES+, will single-quote the value
>  - +RAW_VARS+, if set to +YES+, will print the unexpanded value
>
> @@ -106,6 +108,24 @@ For example:
>   BUSYBOX_RDEPENDENCIES=ncurses util-linux
>  ----
>
> +----
> + $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES DEFINE_VARS=YES
> + define BUSYBOX_DEPENDENCIES
> + skeleton toolchain
> + endef
> + define BUSYBOX_FINAL_ALL_DEPENDENCIES
> + skeleton toolchain
> + endef
> + define BUSYBOX_FINAL_DEPENDENCIES
> + skeleton toolchain
> + endef
> + define BUSYBOX_FINAL_PATCH_DEPENDENCIES
> + endef
> + define BUSYBOX_RDEPENDENCIES
> + ncurses util-linux'linux-pam skeleton toolchain host-skeleton host-ccache
> + endef
> +----
> +
>  ----
>   $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES QUOTED_VARS=YES
>   BUSYBOX_DEPENDENCIES='skeleton toolchain'
> --
> 2.14.3
>
