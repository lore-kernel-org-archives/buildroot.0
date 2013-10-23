From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 23:53:33 +0200
Subject: [Buildroot] [PATCH v8 RESEND 2/8] package: add toolchain
 dependency to every target package
In-Reply-To: <1382088860-30524-3-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5268455D.10106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> This commit makes the dependency from the target toolchain explicit.
> This way we can buid from command line a package that use
> innger-generic-package right after the configuration phase, example:
>
> 	make clean <package-name>
>
> Also remove TARGETS_ALL because the only purpose was to add toolchain
> dependency so it's superseded by this commit.
>
> To prevent circular dependency add the new variable <pkgname>_TOOLCHAIN
> for not adding the toolchain dependency for toolchain packages.
>
> This is also a step forward supporting top-level parallel make.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

  I'm not happy with this _ADD_TOOLCHAIN_DEPENDENCY variable.

  What I would prefer is to move glibc, linux-headers and uclibc back 
under the toolchain directory (why did they ever move out, Thomas?) and 
to filter on $(pkgparentdir)

ifeq ($(5),target)
ifneq ($(pkgparentdir),toolchain)
$(2)_DEPENDENCIES += toolchain
endif
endif


[snip]
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 9523529..f58570d 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -209,7 +209,8 @@ endef
>   # This must be repeated from inner-generic-package, otherwise we get an empty
>   # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
>   # away from the non-host rule
> -$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
> +$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
> +				host-toolchain $(1),\

  You'll also need to do this in pkg-cmake.mk.

>       $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
>
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1e7154e..3f19aea 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -307,8 +307,16 @@ endif
>
>   $(2)_REDISTRIBUTE		?= YES
>
> -
> -$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +# When a target package is a toolchain dependency set this variable to
> +# 'NO' so the 'toolchain' dependency is not added to prevent a circular
> +# dependency
> +$(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
> +
> +$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
> +	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($$($(2)_TYPE)-$$($(2)_ADD_TOOLCHAIN_DEPENDENCY),target-YES)

  It's more readable if you split this and-ing in two separate conditions.

  For $(2)_TYPE, you can directly use $(5) because you're anyway inside 
inner-generic-package here.


  Regards,
  Arnout

> +$(2)_DEPENDENCIES += toolchain
> +endif
>
>   $(2)_INSTALL_STAGING		?= NO
>   $(2)_INSTALL_IMAGES		?= NO

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
