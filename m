From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 00:10:11 +0200
Subject: [Buildroot] [PATCH v7 1/1] package/libvirt: new package
In-Reply-To: <20200630211641.16926-1-jared.bents@rockwellcollins.com>
References: <20200630211641.16926-1-jared.bents@rockwellcollins.com>
Message-ID: <20200828001011.786687a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jared,

On Tue, 30 Jun 2020 16:16:41 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> Libvirt is collection of software that provides a convenient way to
> manage virtual machines and other virtualization functionality, such as
> storage and network interface management. These software pieces include
> an API library, a daemon (libvirtd), and a command line utility (virsh).
> 
>    http://libvirt.org/
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

So, I was having a look at this package, which has been waiting for too
long. I think one thing that is holding off the package from being
merged is that this patch is quite long, and doing a lot of things. Do
you think it would be possible to split it into several parts ? For
example, the qemu and lxc support could be additional patches. Even
perhaps the init scripts could be added separately, since they are
non-trivial and will need their own discussion. This would help get the
base libvirt package merged, and then discuss on top of each it each
addition separately.

Would this make sense?

I've nevertheless spotted a few things, see below.

> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> new file mode 100644
> index 0000000000..2a82c3146d
> --- /dev/null
> +++ b/package/libvirt/Config.in
> @@ -0,0 +1,111 @@
> +config BR2_PACKAGE_LIBVIRT
> +	bool "libvirt"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64 # dmidecode
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_GNUTLS

gnutls has:

	depends on !BR2_STATIC_LIBS
	depends on BR2_USE_WCHAR

which you need to propagate here.

> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

libtirpc has a BR2_TOOLCHAIN_HAS_THREADS dependency

> +	# configure: You must install the pciaccess module to build with udev
> +	select BR2_PACKAGE_LIBPCIACCESS
> +	select BR2_PACKAGE_LIBGLIB2

libglib2 has BR2_TOOLCHAIN_HAS_THREADS, BR2_USE_WCHAR dependencies.

> +	select BR2_PACKAGE_LIBXML2
> +	# run-time dependencies
> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
> +	select BR2_PACKAGE_DMIDECODE

It feels odd that it requires dmidecode. Is it really true ?

If so, could you add a BR2_PACKAGE_DMIDECODE_ARCH_SUPPORTS, use it in
package/dmidecode/Config.in and package/collectd/Config.in.

Then, in libvirt, you can do:

config BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
	bool
	default y if BR2_PACKAGE_DMIDECODE_ARCH_SUPPORTS

you will see later why.

> +if BR2_PACKAGE_LIBVIRT
> +
> +# The daemon requires remote support.

I am not sure what this means / how this comment is useful.

> +config BR2_PACKAGE_LIBVIRT_DAEMON
> +	bool "libvirtd"
> +	default y
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

Can we turn this into a "select" ?

> +	select BR2_PACKAGE_DNSMASQ
> +	select BR2_PACKAGE_EBTABLES
> +	select BR2_PACKAGE_IPTABLES
> +	select BR2_PACKAGE_IPROUTE2

iproute2 needs kernel headers >= 3.4

> +	# These are required because there is no way to unequivocally select a modern netcat
> +	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
> +	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
> +	select BR2_PACKAGE_RADVD
> +	help
> +	  Build the libvirt daemon (libvirtd) otherwise build only the
> +	  utility programs.
> +
> +# Stateful drivers are useful only when building the daemon.
> +if BR2_PACKAGE_LIBVIRT_DAEMON
> +
> +config BR2_PACKAGE_LIBVIRT_QEMU
> +	bool "qemu"
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp->qemu
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12  # libseccomp->qemu

I'm not sure what you mean by "libseccomp->qemu". These two
dependencies are needed by libseccomp, and that's it.

> +	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
> +	select BR2_PACKAGE_HWDATA         # libpciaccess->qemu
> +	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess->qemu

Not clear what the comments libpciaccess->qemu mean here.

> +	select BR2_PACKAGE_LIBSECCOMP
> +	select BR2_PACKAGE_QEMU
> +	select BR2_PACKAGE_QEMU_SYSTEM if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
> +	select BR2_PACKAGE_YAJL
> +	help
> +	  QEMU/KVM support
> +
> +comment "qemu is not supported on this architecture"
> +	depends on !BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET \
> +		|| !BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS

