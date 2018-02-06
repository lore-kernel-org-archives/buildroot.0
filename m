From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Feb 2018 14:51:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
In-Reply-To: <20180206125923.GB20598@australia.be.alcatel-lucent.com>
References: <20180206125923.GB20598@australia.be.alcatel-lucent.com>
Message-ID: <20180206135105.GC28439@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-02-06 13:59 +0100, Thomas De Schampheleire spake thusly:
> In current Buildroot, clashes occur between the variables _NAME and
> _BASE_NAME for two packages called foo and foo-base, i.e.
> 
> Package foo:
> FOO_NAME = foo
> FOO_BASE_NAME = foo-1.2.3
> 
> Package foo-base:
> FOO_BASE_NAME = foo-base
> FOO_BASE_BASE_NAME = foo-base-4.5.6
> 
> where variable FOO_BASE_NAME is clashing between these two packages.
[--SNIP--]
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 10 +++++-----
>  package/pkg-generic.mk  | 14 +++++++-------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 3712b9ccc6..6f15deba28 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -79,7 +79,7 @@ define DOWNLOAD_GIT
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		$($(PKG)_BASENAME_RAW) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -90,7 +90,7 @@ define DOWNLOAD_BZR
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		$($(PKG)_BASENAME_RAW) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -102,7 +102,7 @@ define DOWNLOAD_CVS
>  		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
>  		$($(PKG)_DL_VERSION) \
>  		$($(PKG)_RAWNAME) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		$($(PKG)_BASENAME_RAW) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -113,7 +113,7 @@ define DOWNLOAD_SVN
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		$($(PKG)_BASENAME_RAW) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -137,7 +137,7 @@ define DOWNLOAD_HG
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_RAW_BASE_NAME) \
> +		$($(PKG)_BASENAME_RAW) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a2a12e7b56..97c580541d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -452,10 +452,10 @@ ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>  endif
>  
> -$(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> -$(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> +$(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> +$(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
>  $(2)_DL_DIR	=  $$(DL_DIR)
> -$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
> +$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
>  
>  ifndef $(2)_SUBDIR
>   ifdef $(3)_SUBDIR
> @@ -484,7 +484,7 @@ ifndef $(2)_SOURCE
>   ifdef $(3)_SOURCE
>    $(2)_SOURCE = $$($(3)_SOURCE)
>   else ifdef $(2)_VERSION
> -  $(2)_SOURCE			?= $$($(2)_RAW_BASE_NAME).tar.gz
> +  $(2)_SOURCE			?= $$($(2)_BASENAME_RAW).tar.gz
>   endif
>  endif
>  
> @@ -558,7 +558,7 @@ endif
>  
>  $(2)_REDISTRIBUTE		?= YES
>  
> -$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
> +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_BASENAME_RAW)
>  
>  # When a target package is a toolchain dependency set this variable to
>  # 'NO' so the 'toolchain' dependency is not added to prevent a circular
> @@ -864,9 +864,9 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  # is that the license still applies to the files distributed as part
>  # of the rootfs, even if the sources are not themselves redistributed.
>  ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
> -	$(Q)$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
>  else
> -	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_RAW_BASE_NAME),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
> +	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
>  endif # license files
>  
>  ifeq ($$($(2)_SITE_METHOD),local)
> -- 
> 2.13.6
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
