From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 16:53:57 +0100
Subject: [Buildroot] [RFCv3 12/15] core: kill DEPENDENCIES_HOST_PREREQ
In-Reply-To: <20171201205352.24287-13-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-13-thomas.petazzoni@free-electrons.com>
Message-ID: <20171229155357.GN3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-01 21:53 +0100, Thomas Petazzoni spake thusly:
> Now that DEPENDENCIES_HOST_PREREQ is no longer used anywhere, we can
> kill it.

With fire! A lot of fire! ;-]

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Defintiely:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes since v2:
>  - New patch
> ---
>  Makefile                             |  2 --
>  package/pkg-generic.mk               |  2 --
>  support/dependencies/dependencies.mk | 10 +++-------
>  3 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f31834682c..090b3ba191 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -485,8 +485,6 @@ include package/Makefile.in
>  -include $(wildcard arch/arch.mk.*)
>  include support/dependencies/dependencies.mk
>  
> -PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
> -
>  include toolchain/*.mk
>  include toolchain/*/*.mk
>  
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 7c5d951af9..8c6e34cc9f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -725,9 +725,7 @@ $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
>  $$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
>  
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
> -ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
> -endif
>  
>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  # In the normal case (no package override), the sequence of steps is
> diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
> index 1a4b5df9f2..d8ec137b12 100644
> --- a/support/dependencies/dependencies.mk
> +++ b/support/dependencies/dependencies.mk
> @@ -14,18 +14,14 @@ $(shell support/dependencies/check-host-$(1).sh $(2))
>  endef
>  -include $(sort $(wildcard support/dependencies/check-host-*.mk))
>  
> -core-dependencies:
> -	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
> +dependencies:
> +	@HOSTCC="$(firstword $(HOSTCC_NOCCACHE))" MAKE="$(MAKE)" \
>  		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
>  		$(TOPDIR)/support/dependencies/dependencies.sh
>  
> -core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
> -core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
> -dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
> -
>  ################################################################################
>  #
>  # Toplevel Makefile options
>  #
>  ################################################################################
> -.PHONY: dependencies core-dependencies
> +.PHONY: dependencies
> -- 
> 2.13.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