We normally don't put comments about architecture dependencies.

> +config BR2_PACKAGE_LIBVIRT_LXC
> +	bool "lxc"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc

LXC also needs headers >= 3.0, which you capture properly in the comment below.

> +	select BR2_PACKAGE_LXC
> +	help
> +	  Linux Container support
> +
> +comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

The comment doesn't match the actual dependencies.

> +endif
> +
> +comment "libvirtd needs 'nmap-ncat' or 'netcat-openbsd'"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +
> +comment "libvirtd needs 'nmap-ncat' or 'netcat-openbsd' but netcat is selected"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_NETCAT

Why do we need those comments ? Aren't you already ensuring above using
the NMAP_NCAT select that you will have a good enough netcat
implementation ?

> +endif
> +
> +comment "libvirt needs udev /dev management"
> +	depends on BR2_USE_MMU

You need:

	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS

here.

> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
> +comment "libvirt needs a toolchain w/ headers >= 3.12"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on !BR2_PACKAGE_NETCAT
> +	depends on !BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12

Why is libseccomp coming into play here ? And netcat ? The kernel
headers dependencies are normally listed together with the comment
below.

> +
> +comment "libvirt needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on !BR2_PACKAGE_NETCAT
> +	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || \
> +		!BR2_TOOLCHAIN_HAS_THREADS

So here you have the threads dependency, but this dependency does not
exist on the top level BR2_PACKAGE_LIBVIRT option. Ditto for
BR2_STATIC_LIBS.

To me, this is another sign that this patch is doing too much stuff at
once: we can hardly verify that all those dependencies are correct.

> diff --git a/package/libvirt/S91virtlogd b/package/libvirt/S91virtlogd
> new file mode 100644
> index 0000000000..03d17b5dbd
> --- /dev/null
> +++ b/package/libvirt/S91virtlogd

This init script looks reasonable to me.

> diff --git a/package/libvirt/S92libvirtd b/package/libvirt/S92libvirtd
> new file mode 100644
> index 0000000000..736519f3d0
> --- /dev/null
> +++ b/package/libvirt/S92libvirtd

This one feels a lot more custom/specific, with the module loading
logic, the dnsmasq handling, etc. Having the libvirt init script do
start-stop-daemon actions on dnsmasq feels odd.

Again, I believe this is trying to solve too many problems in one-go.

> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> new file mode 100644
> index 0000000000..c7ee5dbed3
> --- /dev/null
> +++ b/package/libvirt/libvirt.mk
> @@ -0,0 +1,389 @@
> +################################################################################
> +#
> +# libvirt
> +#
> +################################################################################
> +
> +LIBVIRT_VERSION = 6.4.0
> +LIBVIRT_SITE = https://libvirt.org/sources
> +LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
> +LIBVIRT_LICENSE = LGPL-2.1+
> +LIBVIRT_LICENSE_FILES = COPYING
> +LIBVIRT_DEPENDENCIES = \
> +	host-nfs-utils \
> +	host-python-docutils \
> +	gnutls \
> +	libxml2 \
> +	libglib2 \
> +	udev

You're selecting libpciaccess but not depending on it here ?

> +LIBVIRT_CONF_OPTS = \
> +	--disable-rpath \
> +	--without-apparmor \
> +	--without-bhyve \
> +	--without-dtrace \
> +	--without-esx \
> +	--without-firewalld \
> +	--without-firewalld-zone \
> +	--without-glusterfs \
> +	--without-hal \
> +	--with-host-validate \
> +	--without-hyperv \
> +	--with-init-script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
> +	--with-interface \
> +	--without-libxl \
> +	--without-login-shell \
> +	--without-netcf \
> +	--without-numad \
> +	--without-openwsman \
> +	--without-openvz \
> +	--without-phyp \
> +	--without-pm-utils \
> +	--with-remote \
> +	--without-sanlock \
> +	--without-secdriver-apparmor \
> +	--with-secrets \
> +	--without-storage-mpath \
> +	--without-storage-iscsi \
> +	--without-storage-iscsi-direct \
> +	--with-sysctl \
> +	--without-test-suite \
> +	--with-udev \

So there is a way to get going without udev ?


> +ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
> +LIBVIRT_CONF_OPTS += --with-pciaccess
> +LIBVIRT_DEPENDENCIES += libpciaccess
> +else
> +LIBVIRT_CONF_OPTS += --without-pciaccess
> +endif

