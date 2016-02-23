From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 00:28:34 +0100
Subject: [Buildroot] [PATCH] core: do not attempt downloads with no
 _VERSION set
In-Reply-To: <20160124223345.GA31752@vostro>
References: <20160124223345.GA31752@vostro>
Message-ID: <56CCEB22.2090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/24/16 23:33, Alex Suykov wrote:
> Currently, when the package defines no _SOURCE and no _VERSION
> variables, we end up trying to download <PACKAGE>-undefined.tar.gz.
> 
> This is utterly pointless.
> 
> Change the logic to not attempt a download when neither _SOURCE
> nor _VERSION is set:
>   - do not set an undefined _VERSION to "undefined"
>   - do not append an empty (or "undefined") version to the package
>     rawname
>   - use the package rawname in the MESSAGE macro
> 
> Consequently, for packages that have no _VERSION, the build
> directory will be just the package name (which to some may look
> nicer than the current "package-undefined").
> 
> Furthermore, the message trace is also a bit leaner (to the same
> people that find "package" nicer than "package-undefined").
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Note that we could also remove the _SOURCE and _VERSION definitions in
pkg-virtual.mk.

 Some additional comments below.

> ---
>  package/pkg-generic.mk | 6 ++----
>  package/pkg-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1e024d3..a5ee023 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -380,8 +380,6 @@ ifndef $(2)_VERSION
>    $(2)_DL_VERSION := $$($(3)_DL_VERSION)
>   else ifdef $(3)_VERSION
>    $(2)_DL_VERSION := $$($(3)_VERSION)
> - else
> -  $(2)_DL_VERSION = undefined
>   endif
>  else
>   $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
> @@ -392,7 +390,7 @@ ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>  endif
>  
> -$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> +$(2)_BASE_NAME	=  $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
>  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>  
> @@ -422,7 +420,7 @@ endif
>  ifndef $(2)_SOURCE
>   ifdef $(3)_SOURCE
>    $(2)_SOURCE = $$($(3)_SOURCE)
> - else
> + else ifdef $(2)_VERSION
>    $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz

 Maybe we should also fix this whitespace gibberish.

>   endif
>  endif
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 44bd2c9..c098b55 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -83,7 +83,7 @@ INFLATE.tar  = cat
>  suitable-extractor = $(INFLATE$(suffix $(1)))
>  
>  # MESSAGE Macro -- display a message in bold type
> -MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
> +MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_BASE_NAME) $(call qstrip,$(1))$(TERM_RESET)"

 This part I don't like much. I did like it that the package name and the
version were separated in the messages. The idea of this change is to avoid a
double space when PKG_VERSION is empty, but in fact we already have that for the
finalizing steps.

 So, to eliminate all spaces, I'd make it

MESSAGE = echo "$(TERM_BOLD)>>>" $($(PKG)_NAME) $($(PKG)_VERSION) "$(call
qstrip,$(1))$(TERM_RESET)"

this way, empty package name and version will be eliminated by shell parsing.

 But that's a separate patch, so I propose to eliminate just this bit from the
patch and apply.

 Regards,
 Arnout


>  TERM_BOLD := $(shell tput smso)
>  TERM_RESET := $(shell tput rmso)
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
