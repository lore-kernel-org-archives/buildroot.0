From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 11 Dec 2013 23:51:10 +0100
Subject: [Buildroot] [PATCHv2 01/36] package: introduce Python package
	infrastructure
In-Reply-To: <1386793631-14026-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386793631-14026-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLA1U-mQ76ve14MswJHiL947uhw8FiewHX_jqezzs+vsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


2013/12/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-python.txt | 159 ++++++++++++++++++++++++
>  docs/manual/adding-packages.txt        |   2 +
>  package/Makefile.in                    |   1 +
>  package/pkg-python.mk                  | 219
> +++++++++++++++++++++++++++++++++
>  4 files changed, 381 insertions(+)
>  create mode 100644 docs/manual/adding-packages-python.txt
>  create mode 100644 package/pkg-python.mk
>
> diff --git a/docs/manual/adding-packages-python.txt
> b/docs/manual/adding-packages-python.txt
> new file mode 100644
> index 0000000..1b0298f
> --- /dev/null
> +++ b/docs/manual/adding-packages-python.txt
> @@ -0,0 +1,159 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +Infrastructure for Python packages
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This infrastructure applies to Python packages that use the standard
> +Python setuptools mechanism as their build system, generally
> +recognizable by the usage of a +setup.py+ script.
> +
> +[[python-package-tutorial]]
> +
> ++python-package+ tutorial
> +^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +First, let's see how to write a +.mk+ file for a Python package,
> +with an example :
> +
> +------------------------
> +01:
> ################################################################################
> +02: #
> +03: # python-foo
> +04: #
> +05:
> ################################################################################
> +06:
> +07: PYTHON_FOO_VERSION = 1.0
> +08: PYTHON_FOO_SOURCE = python-foo-$(LIBFOO_VERSION).tar.xz
> +09: PYTHON_FOO_SITE = http://www.foosoftware.org/download
> +10: PYTHON_FOO_LICENSE = BSD-3c
> +11: PYTHON_FOO_LICENSE_FILES = LICENSE
> +12: PYTHON_FOO_ENV = SOME_VAR=1
> +13: PYTHON_FOO_DEPENDENCIES = libmad
> +14: PYTHON_FOO_SETUP_TYPE = distutils
> +15:
> +16: $(eval $(python-package))
> +------------------------
> +
> +On line 7, we declare the version of the package.
> +
> +On line 8 and 9, we declare the name of the tarball (xz-ed tarball
> +recommended) and the location of the tarball on the Web. Buildroot
> +will automatically download the tarball from this location.
> +
> +On line 10 and 11, we give licensing details about the package (its
> +license on line 10, and the file containing the license text on line
> +11).
> +
> +On line 12, we tell Buildroot to pass custom options to the Python
> ++setup.py+ script when it is configuring the package.
> +
> +On line 13, we declare our dependencies, so that they are built
> +before the build process of our package starts.
> +
> +On line 14, we declare the specific Python build system being used. In
> +this case the +distutils+ Python build system is used. The two
> +supported ones are +distutils+ and +setuptools+.
> +
> +Finally, on line 16, we invoke the +python-package+ macro that
> +generates all the Makefile rules that actually allow the package to be
> +built.
> +
> +[[python-package-reference]]
> +
> ++python-package+ reference
> +^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +As a policy, packages that merely provide Python modules should all be
> +named +python-<something>+ in Buildroot. Other packages that use the
> +Python build system, but are not Python modules, can freely choose
> +their name (existing examples in Buildroot are +scons+ and
> ++supervisor+).
> +
> +In their +Config.in+ file, they should depend on +BR2_PACKAGE_PYTHON+
> +so that when Buildroot will enable Python 3 usage for modules, we will
> +be able to enable Python modules progressively on Python 3.
> +
> +The main macro of the Python package infrastructure is
> ++python-package+. It is similar to the +generic-package+ macro. It is
> +also possible to create Python host packages with the
> ++host-python-package+ macro.
> +
> +Just like the generic infrastructure, the Python infrastructure works
> +by defining a number of variables before calling the +python-package+
> +or +host-python-package+ macros.
> +
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the Python infrastructure: +PYTHON_FOO_VERSION+,
> ++PYTHON_FOO_SOURCE+, +PYTHON_FOO_PATCH+, +PYTHON_FOO_SITE+,
> ++PYTHON_FOO_SUBDIR+, +PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
> ++PYTHON_FOO_LICENSE_FILES+, etc.
> +
> +Note that:
> +
> + * Setting +PYTHON_FOO_INSTALL_STAGING+ to +YES+ has no effect (unless
> +   a +PYTHON_FOO_INSTALL_STAGING_CMDS+ variable is defined), since
> +   Python modules generally don't need to be installed to the
> +   +staging+ directory.
> +
> + * It is not necessary to add +python+ or +host-python+ in the
> +   +PYTHON_FOO_DEPENDENCIES+ variable of a package, since these basic
> +   dependencies are automatically added as needed by the Python
> +   package infrastructure.
> +
> + * Similarly, it is not needed to add +host-setuptools+ and/or
> +   +host-distutilscross+ dependencies to +PYTHON_FOO_DEPENDENCIES+ for
> +   setuptools-based packages, since these are automatically added by
> +   the Python infrastructure as needed.
> +
> +One variable specific to the Python infrastructure is mandatory:
> +
> +* +PYTHON_FOO_BUILD_TYPE+, to define which Python build system is used
>
s/PYTHON_FOO_BUILD_TYPE/PYTHON_FOO_SETUP_TYPE/


