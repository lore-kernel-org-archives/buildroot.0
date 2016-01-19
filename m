From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2016 23:32:33 +0100
Subject: [Buildroot] [RFC 1/2] non-versioned packages
In-Reply-To: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
Message-ID: <20160119223233.GH3360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2015-10-01 00:12 +0300, Alex Suykov spake thusly:
> In case (PKG)_VERSION is empty, do not attempt to download sources
> for the package. Attempts to download (package)-undefined.tar.gz
> are pointless, the file is not likely to exist.
> 
> Also, output/build/(package) looks better and makes more sense than
> output/build/(package)-undefined for such packages.
> 
> Non-versioned packages within buildroot: skeleton and mke2img.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I'm still not convinced that the commit log is correct. What
about something like;

    core: do not attempt to download when no _VERSION and no _SOURCE

    Currently, when the package defines no _SOURCE and no _VERSION
    variables, we end up trying to download <PACKAGE>-undefined.tar.gz.

    This is utterly pointless.

    Change the logic to not attempt a download when neither _SOURCE nor
    _VERSION is set:
      - do not set an indefined _VERSION to "undefined"
      - do not append an empty (or "undefined") version to the package
        rawname
      - use the package rawname in the <ESSAGE macro

    Consequently, for packages that have no _VERSION, the build
    directory will be just the package name (which to some may look
    nicer than the current "package-undefined").

    Furthermore, the message trace is also a bit leaner (to the same
    people that find "package" nicer than "package-undefined"). ;-)

    Signed-off-by: You
    Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 6 ++----
>  package/pkg-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> The actual case the prompted me to do the change: I'm using buildroot
> as a test rig for building and running HEAD shapshots of a local git repo.
> "HEAD" is not a proper version, but without these changes I could only
> get "package-unknown" or "package-HEAD", and it took some effort to prevent
> download attempts.
> 
> I'm not sure how common this is, but it's possible. And since no proper
> downloadable package should ever come without a version, changing the way
> empty VERSION is handled should affect them.
> 
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5201fca..cb5545b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -332,8 +332,6 @@ ifndef $(2)_VERSION
>    $(2)_DL_VERSION := $$($(3)_DL_VERSION)
>   else ifdef $(3)_VERSION
>    $(2)_DL_VERSION := $$($(3)_VERSION)
> - else
> -  $(2)_DL_VERSION = undefined
>   endif
>  else
>   $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
> @@ -344,7 +342,7 @@ ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>  endif
>  
> -$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> +$(2)_BASE_NAME	=  $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
>  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>  
> @@ -374,7 +372,7 @@ endif
>  ifndef $(2)_SOURCE
>   ifdef $(3)_SOURCE
>    $(2)_SOURCE = $$($(3)_SOURCE)
> - else
> + else ifdef $(2)_VERSION
>    $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
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
>  TERM_BOLD := $(shell tput smso)
>  TERM_RESET := $(shell tput rmso)
>  
> -- 
> 2.0.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
