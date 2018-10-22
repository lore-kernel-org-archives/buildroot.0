From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 23:24:32 +0100
Subject: [Buildroot] [PATCH] core: support host gcc of the future
In-Reply-To: <20181022090513.4976-1-yann.morin.1998@free.fr>
References: <20181022090513.4976-1-yann.morin.1998@free.fr>
Message-ID: <2f29e023-6e86-1388-e48e-62bcea5a723b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/22/18 10:05 AM, Yann E. MORIN wrote:
> When we do a release, we know only of a set of gcc versions that the
> host may have. But in the future, distributions with newer gcc versions
> may show up.
> 
> Currently, we do not recognise those versions, and thus we do as if they
> were older than the oldest we know of. This means that a set of packages
> become unselectable, when they should be.
> 
> We fix that be capping the detected version to the highest we know of.

 Good plan!

> 
> Reported-by: gargar_ on IRC
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in | 3 +++
>  Makefile  | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 6b5b2b043c..f6d28e362f 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -67,6 +67,9 @@ config BR2_HOST_GCC_AT_LEAST_8
>  	default y if BR2_HOST_GCC_VERSION = "8"
>  	select BR2_HOST_GCC_AT_LEAST_7
>  
> +# When adding new entries above, be sure to update
> +# the HOSTCC_VERSION variable in the Makefile.
> +
>  # Hidden boolean selected by packages in need of Java in order to build
>  # (example: kodi)
>  config BR2_NEEDS_HOST_JAVA
> diff --git a/Makefile b/Makefile
> index d39a94e832..6572e1e947 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -351,8 +351,11 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
>  	    -e 's/macppc/powerpc/' \
>  	    -e 's/sh.*/sh/' )
>  
> -HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
> -	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
> +# When adding a new host gcc version in Config.in,
> +# update the major in the condition, below:
> +HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
> +	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \
> +	[ "$${V%% *}" -le 8 ] || V=8; printf "%s" "$${V}")

 It is not so easy for the developer to realize that they should replace the two
8s there when bumping maximum host gcc... Could you move it into a variable?

 Regards,
 Arnout

>  
>  # For gcc >= 5.x, we only need the major version.
>  ifneq ($(firstword $(HOSTCC_VERSION)),4)
> 