Ah, so libpciaccess is an optional dependency in the end ?

> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +LIBVIRT_CONF_OPTS += --with-selinux --with-secdriver-selinux
> +LIBVIRT_DEPENDENCIES += libselinux
> +else
> +LIBVIRT_CONF_OPTS += --without-selinux --with-selinux-mount=/sys/fs/selinux \

You're providing the SELinux mount path when selinux is disabled ?

> +define LIBVIRT_INSTALL_UDEV_RULES
> +	$(INSTALL) -D -m 644 package/libvirt/90-kvm.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules
> +endef
> +LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
> +
> +define LIBVIRT_FIX_PO_MAKEFILE_IN_IN
> +	test ! -f $(@D)/po/Makefile.in.in || \
> +	$(SED) 's/GETTEXT_MACRO_VERSION = 0.17/GETTEXT_MACRO_VERSION = @GETTEXT_MACRO_VERSION@/' \
> +		$(@D)/po/Makefile.in.in
> +endef

This probably needs a comment.

> +LIBVIRT_PRE_PATCH_HOOKS += LIBVIRT_FIX_PO_MAKEFILE_IN_IN
> +
> +# Adjust diretory ownerships and permissions. Notice /var/log is a symlink to
> +# /tmp in the default sysvinit skeleton, so some directories may disappear at
> +# run-time. Set the permissions anyway, since they are valid for the default
> +# systemd skeleton.
> +define LIBVIRT_PERMISSIONS
> +	/etc/libvirt                             d  700  root  root  -  -  -  -  -
> +	/etc/libvirt/nwfilter                    d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt                         d  755  root  root  -  -  -  -  -
> +	/var/lib/libvirt/boot                    d  711  root  root  -  -  -  -  -
> +	/var/lib/libvirt/dnsmasq                 d  755  root  root  -  -  -  -  -
> +	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
> +	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
> +	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
> +	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
> +	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
> +	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
> +	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
> +	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
> +	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
> +	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
> +	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
> +	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
> +	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
> +	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
> +	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
> +	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
> +endef
> +
> +# libvirt may need to create persistent files (e.g. VM definitions) in these
> +# directories. Move them to /var/lib because /etc may be on a read-only or
> +# volatile (initramfs) filesystem. We could tweak the code to change these
> +# paths but the patch would be large and would break compatibility with
> +# ordinary installations and with the documentation.
> +define LIBVIRT_CREATE_SYMLINKS
> +	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
> +	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
> +	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
> +	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
> +	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
> +	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
> +endef
> +
> +LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
> +
> +# Remove directories that conflict with the default skeleton. They will be
> +# created by the daemon at run-time.
> +define LIBVIRT_PURGE_TMPDIR
> +	rm -rf $(TARGET_DIR)/var/{cache,log,run}/libvirt
> +endef

I'm a bit confusing here, since you're setting permissions for
/var/cache/libvirt and /var/log/libvirt in LIBVIRT_PERMISSIONS.

> +
> +LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_PURGE_TMPDIR
> +
> +ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
> +define LIBVIRT_USERS
> +	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon

Is it sensible for something called "libvirt" to create a user named
"qemu" in a group named "kvm" ? Is it the typically installation
strategy of libvirt on other systems ?

> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
> +define LIBVIRT_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
> +	$(INSTALL) -m 755 -t $(TARGET_DIR)/etc/init.d \
> +		package/libvirt/S91virtlogd \
> +		package/libvirt/S92libvirtd

I'd prefer our traditional:

	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
	$(INSTALL) -D -m 0755 package/libvirt/S92libvirtd $(TARGET_DIR)/etc/init.d/S92libvirtd

> +endef
> +define LIBVIRT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -s -f ../../../../usr/lib/systemd/system/libvirtd.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/libvirtd.service
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
> +	ln -s -f ../../../../usr/lib/systemd/system/virtlockd.socket \
> +		../../../../usr/lib/systemd/system/virtlogd.socket \
> +		../../../../usr/lib/systemd/system/libvirtd.socket \
> +		../../../../usr/lib/systemd/system/libvirtd-ro.socket \
> +		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants

I think this is no longer needed now that we have SYSTEMD_PRESET_ALL
that gets called at the end of the build.

As suggested, could you split up that patches into simpler chunks so
that we can make progress in the review and merging ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
