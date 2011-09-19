From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 19 Sep 2011 10:33:22 +0200
Subject: [Buildroot] [git commit] Add xenomai real-time Framework to
	buildroot
In-Reply-To: <20110918210214.D4A1A8D5CD@busybox.osuosl.org>
References: <20110918210214.D4A1A8D5CD@busybox.osuosl.org>
Message-ID: <CAAXf6LUypr_EHGnwEfAbpWYpQFrfdNw9zvy0muECOkCyBx1CGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

On Sun, Sep 18, 2011 at 10:59 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=956d4ab0f501c44f977297d8faac95afa43f3082
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> [Fixes by Thomas, including comments from Arnout:
> ?* Use AUTOTARGETS instead of GENTARGETS
>
> ?* Use $(KERNEL_ARCH) instead of $(BR2_ARCH) as argument to the
> ? ?prepare-kernel.sh script. This allows the arch name to be fixed
> ? ?with the usual sed expressions and the quotes to be stripped.
>
> ?* Add the --verbose option to prepare-kernel.sh. This allows to get
> ? ?some clear error message when no Xenomai patch has been found for
> ? ?the current kernel version.
>
> ?* Improve the help texts as suggested by Arnout, and remove the
> ? ?now useless README file.
>
> ?* Add a BR2_PACKAGE_XENOMAI_SMP option, instead of poking inside the
> ? ?kernel configuration to find out whether SMP is enabled or
> ? ?not. This cannot work because: 1) the kernel might be built
> ? ?outside of Buildroot and 2) if the kernel is built inside
> ? ?Buildroot, it is built *after* Xenomai, so the kernel
> ? ?configuration file is typically not yet present.
>
> ?* Simplify the ARM subarchitecture selection as suggested by Arnout.
>
> ?* Remove the documentation and development files according to
> ? ?Buildroot standards (using BR2_HAVE_DOCUMENTATION and
> ? ?BR2_HAVE_DEVFILES).
>
> ?* Simplify the /etc/ld.so.conf modification logic.
> ]

Thanks for these fixes.

