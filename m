From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 11:02:25 +0100
Subject: [Buildroot] [PATCH 03/38] package: introduce Python package
	infrastructure
In-Reply-To: <1386540907-7242-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWUByrN9ZHRu1MET+_aS44JquFaSXzxx6AWnL9WmC817w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 8, 2013 at 11:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-python.txt | 136 ++++++++++++++++++++
>  docs/manual/adding-packages.txt        |   2 +
>  package/Makefile.in                    |   1 +
>  package/pkg-python.mk                  | 219 +++++++++++++++++++++++++++++++++
>  4 files changed, 358 insertions(+)
>  create mode 100644 docs/manual/adding-packages-python.txt
>  create mode 100644 package/pkg-python.mk
>
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> new file mode 100644
> index 0000000..9b5876f
> --- /dev/null
> +++ b/docs/manual/adding-packages-python.txt
> @@ -0,0 +1,136 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +Infrastructure for Python packages
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This infrastructure applies to Python packages that use the standard
> +Python setuptools mechanism as their build system, generally
> +recognizable as the usage of a +setup.py+ script.

I would rather say: 'recognizable by'

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
> +01: ################################################################################
> +02: #
> +03: # python-foo
> +04: #
> +05: ################################################################################
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

Should we clarify here that if the tarball is .gz, it shouldn't be
specified because it's currently the default?

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
> +Finally, on line line 16, we invoke the +python-package+ macro that

line line

> +generates all the Makefile rules that actually allows the package to

allow

> +be built.
> +
> +[[python-package-reference]]
> +
> ++python-package+ reference
> +^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The main macro of the Python package infrastructure is
> ++python-package+. It is similar to the +generic-package+ macro. The
> +ability to have Python host packages is also available, with the
> ++host-python-package+ macro.
> +
> +Just like the generic infrastructure, the Python infrastructure works
> +by defining a number of variables before calling the +python-package+
> +or +host-python-package+ macros.
> +
> +First, all the package metadata information variables that exist in

The word First sounds odd to me here. I would rather use 'To start
with,' or 'First of all,'.

> +the generic infrastructure also exist in the Python infrastructure:
> ++PYTHON_FOO_VERSION+, +PYTHON_FOO_SOURCE+, +PYTHON_FOO_PATCH+,
> ++PYTHON_FOO_SITE+, +PYTHON_FOO_SUBDIR+, +PYTHON_FOO_DEPENDENCIES+,
> ++PYTHON_FOO_LICENSE+, +PYTHON_FOO_LICENSE_FILES+, etc.
> +
> +Note however that setting +PYTHON_FOO_INSTALL_STAGING+ to +YES+ has no
> +effect (unless a +PYTHON_FOO_INSTALL_STAGING_CMDS+ variable is
> +defined), since Python modules generally don't need to be installed to
> +the staging directory.
> +
> +For Python packages, one specific variable is mandatory:

Is it needed to say 'For Python packages' here?

> +
> +* +PYTHON_FOO_BUILD_TYPE+, to define which Python build system is used
> +  by the package. The two supported values are +distutils+ and
> +  +setuptools+. If you don't know which one is used in your package,
> +  look at the +setup.py+ file in your package source code, and see
> +  whether it imports things from the +distutils+ module or the
> +  +setuptools+ module.
> +
> +A few additional variables, specific to the Python infrastructure, can
> +also optionaly be defined, depending on the needs. Many of them are

* I would remove 'also' here.
* optionally (two l's)
* The 'depending on the needs' sounds odd to me, suggestions:
"depending on the needs of the package" or "depending on the package's
needs".

> +only useful in very specific cases, typical packages will therefore
> +only use a few of them.
> +
> +* +PYTHON_FOO_ENV+, to specify additional environment variables to
> +  pass to the Python +setup.py+ script (for both the build and install
> +  steps). Note that the infrastructure is automatically passing
> +  several standard variables: defined in +PKG_PYTHON_DISTUTILS_ENV+

Is the colon needed here? After a colon I would have expected a list
of variables that are automatically passed; however what follows is
rather in which containers these variables are put. So I'd replace the
colon with a comma, as you did for INSTALL_OPT.

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
> diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
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


What I have not yet seen in the documentation is a naming policy for
python packages. I understood that we expect them all to be named
python-foo, right, so maybe this could be added in the new python
section of the manual?


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
> index 0000000..4556843
> --- /dev/null
> +++ b/package/pkg-python.mk
> @@ -0,0 +1,219 @@
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
> +################################################################################
> +
> +# Passed in the environment of build and install steps of target
> +# distutils based packages.
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
> +# Passed as options of the build step of target distutils based
> +# packages.

This is probably personal, but I don't feel this comment explains more
than the variable name already does.
Moreover, to repeat the text 'of target distutils based packages' for
each of the ENV, BUILD_OPT, INSTALL_OPT variables seems redundant too.
What about a structure like:

# target distutils-based packages
PKG_PYTHON_DISTUTILS_ENV = ...
PKG_PYTHON_DISTUTILS_BUILD_OPT = ...
PKG_PYTHON_DISTUTIRS_INSTALL_OPT = ...

# host distutils-based packages
....

# target setuptools-based packages
...

# host setuptools-based packages
...



> +PKG_PYTHON_DISTUTILS_BUILD_OPT = \
> +       --executable=/usr/bin/python
> +
> +# Passed as options of the install step of target distutils based
> +# packages.
> +PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
> +       --prefix=$(TARGET_DIR)/usr
> +
> +# Passed in the environment of build and install steps of host
> +# distutils based packages.
> +HOST_PKG_PYTHON_DISTUTILS_ENV = \
> +       PATH="$(HOST_PATH)"
> +
> +# Passed as options of the install step of host distutils based
> +# packages.
> +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
> +       --prefix=$(HOST_DIR)/usr
> +
> +# Passed in the environment of the build and install steps of
> +# setuptools based packages.
> +PKG_PYTHON_SETUPTOOLS_ENV = \
> +       PATH="$(TARGET_PATH)" \
> +       PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +       PYTHONXCPREFIX="$(STAGING_DIR)/usr/"
> +
> +# Passed in the environment of the build and install steps of
> +# setuptools based packages built for the host.
> +HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> +       PATH="$(HOST_PATH)" \
> +       PYTHONXCPREFIX="$(HOST_DIR)/usr/"
> +
> +# Passed as options of the install of setuptools based packages.
> +PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
> +       --prefix=$(TARGET_DIR)/usr \
> +       --executable=/usr/bin/python \
> +       --single-version-externally-managed \
> +       --root=/
> +
> +# Passed as options of the install of setuptools based packages built
> +# for the host.
> +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
> +       --prefix=$(HOST_DIR)/usr
> +
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
> +# This must be repeated from inner-generic-package, and we need to
> +# exclude the packages added above in various situations, otherwise

Do you mean 'as we need to' ?

added below

and what do you mean with 'in various situations' here?

> +# they get automatically added in the dependencies of the host package
> +# when present in the dependency of the target package, which we do
> +# not necessarily want, especially for host-python-distutilscross.
> +$(2)_DEPENDENCIES ?= $(filter-out host-python host-python-setuptools host-python-distutilscross $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
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
> +################################################################################
> +# python-package -- the target generator macro for Python packages
> +################################################################################
> +
> +python-package = $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
> +host-python-package = $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
> --

Best regards,
Thomas