> +  by the package. The two supported values are +distutils+ and
> +  +setuptools+. If you don't know which one is used in your package,
> +  look at the +setup.py+ file in your package source code, and see
> +  whether it imports things from the +distutils+ module or the
> +  +setuptools+ module.
> +
> +A few additional variables, specific to the Python infrastructure, can
> +optionally be defined, depending on the package's needs. Many of them
> +are only useful in very specific cases, typical packages will
> +therefore only use a few of them, or none.
> +
> +* +PYTHON_FOO_ENV+, to specify additional environment variables to
> +  pass to the Python +setup.py+ script (for both the build and install
> +  steps). Note that the infrastructure is automatically passing
> +  several standard variables, defined in +PKG_PYTHON_DISTUTILS_ENV+
> +  (for distutils target packages), +HOST_PKG_PYTHON_DISTUTILS_ENV+
> +  (for distutils host packages), +PKG_PYTHON_SETUPTOOLS_ENV+ (for
> +  setuptools target packages) and +HOST_PKG_PYTHON_SETUPTOOLS_ENV+
> +  (for setuptools host packages).
> +
> +* +PYTHON_FOO_BUILD_OPT+, to specify additional options to pass to the
> +  Python +setup.py+ script during the build step. For target distutils
> +  packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPT+ options are already
> +  passed automatically by the infrastructure.
> +
> +* +PYTHON_FOO_INSTALL_OPT+, to specify additional options to pass to
> +  the Python +setup.py+ script during the installation step. Note that
> +  the infrastructure is automatically passing some options, defined in
> +  +PKG_PYTHON_DISTUTILS_INSTALL_OPT+ (for target distutils packages),
> +  +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT+ (for host distutils
> +  packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+ (for target
> +  setuptools packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+
> +  (for host setuptools packages).
> +
> +With the Python infrastructure, all the steps required to build and
> +install the packages are already defined, and they generally work well
> +for most Python-based packages. However, when required, it is still
> +possible to customize what is done in any particular step:
> +
> +* By adding a post-operation hook (after extract, patch, configure,
> +  build or install). See xref:hooks[] for details.
> +
> +* By overriding one of the steps. For example, even if the Python
> +  infrastructure is used, if the package +.mk+ file defines its own
> +  +PYTHON_FOO_BUILD_CMDS+ variable, it will be used instead of the
> +  default Python one. However, using this method should be restricted
> +  to very specific cases. Do not use it in the general case.
> diff --git a/docs/manual/adding-packages.txt
> b/docs/manual/adding-packages.txt
> index ae76e74..01277d8 100644
> --- a/docs/manual/adding-packages.txt
> +++ b/docs/manual/adding-packages.txt
> @@ -18,6 +18,8 @@ include::adding-packages-autotools.txt[]
>
>  include::adding-packages-cmake.txt[]
>
> +include::adding-packages-python.txt[]
> +
>  include::adding-packages-hooks.txt[]
>
>  include::adding-packages-gettext.txt[]
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 7bc0606..f5d6289 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -371,4 +371,5 @@ include package/pkg-utils.mk
>  include package/pkg-download.mk
>  include package/pkg-autotools.mk
>  include package/pkg-cmake.mk
> +include package/pkg-python.mk
>  include package/pkg-generic.mk
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> new file mode 100644
> index 0000000..e436f22
> --- /dev/null
> +++ b/package/pkg-python.mk
> @@ -0,0 +1,219 @@
>
> +################################################################################
> +# Python package infrastructure
> +#
> +# This file implements an infrastructure that eases development of
> +# package .mk files for Python packages. It should be used for all
> +# packages that use Python setup.py/setuptools as their build system.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this Python infrastructure requires the
> +# .mk file to only specify metadata informations about the package:
> +# name, version, download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different
> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
> +# already defined, it is used as the list of commands to perform to
> +# build the package, instead of the default Python behaviour. The
> +# package can also define some post operation hooks.
> +#
>
> +################################################################################
> +
> +# Target distutils-based packages
> +PKG_PYTHON_DISTUTILS_ENV = \
> +       PATH="$(TARGET_PATH)" \
> +       CC="$(TARGET_CC)" \
> +       CFLAGS="$(TARGET_CFLAGS)" \
> +       LDFLAGS="$(TARGET_LDFLAGS)" \
> +       LDSHARED="$(TARGET_CROSS)gcc -shared" \
> +       CROSS_COMPILING=yes \
> +       _python_sysroot=$(STAGING_DIR) \
> +       _python_srcdir=$(PYTHON_DIR) \
> +       _python_prefix=/usr \
> +       _python_exec_prefix=/usr
> +
> +PKG_PYTHON_DISTUTILS_BUILD_OPT = \
> +       --executable=/usr/bin/python
> +
> +PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
> +       --prefix=$(TARGET_DIR)/usr
> +
> +# Host distutils-based packages
> +HOST_PKG_PYTHON_DISTUTILS_ENV = \
> +       PATH="$(HOST_PATH)"
> +
> +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
> +       --prefix=$(HOST_DIR)/usr
> +
> +# Target setuptools-based packages
> +PKG_PYTHON_SETUPTOOLS_ENV = \
> +       PATH="$(TARGET_PATH)" \
> +
> PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
> \
> +       PYTHONXCPREFIX="$(STAGING_DIR)/usr/"
> +
> +PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
> +       --prefix=$(TARGET_DIR)/usr \
> +       --executable=/usr/bin/python \
> +       --single-version-externally-managed \
> +       --root=/
> +
> +# Host setuptools-based packages
> +HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> +       PATH="$(HOST_PATH)" \
> +       PYTHONXCPREFIX="$(HOST_DIR)/usr/"
> +
> +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
> +       --prefix=$(HOST_DIR)/usr
> +
>
> +################################################################################
> +# inner-python-package -- defines how the configuration, compilation
> +# and installation of a Python package should be done, implements a
> +# few hooks to tune the build process and calls the generic package
> +# infrastructure to generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including an HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the package directory prefix
> +#  argument 5 is the type (target or host)
>
> +################################################################################
> +
> +define inner-python-package
> +
> +$(2)_SRCDIR    = $$($(2)_DIR)/$($(2)_SUBDIR)
> +$(2)_BUILDDIR  = $$($(2)_SRCDIR)
> +
> +$(2)_ENV         ?=
> +$(2)_BUILD_OPT   ?=
> +$(2)_INSTALL_OPT ?=
> +
> +ifndef $(2)_SETUP_TYPE
> + ifdef $(3)_SETUP_TYPE
> +  $(2)_SETUP_TYPE = $($(3)_SETUP_TYPE)
> + else
> +  $$(error "$(1): Unknown or undefined <pkg>_SETUP_TYPE")
> + endif
> +endif
> +
> +# Distutils
> +ifeq ($$($(2)_SETUP_TYPE),distutils)
> +ifeq ($(5),target)
> +$(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
> +$(2)_BASE_BUILD_TGT   = build
> +$(2)_BASE_BUILD_OPT   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPT)
> +$(2)_BASE_INSTALL_OPT = $$(PKG_PYTHON_DISTUTILS_INSTALL_OPT)
> +else
> +$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
> +$(2)_BASE_BUILD_TGT   = build
> +$(2)_BASE_BUILD_OPT   =
> +$(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT)
> +endif
> +# Setuptools
> +else ifeq ($$($(2)_SETUP_TYPE),setuptools)
> +ifeq ($(5),target)
> +$(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
> +$(2)_BASE_BUILD_TGT   = build -x
> +$(2)_BASE_BUILD_OPT   =
> +$(2)_BASE_INSTALL_OPT = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
> +else
> +$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
> +$(2)_BASE_BUILD_TGT   = build
> +$(2)_BASE_BUILD_OPT   =
> +$(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
> +endif
> +endif
> +
> +# The below statement intends to calculate the dependencies of host
> +# packages by derivating them from the dependencies of the
> +# corresponding target package, after adding the 'host-' prefix in
> +# front of the dependencies.
> +#
> +# However it must be repeated from inner-generic-package, as we need
> +# to exclude the python, host-python, host-python-setuptools and
> +# host-distutilscross packages, which are added below in the list of
> +# dependencies depending on the package characteristics, and shouldn't
> +# be derived automatically from the dependencies of the corresponding
> +# target package. For example, target packages need
> +# host-python-distutilscross, but not host packages.
> +$(2)_DEPENDENCIES ?= $(filter-out host-python host-python-setuptools
> host-python-distutilscross $(1),$(patsubst host-host-%,host-%,$(addprefix
> host-,$($(3)_DEPENDENCIES))))
> +
> +# Target packages need both the python interpreter on the target (for
> +# runtime) and the python interpreter on the host (for
> +# compilation). However, host packages only need the python
> +# interpreter on the host.
> +ifeq ($(5),target)
> +$(2)_DEPENDENCIES += host-python python
> +else
> +$(2)_DEPENDENCIES += host-python
> +endif
> +
> +# Setuptools based packages will need host-python-setuptools (both
> +# host and target) and host-python-distutilscross (only target
> +# packages). We need to have a special exclusion for the
> +# host-setuptools package itself: it is setuptools-based, but
> +# shouldn't depend on host-setuptools (because it would otherwise
> +# depend on itself!).
> +ifeq ($$($(2)_SETUP_TYPE),setuptools)
> +ifneq ($(2),HOST_PYTHON_SETUPTOOLS)
> +$(2)_DEPENDENCIES += host-python-setuptools
> +ifeq ($(5),target)
> +$(2)_DEPENDENCIES += host-python-distutilscross
> +endif
> +endif
> +endif
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +       (cd $$($$(PKG)_BUILDDIR)/; \
> +               $$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +               $(HOST_DIR)/usr/bin/python setup.py \
> +               $$($$(PKG)_BASE_BUILD_TGT) \
> +               $$($$(PKG)_BASE_BUILD_OPT) $$($$(PKG)_BUILD_OPT))
> +endef
> +endif
> +
> +#
> +# Host installation step. Only define it if not already defined by the
> +# package .mk file.
> +#
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +       (cd $$($$(PKG)_BUILDDIR)/; \
> +               $$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +               $(HOST_DIR)/usr/bin/python setup.py install \
> +               $$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
> +endef
> +endif
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +       (cd $$($$(PKG)_BUILDDIR)/; \
> +               $$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +               $(HOST_DIR)/usr/bin/python setup.py install \
> +               $$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
> +
> +endef
> +
>
> +################################################################################
> +# python-package -- the target generator macro for Python packages
>
> +################################################################################
> +
> +python-package = $(call inner-python-package,$(call pkgname),$(call
> UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call
> pkgparentdir),target)
> +host-python-package = $(call inner-python-package,host-$(call
> pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call
> pkgname)),$(call pkgparentdir),host)
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131211/ad4e1c37/attachment-0001.html>