>
> [Peter: whitespace fixes]
> Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?linux/Config.ext.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? 15 +++
> ?linux/linux-ext-xenomai.mk ? ? ? ? ? ? ? ? ? ? ? ? | ? 30 ++++++
> ?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?4 +
> ?package/xenomai/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ?| ?106 ++++++++++++++++++++
> ?.../xenomai/xenomai-do-not-install-devices.patch ? | ? 11 ++
> ?package/xenomai/xenomai.mk ? ? ? ? ? ? ? ? ? ? ? ? | ? 99 ++++++++++++++++++
> ?target/generic/device_table_dev.txt ? ? ? ? ? ? ? ?| ? ?5 +
> ?7 files changed, 270 insertions(+), 0 deletions(-)
>
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 50e801d..893edb5 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -1,3 +1,18 @@
> ?menu "Linux Kernel Extensions"
>
> +# Xenomai
> +config BR2_LINUX_KERNEL_EXT_XENOMAI
> + ? ? ? bool "Adeos/Xenomai Real-time patch"
> + ? ? ? select BR2_PACKAGE_XENOMAI
> + ? ? ? help
> + ? ? ? ? Xenomai Kernel part.
> +
> +config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
> + ? ? ? depends on BR2_LINUX_KERNEL_EXT_XENOMAI
> + ? ? ? string "Path for Adeos patch file"
> + ? ? ? help
> + ? ? ? ? Optionally, explicitly specify the Adeos patch to use.
> + ? ? ? ? Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
> + ? ? ? ? and verify that your kernel version in buildroot matches.
> +
> ?endmenu
> diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
> new file mode 100644
> index 0000000..e855ded
> --- /dev/null
> +++ b/linux/linux-ext-xenomai.mk
> @@ -0,0 +1,30 @@
> +##################################################
> +# Linux Adeos/Xenomai extensions
> +#
> +# Patch the linux kernel with xenomai extension
> +##################################################
> +
> +ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
> +# Add dependency to xenomai (user-space) which provide ksrc part
> +LINUX_DEPENDENCIES += xenomai
> +
> +# Adeos patch version
> +XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
> +ifeq ($(XENOMAI_ADEOS_PATCH),)
> +XENOMAI_ADEOS_OPT = --default
> +else
> +XENOMAI_ADEOS_OPT = --adeos=$(XENOMAI_ADEOS_PATCH)
> +endif
> +
> +# Prepare kernel patch
> +define XENOMAI_PREPARE_KERNEL
> + ? ? ? $(XENOMAI_DIR)/scripts/prepare-kernel.sh \
> + ? ? ? ? ? ? ? --linux=$(LINUX_DIR) \
> + ? ? ? ? ? ? ? --arch=$(KERNEL_ARCH) \
> + ? ? ? ? ? ? ? $(XENOMAI_ADEOS_OPT) \
> + ? ? ? ? ? ? ? --verbose
> +endef
> +
> +LINUX_POST_EXTRACT_HOOKS += XENOMAI_PREPARE_KERNEL
> +
> +endif #BR2_LINUX_EXT_XENOMAI
> diff --git a/package/Config.in b/package/Config.in
> index d95e7b5..efb266a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -487,6 +487,10 @@ source "package/rpm/Config.in"
> ?endif
> ?endmenu
>
> +menu "Real-Time"
> +source "package/xenomai/Config.in"
> +endmenu
> +
> ?menu "Shell and utilities"
> ?source "package/at/Config.in"
> ?if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> new file mode 100644
> index 0000000..b5737b8
> --- /dev/null
> +++ b/package/xenomai/Config.in
> @@ -0,0 +1,106 @@
> +config BR2_PACKAGE_XENOMAI
> + ? ? ? bool "Xenomai Userspace"
> + ? ? ? help
> + ? ? ? ? Real-Time Framework for Linux
> + ? ? ? ? http://www.xenomai.org
> +
> + ? ? ? ? Xenomai is split in two parts: a kernel part and an
> + ? ? ? ? userspace part.
> +
> + ? ? ? ? This package contains the userspace part, which consists
> + ? ? ? ? mainly in libraries to write userspace real-time programs
> + ? ? ? ? that interact with the in-kernel Xenomai real-time core.
> +
> + ? ? ? ? For those libraries to work, you need a Xenomai-enabled
> + ? ? ? ? kernel. This is possible in two ways:
> + ? ? ? ? ?- if you compile your kernel with Buildroot, you need to go
> + ? ? ? ? ? ?to Linux Kernel -> Linux Kernel Extensions to enable the
> + ? ? ? ? ? ?Xenomai extension.
> + ? ? ? ? ?- if you compile your kernel outside of Buildroot, you need
> + ? ? ? ? ? ?to make sure that it is Xenomai-enabled.
> +
> + ? ? ? ? Finally, if you are using a static /dev, make sure to
> + ? ? ? ? uncomment the Xenomai entries listed in
> + ? ? ? ? target/generic/device_table_dev.txt.
> +
> +if BR2_PACKAGE_XENOMAI
> +
> +config BR2_PACKAGE_XENOMAI_VERSION
> + ? ? ? string "Custom Xenomai version"
> + ? ? ? help
> + ? ? ? ? Manually select Xenomai version. ?If left empty, the default
> + ? ? ? ? version will be used.
> +
> + ? ? ? ? Make sure that the selected version has a patch for your
> + ? ? ? ? selected Linux kernel. If it does not, download and select
> + ? ? ? ? a patch manually with
> + ? ? ? ? BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
> + ? ? ? ? Kernel -> Linux Kernel Extensions menu.
> +
> +config BR2_PACKAGE_XENOMAI_SMP
> + ? ? ? bool "Enable SMP support"
> + ? ? ? help
> + ? ? ? ? This option allows to enable or disable SMP support. It has
> + ? ? ? ? to match your kernel configuration.
> +
> +choice
> + ? ? ? prompt "Xenomai ARM CPU type"
> + ? ? ? depends on BR2_arm
> + ? ? ? default BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
> + ? ? ? help
> + ? ? ? ? On the ARM architecture, Xenomai needs to be configured for
> + ? ? ? ? a specific sub-architecture. ?Select the appropriate
> + ? ? ? ? sub-architecture from the list.
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_AT91RM9200
> + ? ? ? ? ? ? ? bool "Atmel AT91RM9200"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_AT91SAM926X
> + ? ? ? ? ? ? ? bool "Atmel AT91SAM926X"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_INTEGRATOR
> + ? ? ? ? ? ? ? bool "ARM Ltd. Integrator"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_IXP4XX
> + ? ? ? ? ? ? ? bool "Intel IXP4XX (XScale)"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_IMX
> + ? ? ? ? ? ? ? bool "Freescale i.MX (MX1/MXL)"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_IMX21
> + ? ? ? ? ? ? ? bool "Freescale i.MX21"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_MX2
> + ? ? ? ? ? ? ? bool "Freescale MXC/MX2"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_MX3
> + ? ? ? ? ? ? ? bool "Freescale MXC/MX3"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_SA1100
> + ? ? ? ? ? ? ? bool "StrongARM SA1100"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_S3C2410
> + ? ? ? ? ? ? ? bool "S3C2410"
> +
> + ? ? ? config BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
> + ? ? ? ? ? ? ? bool "Generic ARM"
> +
> +endchoice
> +
> +# Now set CPU type. We force manually selected type even if detected in case
> +# user takes the risk.
> +config BR2_PACKAGE_XENOMAI_CPU_TYPE
> + ? ? ? string
> + ? ? ? depends on BR2_PACKAGE_XENOMAI && BR2_arm
> + ? ? ? default "at91rm9200" ?if BR2_PACKAGE_XENOMAI_CPU_AT91RM9200
> + ? ? ? default "at91sam926x" if BR2_PACKAGE_XENOMAI_CPU_AT91SAM926X
> + ? ? ? default "integrator" ?if BR2_PACKAGE_XENOMAI_CPU_INTEGRATOR
> + ? ? ? default "ixp4xx" ? ? ?if BR2_PACKAGE_XENOMAI_CPU_IXP4XX
> + ? ? ? default "generic" ? ? if BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
> + ? ? ? default "imx" ? ? ? ? if BR2_PACKAGE_XENOMAI_CPU_IMX
> + ? ? ? default "imx21" ? ? ? if BR2_PACKAGE_XENOMAI_CPU_IMX21
> + ? ? ? default "mx2" ? ? ? ? if BR2_PACKAGE_XENOMAI_CPU_MX2
> + ? ? ? default "mx3" ? ? ? ? if BR2_PACKAGE_XENOMAI_CPU_MX3
> + ? ? ? default "s3c2410" ? ? if BR2_PACKAGE_XENOMAI_CPU_S3C2410
> +
> +endif
> diff --git a/package/xenomai/xenomai-do-not-install-devices.patch b/package/xenomai/xenomai-do-not-install-devices.patch
> new file mode 100644
> index 0000000..348abee
> --- /dev/null
> +++ b/package/xenomai/xenomai-do-not-install-devices.patch
> @@ -0,0 +1,11 @@
> +--- a/Makefile.in ? ? ?2011-06-24 16:11:23.591449817 +0200
> ++++ b/Makefile.in ? ? ?2011-06-24 16:20:29.638129633 +0200
> +@@ -719,7 +719,7 @@
> + ? ? ? ? $$sudo mknod -m 666 $(DESTDIR)/dev/rtheap c 10 254 ; \
> + ? ? ? fi
> +
> +-install-exec-local: devices
> ++install-exec-local:
> +
> + install-user:
> + ? ? ? $(MAKE) SUDO=false install
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> new file mode 100644
> index 0000000..8f78333
> --- /dev/null
> +++ b/package/xenomai/xenomai.mk
> @@ -0,0 +1,99 @@
> +#############################################################
> +# Xenomai
> +# URL ?: http://xenomai.org
> +# NOTE : Real-Time Framework for Linux
> +#
> +#############################################################
> +
> +XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
> +ifeq ($(XENOMAI_VERSION),)
> +XENOMAI_VERSION = 2.5.6
> +endif
> +
> +XENOMAI_SITE = http://download.gna.org/xenomai/stable/
> +XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
> +
> +XENOMAI_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_arm),y)
> +XENOMAI_CPU_TYPE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_CPU_TYPE))
> +# Set "generic" if not defined
> +ifeq ($(XENOMAI_CPU_TYPE),)
> +XENOMAI_CPU_TYPE = generic
> +endif
> +XENOMAI_CONF_OPT += --enable-arm-mach=$(XENOMAI_CPU_TYPE)
> +endif #BR2_arm
> +
> +ifeq ($(BR2_PACKAGE_XENOMAI_SMP),y)
> +XENOMAI_CONF_OPT += --enable-smp
> +endif
> +
> +# The configure step needs to be overloaded, because Xenomai doesn't
> +# support --prefix=/usr and the autotargets infrastructure enforces
> +# this.
> +define XENOMAI_CONFIGURE_CMDS
> + ? ? ? (cd $(@D); rm -rf config.cache; \
> + ? ? ? ? ? ? ? $(TARGET_CONFIGURE_OPTS) \
> + ? ? ? ? ? ? ? $(TARGET_CONFIGURE_ARGS) \
> + ? ? ? ? ? ? ? CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
> + ? ? ? ? ? ? ? ./configure \
> + ? ? ? ? ? ? ? $(XENOMAI_CONF_OPT) \
> + ? ? ? ? ? ? ? --host=$(GNU_TARGET_NAME) \
> + ? ? ? )
> +endef
> +
> +ifeq ($(BR2_HAVE_DOCUMENTATION),)
> +define XENOMAI_REMOVE_DOCUMENTATION
> + ? ? ? rm -rf $(TARGET_DIR)/usr/xenomai/share/doc
> + ? ? ? rm -rf $(TARGET_DIR)/usr/xenomai/share/man
> +endef
> +
> +XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DOCUMENTATION
> +endif
> +
> +ifeq ($(BR2_HAVE_DEVFILES),)
> +define XENOMAI_REMOVE_DEVFILES
> + ? ? ? rm -rf $(TARGET_DIR)/usr/xenomai/include
> + ? ? ? for i in xeno-config xeno-info wrap-link.sh ; do \
> + ? ? ? ? ? ? ? rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
> + ? ? ? done
> +endef
> +
> +XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DEVFILES
> +endif
> +
> +define XENOMAI_ADD_LD_SO_CONF
> + ? ? ? # Add /usr/xenomai/lib in the library search path
> + ? ? ? grep -q "^/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf || \
> + ? ? ? ? ? ? ? echo "/usr/xenomai/lib" >> $(TARGET_DIR)/etc/ld.so.conf
> +endef


