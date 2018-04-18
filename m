From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Apr 2018 00:27:40 +0200
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <20180416115855.26762-1-chemobejk@gmail.com>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
Message-ID: <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-04-18 13:58, Stefan Becker wrote:
> If the variable content has newlines in it then the currently dumped
> content can't be fed again to GNU make. Add the option DEFINE_VARS which
> causes the variables to be dumped using
> 
>    define VAR
>    ... line 1 ...
>    ... line 2 ...
>    ...
>    endef

 I'm still not convinced that this is such a great idea.

1. As explained in reply to your first iteration, there shouldn't be a need for
including Buildroot variables in a surrounding Makefile.

2. At least equally relevant would be output that is appropriate for Python,
JSON, ...

3. The implementation is not complete. In case of RAW_VARS, it's pretty hard to
use in practice because also all the referenced variables would need to be
retrieved. In the expanded case, any remaining $ will be interpreted by your
surrounding make instead of being passed down to the shell like they should. Try
e.g. CANFESTIVAL_INSTALL_TARGET_CMDS.

Note that QUOTED_VARS is not perfect either, mainly because there are some make
variables that are not legal shell variables (e.g. all the 4th stuff).

 So, if anything changes in here, I'd rather have some output that is in some
intermediate format that can easily be converted into or parsed by shell,
python, etc.

 Regards,
 Arnout

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
>  		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>  		$(if $(filter-out environment% default automatic, \
>  				$(origin $V)), \
> -		$(if $(QUOTED_VARS),\
> -			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> -			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
> +		$(if $(DEFINE_VARS), \
> +			$(info define $V) \
> +			$(info $(if $(RAW_VARS),$(value $V),$($V))) \
> +			$(info endef), \
> +			$(if $(QUOTED_VARS),\
> +				$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> +				$(info $V=$(if $(RAW_VARS),$(value $V),$($V)))))))
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
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
