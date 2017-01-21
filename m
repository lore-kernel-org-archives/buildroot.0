From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Jan 2017 23:25:29 +0100
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <20170106223748.2203-1-cedric.marie@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
Message-ID: <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi C?dric,

Le 06/01/2017 ? 23:37, C?dric Marie a ?crit :
> CMake provides several backends. The default one is Make, but Ninja is
> also supported. Ninja is a small build system with a focus on speed.
> 
> If the new option BR2_CMAKE_USE_NINJA_BACKEND is enabled, CMake will
> use Ninja backend.
> 
> In CMake package infrastructure, when this option is set:
> - Add host-ninja dependency
> - Add "-G Ninja" option in CMake configure step
> - Use ninja command instead of make ($(MAKE))
> 
> Most of make arguments are compatible with ninja command. But there are
> a few differences:
> - Environment variables such as DESTDIR cannot be given in arguments.
>   Instead they must be set before the command (which is compatible with
>   make)
> - CMake does not handle VERBOSE variable with Ninja backend. Instead,
>   we must add -v option when VERBOSE is set.
> - install/fast target is specific to make backend. With ninja backend,
>   install target must be used (and it will not try to compile as make
>   backend does).
> 
> Tested on following packages: cannelloni, graphite2, libcuefile,
> libubox, rabbitmq-c, ubus.

There are currently 146 packages using CMake in Buildroot, I'm not sure all of
them support ninja backend yet.

I would suggest to enable Ninja backend package by package when it has been tested.

> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>  Config.in            |  6 ++++++
>  package/pkg-cmake.mk | 26 ++++++++++++++++++++------
>  2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index ccd777e..26ebcf6 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -656,6 +656,12 @@ config BR2_SHARED_STATIC_LIBS
>  
>  endchoice
>  
> +config BR2_CMAKE_USE_NINJA_BACKEND
> +	bool "Compile CMake packages with Ninja backend"
> +        help

Indent with one tab.

> +          CMake provides several backends. The default one is Make, but
> +          Ninja is also supported. Ninja is a small build system with a
> +          focus on speed.

Indent with one tab and 2 spaces.

>  
>  config BR2_PACKAGE_OVERRIDE_FILE
>  	string "location of a package override file"
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 4e0e838..83bf79e 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -53,24 +53,35 @@ define inner-cmake-package
>  
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPTS			?=
> +$(2)_INSTALL_STAGING_ENV	?= DESTDIR=$$(STAGING_DIR)
> +$(2)_INSTALL_TARGET_ENV		?= DESTDIR=$$(TARGET_DIR)
> +
> +ifeq ($(BR2_CMAKE_USE_NINJA_BACKEND),y)
> +$(2)_MAKE			?= $$(HOST_DIR)/usr/bin/ninja
> +$(2)_MAKE_ENV			?=
> +$(2)_MAKE_OPTS			?= $(if $(VERBOSE),-v)
> +$(2)_INSTALL_OPTS		?= install
> +else
>  $(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
> -$(2)_INSTALL_OPTS		?= install
> -$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
> -$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install/fast
> +$(2)_INSTALL_OPTS		?= install/fast

I think these changes should be in a preparatory patch before adding Ninja
backend support.

Best regards,
Romain

> +endif
>  
>  $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
>  
>  $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>  
> -
>  ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
>  else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
>  endif
>  
> +ifeq ($(BR2_CMAKE_USE_NINJA_BACKEND),y)
> +$(2)_CONF_OPTS += -G Ninja
> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -146,6 +157,9 @@ endif
>  $(2)_DEPENDENCIES += host-pkgconf
>  
>  $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
> +ifeq ($(BR2_CMAKE_USE_NINJA_BACKEND),y)
> +$(2)_DEPENDENCIES += host-ninja
> +endif
>  
>  #
>  # Build step. Only define it if not already defined by the package .mk
> @@ -179,7 +193,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_INSTALL_STAGING_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> @@ -189,7 +203,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_INSTALL_TARGET_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> 
