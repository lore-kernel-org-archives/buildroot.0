From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 May 2014 11:25:32 +0200
Subject: [Buildroot] [PATCH 1 of 7 v2] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <a0eab18241e211343bfa.1399905849@argentina>
References: <patchbomb.1399905848@argentina>
 <a0eab18241e211343bfa.1399905849@argentina>
Message-ID: <5371E50C.7010606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 Thanks for taking upon you this gruelling task :-)

On 12/05/14 16:44, Thomas De Schampheleire wrote:
> The inner-xxx-targets in the buildroot package infrastructures are
> evaluated using $(eval) which causes variable references to be a bit
> different than in regular make code. As we want most references to be
> expanded only at the time of the $(eval) we should not use standard
> references $(VAR) but rather use double dollar signs $$(VAR). This includes
> function references like $(call), $(subst), etc. The only exception is the
> reference to pkgdir/pkgname and numbered variables, which are parameters to

 I don't see why references to pkgdir/pkgname should be an exception. See my
comments below. So the original was perfect. (sorry, Yann :-)

> the inner block: $(1), $(2), etc.
> 
> This patch introduces consistent usage of double-dollar signs throughout the
> different inner-xxx-targets blocks.
> 
> In some cases, this would potentially cause circular references, in
> particular when the value of HOST_FOO_VAR would be obtained from the
> corresponding FOO_VAR if HOST_FOO_VAR is not defined. In these cases, an
> immediate assignment using := is necessary instead of a deferred assignment.
> using =.
> When such a circular assignment occurs in a variable defined with '?=',
> a special construction is necessary, as make does not have a corresponding
> '?:=' assignment. As 'FOO ?= bar' is equivalent to
>   ifeq ($(origin FOO),undefined)
>     FOO = bar
>   endif
> we can replace such constructions with
>   ifeq ($$(origin FOO),undefined)
>     FOO := bar
>   endif
> 
> 
> Benefits of these changes are:
> - behavior of variables is now again as expected. For example, setting
>   $(2)_VERSION = virtual in pkg-virtual.mk will effectively work, while
>   originally it would cause very odd results.
> 
> - The output of 'make printvars' is now much more useful. This target shows
>   the value of all variables, and the expression that led to that value.
>   However, if the expression was coming from an inner-xxx-targets block, and
>   was using single dollar signs, it would show in printvars as
>     VAR = value (value)
>   while if double dollar signs are used, it would effectively look like
>     VAR = value (actual expression)
>   as is intended.
>   This improvement is for example effective for FOO_DL_VERSION, FOO_RAWNAME,
>   FOO_SITE_METHOD and FOO_MAKE.
> 
> The correctness of this patch can be verified by comparing 'make printvars'
> before and after applying this patch.
> 
> Insight-provided-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 In case it wasn't obvious: this series is _not_ for 2014.05.

> 
> ---
> v2:
> - extend change to manual, fs/common and caseconvert-helper (Yann)
> - increase consistency by also changing $(Q) in $$(Q) and the UPPERCASE
>   calls in the xxx-targets (outer) block. (Yann)
> 
>  docs/manual/manual.mk    |  14 +++---
>  fs/common.mk             |  14 +++---
>  package/pkg-autotools.mk |  34 +++++++++-------
>  package/pkg-cmake.mk     |  32 ++++++++-------
>  package/pkg-generic.mk   |  90 +++++++++++++++++++++---------------------
>  package/pkg-luarocks.mk  |  12 ++--
>  package/pkg-perl.mk      |  48 +++++++++++-----------
>  package/pkg-python.mk    |  34 ++++++++-------
>  package/pkg-utils.mk     |   8 +-
>  package/pkg-virtual.mk   |  16 ++++---
>  10 files changed, 157 insertions(+), 145 deletions(-)
> 
> Note: in addition to using 'make printvars' to verify this patch, a 'make
> randpackageconfig' was performed successfully.

 Perhaps you should do a 'make manual' as well.

> 
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -54,16 +54,16 @@ define GENDOC_INNER

 I would add a brief comment in the beginning of GENDOC_INNER:

# Since this function will be called from within an $(eval ...)
# all variable references except the arguments must be $$-quoted.

