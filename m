From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 23:16:07 +0100
Subject: [Buildroot] [RFC v1 5/6] package/pkg-cmake: add
 _INSTALL_STAGING_ENV/_INSTALL_TARGET_ENV
In-Reply-To: <20210213174013.32584-6-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
 <20210213174013.32584-6-ps.report@gmx.net>
Message-ID: <b9f6c0df-6ad5-7a7f-40de-7eb4f7409c19@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/02/2021 18:40, Peter Seiderer wrote:
> Add _INSTALL_STAGING_ENV/_INSTALL_TARGET_ENV as needed for ninja
> make/install as ninja expects the DESDIR as eviornment var instead
> of parameter.
> 
> This one makes ninja unhappy:
> 
> 	$ ninja install DESTDIR=...
> 
> This one makes ninja happy:
> 
> 	$ DESTDIR=... ninja install

 We can use the same for make as well, so we don't need the additional ?= below.

 And with that, we can actually remove _INSTALL_STAGING_OPTS and
_INSTALL_TARGET_OPTS completely...

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> ToDo:
>   - add documentation
> 
> Notes:
>   - alternative to explicit make/ninja calls maybe common
>     'cmake --build'/'cmake --install' calls are a feasible
>     solution (yet untested) - pro: more common code, con:
>     less customizable, needs to take a look at the current
>     users of _MAKE/_INSTALL_STAGING_OPTS/_INSTALL_TARGET_OPTS
>     options
> ---
>  package/pkg-cmake.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index c001051002..b758e50b76 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -58,7 +58,10 @@ $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_OPTS		?= install
>  $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
> +$(2)_INSTALL_STAGING_ENV	?=
>  $(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
> +$(2)_INSTALL_TARGET_ENV		?=
> +
>  
>  $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>  
> @@ -192,7 +195,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_INSTALL_STAGING_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)

 I.e.

	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) DESTDIR=$(STAGING_DIR) \
		$$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)



 Note that I think it's useful to add a $(2)_USE_NINJA option for cmake
packages. We could default that one to YES after some testing, and any package
that really doesn't want ninja can set it to NO.

 Regards,
 Arnout


>  endef
>  endif
>  
> @@ -202,7 +205,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV)  $$($$(PKG)_INSTALL_TARGET_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> 
