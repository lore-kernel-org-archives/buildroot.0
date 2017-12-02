From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Dec 2017 16:06:06 +0100
Subject: [Buildroot] [RFCv3 07/15] package/pkg-generic: handle host-tar
 as an extract dependency
In-Reply-To: <20171201205352.24287-8-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-8-thomas.petazzoni@free-electrons.com>
Message-ID: <20171202150606.GC2988@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-01 21:53 +0100, Thomas Petazzoni spake thusly:
> This moves the host-tar dependency handling from
> DEPENDENCY_HOST_PREREQ to an extract dependency.
> 
> To achieve that, check-host-tar.mk fills in the

s/$/ variable/

> BR2_TAR_HOST_DEPENDENCY with host-tar if building a host-tar is
> needed. The name BR2_TAR_HOST_DEPENDENCY has been chosen because it
> matches the name BR2_CMAKE_HOST_DEPENDENCY already used in
> check-host-cmake.mk.
> 
> The BR2_TAR_HOST_DEPENDENCY is added to all packages, except host-tar
> itself (obviously) and host-skeleton, because we depend on
> host-skeleton to install host-tar properly in HOST_DIR.

As we discussed on IRC, there is also the case for the tar filesystem,
which may require host-tar.

Granted, it is very very unlikely that we end up with no package that
require host-tar, but still...

> In addition, we modify tar.mk to explicitly build host-tar without
> ccache: since ccache source code is available as a tarball, ccache
> will obviously depend on host-tar if the system tar is insufficient.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v2:
>  - New patch
> ---
>  package/pkg-generic.mk                 | 4 ++++
>  package/tar/tar.mk                     | 6 ++++++
>  support/dependencies/check-host-tar.mk | 2 +-
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 824c34bec9..86dd2561d4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -587,6 +587,10 @@ ifneq ($(1),host-skeleton)
>  $(2)_DEPENDENCIES += host-skeleton
>  endif
>  
> +ifeq ($(filter host-tar host-skeleton,$(1)),)
> +$(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
> +endif

So, even packages that are available as a zip file will get the
dependency on host-tar?

>  # Eliminate duplicates in dependencies
>  $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
>  $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index cb2ddc0eca..813eabed14 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -44,4 +44,10 @@ define HOST_TAR_EXTRACT_CMDS
>  	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
>  	rmdir $(@D)/tar-$(TAR_VERSION)
>  endef
> +
> +# we are built before ccache
> +HOST_TAR_CONF_ENV = \
> +	CC="$(HOSTCC_NOCCACHE)" \
> +	CXX="$(HOSTCXX_NOCCACHE)"
> +
>  $(eval $(host-autotools-package))
> diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
> index ad0b32e277..d07f727c4c 100644
> --- a/support/dependencies/check-host-tar.mk
> +++ b/support/dependencies/check-host-tar.mk
> @@ -1,6 +1,6 @@
>  TAR ?= tar
>  
>  ifeq (,$(call suitable-host-package,tar,$(TAR)))
> -DEPENDENCIES_HOST_PREREQ += host-tar
>  TAR = $(HOST_DIR)/bin/tar
> +BR2_TAR_HOST_DEPENDENCY += host-tar

Why assign-append here, instead of simply assign?

Regards,
Yann E. MORIN.

>  endif
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
