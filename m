From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Jun 2015 14:15:36 +0200
Subject: [Buildroot] [PATCH v2] kvmtool: new package
In-Reply-To: <1434979398-30311-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1434979398-30311-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <55894DE8.8060706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/15 15:23, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

 Some minor whitespace questions below, but basically

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/Config.in          |  1 +
>  package/kvmtool/Config.in  | 32 ++++++++++++++++++++++++++++
>  package/kvmtool/kvmtool.mk | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 86 insertions(+)
>  create mode 100644 package/kvmtool/Config.in
>  create mode 100644 package/kvmtool/kvmtool.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6dbc32d..2c0d029 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1398,6 +1398,7 @@ endif
>  	source "package/irqbalance/Config.in"
>  	source "package/keyutils/Config.in"
>  	source "package/kmod/Config.in"
> +	source "package/kvmtool/Config.in"
>  	source "package/lxc/Config.in"
>  	source "package/monit/Config.in"
>  	source "package/ncdu/Config.in"
> diff --git a/package/kvmtool/Config.in b/package/kvmtool/Config.in
> new file mode 100644
> index 0000000..ce24d40
> --- /dev/null
> +++ b/package/kvmtool/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_KVMTOOL
> +	bool "kvmtool"
> +	depends on BR2_USE_MMU # guest simple init fork()
> +	# No MADV_HUGEPAGE define in uClibc(-ng)
> +	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +	# Only mips big-endian seems to be supported (build breaks)
> +	# Should work on powerpc64 but the build breaks with missing types
> +	depends on \
> +		BR2_aarch64 || BR2_arm       || BR2_armeb || BR2_i386 || \
> +		BR2_mips    || BR2_x86_64

 Line splitting, whitespace and ordering is a bit weird I think, why not

	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_mips || \
		BR2_i386 || BR2_x86_64

> +	# libfdt is only required for DT architectures...
> +	# ...but it's not able to build for static targets
> +	depends on !(BR2_STATIC_LIBS && (BR2_aarch64 || BR2_arm || BR2_armeb))
> +	select BR2_PACKAGE_DTC if BR2_aarch64 || BR2_arm || BR2_armeb
> +	help
> +	  kvmtool is a lightweight tool for hosting KVM guests.
> +	  As a pure virtualization tool it only supports guests using
> +	  the same architecture, though it supports running 32-bit guests
> +	  on those 64-bit architectures that allow this.
> +
> +	  https://git.kernel.org/cgit/linux/kernel/git/will/kvmtool.git/tree/README
> +
> +comment "kvmtool needs a (e)glibc or musl toolchain"
> +	depends on BR2_USE_MMU
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +	depends on BR2_i386 || BR2_mips || BR2_x86_64

 It makes more sense to put the arch-depends together, so the arches just after MMU.

> +
> +comment "kvmtool needs a (e)glibc or musl toolchain w/ dynamic library"
> +	depends on BR2_USE_MMU
> +        depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
   ^^^^^^^^ spaces iso. tab.

 Also, glibc can't be static, but probably the way you have it here is clearer.

> +		BR2_STATIC_LIBS
> +	depends on BR2_aarch64 || BR2_arm || BR2_armeb

 Same here: arches just after MMU.

> diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
> new file mode 100644
> index 0000000..7f682db
> --- /dev/null
> +++ b/package/kvmtool/kvmtool.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# kvmtool
> +#
> +################################################################################
> +
> +KVMTOOL_VERSION = 372f583d359a5bdcbbe7268809c8d1dc179c64d2
> +KVMTOOL_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/will/kvmtool.git
> +KVMTOOL_SITE_METHOD = git
> +KVMTOOL_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
> +	$(if $(BR2_PACKAGE_DTC),dtc) \
> +	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
> +	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
> +	$(if $(BR2_PACKAGE_LIBVNCSERVER),libvncserver) \
> +	$(if $(BR2_PACKAGE_SDL),sdl) \
> +	$(if $(BR2_PACKAGE_ZLIB),zlib)
> +KVMTOOL_LICENSE = GPLv2
> +KVMTOOL_LICENSE_FILES = COPYING
> +
> +# This is required to convert a static binary (init helper) back into
> +# object-file format, and in multilib toolchains like CS 2012.09 for x86
> +# the default is i386, hence when building for x86_64 things break since
> +# LD doesn't autodetect the input file format.
> +# GCC-as-linker can't accomplish this feat easily either since it's mixing
> +# static content (guest_init.o) with dynamic one (lkvm) making
> +# a relocatable output file.
> +# The purpose of this trick is to embed the init helper into the main
> +# binary to help users in guest system startup, which would otherwise
> +# require more complex guest images.
> +# This needs revisiting if/when X32 ABI support is added.
> +#
> +# If more packages need this (unlikely) an ld wrapper might be a better
> +# solution, using gcc -dumpspecs information.
> +KVMTOOL_EXTRA_LDFLAGS = \
> +	$(if $(BR2_x86_64),-m elf_x86_64)
> +
> +# Disable -Werror, otherwise musl is not happy
> +KVMTOOL_MAKE_OPTS = \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
> +	WERROR=0

 Shouldn't we pass TARGET_CFLAGS and friends as well? Perhaps put
TARGET_CONFIGURE_OPTS in the environment?

 Regards,
 Arnout

> +
> +define KVMTOOL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
> +endef
> +
> +define KVMTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) \
> +		$(KVMTOOL_MAKE_OPTS) install DESTDIR=$(TARGET_DIR) prefix=/usr
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
