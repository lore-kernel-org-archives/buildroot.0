From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 21:10:02 +0200
Subject: [Buildroot] [PATCH v3] Add Xen 4.6
In-Reply-To: <1463091181-22886-1-git-send-email-alistair.francis@xilinx.com>
References: <1463091181-22886-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20160612211002.08112f42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 15:13:01 -0700, Alistair Francis wrote:
> Add support to compile Xen 4.6 and Xen tools for arm32 and arm64
> targets.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks a lot! I've applied your patch, with a number of changes, see
below for the details!

> diff --git a/package/xen/Config.in b/package/xen/Config.in
> new file mode 100644
> index 0000000..52d185c
> --- /dev/null
> +++ b/package/xen/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_XEN
> +	bool "xen"
> +	# Xen in buildroot only supports these architectures
> +	depends on BR2_arm || BR2_aarch64

In fact, BR2_arm is not good enough: Xen uses the dmb instruction for
memory barriers, so I've restricted the package to ARMv7.

> +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_WCHAR # libglib2, util-linux
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PIXMAN
> +	select BR2_PACKAGE_YAJL

None of these dependencies are needed for the hypervisor, they are only
needed for the tools. So I've moved all of this under the tools
sub-option.

Also, since I believe building with both the hypervisor and the tools
disabled doesn't make much sense, I've added here:

	select BR2_PACKAGE_XEN_HYPERVISOR if !BR2_PACKAGE_XEN_TOOLS

> +if BR2_PACKAGE_XEN
> +
> +config BR2_PACKAGE_XEN_HYPERVISOR
> +	bool "Build the Xen hypervisor"
> +	default y
> +	help
> +	  The Xen binaries are avaliable in /usr/lib/xen/
> +	  See http://wiki.xenproject.org/wiki/Getting_Started for using the
> +	  Xen hypervisor.
> +
> +config BR2_PACKAGE_XEN_TOOLS
> +	bool "Build the Xen tools"
> +	depends on !BR2_STATIC_LIBS # dtc (libfdt)
> +	select BR2_PACKAGE_DTC
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC

So here we have a lot more dependencies (all the ones you originally
had on the main Xen option).


> +ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> +XEN_INSTALL_IMAGES = YES

I've grouped this under the BR2_PACKAGE_XEN_HYPERVISOR conditional
below.

> +endif
> +
> +XEN_DEPENDENCIES += libaio libglib2 ncurses openssl pixman yajl

This is now under the BR2_PACKAGE_XEN_TOOLS option.

> +
> +XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)

Since you're not installing anything to the target when only the
Hypervisor is enabled, I've simply added XEN_INSTALL_TARGET = NO in the
hypervisor case, and moved this under the tools condition.

> +XEN_ARCH=$(ARCH)

Not needed, since the only architectures you support are ARM and
AArch64, so the below conditions were sufficient.

> +
> +# Overwrite some architectures to match what Xen expects
> +ifeq ($(ARCH),aarch64)
> +XEN_ARCH="arm64"

Quotes not needed.

> +endif
> +ifeq ($(ARCH),arm)

else ifeq is better here.

> +XEN_ARCH="arm32"

Quotes not needed.

> +endif
> +
> +XEN_CONF_OPTS += --disable-ocamltools
> +XEN_MAKE_ENV += XEN_TARGET_ARCH=$(XEN_ARCH) CROSS_COMPILE=$(TARGET_CROSS) $(TARGET_CONFIGURE_OPTS)
> +
> +ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> +XEN_MAKE_OPTS += dist-xen
> +
> +define XEN_INSTALL_IMAGES_CMDS
> +	cp $(@D)/xen/xen $(BINARIES_DIR)
> +endef
> +else
> +XEN_CONF_OPTS += --disable-xen
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
> +XEN_DEPENDENCIES += dtc util-linux

I've added many more dependencies here.

> +XEN_INSTALL_TARGET_OPTS += install-tools
> +XEN_MAKE_OPTS += dist-tools
> +
> +define XEN_INSTALL_INIT_SYSV
> +	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
> +	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
> +	mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
> +endef
> +else
> +XEN_CONF_OPTS += --disable-tools
> +endif
> +
> +$(eval $(autotools-package))

See https://git.buildroot.org/buildroot/log for the final commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
