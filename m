From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 00:16:47 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <20190322183904.22401-3-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-3-anaumann@ultratronik.de>
Message-ID: <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andreas,

On 22/03/2019 19:39, Andreas Naumann wrote:
> This provides generic functions for Qt5 qmake based packages. Besides
> being able to remove lots of redundant commands, it should make it possible to
> eliminate the numerous and complex target install steps.

 The commands are not really redundant (otherwise you could just remove them
anyway) and eliminating the target install steps is more or less the same thing.
And anyway, this infra doesn't allow that by itself, because you could just do
it per package. It just makes it easier to do it consistently for all packages,
makes it easier to add a new qmake package, and it makes it easier to change how
the target installation is done.

> This is done by re-running the install step of the qmake generated Makefile
> with the package build directory prepended (to the staging/host path). Even
> though this does create lengthy pathes it allows for easy separation of the
> staging files from the host destined files by just omitting the resulting
> BUILD_DIR+HOST_DIR path from the following rsync call to the real target folder.

 We have not converged yet on whether this is the right approach. So maybe, in
order to move forward, it would be better to split the patch up into a first bit
that creates the qmake package but does not define target install steps, then
convert the relevant packages to qmake packages, and finally change the qmake
infra to do target install and changes all the packages again. It's more work to
do it this way, obviously, but it would allow us to already commit part of the
series before we have converged on it completely.


> In addition, rsync excludes all header-, documentation- and cmake-pathes as well
> as libtool and prl files in order to avoid unnecessary files accumulating in
> target.

 All of these (except *.prl) are anyway cleaned up in target finalize, so by
itself it's not that useful.


> Getting rid of the many conditional install commands is possible because qmake
> already takes care of this when generating the Makefile install targets with the
> given or autodetected configure options of each package.
> 
> However, custom install steps may have to remain in cases where a particular
> buildroot option has no corresponding setting in the packages configuration
> options.

 This is also something that probably will need more discussion.


> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/Makefile.in  |   1 +
>  package/pkg-qmake.mk | 109 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 package/pkg-qmake.mk
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dc818a2c18..fb0e22114c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -442,3 +442,4 @@ include package/pkg-kernel-module.mk
>  include package/pkg-waf.mk
>  include package/pkg-golang.mk
>  include package/pkg-meson.mk
> +include package/pkg-qmake.mk
> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
> new file mode 100644
> index 0000000000..11cfb809fc
> --- /dev/null
> +++ b/package/pkg-qmake.mk
> @@ -0,0 +1,109 @@
> +################################################################################
> +# QMAKE package infrastructure
> +#
> +# This file implements an infrastructure that eases development of package
> +# .mk files for QMAKE packages. It should be used for all packages that use

 It's called qmake, not QMAKE.

> +# QMAKE as their build system.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure

 You have not actually added documentation :-)

> +#
> +# In terms of implementation, this QMAKE infrastructure requires the .mk file
> +# to only specify metadata information about the package: name, version,
> +# download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different steps
> +# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
> +# it is used as the list of commands to perform to build the package,
> +# instead of the default QMAKE behaviour. The package can also define some
> +# post operation hooks.
> +#
> +################################################################################
> +
> +################################################################################
> +# inner-qmake-package -- defines how the configuration, compilation and
> +# installation of a qmake package should be done, implements a few hooks
> +# to tune the build process for qmake specifities and calls the generic
> +# package infrastructure to generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)

 Since we don't support a host variant (yet), I would prefer to leave out
argument 3 and 4. That makes it more explicit that the whole thing needs to be
reviewed when a host variant gets added.

> +################################################################################
> +
> +define inner-qmake-package
> +
> +$(2)_CONF_ENV			?=
> +$(2)_CONF_OPTS			?=
> +$(2)_MAKE_ENV			?=
> +$(2)_MAKE_OPTS			?=
> +$(2)_INSTALL_STAGING_OPTS	?= install

 Even though target install reuses staging install, I'd allow overriding it:

$(2)_INSTALL_TARGET_OPTS ?= $$($(2)_INSTALL_STAGING_OPTS)

