From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 May 2016 00:34:20 +0200
Subject: [Buildroot] [PATCH 1/6] qemu: add support for host-qemu-system
In-Reply-To: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <b3d5a198-a3cf-4dc9-b15d-93748a1a8521@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Simon,

  Thanks for working on this! You clearly understood the feedback that Thomas 
gave to Gustavo's original patches.

  I have a lot of feedback, mainly simplifying things a little.

On 05/04/16 09:47, Simon Maes wrote:
>     Additional package configurations are:

  Not very important, but we don't usually indent commit messages like this. 
When you do "git log", an additional 4 spaces will be added so then it becomes 
really deep...

>     - Enable system or linux user-land emulation
>     - Enable SDL frontend and FDT support
>     - Enable Qemu debug
>     - Disable stripped binary format

  Sounds to me like this could be split up into more patches. But in fact I 
think all of the optional things can be removed (i.e. made non-optional).

>
> Signed-off-by: Simon Maes <simonn.maes@gmail.com>
> ---
>  package/qemu/Config.in.host | 66 +++++++++++++++++++++++++++++++++++++++++++++
>  package/qemu/qemu.mk        | 39 ++++++++++++++++++++++-----
>  2 files changed, 99 insertions(+), 6 deletions(-)
>
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index c5c3f05..71f697e 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -15,3 +15,69 @@ config BR2_PACKAGE_HOST_QEMU
>  	  This option builds a user emulator for your selected architecture.
>
>  	  http://www.qemu.org
> +
> +if BR2_PACKAGE_HOST_QEMU
> +
> +#
> +# Configuration selection
> +#
> +
> +comment "Emulators selection"
> +
> +config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
> +	bool "Enable systems emulation"
> +	depends on !BR2_STATIC_LIBS # dtc
> +	select BR2_PACKAGE_HOST_QEMU_FDT
> +	help
> +	  Say 'y' to build system emulators/virtualisers.
> +	  When building the host-qemu package for system emulation,
> +	  qemu will be configured to support the Target Architecture,
> +	  configured in Buildroot

  Why does that second sentence come here? Isn't that just true for all qemu 
builds? In fact, something similar is already in the general host-qemu help text.

> +
> +config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> +	bool "Enable Linux user-land emulation"
> +	help
> +	  Say 'y' to build Linux user-land emulators.

  Generally we try to stay compatible with existing configurations, so this 
should default to y - otherwise, when you have host-qemu selected before this 
patch, and you do a 'make menuconfig' and just save, you will neither system 
mode nor user mode selected.

  But in fact, it's silly to have neither. For target qemu, we can specify which 
targets to build, but for host it's only system or user. And if neither of them 
is selected, we're actually not going to build anything.

  So to avoid that, you can give this:

	default y if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE

  Alternatively, in BR2_PACKAGE_HOST_QEMU itself, you can add

	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE

which makes sure that one of them is always selected.

> +
> +config BR2_PACKAGE_HOST_QEMU_HAS_EMULS
> +	def_bool y
> +	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE || \
> +		BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE

  This should always be true.

> +
> +if BR2_PACKAGE_HOST_QEMU_HAS_EMULS
> +
> +comment "Frontends"
> +
> +config BR2_PACKAGE_HOST_QEMU_SDL
> +	bool "Enable SDL frontend"
> +	select BR2_PACKAGE_SDL

  This makes no sense. The target SDL package has nothing to do with host-qemu. 
Anyway, there isn't much point in building host-sdl either, because it doesn't 
have X11 support so most users can't do anything useful with it.

  I think we should just rely on system-installed devel packages for SDL and 
autodetection by configure. So add to the help text that you need libsdl1.2-dev 
(or whatever it is you need) to get graphical support.


> +	help
> +	  Say 'y' to enable the SDL frontend, that is, a graphical window
> +	  presenting the VM's display.
> +
> +comment "Misc. features"
> +
> +config BR2_PACKAGE_HOST_QEMU_FDT
> +	bool "Enable FDT"
> +	depends on !BR2_STATIC_LIBS # dtc
> +	select BR2_PACKAGE_DTC

  Again, target dtc has nothing to do with host-qemu. And again, I think it's OK 
