From: Cam Hutchison <cam@camh.ch>
Date: Tue, 6 Feb 2018 09:23:33 +1100
Subject: [Buildroot] [PATCH 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
In-Reply-To: <20180205142914.GR20598@australia.be.alcatel-lucent.com>
References: <20180205142914.GR20598@australia.be.alcatel-lucent.com>
Message-ID: <CABa6e=ps3+ha8GvJQizG-aYfu8WeCG8mMQPgMQCOYnaB8B3A2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 February 2018 at 01:29, Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com> wrote:
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
>
> The problem is generic and can occur for a number of variables in Buildroot.
> One solution is to use a different separator than '_' to separate the
> package name from the rest of the variable name. For example:
> FOO_NAME could become FOO.NAME, FOO-NAME, or something else.
> Then, in the example we would have following non-clashing variables:
> FOO.NAME
> FOO.BASE_NAME
> FOO_BASE.NAME
> FOO_BASE.BASE_NAME
>
> However, making that change for only this case means that the variable
> naming is no longer consistent. And making the change for all variables has
> a large impact, also on certain user scripts.
>
> For now, keep it simple, and rename FOO_BASE_NAME into FOO_BASENAME, so that
> the variables become:
> FOO_NAME
> FOO_BASENAME
> FOO_BASE_NAME
> FOO_BASE_BASENAME
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/pkg-download.mk | 10 +++++-----
>  package/pkg-generic.mk  | 14 +++++++-------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 3712b9ccc6..14091a4646 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -79,7 +79,7 @@ define DOWNLOAD_GIT
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> -               $($(PKG)_RAW_BASE_NAME) \
> +               $($(PKG)_RAW_BASENAME) \
>                 $($(PKG)_DL_OPTS)
>  endef
>
> @@ -90,7 +90,7 @@ define DOWNLOAD_BZR
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> -               $($(PKG)_RAW_BASE_NAME) \
> +               $($(PKG)_RAW_BASENAME) \
>                 $($(PKG)_DL_OPTS)
>  endef
>
> @@ -102,7 +102,7 @@ define DOWNLOAD_CVS
>                 $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
>                 $($(PKG)_DL_VERSION) \
>                 $($(PKG)_RAWNAME) \
> -               $($(PKG)_RAW_BASE_NAME) \
> +               $($(PKG)_RAW_BASENAME) \
>                 $($(PKG)_DL_OPTS)
>  endef
>
> @@ -113,7 +113,7 @@ define DOWNLOAD_SVN
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> -               $($(PKG)_RAW_BASE_NAME) \
> +               $($(PKG)_RAW_BASENAME) \
>                 $($(PKG)_DL_OPTS)
>  endef
>
> @@ -137,7 +137,7 @@ define DOWNLOAD_HG
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> -               $($(PKG)_RAW_BASE_NAME) \
> +               $($(PKG)_RAW_BASENAME) \
>                 $($(PKG)_DL_OPTS)
>  endef
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a2a12e7b56..9a76cb3b8a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -452,10 +452,10 @@ ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>  endif
>
> -$(2)_BASE_NAME = $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> -$(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> +$(2)_BASENAME  = $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> +$(2)_RAW_BASENAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))

Doesn't this have the same problem? e.g. package foo and foo-raw
will now have conflicting variables.

If this patch is just to address some specific cases with existing
packages, can you list those packages in the commit message?

>  $(2)_DL_DIR    =  $$(DL_DIR)
> -$(2)_DIR       =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
> +$(2)_DIR       =  $$(BUILD_DIR)/$$($(2)_BASENAME)
>
>  ifndef $(2)_SUBDIR
>   ifdef $(3)_SUBDIR
> @@ -484,7 +484,7 @@ ifndef $(2)_SOURCE
>   ifdef $(3)_SOURCE
>    $(2)_SOURCE = $$($(3)_SOURCE)
>   else ifdef $(2)_VERSION
> -  $(2)_SOURCE                  ?= $$($(2)_RAW_BASE_NAME).tar.gz
> +  $(2)_SOURCE                  ?= $$($(2)_RAW_BASENAME).tar.gz
>   endif
>  endif
>
> @@ -558,7 +558,7 @@ endif
>
>  $(2)_REDISTRIBUTE              ?= YES
>
> -$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
> +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASENAME)
>
>  # When a target package is a toolchain dependency set this variable to
>  # 'NO' so the 'toolchain' dependency is not added to prevent a circular
> @@ -864,9 +864,9 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  # is that the license still applies to the files distributed as part
>  # of the rootfs, even if the sources are not themselves redistributed.
>  ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
> -       $(Q)$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +       $(Q)$$(call legal-warning-pkg,$$($(2)_RAW_BASENAME),cannot save license ($(2)_LICENSE_FILES not defined))
>  else
> -       $(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_RAW_BASE_NAME),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
> +       $(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_RAW_BASENAME),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
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
