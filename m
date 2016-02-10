From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Feb 2016 15:18:35 +0100
Subject: [Buildroot] [PATCH 1/1] Integration of system emulation in
 host-qemu package
In-Reply-To: <1453975646-2444-1-git-send-email-simonn.maes@gmail.com>
References: <1453975646-2444-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <CAAXf6LWZnAG0HC0zz2jdMkEqM4GuLKJ_u3zv-U_uLxnbu7LBJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Thu, Jan 28, 2016 at 11:07 AM, Simon Maes <simonn.maes@gmail.com> wrote:
> Qemu package in Buildroot now supports system emulation for host.
> Additional configurations in Buildroot are:
> - Qemu version and where to download the software
> - Enable system or linux user-land emulation
> - Enable SDL frontend and FDT support
> - Enable Qemu debug
> - Disable stripped binary format
> - Save Qemu commandline arguments to run Qemu directly using
>  'make qemu-system-run'
>
> Support for VDE2 as host package is also added.
>
> Signed-off-by: Simon Maes <simonn.maes@gmail.com>
> ---
>  package/Config.in.host      |   1 +
>  package/qemu/Config.in      |   8 +++
>  package/qemu/Config.in.host | 160 ++++++++++++++++++++++++++++++++++++++++++++
>  package/qemu/qemu.mk        | 104 +++++++++++++++++++++++-----
>  package/vde2/Config.in.host |  14 ++++
>  package/vde2/vde2.mk        |   1 +
>  6 files changed, 271 insertions(+), 17 deletions(-)
>  create mode 100644 package/vde2/Config.in.host



There was some discussion on this topic on the Buildroot developer
days, see the notes under topic "qemu / host-qemu integration" here:
http://elinux.org/Buildroot:DeveloperDaysFOSDEM2016

Some specific comments below...


>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 8e6b870..17ecbf6 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -31,5 +31,6 @@ menu "Host utilities"
>         source "package/uboot-tools/Config.in.host"
>         source "package/util-linux/Config.in.host"
>         source "package/vboot-utils/Config.in.host"
> +       source "package/vde2/Config.in.host"

The support for vde2 is independent from the addition of a host
system-qemu, and should be done in a separate patch.

Also, there is some concern that the Host Utilities menu would become
too large. It is really intended to contain images related to
building/packaging an image. An alternative approach is thus to add a
config option in qemu to 'Enable VDE2 support' (or whatever). When
that option is set, add host-vde2 to the dependencies of host-qemu.
Then it will be built automatically without requiring a change in Host
Utilities.

>
>  endmenu
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 082b5ee..599af1e 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -36,6 +36,14 @@ config BR2_PACKAGE_QEMU
>
>  if BR2_PACKAGE_QEMU
>
> +config BR2_PACKAGE_QEMU_VERSION
> +       string "qemu version"
> +       default "2.5.0"
> +       help
> +         QEMU version to use
> +         Sometimes the latest version is broken for some specific
> +         architecture or target machine
> +
>  comment "Emulators selection"
>
>  config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index c5c3f05..9bf578b 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -15,3 +15,163 @@ config BR2_PACKAGE_HOST_QEMU
>           This option builds a user emulator for your selected architecture.
>
>           http://www.qemu.org
> +
> +
> +if BR2_PACKAGE_HOST_QEMU
> +
> +#
> +# Version selection. We provide the choice between:
> +#
> +#  1. A single fairly recent stable version available on the official Qemu webpage
> +#  2. A custom tarball
> +#  3. A custom stable version available using git
> +#  4. A custom stable version available using mercurial
> +#  5. A custom stable version available local on your machine

Here the concern is that the full-fledged choice of source is
unnecessary. So instead, I propose to just use a simple version
selection (from the official webpage) and remove the other options. In
our own use case, we can then add a few lines to support the source we
need.

A general approach to deciding the source of a package has been
discussed too. It could then become possible to override the source of
a package in a certain file, similar as local.mk, but unlike that one
something that is supposed to be version controlled. The notes contain
some more detail on that.