>  manual-check-dependencies-$(3):
>  
>  $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
> -			   $$($(call UPPERCASE,$(1))_SOURCES) \
> +			   $$($$(call UPPERCASE,$(1))_SOURCES) \
>  			   manual-check-dependencies \
>  			   manual-check-dependencies-$(3) \
>  			   manual-update-lists
> -	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
> -	$(Q)mkdir -p $$(@D)/.build
> -	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
> -	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
> +	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
> +	$$(Q)mkdir -p $$(@D)/.build
> +	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
> +	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
>  	        -D $$(@D) $$(@D)/.build/$(1).txt
> -	-$(Q)rm -rf $$(@D)/.build
> +	-$$(Q)rm -rf $$(@D)/.build
>  endef
>  
>  ################################################################################
> @@ -82,7 +82,7 @@ define GENDOC
>  $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
>  clean: $(1)-clean
>  $(1)-clean:
> -	$(Q)$(RM) -rf $(O)/docs/$(1)
> +	$$(Q)$$(RM) -rf $$(O)/docs/$(1)
>  .PHONY: $(1) $(1)-clean manual-update-lists
>  endef
>  
> diff --git a/fs/common.mk b/fs/common.mk
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -39,7 +39,7 @@ define ROOTFS_TARGET_INTERNAL

 Same here: add comment.

>  
>  # extra deps
>  ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
> -	$(if $(PACKAGES_USERS),host-mkpasswd)
> +	$$(if $$(PACKAGES_USERS),host-mkpasswd)
>  
>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
>  ROOTFS_$(2)_COMPRESS_EXT = .gz
> @@ -69,7 +69,7 @@ endif
>  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
>  	rm -f $$(FAKEROOT_SCRIPT)
>  	rm -f $$(TARGET_DIR_WARNING_FILE)
> -	rm -f $(USERS_TABLE)
> +	rm -f $$(USERS_TABLE)
>  	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  ifneq ($$(ROOTFS_DEVICE_TABLES),)
>  	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
> @@ -80,14 +80,14 @@ endif
>  	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  endif
>  ifneq ($$(ROOTFS_USERS_TABLES),)
> -	cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
> +	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
>  endif
> -	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
> -	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
> +	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
> +	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
>  	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
> -	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> -	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
> +	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> +	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
>  	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
>  ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
>  	$$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -65,7 +65,7 @@ define inner-autotools-package
>  
>  ifndef $(2)_LIBTOOL_PATCH
>   ifdef $(3)_LIBTOOL_PATCH
> -  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
> +  $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
>   else
>    $(2)_LIBTOOL_PATCH ?= YES
>   endif
> @@ -73,25 +73,28 @@ endif
>  
>  ifndef $(2)_MAKE
>   ifdef $(3)_MAKE
> -  $(2)_MAKE = $($(3)_MAKE)
> +  $(2)_MAKE = $$($(3)_MAKE)
>   else
> -  $(2)_MAKE ?= $(MAKE)
> +  $(2)_MAKE ?= $$(MAKE)
>   endif
>  endif
>  
>  ifndef $(2)_AUTORECONF
>   ifdef $(3)_AUTORECONF
> -  $(2)_AUTORECONF = $($(3)_AUTORECONF)
> +  $(2)_AUTORECONF = $$($(3)_AUTORECONF)
>   else
>    $(2)_AUTORECONF ?= NO
>   endif
>  endif
>  
> +ifeq ($$(origin $(2)_AUTORECONF_OPT),undefined)
> + $(2)_AUTORECONF_OPT := $$($(3)_AUTORECONF_OPT)
> +endif
> +
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPT			?=
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPT			?=
> -$(2)_AUTORECONF_OPT		?= $($(3)_AUTORECONF_OPT)

 Wouldn't it be clearer to keep this as a ?= but put it inside an
ifeq ($(4),host) ? I haven't tested whether that works, however.