> +
> +#
> +# Configure step. Only define it if not already defined by the package
> +# .mk file.
> +#
> +ifndef $(2)_CONFIGURE_CMDS
> +define $(2)_CONFIGURE_CMDS
> +	cd $$($$(PKG)_SRCDIR) && \

 I realize it is currently not done consistently at all, but _SRCDIR should only
be used for extract and patch. _BUILDDIR should be used for configure, build,
install.

> +	$$(TARGET_MAKE_ENV) \> +	$$($(2)_CONF_ENV) \

 This would still fit on the preceding line.

 Also, it's weird that you mix $(2) with $$(PKG). Although I'm generally in
favour of using PKG, I think that inside the inner- macros it's better to
consistently use $(2).

> +	$$(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \

 All the qt.io packages currently seem to use qmake without -spec option, and
the external packages use $$(QT5_QMAKE). I'm not entirely sure which is best,
but I'd go for QT5_QMAKE.

 With that, it would also fit together into a single line with the ENV settings.

> +		$$($(2)_CONF_OPTS)
> +endef
> +endif
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	$$(TARGET_MAKE_ENV) \
> +	$$($(2)_MAKE_ENV) \
> +	$$(MAKE) -C $$($$(PKG)_SRCDIR) $$($(2)_MAKE_OPTS)
> +endef
> +endif
> +
> +#
> +# Staging installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_STAGING_CMDS
> +define $(2)_INSTALL_STAGING_CMDS
> +	$$(TARGET_MAKE_ENV) \
> +	$$($(2)_MAKE_ENV) \
> +	$$(MAKE) -C $$($$(PKG)_SRCDIR) $$($(2)_INSTALL_STAGING_OPTS)
> +	$$(QT5_LA_PRL_FILES_FIXUP)

 H, the QT5_LA_PRL_FILES_FIXUP really only applies to the qt.io packages,
because other packages don't necessarily install as libQt5*.

 Actually, this fixup is also partially redundant with the existing fixup in the
install staging rule. So perhaps that rule should be extended with a way to
specify additional sed lines for the package, e.g.

        @$(call MESSAGE,"Fixing libtool files")
        for la in $$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
                cp -a "$${la}" "$${la}.fixed" && \
                $(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
...
                        -e "s:@BASE_DIR@:$(BASE_DIR):g" \
			$($(PKG)_FIX_LIBTOOL_SED_EXPR) \
                        "$${la}.fixed" && \
...

and setting

$(2)_FIX_LIBTOOL_SED_EXPR = -e "/^dependency_libs=/s%-L/usr/lib %%g"

in inner-qmake-package.

 But that would first need to be refactored in two separate patches, of course.
So, to not make things more complicated than they are already, I'm OK with your
current proposal as well.


> +endef
> +endif
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +	$$(TARGET_MAKE_ENV) \
> +	$$($(2)_MAKE_ENV) \
> +	$$(MAKE) -C $$($$(PKG)_SRCDIR) INSTALL_ROOT=$$($$(PKG)_SRCDIR)/tmp-target-install $$($(2)_INSTALL_STAGING_OPTS)

 This part really needs some explanation in the comment above, because it is
*very* counter-intuitive. You should explain why INSTALL_ROOT is used here and
not for staging install, and what its effect is exactly, i.e. that qmake
configures things with STAGING_DIR as the prefix and that INSTALL_ROOT goes
before it, so you end up with everything under
$(@D)/tmp-target-install/$(STAGING_DIR)

 However, I'm not sure that this is the way we want to go. What is wrong with
the pkg-files-list? You said before that it was incorrect, but if that is the
case, it should be fixed.

 Regards,
 Arnout

> +	rsync -arv --exclude usr/include* --exclude usr/lib/cmake* --exclude usr/doc* \
> +	           --exclude *.la --exclude *.prl \
> +	    $$($$(PKG)_SRCDIR)/tmp-target-install/$$(STAGING_DIR)/ $$(TARGET_DIR)/
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +
> +endef
> +
> +################################################################################
> +# qmake-package -- the target generator macro for QMAKE packages
> +################################################################################
> +
> +qmake-package = $(call inner-qmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> 