> +#
> +choice
> +       prompt "Qemu version"
> +       default BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE
> +
> +config BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE
> +       bool "Tarball from the Qemu download webpage"
> +       help
> +         This option allows Buildroot to get the Qemu source
> +         code from the Qemu download webpage in tarball format.
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_TARBALL
> +       bool "Custom tarball"
> +       help
> +         This option allows to specify a URL pointing to a Qemu source
> +         tarball. This URL can use any protocol recognized by Buildroot,
> +         like http://, ftp://, file:// or scp://.
> +
> +         When pointing to a local tarball using file://, you may want to
> +         use a make variable like $(TOPDIR) to reference the root of the
> +         Buildroot tree.
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_GIT
> +       bool "Custom Git repository"
> +       help
> +         This option allows Buildroot to get the Qemu source
> +         code from a Git repository.
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_HG
> +       bool "Custom Mercurial repository"
> +       help
> +         This option allows Buildroot to get the Qemu source
> +         code from a Mercurial repository.
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_LOCAL
> +       bool "Local directory"
> +       help
> +         This option allows Buildroot to get the Qemu source
> +         code from a local directory.
> +
> +endchoice
> +
> +config BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE_VERSION
> +       string "host qemu version"
> +       default "2.5.0"
> +       help
> +         QEMU version to use for host
> +         Sometimes the latest version is broken for some specific
> +         architecture or target machine
> +       depends on BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_TARBALL_LOCATION
> +       string "URL of custom Qemu tarball"
> +       depends on BR2_PACKAGE_HOST_QEMU_CUSTOM_TARBALL
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_REPO_URL
> +       string "URL of custom repository"
> +       depends on BR2_PACKAGE_HOST_QEMU_CUSTOM_GIT || BR2_PACKAGE_HOST_QEMU_CUSTOM_HG
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_REPO_VERSION
> +       string "Custom repository version"
> +       help
> +         Revision to use in the typical format used by Git/Mercurial
> +         E.G. a sha id, a tag, branch, ..
> +       depends on BR2_PACKAGE_HOST_QEMU_CUSTOM_GIT || BR2_PACKAGE_HOST_QEMU_CUSTOM_HG
> +
> +config BR2_PACKAGE_HOST_QEMU_CUSTOM_LOCAL_PATH
> +       string "Path to the local directory"
> +       depends on BR2_PACKAGE_HOST_QEMU_CUSTOM_LOCAL
> +       help
> +         Path to the local directory with the Qemu source code.
> +
> +config BR2_PACKAGE_HOST_QEMU_VERSION
> +       string
> +       default BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE_VERSION if BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE
> +       default "custom-tar" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
> +       default BR2_PACKAGE_HOST_QEMU_CUSTOM_REPO_VERSION \
> +               if BR2_PACKAGE_HOST_QEMU_CUSTOM_GIT || BR2_PACKAGE_HOST_QEMU_CUSTOM_HG
> +       default "custom-local" if BR2_PACKAGE_HOST_QEMU_CUSTOM_LOCAL
> +
> +#
> +# Configuration selection
> +#
> +
> +comment "Emulators selection"
> +
> +config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
> +       bool "Enable systems emulation"
> +       depends on !BR2_STATIC_LIBS # dtc
> +       select BR2_PACKAGE_HOST_QEMU_FDT
> +       help
> +         Say 'y' to build system emulators/virtualisers.
> +         When building the host-qemu package for system emulation, qemu will be configured to support the Target Architecture, configured in Buildroot

Please wrap at 80 characters.

> +
> +config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> +       bool "Enable Linux user-land emulation"
> +       help
> +         Say 'y' to build Linux user-land emulators.
> +
> +config BR2_PACKAGE_HOST_QEMU_HAS_EMULS
> +       def_bool y
> +       depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE || BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> +
> +if BR2_PACKAGE_HOST_QEMU_HAS_EMULS
> +
> +comment "Frontends"
> +
> +config BR2_PACKAGE_HOST_QEMU_SDL
> +       bool "Enable SDL frontend"
> +       select BR2_PACKAGE_SDL
> +       help
> +         Say 'y' to enable the SDL frontend, that is, a graphical window
> +         presenting the VM's display.
> +
> +comment "Misc. features"
> +
> +config BR2_PACKAGE_HOST_QEMU_FDT
> +       bool "Enable FDT"
> +       depends on !BR2_STATIC_LIBS # dtc
> +       select BR2_PACKAGE_DTC
> +       help
> +         Say 'y' here to have QEMU capable of constructing Device Trees,
> +         and passing them to the VMs.
> +
> +comment "FDT support needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> +
> +endif # BR2_PACKAGE_HOST_QEMU_HAS_EMULS
> +
> +config BR2_PACKAGE_HOST_QEMU_DEBUG
> +       bool "Enable debug"
> +       help
> +         Say 'y' here to enable common debug build options for QEMU.
> +
> +config BR2_PACKAGE_HOST_QEMU_STRIP_BINARY
> +       bool "Enable stripped binary format"
> +       help
> +         Say 'y' here to enable stripping QEMU binary.
> +
> +config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS
> +       string "qemu-system command arguments"
> +       depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
> +       help
> +         Arguments to be used for your target host-qemu-system to run
> +         via "make qemu-system-run".