>  $(2)_INSTALL_OPT                ?= install
>  $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
> @@ -175,7 +178,7 @@ endef
>  #
>  define LIBTOOL_PATCH_HOOK
>  	@$$(call MESSAGE,"Patching libtool")
> -	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
> +	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
>  		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
>  		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
>  			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
> @@ -201,8 +204,8 @@ endif
>  #
>  define AUTORECONF_HOOK
>  	@$$(call MESSAGE,"Autoreconfiguring")
> -	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
> -	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
> +	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
> +	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
>  		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
>  			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
>  			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
> @@ -220,10 +223,11 @@ endef
>  # This must be repeated from inner-generic-package, otherwise we get an empty
>  # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
>  # away from the non-host rule
> -$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
> +ifeq ($$(origin $(2)_DEPENDENCIES),undefined)

ifeq ($(4),host)
 $(2)_DEPENDENCIES ?= ....

 This one I tested with printvars, and it seems to work.

> +$(2)_DEPENDENCIES := $$(filter-out host-automake host-autoconf host-libtool \
>  				host-toolchain $(1),\
> -    $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> -
> +    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> +endif
>  
>  ifeq ($$($(2)_AUTORECONF),YES)
>  $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
> @@ -263,9 +267,9 @@ endif
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
> -	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
> +	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
>  		cp -f $$$$i $$$$i~; \
> -		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
> +		$$(SED) "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" $$$$i; \
>  	done
>  endef
>  endif
> @@ -290,5 +294,5 @@ endef
>  # autotools-package -- the target generator macro for autotools packages
>  ################################################################################
>  
> -autotools-package = $(call inner-autotools-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> -host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> +autotools-package = $(call inner-autotools-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
> +host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)

 The reason not to double-$ $(pkgname) is not that it doesn't work (at least it
works for me with printvars), but that it increases the make parsing time with a
factor four (because $(pkgname) gets evaluated very often).

 IMHO, mixing $ and $$ doesn't make things clearer. Therefore, I would leave
everything single-$ here and add a comment

# Using $$ for $(pkgname) is bad for performance because it is evaluated so
# often. Therefore, we use single $ for the arguments here.

(and same for all other outer functions).

> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -38,14 +38,14 @@ define inner-cmake-package
>  
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPT			?=
> -$(2)_MAKE			?= $(MAKE)
> +$(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPT			?=
>  $(2)_INSTALL_HOST_OPT		?= install
>  $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
>  
> -$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
> +$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
>  
>  #
> @@ -60,12 +60,12 @@ ifeq ($(4),target)
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> -	PATH=$(BR_PATH) \
> -	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	PATH=$$(BR_PATH) \
> +	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_COLOR_MAKEFILE=OFF \
> -		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
> +		-DBUILD_SHARED_LIBS=$$(if $$(BR2_PREFER_STATIC_LIB),OFF,ON) \
>  		$$($$(PKG)_CONF_OPT) \
>  	)
>  endef
> @@ -75,8 +75,8 @@ else
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> -	PATH=$(BR_PATH) \
> -	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	PATH=$$(BR_PATH) \
> +	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -91,7 +91,9 @@ endif
>  
>  # This must be repeated from inner-generic-package, otherwise we only get
>  # host-cmake in _DEPENDENCIES because of the following line
> -$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($$(origin $(2)_DEPENDENCIES),undefined)

ifeq ($(4),host)

> +$(2)_DEPENDENCIES := $$(filter-out host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> +endif
>  
>  $(2)_DEPENDENCIES += host-cmake
>  
> @@ -102,11 +104,11 @@ endif
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)

 Unrelated to this patch, does anyone know why we use $(PKG) here instead of $(2) ?

>  endef
>  else
>  define $(2)_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  endif
> @@ -117,7 +119,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> @@ -127,7 +129,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> @@ -137,7 +139,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> @@ -151,8 +153,8 @@ endef
>  # cmake-package -- the target generator macro for CMake packages
>  ################################################################################
>  
> -cmake-package = $(call inner-cmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> -host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> +cmake-package = $(call inner-cmake-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
> +host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)

 Same here: keep single $, add comment.

>  
>  ################################################################################
>  # Generation of the CMake toolchain file
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -263,7 +263,7 @@ define inner-generic-package
>  
>  $(2)_TYPE                       =  $(4)
>  $(2)_NAME			=  $(1)
> -$(2)_RAWNAME			=  $(patsubst host-%,%,$(1))
> +$(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
>  
>  # Keep the package version that may contain forward slashes in the _DL_VERSION
>  # variable, then replace all forward slashes ('/') by underscores ('_') to
> @@ -272,15 +272,15 @@ define inner-generic-package
>  # version control system branch or tag, for example remotes/origin/1_10_stable.
>  ifndef $(2)_VERSION
>   ifdef $(3)_VERSION
> -  $(2)_DL_VERSION = $($(3)_VERSION)
> -  $(2)_VERSION = $(subst /,_,$($(3)_VERSION))
> +  $(2)_DL_VERSION = $$($(3)_VERSION)
> +  $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
>   else
>    $(2)_VERSION = undefined
>    $(2)_DL_VERSION = undefined
>   endif
>  else
> -  $(2)_DL_VERSION = $($(2)_VERSION)
> -  $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
> +  $(2)_DL_VERSION = $$($(2)_VERSION)
> +  $(2)_VERSION := $$(subst /,_,$$($(2)_VERSION))
>  endif
>  
>  $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> @@ -304,7 +304,7 @@ endif
>  
>  ifndef $(2)_SOURCE
>   ifdef $(3)_SOURCE
> -  $(2)_SOURCE = $($(3)_SOURCE)
> +  $(2)_SOURCE = $$($(3)_SOURCE)
>   else
>    $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
>   endif
> @@ -312,22 +312,22 @@ endif
>  
>  ifndef $(2)_PATCH
>   ifdef $(3)_PATCH
> -  $(2)_PATCH = $($(3)_PATCH)
> +  $(2)_PATCH = $$($(3)_PATCH)
>   endif
>  endif
>  
>  ifndef $(2)_SITE
>   ifdef $(3)_SITE
> -  $(2)_SITE = $($(3)_SITE)
> +  $(2)_SITE = $$($(3)_SITE)
>   endif
>  endif
>  
>  ifndef $(2)_SITE_METHOD
>   ifdef $(3)_SITE_METHOD
> -  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
> +  $(2)_SITE_METHOD = $$($(3)_SITE_METHOD)
>   else
>  	# Try automatic detection using the scheme part of the URI
> -	$(2)_SITE_METHOD = $(call geturischeme,$($(2)_SITE))
> +	$(2)_SITE_METHOD = $$(call geturischeme,$$($(2)_SITE))
>   endif
>  endif
>  
> @@ -339,7 +339,7 @@ endif
>  
>  ifndef $(2)_LICENSE
>   ifdef $(3)_LICENSE
> -  $(2)_LICENSE = $($(3)_LICENSE)
> +  $(2)_LICENSE = $$($(3)_LICENSE)
>   endif
>  endif
>  
> @@ -347,13 +347,13 @@ endif
>  
>  ifndef $(2)_LICENSE_FILES
>   ifdef $(3)_LICENSE_FILES
> -  $(2)_LICENSE_FILES = $($(3)_LICENSE_FILES)
> +  $(2)_LICENSE_FILES = $$($(3)_LICENSE_FILES)
>   endif
>  endif
>  
>  ifndef $(2)_REDISTRIBUTE
>   ifdef $(3)_REDISTRIBUTE
> -  $(2)_REDISTRIBUTE = $($(3)_REDISTRIBUTE)
> +  $(2)_REDISTRIBUTE = $$($(3)_REDISTRIBUTE)
>   endif
>  endif
>  
> @@ -364,8 +364,10 @@ endif
>  # dependency
>  $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
>  
> -$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
> -	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($$(origin $(2)_DEPENDENCIES),undefined)

 ifeq ($(4),host)

> +$(2)_DEPENDENCIES := $$(filter-out  host-toolchain $(1),\
> +	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> +endif
>  ifeq ($(4),target)
>  ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
>  $(2)_DEPENDENCIES += toolchain
> @@ -392,8 +394,8 @@ endif
>  
>  # default extract command
>  $(2)_EXTRACT_CMDS ?= \
> -	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
> -	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
> +	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
> +	$$(TAR) $$(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
>  
>  # pre/post-steps hooks
>  $(2)_PRE_DOWNLOAD_HOOKS         ?=
> @@ -467,7 +469,7 @@ endif
>  $$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
>  
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
> -ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
> +ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>  endif
>  
> @@ -510,11 +512,11 @@ endif
>  			@echo $$($(2)_DEPENDENCIES)
>  
>  $(1)-graph-depends:
> -			@$(INSTALL) -d $(O)/graphs
> -			@cd "$(CONFIG_DIR)"; \
> -			$(TOPDIR)/support/scripts/graph-depends -p $(1) -d $(BR_GRAPH_DEPTH) \
> -			|tee $(O)/graphs/$$(@).dot \
> -			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
> +			@$$(INSTALL) -d $$(O)/graphs
> +			@cd "$$(CONFIG_DIR)"; \
> +			$$(TOPDIR)/support/scripts/graph-depends -p $(1) -d $$(BR_GRAPH_DEPTH) \
> +			|tee $$(O)/graphs/$$(@).dot \
> +			|dot -T$$(BR_GRAPH_OUT) -o $$(O)/graphs/$$(@).$$(BR_GRAPH_OUT)
>  
>  $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
>  
> @@ -548,7 +550,7 @@ endif
>  $$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
> +$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
>  $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
> @@ -559,9 +561,9 @@ endif
>  # kernel case, the bootloaders case, and the normal packages case.
>  ifeq ($(1),linux)
>  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> -else ifneq ($(filter boot/%,$(pkgdir)),)
> +else ifneq ($$(filter boot/%,$(pkgdir)),)

 $$(pkgdir) works fine here. Also, it gets evaluated only once anyway, so
there's no speedup from using a single $.

>  $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
> -else ifneq ($(filter toolchain/%,$(pkgdir)),)
> +else ifneq ($$(filter toolchain/%,$(pkgdir)),)
>  $(2)_KCONFIG_VAR = BR2_$(2)
>  else
>  $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
> @@ -577,7 +579,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  ifneq ($$($(2)_SITE_METHOD),local)
>  ifneq ($$($(2)_SITE_METHOD),override)
>  # Packages that have a tarball need it downloaded and extracted beforehand
> -$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
> +$(1)-legal-info: $(1)-extract $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
>  $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
>  endif
>  endif
> @@ -587,40 +589,40 @@ endif
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:

 Have you also tested a 'make legal-info'? This whole thing is rather fragile so
we may easily miss something by just reviewing. Also, printvars doesn't show the
contents of this rule (because it's not a variable). 'make -qp' does, however,
so that would also be a good check (it may reorder things, though, so it may not
be easy to diff).

>  # Packages without a source are assumed to be part of Buildroot, skip them.
> -	$(foreach hook,$($(2)_PRE_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
> -ifneq ($(call qstrip,$$($(2)_SOURCE)),)
> +	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
> +ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  
>  ifeq ($$($(2)_SITE_METHOD),local)
>  # Packages without a tarball: don't save and warn
> -	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
> +	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
>  
>  else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> -	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
> +	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
>  
>  else
>  # Other packages
>  
>  # Save license files if defined
> -ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)

 Huh, this original wouldn't even have worked (because it would strip the quotes
from the variable name, not from its contents).

> -	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(4)))
> -	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
> +	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
> +	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
>  else
>  # Double dollar signs are really needed here, to catch host packages
>  # without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
>  # have multiple license files.

 I think you can remove this comment now :-)

> -	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$(call UPPERCASE,$(4)))$$(sep))
> +	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
>  endif # license files
>  
>  ifeq ($$($(2)_REDISTRIBUTE),YES)
>  # Copy the source tarball (just hardlink if possible)
> -	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4))) 2>/dev/null || \
> -	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
> +	@cp -l $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
> +	   cp $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
>  endif # redistribute
>  
>  endif # other packages
> -	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(4)))
> -endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
> -	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
> +	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$(call UPPERCASE,$(4)))
> +endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> +	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
>  # add package to the general list of targets if requested by the buildroot
>  # configuration
> @@ -649,8 +651,8 @@ endif # SITE_METHOD
>  # ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
>  # Do not add xzcat to the list of required dependencies, as it gets built
>  # automatically if it isn't found.
> -ifneq ($(call suitable-extractor,$($(2)_SOURCE)),$(XZCAT))
> -DL_TOOLS_DEPENDENCIES += $(firstword $(call suitable-extractor,$($(2)_SOURCE)))
> +ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
> +DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
>  endif
>  
>  endif # $(2)_KCONFIG_VAR
> @@ -661,8 +663,8 @@ endef # inner-generic-package
>  ################################################################################
>  
>  # In the case of target packages, keep the package name "pkg"
> -generic-package = $(call inner-generic-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> +generic-package = $(call inner-generic-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
>  # In the case of host packages, turn the package name "pkg" into "host-pkg"
> -host-generic-package = $(call inner-generic-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> +host-generic-package = $(call inner-generic-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)

 Keep original, add comment.

>  
>  # :mode=makefile:
> diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
> --- a/package/pkg-luarocks.mk
> +++ b/package/pkg-luarocks.mk
> @@ -34,10 +34,10 @@
>  define inner-luarocks-package
>  
>  $(2)_BUILD_OPT		?=
> -$(2)_SUBDIR		?= $(1)-$(shell echo "$($(3)_VERSION)" | sed -e "s/-[0-9]$$//")
> -$(2)_ROCKSPEC		?= $(1)-$($(3)_VERSION).rockspec
> -$(2)_SOURCE		?= $(1)-$($(3)_VERSION).src.rock
> -$(2)_SITE		?= $(call qstrip,$(BR2_LUAROCKS_MIRROR))
> +$(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
> +$(2)_ROCKSPEC		?= $(1)-$$($(3)_VERSION).rockspec
> +$(2)_SOURCE		?= $(1)-$$($(3)_VERSION).src.rock
> +$(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
>  
>  # Since we do not support host-luarocks-package, we know this is
>  # a target package, and can just add the required dependencies
> @@ -49,7 +49,7 @@ define inner-luarocks-package
>  ifndef $(2)_EXTRACT_CMDS
>  define $(2)_EXTRACT_CMDS
>  	cd $$($(2)_DIR)/.. && \
> -	 $$(LUAROCKS_RUN) unpack --force $(DL_DIR)/$$($(2)_SOURCE)
> +	 $$(LUAROCKS_RUN) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
>  endef
>  endif
>  
> @@ -77,5 +77,5 @@ endef
>  # luarocks-package -- the target generator macro for LuaRocks packages
>  ################################################################################
>  
> -luarocks-package = $(call inner-luarocks-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> +luarocks-package = $(call inner-luarocks-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)

 Keep original, add comment.

>  # host-luarocks-package not supported
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> --- a/package/pkg-perl.mk
> +++ b/package/pkg-perl.mk
> @@ -51,18 +51,18 @@ define $(2)_CONFIGURE_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>  		PERL_MM_USE_DEFAULT=1 \
>  		perl Build.PL \
> -			--config ar="$(TARGET_AR)" \
> -			--config full_ar="$(TARGET_AR)" \
> -			--config cc="$(TARGET_CC)" \
> -			--config ccflags="$(TARGET_CFLAGS)" \
> -			--config ld="$(TARGET_CC)" \
> -			--config lddlflags="-shared $(TARGET_LDFLAGS)" \
> -			--config ldflags="$(TARGET_LDFLAGS)" \
> -			--include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE \
> +			--config ar="$$(TARGET_AR)" \
> +			--config full_ar="$$(TARGET_AR)" \
> +			--config cc="$$(TARGET_CC)" \
> +			--config ccflags="$$(TARGET_CFLAGS)" \
> +			--config ld="$$(TARGET_CC)" \
> +			--config lddlflags="-shared $$(TARGET_LDFLAGS)" \
> +			--config ldflags="$$(TARGET_LDFLAGS)" \
> +			--include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
>  			--destdir $$(TARGET_DIR) \
>  			--installdirs vendor \
>  			--install_path lib=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
> -			--install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(PERL_ARCHNAME) \
> +			--install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$$(PERL_ARCHNAME) \
>  			--install_path bin=/usr/bin \
>  			--install_path script=/usr/bin \
>  			--install_path bindoc=/usr/share/man/man1 \
> @@ -72,17 +72,17 @@ define $(2)_CONFIGURE_CMDS
>  		PERL_MM_USE_DEFAULT=1 \
>  		PERL_AUTOINSTALL=--skipdeps \
>  		perl Makefile.PL \
> -			AR="$(TARGET_AR)" \
> -			FULL_AR="$(TARGET_AR)" \
> -			CC="$(TARGET_CC)" \
> -			CCFLAGS="$(TARGET_CFLAGS)" \
> -			LD="$(TARGET_CC)" \
> -			LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
> -			LDFLAGS="$(TARGET_LDFLAGS)" \
> +			AR="$$(TARGET_AR)" \
> +			FULL_AR="$$(TARGET_AR)" \
> +			CC="$$(TARGET_CC)" \
> +			CCFLAGS="$$(TARGET_CFLAGS)" \
> +			LD="$$(TARGET_CC)" \
> +			LDDLFLAGS="-shared $$(TARGET_LDFLAGS)" \
> +			LDFLAGS="$$(TARGET_LDFLAGS)" \
>  			DESTDIR=$$(TARGET_DIR) \
>  			INSTALLDIRS=vendor \
>  			INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
> -			INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(PERL_ARCHNAME) \
> +			INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$$(PERL_ARCHNAME) \
>  			INSTALLVENDORBIN=/usr/bin \
>  			INSTALLVENDORSCRIPT=/usr/bin \
>  			INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
> @@ -125,8 +125,8 @@ define $(2)_BUILD_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>  		perl Build $$($(2)_BUILD_OPT) build; \
>  	else \
> -		$(MAKE1) \
> -			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE \
> +		$$(MAKE1) \
> +			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
>  			$$($(2)_BUILD_OPT) pure_all; \
>  	fi
>  endef
> @@ -137,7 +137,7 @@ define $(2)_BUILD_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>  		perl Build $$($(2)_BUILD_OPT) build; \
>  	else \
> -		$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
> +		$$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
>  	fi
>  endef
>  endif
> @@ -152,7 +152,7 @@ define $(2)_INSTALL_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>  		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
>  	else \
> -		$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
> +		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
>  	fi
>  endef
>  endif
> @@ -166,7 +166,7 @@ define $(2)_INSTALL_TARGET_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>  		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
>  	else \
> -		$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
> +		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
>  	fi
>  endef
>  endif
> @@ -181,5 +181,5 @@ endef
>  # perl-package -- the target generator macro for Perl packages
>  ################################################################################
>  
> -perl-package = $(call inner-perl-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> -host-perl-package = $(call inner-perl-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> +perl-package = $(call inner-perl-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
> +host-perl-package = $(call inner-perl-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)

 Keep original, add comment.

> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -82,7 +82,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT =
>  
>  define inner-python-package
>  
> -$(2)_SRCDIR	= $$($(2)_DIR)/$($(2)_SUBDIR)
> +$(2)_SRCDIR	= $$($(2)_DIR)/$$($(2)_SUBDIR)
>  $(2)_BUILDDIR	= $$($(2)_SRCDIR)
>  
>  $(2)_ENV         ?=
> @@ -91,7 +91,7 @@ define inner-python-package
>  
>  ifndef $(2)_SETUP_TYPE
>   ifdef $(3)_SETUP_TYPE
> -  $(2)_SETUP_TYPE = $($(3)_SETUP_TYPE)
> +  $(2)_SETUP_TYPE = $$($(3)_SETUP_TYPE)
>   else
>    $$(error "$(2)_SETUP_TYPE must be set")
>   endif
> @@ -138,7 +138,9 @@ endif
>  # depending on the package characteristics, and shouldn't be derived
>  # automatically from the dependencies of the corresponding target
>  # package.
> -$(2)_DEPENDENCIES ?= $(filter-out host-python host-python3 host-python-setuptools host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($$(origin $(2)_DEPENDENCIES),undefined)

ifeq($(4),host)

 But maybe that doesn't work here. Or maybe you do need the := here. Although I
doubt it.

> +$(2)_DEPENDENCIES := $$(filter-out host-python host-python3 host-python-setuptools host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> +endif
>  
>  # Target packages need both the python interpreter on the target (for
>  # runtime) and the python interpreter on the host (for
> @@ -155,19 +157,19 @@ endif
>  #   - otherwise, we depend on the one requested by *_NEEDS_HOST_PYTHON.
>  #
>  ifeq ($(4),target)
> -$(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
> +$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
>  else
> -ifeq ($($(2)_NEEDS_HOST_PYTHON),)
> -$(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
> +$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)
>  else
> -ifeq ($($(2)_NEEDS_HOST_PYTHON),python2)
> +ifeq ($$($(2)_NEEDS_HOST_PYTHON),python2)
>  $(2)_DEPENDENCIES += host-python
> -else ifeq ($($(2)_NEEDS_HOST_PYTHON),python3)
> +else ifeq ($$($(2)_NEEDS_HOST_PYTHON),python3)
>  $(2)_DEPENDENCIES += host-python3
>  else
> -$$(error Incorrect value '$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
> +$$(error Incorrect value '$$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
>  endif
> -endif # ($($(2)_NEEDS_HOST_PYTHON),)
> +endif # ($$($(2)_NEEDS_HOST_PYTHON),)
>  endif # ($(4),target)
>  
>  # Setuptools based packages will need host-python-setuptools (both
> @@ -196,12 +198,12 @@ endif
>  #   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
>  #
>  ifeq ($(4),target)
> -$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
> +$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
>  else
> -ifeq ($($(2)_NEEDS_HOST_PYTHON),)
> -$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
> +ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
> +$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
>  else
> -$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/$($(2)_NEEDS_HOST_PYTHON)
> +$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/$$($(2)_NEEDS_HOST_PYTHON)
>  endif
>  endif
>  
> @@ -255,5 +257,5 @@ endef
>  # python-package -- the target generator macro for Python packages
>  ################################################################################
>  
> -python-package = $(call inner-python-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> -host-python-package = $(call inner-python-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> +python-package = $(call inner-python-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
> +host-python-package = $(call inner-python-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -19,13 +19,13 @@
>  define caseconvert-helper
>  $(1) = $$(strip \
>  	$$(eval __tmp := $$(1))\
> -	$(foreach c, $(2),\
> -		$$(eval __tmp := $$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),$$(__tmp))))\
> +	$$(foreach c, $(2),\
> +		$$(eval __tmp := $$(subst $$(word 1,$$(subst :, ,$$(c))),$$(word 2,$$(subst :, ,$$(c))),$$(__tmp))))\
>  	$$(__tmp))
>  endef
>  
> -$(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
> -$(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
> +$(eval $(call caseconvert-helper,UPPERCASE,$$(join $$(addsuffix :,$$([FROM])),$$([TO]))))
> +$(eval $(call caseconvert-helper,LOWERCASE,$$(join $$(addsuffix :,$$([TO])),$$([FROM]))))

 Actually, here the single $-es are intentional. It is chosen in order to
maximize the speed-up, that's why you see this counter-intuitive mix of $ and
$$. Maybe you can extend the comment above a little to explain that a little
better. Or I can do that as well if you prefer.

>  
>  #
>  # Manipulation of .config files based on the Kconfig
> diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
> --- a/package/pkg-virtual.mk
> +++ b/package/pkg-virtual.mk
> @@ -35,8 +35,8 @@
>  define inner-virtual-package
>  
>  # Ensure the virtual package has an implementation defined.
> -ifeq ($(BR2_PACKAGE_HAS_$(2)),y)
> -ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2))),)
> +ifeq ($$(BR2_PACKAGE_HAS_$(2)),y)
> +ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)
>  $$(error No implementation selected for virtual package $(1). Configuration error)
>  endif
>  endif
> @@ -50,11 +50,13 @@ HOST_$(3)_VERSION = virtual
>  
>  # This must be repeated from inner-generic-package, otherwise we get an empty
>  # _DEPENDENCIES
> -$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
> -	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($$(origin $(2)_DEPENDENCIES),undefined)

ifeq ($(4),host)

> +$(2)_DEPENDENCIES := $$(filter-out host-toolchain $(1),\
> +	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> +endif
>  
>  # Add dependency against the provider
> -$(2)_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2)))
> +$(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
>  
>  # Call the generic package infrastructure to generate the necessary
>  # make targets
> @@ -66,5 +68,5 @@ endef
>  # virtual-package -- the target generator macro for virtual packages
>  ################################################################################
>  
> -virtual-package = $(call inner-virtual-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> -host-virtual-package = $(call inner-virtual-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> +virtual-package = $(call inner-virtual-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
> +host-virtual-package = $(call inner-virtual-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)
> 

 Keep original + comment.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