to always build dtc support in host-qemu.

> +	help
> +	  Say 'y' to have QEMU capable of constructing Device Trees,
> +	  and passing them to the VMs.
> +
> +comment "FDT support needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_HOST_QEMU_DEBUG
> +	bool "Enable debug"
> +	help
> +	  Say 'y' to enable build options for QEMU.

  build options? I guess debug options?

> +
> +config BR2_PACKAGE_HOST_QEMU_STRIP_BINARY
> +	bool "Enable stripped binary format"
> +	help
> +	  Say 'y' to enable stripping of the QEMU binary.

  I don't see how this is useful for host-qemu.

> +
> +endif # BR2_PACKAGE_HOST_QEMU_HAS_EMULS
> +
> +endif # BR2_PACKAGE_HOST_QEMU
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 522910e..0e99138 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -17,6 +17,8 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
>  # Host-qemu
>
>  HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
> +HOST_QEMU_SITE = $(QEMU_SITE)
> +HOST_QEMU_SOURCE = $(QEMU_SOURCE)

  This doesn't belong here, it's only relevant when the version of host and 
target qemu can be selected independently.

>
>  #       BR ARCH         qemu
>  #       -------         ----
> @@ -61,7 +63,6 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),sh4aeb)
>  HOST_QEMU_ARCH = sh4eb
>  endif
> -HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
>
>  ifeq ($(BR2_PACKAGE_HOST_QEMU),y)

  Since you're anyway moving things around: this condition (and the system check 
immediately below) would be better placed together with the BR_BUILDING check 
below. And it would be better to do that in a separate patch BTW.

>  HOST_QEMU_HOST_SYSTEM_TYPE = $(shell uname -s)
> @@ -69,10 +70,12 @@ ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
>  $(error "qemu-user can only be used on Linux hosts")
>  endif
>
> -# kernel version as major*256 + minor
> -HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> +HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu

  Do we need this? Isn't --enable-system enough? Or will it build all arches then?

  Why the softmmu version? Shouldn't that depend on BR2_USE_MMU?

> +HOST_QEMU_OPTS += --enable-system
> +else
> +HOST_QEMU_OPTS += --disable-system
> +endif
>
>  #
>  # The principle of qemu-user is that it emulates the instructions of
> @@ -84,11 +87,34 @@ HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(
>  # built with kernel headers that are older or the same as the kernel
>  # version running on the host machine.
>  #

  You moved this comment away from the code that it applies to: the version check.

> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE),y)
> +HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-linux-user
> +HOST_QEMU_OPTS += --enable-linux-user
> +
> +# kernel version as major*256 + minor
> +HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
> +HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
> +HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)

  This bit should also go inside the BR_BUILDING, in a separate patch.


  Regards,
  Arnout

> +
>  ifeq ($(BR_BUILDING),y)
>  ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
>  $(error "Refusing to build qemu-user: target Linux version newer than host's.")
>  endif
> +
> +else
> +HOST_QEMU_OPTS += --disable-linux-user
> +endif
>  endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_DEBUG),y)
> +HOST_QEMU_OPTS += --enable-debug
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_STRIP_BINARY),n)
> +HOST_QEMU_OPTS += --disable-strip
> +endif
> +
>  endif
>
>  define HOST_QEMU_CONFIGURE_CMDS
> @@ -100,7 +126,8 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--host-cc="$(HOSTCC)"                   \
>  		--python=$(HOST_DIR)/usr/bin/python2    \
>  		--extra-cflags="$(HOST_CFLAGS)"         \
> -		--extra-ldflags="$(HOST_LDFLAGS)"
> +		--extra-ldflags="$(HOST_LDFLAGS)"       \
> +		$(HOST_QEMU_OPTS)
>  endef
>
>  define HOST_QEMU_BUILD_CMDS
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