The 'make qemu-system-run' could be controversial, so I would make
that addition a separate patch.

> +
> +
> +endif # BR2_PACKAGE_HOST_QEMU
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 1b08b42..82e34e7 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,17 +4,38 @@
>  #
>  ################################################################################
>
> -QEMU_VERSION = 2.5.0
> -QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
> -QEMU_SITE = http://wiki.qemu.org/download
> -QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
> -QEMU_LICENSE_FILES = COPYING COPYING.LIB
> -# NOTE: there is no top-level license file for non-(L)GPL licenses;
> +#-------------------------------------------------------------
> +# Host-qemu
> +
> +HOST_QEMU_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_VERSION))
> +HOST_QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
> +HOST_QEMU_LICENSE_FILES = COPYING COPYING.LIB
> +# NOTE: there is no top-level license file for non-(L)GPL licenses;
>  #       the non-(L)GPL license texts are specified in the affected
>  #       individual source files.

If the host and target qemu versions line up, then the license will be
the same too. As HOST_FOO_LICENSE is taken from FOO_LICENSE if not
explicitly defined, I don't think you need to split these. In this
case I'd leave the license and version definitions at the top of this
file before the host/target split.

>
> -#-------------------------------------------------------------
> -# Host-qemu
> +# Compute HOST_QEMU_SOURCE and HOST_QEMU_SITE from the configuration
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_OFFICIAL_WEBPAGE),y)
> +HOST_QEMU_SITE = http://wiki.qemu.org/download
> +HOST_QEMU_SOURCE = qemu-$(HOST_QEMU_VERSION).tar.bz2
> +else ifeq ($(BR2_PACKAGE_HOST_QEMU_CUSTOM_TARBALL),y)
> +HOST_QEMU_TARBALL = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_CUSTOM_TARBALL_LOCATION))
> +HOST_QEMU_SITE = $(patsubst %/,%,$(dir $(HOST_QEMU_TARBALL)))
> +HOST_QEMU_SOURCE = $(notdir $(HOST_QEMU_TARBALL))
> +BR_NO_CHECK_HASH_FOR += $(HOST_QEMU_SOURCE)
> +# Overwrite HOST_QEMU_VERSION so that HOST_QEMU_DIR becomes unique, in which case a
> +# change in the HOST_QEMU_TARBALL configuration automatically gets picked up.
> +HOST_QEMU_VERSION = custom-$(HOST_QEMU_TARBALL)
> +else ifeq ($(BR2_PACKAGE_HOST_QEMU_CUSTOM_GIT),y)
> +HOST_QEMU_SITE = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_CUSTOM_REPO_URL))
> +HOST_QEMU_SITE_METHOD = git
> +else ifeq ($(BR2_PACKAGE_HOST_QEMU_CUSTOM_HG),y)
> +HOST_QEMU_SITE = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_CUSTOM_REPO_URL))
> +HOST_QEMU_SITE_METHOD = hg
> +else ifeq ($(BR2_PACKAGE_HOST_QEMU_CUSTOM_LOCAL),y)
> +HOST_QEMU_SITE = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_CUSTOM_LOCAL_PATH))
> +HOST_QEMU_SITE_METHOD = local
> +endif
>
>  HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
>
> @@ -62,7 +83,6 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),sh4aeb)
>  HOST_QEMU_ARCH = sh4eb
>  endif
> -HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
>
>  ifeq ($(BR2_PACKAGE_HOST_QEMU),y)
>  HOST_QEMU_HOST_SYSTEM_TYPE = $(shell uname -s)
> @@ -70,10 +90,12 @@ ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
>  $(error "qemu-user can only be used on Linux hosts")
>  endif
>
> -# kernel version as major*256 + minor
> -HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> +HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu
> +HOST_QEMU_OPTS += --enable-system
> +else
> +HOST_QEMU_OPTS += --disable-system
> +endif
>
>  #
>  # The principle of qemu-user is that it emulates the instructions of
> @@ -85,15 +107,42 @@ HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(
>  # built with kernel headers that are older or the same as the kernel
>  # version running on the host machine.
>  #
> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE),y)
> +HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-linux-user
> +HOST_QEMU_OPTS += --enable-linux-user
> +
> +# kernel version as major*256 + minor
> +HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
> +HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
> +HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
> +
>  ifeq ($(BR_BUILDING),y)
>  ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
>  $(error "Refusing to build qemu-user: target Linux version newer than host's.")
>  endif
>  endif
> +
> +else
> +HOST_QEMU_OPTS += --disable-linux-user
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_DEBUG),y)
> +HOST_QEMU_OPTS += --enable-debug
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_STRIP_BINARY),n)
> +HOST_QEMU_OPTS += --disable-strip
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_VDE2),y)
> +HOST_QEMU_OPTS += --enable-vde
> +HOST_QEMU_DEPENDENCIES += host-vde2
>  endif
>
>  define HOST_QEMU_CONFIGURE_CMDS
> -       cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
> +       ( cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
>                 --target-list="$(HOST_QEMU_TARGETS)"    \
>                 --prefix="$(HOST_DIR)/usr"              \
>                 --interp-prefix=$(STAGING_DIR)          \
> @@ -101,7 +150,9 @@ define HOST_QEMU_CONFIGURE_CMDS
>                 --host-cc="$(HOSTCC)"                   \
>                 --python=$(HOST_DIR)/usr/bin/python2    \
>                 --extra-cflags="$(HOST_CFLAGS)"         \
> -               --extra-ldflags="$(HOST_LDFLAGS)"
> +               --extra-ldflags="$(HOST_LDFLAGS)"       \
> +               $(HOST_QEMU_OPTS)                            \
> +)
>  endef
>
>  define HOST_QEMU_BUILD_CMDS
> @@ -115,11 +166,30 @@ endef
>  $(eval $(host-generic-package))
>
>  # variable used by other packages
> -QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
> +HOST_QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
>
> -#-------------------------------------------------------------
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> +HOST_QEMU_SYSTEM = $(HOST_DIR)/usr/bin/qemu-system-$(HOST_QEMU_ARCH)
> +
> +.PHONY: qemu-system-run
> +qemu-system-run:
> +       $(HOST_QEMU_SYSTEM) $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS))
> +endif
> +
> +#------------------------------------------------------------
>  # Target-qemu
>
> +QEMU_VERSION = 2.5.0
> +QEMU_VERSION = $(call qstrip,$(BR2_PACKAGE_QEMU_VERSION))
> +QEMU_SITE = http://wiki.qemu.org/download
> +QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
> +QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
> +QEMU_LICENSE_FILES = COPYING COPYING.LIB
> +# NOTE: there is no top-level license file for non-(L)GPL licenses;
> +#       the non-(L)GPL license texts are specified in the affected
> +#       individual source files.
> +
> +
>  QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
>
>  # Need the LIBS variable because librt and libm are
> diff --git a/package/vde2/Config.in.host b/package/vde2/Config.in.host
> new file mode 100644
> index 0000000..c412e9f
> --- /dev/null
> +++ b/package/vde2/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_VDE2
> +       bool "host vde2"
> +       depends on BR2_USE_MMU # fork()
> +       depends on !BR2_STATIC_LIBS # dlopen()
> +       help
> +         VDE is an ethernet compliant virtual network that can be
> +         spawned over a set of physical computers over the Internet.
> +         VDE is part of the virtualsquare project.
> +
> +         http://vde.sourceforge.net/
> +
> +comment "vde2 needs a toolchain w/ dynamic library"
> +       depends on BR2_USE_MMU
> +       depends on BR2_STATIC_LIBS
> diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
> index bad758d..13fecd3 100644
> --- a/package/vde2/vde2.mk
> +++ b/package/vde2/vde2.mk
> @@ -38,3 +38,4 @@ VDE2_CONF_OPTS = \
>  VDE2_MAKE = $(MAKE1)
>
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> --
> 1.8.3.1

Best regards,
Thomas
