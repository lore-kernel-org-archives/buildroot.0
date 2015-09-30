From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2015 00:15:17 +0200
Subject: [Buildroot] [RFC 1/2] non-versioned packages
In-Reply-To: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
Message-ID: <20150930221517.GA3702@free.fr>
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

Wrong. We also have:
    googlefontdirectory
    gadgetfs-test
  * initscripts
 r+ * mcookie
    cache-calibrator

[*] like skeleton and mke2img, those are internal packages. so it's
normal they have no version.
[+] mcookie is now provided by util-linux, so we should probably get rid
of our internal copy.

Also, there has been a new package discussed on the list today that had
no version either (libsoil):
    http://lists.busybox.net/pipermail/buildroot/2015-September/140370.html
    http://lists.busybox.net/pipermail/buildroot/2015-September/140480.html
    http://lists.busybox.net/pipermail/buildroot/2015-September/140508.html

And yes, I would like to keep being able to have packages without a
version.Even if  upstream are not playing by the rules, it is perfectly
legit that we have support for that.

Regards,
Yann E. MORIN.

> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
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