This pattern of needing to add something to ld.so.conf only if it
isn't present yet, seems something generic to me, i.e. it could be
useful to other packages as well. Do you think it's worth it to add a
small infrastructure to the Makefile.package.in for that?

Thanks,
Thomas


> +
> +XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_ADD_LD_SO_CONF
> +
> +# If you use static /dev creation don't forget to update your
> +# ?device_table_dev.txt
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
> +XENOMAI_DEPENDENCIES += udev
> +
> +define XENOMAI_INSTALL_UDEV_RULES
> + ? ? ? if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
> + ? ? ? ? ? ? ? for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
> + ? ? ? ? ? ? ? ? ? ? ? cp $$f $(TARGET_DIR)/etc/udev/rules.d/ ; \
> + ? ? ? ? ? ? ? done ; \
> + ? ? ? fi;
> +endef
> +
> +XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_INSTALL_UDEV_RULES
> +endif # udev
> +
> +define XENOMAI_REMOVE_UDEV_RULES
> + ? ? ? if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
> + ? ? ? ? ? ? ? for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
> + ? ? ? ? ? ? ? ? ? ? ? rm -f $(TARGET_DIR)/etc/udev/rules.d/$$f ; \
> + ? ? ? ? ? ? ? done ; \
> + ? ? ? fi;
> +endef
> +
> +XENOMAI_POST_UNINSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UDEV_RULES
> +
> +$(eval $(call AUTOTARGETS,package,xenomai))
> diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
> index a3d53d4..71cd083 100644
> --- a/target/generic/device_table_dev.txt
> +++ b/target/generic/device_table_dev.txt
> @@ -141,3 +141,8 @@
>
> ?# I2C device nodes
> ?/dev/i2c- ? ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 89 ? ? ?0 ? ? ? 0 ? ? ? 1 ? ? ? 4
> +
> +# Xenomai
> +#/dev/rtheap ? ? c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 10 ? ? ?254 ? ? 0 ? ? ? 0 ? ? ? -
> +#/dev/rtscope ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 10 ? ? ?253 ? ? 0 ? ? ? 0 ? ? ? -
> +#/dev/rtp ? ? ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 150 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 32
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
