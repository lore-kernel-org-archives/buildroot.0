From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 00:19:14 +0200
Subject: [Buildroot] [PATCH v8 RESEND 3/8] package: add support for
 top-level parallel make
In-Reply-To: <1382088860-30524-4-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52684B62.8020407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> To be able to use top-level parallel make we must not depend in a rule
> on the order of evaluation of the prerequisites, so instead of relyng on

  nitpick: relying

> the left to right ordering of evaluation of the prerequisites add an
> explicit rule to describe the dependencies.
> So add explicit dependencies for the following stamp files:
>     %/.stamp_extracted
>     %/.stamp_patched
>     %/.stamp_configured
>     %/.stamp_built
>     %/.stamp_host_installed
>     %/.stamp_staging_installed
>     %/.stamp_images_installed
>     %/.stamp_target_installed

  Your description here is not entirely accurate, because this makes it 
look as if the dependencies are added for the pattern rules.

>
> Because the %-build target is not anymore part of the dependency chain,
> add a new variable <pkgname>_BUILD_DEPENDENCIES to be used instead.
> This new variable is used only by uclibc and glibc packages.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>   package/glibc/glibc.mk   |  2 +-
>   package/pkg-generic.mk   | 38 +++++++++++++++++++++-----------------
>   package/uclibc/uclibc.mk |  2 +-
>   3 files changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 68b98a9..e89c12a 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -27,7 +27,7 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>   GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
>
>   # Before (e)glibc is built, we must have the second stage cross-compiler
> -glibc-build: host-gcc-intermediate
> +GLIBC_BUILD_DEPENDENCIES = host-gcc-intermediate

  I don't like this. (You'll notice I generally don't like adding new 
variables :-). This build-dependency is really an exceptional situation, 
so adding generic package infrastructure for it feels wrong to me. 
Instead, you can keep the explicit dependency that was there already, 
only now it is even more explicit:

$(GLIBC_TARGET_BUILD): host-gcc-intermediate

  Note that GLIBC_TARGET_BUILD is only defined after the
$(eval $(autotools-package)) so it will have to be moved down as well.


>
>   GLIBC_SUBDIR = build
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3f19aea..094868c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -317,6 +317,7 @@ $(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
>   ifeq ($$($(2)_TYPE)-$$($(2)_ADD_TOOLCHAIN_DEPENDENCY),target-YES)
>   $(2)_DEPENDENCIES += toolchain
>   endif
> +$(2)_BUILD_DEPENDENCIES		?=
>
>   $(2)_INSTALL_STAGING		?= NO
>   $(2)_INSTALL_IMAGES		?= NO
> @@ -368,30 +369,34 @@ $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
>   endif
>

  I would like to see somewhere a comment explaining how the dependencies 
between the steps are handled. In particular, explaining that this is not 
done in the pattern rules because then make would remove the stamp files 
and do too much rebuilding.

>   ifeq ($$($(2)_INSTALL_TARGET),YES)
> -$(1)-install-target:	$(1)-build \
> -			$$($(2)_TARGET_INSTALL_TARGET)
> +$(1)-install-target:	$$($(2)_TARGET_INSTALL_TARGET)
>   else
>   $(1)-install-target:
>   endif
>
>   ifeq ($$($(2)_INSTALL_STAGING),YES)
> -$(1)-install-staging:	$(1)-build \
> -			$$($(2)_TARGET_INSTALL_STAGING)
> +$(1)-install-staging:	$$($(2)_TARGET_INSTALL_STAGING)
>   else
>   $(1)-install-staging:
>   endif
>
>   ifeq ($$($(2)_INSTALL_IMAGES),YES)
> -$(1)-install-images:	$(1)-build \
> -			$$($(2)_TARGET_INSTALL_IMAGES)
> +$(1)-install-images:	$$($(2)_TARGET_INSTALL_IMAGES)
>   else
>   $(1)-install-images:
>   endif
>
> -$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
> +$(1)-install-host:      $$($(2)_TARGET_INSTALL_HOST)
>
> -$(1)-build:		$(1)-configure \
> -			$$($(2)_TARGET_BUILD)
> +$$($(2)_TARGET_INSTALL_TARGET) $$($(2)_TARGET_INSTALL_STAGING) \
> +$$($(2)_TARGET_INSTALL_IMAGES) $$($(2)_TARGET_INSTALL_HOST): \
> +	$$($(2)_TARGET_BUILD)

  I think it would also be possible to turn this into a dependency on 
$(1)-build instead of $$($(2)_TARGET_BUILD). That would also avoid the 
need for _BUILD_DEPENDENCIES and maybe some other changes.

  Of course, to be able to do that, you have to add
.PHONY: $(1)-build
otherwise everything will always be rebuilt.


> +
> +$(1)-build:		$$($(2)_TARGET_BUILD)
> +$$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE) | $$($(2)_BUILD_DEPENDENCIES)
> +
> +$(1)-configure:			$$($(2)_TARGET_CONFIGURE)
> +$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)

  This warrants a comment explaining why you use | here.

>
>   $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies dirs prepare
>
> @@ -402,13 +407,13 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>   #  extract
>   #  patch
>   #  configure
> -$(1)-configure:		$(1)-patch $(1)-depends \
> -			$$($(2)_TARGET_CONFIGURE)
> +$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
>
> -$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
> +$(1)-patch:		$$($(2)_TARGET_PATCH)
> +$$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
>
> -$(1)-extract:		$(1)-source \
> -			$$($(2)_TARGET_EXTRACT)
> +$(1)-extract:			$$($(2)_TARGET_EXTRACT)
> +$$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
>
>   $(1)-depends:		$$($(2)_DEPENDENCIES)

  Is the -depends target still useful? Does anybody ever run 'make 
foo-depends'?


  Regards,
  Arnout

>
> @@ -418,10 +423,9 @@ else
>   #  source, by rsyncing
>   #  depends
>   #  configure
> -$(1)-configure:		$(1)-depends \
> -			$$($(2)_TARGET_CONFIGURE)
> +$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_RSYNC)
>
> -$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
> +$(1)-depends:		$$($(2)_DEPENDENCIES)
>
>   $(1)-patch:		$(1)-rsync
>   $(1)-extract:		$(1)-rsync
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 0d12afd..dea36e7 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -26,7 +26,7 @@ UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>   UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
>
>   # Before uClibc is built, we must have the second stage cross-compiler
> -uclibc-build: host-gcc-intermediate
> +UCLIBC_BUILD_DEPENDENCIES = host-gcc-intermediate
>
>   # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
>   # setting.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
