From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 17:19:55 +0200
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <20171127104131.27975-4-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
Message-ID: <20180402171955.0d091a53@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 08:41:31 -0200, Carlos Santos wrote:
> Libvirt is collection of software that provides a convenient way to
> manage virtual machines and other virtualization functionality, such as
> storage and network interface management. These software pieces include
> an API library, a daemon (libvirtd), and a command line utility (virsh).
> 
> http://libvirt.org/
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

This is not a simple package. We did a review with Arnout, I'll try to
summarize the comments that we had. I'm sure I'll forget about those
comments though.

> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> new file mode 100644
> index 0000000000..8e64c85188
> --- /dev/null
> +++ b/package/libvirt/Config.in
> @@ -0,0 +1,44 @@
> +config BR2_PACKAGE_LIBVIRT
> +	bool "libvirt"
> +	depends on !BR2_PACKAGE_NETCAT

Why do we need this if you select nmap-ncat below ?

> +	depends on !BR2_STATIC_LIBS # libnl, lvm2
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, libtirpc
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	# configure: You must install the pciaccess module to build with udev
> +	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LVM2
> +	# use netcf, if possible, when udev is not available
> +	select BR2_PACKAGE_NETCF if !BR2_PACKAGE_HAS_UDEV && !BR2_arc && BR2_USE_WCHAR

I think it would be a bit easier to have the first patch introduced
only libvirt with udev support, it would avoid the netcf dependency,
the /dev/kvm fixup, lots of additional complexity. It can come in a
separate patch. This would make the whole thing easier to review.

> +	select BR2_PACKAGE_YAJL
> +	# run-time dependencies
> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
> +	select BR2_PACKAGE_DMIDECODE
> +	select BR2_PACKAGE_DNSMASQ
> +	select BR2_PACKAGE_IPTABLES
> +	select BR2_PACKAGE_IPROUTE2
> +	select BR2_PACKAGE_RADVD

Are all those dependencies mandatory in all situations ?

> diff --git a/package/libvirt/S30devkvmperms b/package/libvirt/S30devkvmperms
> new file mode 100755
> index 0000000000..8953256a03
> --- /dev/null
> +++ b/package/libvirt/S30devkvmperms
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +#
> +# Set the permissions of /dev/kvm
> +#
> +
> +start() {
> +	printf "Setting the ownership and permissions of /dev/kvm: "
> +	chown qemu:kvm /dev/kvm && chmod 660 /dev/kvm \
> +	&& echo "OK" || echo "FAIL"
> +}
> +
> +stop() {
> +	printf "Restoring the ownership and permissions of /dev/kvm: "
> +	chown root:root /dev/kvm && chmod 600 /dev/kvm \
> +	&& echo "OK" || echo "FAIL"

The stop part is probably useless, I don't see the point of restoring
the permissions.

> diff --git a/package/libvirt/S90libvirt b/package/libvirt/S90libvirt
> new file mode 100644
> index 0000000000..8ff43b4539
> --- /dev/null
> +++ b/package/libvirt/S90libvirt
> @@ -0,0 +1,139 @@
> +#!/bin/sh

Could this script be split in several init scripts, one per service,
and be made more similar to all other Buildroot init scripts ?

> +
> +my_name="$0"
> +
> +check_required_files() {
> +	[ -x "$1" ] || {
> +		echo "$my_name: $1 is missing"
> +		exit 1
> +	}
> +	[ -z "$2" ] || [ -f "$2" ] || {
> +		echo "$my_name: $2 is missing"
> +		exit 1
> +	}

This is not really good. I think we should simply not check the
existence of the executable. Maybe just check the existence of the
configuration file.

> +rm_stale_pidfile() {
> +	if [ -e "$1" ]; then
> +		exe="/proc/$(cat "$1")/exe"
> +		{ [ -s "$exe" ] && [ "$(readlink -f "$exe")" = "$2" ]; } || rm -f "$1"
> +	fi

Do we need that, with start-stop-daemon ?


> diff --git a/package/libvirt/device_table.txt b/package/libvirt/device_table.txt
> new file mode 100644
> index 0000000000..a0f155ef24
> --- /dev/null
> +++ b/package/libvirt/device_table.txt
> @@ -0,0 +1,39 @@
> +# See package/makedevs/README for details
> +#
> +# Libvirt directories ownership and permissions
> +#
> +# <name>				<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
> +/etc/libvirt				d	700	0	0	-	-	-	-	-
> +/etc/libvirt/nwfilter			d	700	0	0	-	-	-	-	-
> +/etc/libvirt/qemu			d	700	0	0	-	-	-	-	-
> +/etc/libvirt/qemu/autostart		d	700	0	0	-	-	-	-	-
> +/etc/libvirt/qemu/networks		d	700	0	0	-	-	-	-	-
> +/etc/libvirt/qemu/networks/autostart	d	700	0	0	-	-	-	-	-
> +/etc/libvirt/storage			d	755	0	0	-	-	-	-	-
> +/etc/libvirt/storage/autostart		d	755	0	0	-	-	-	-	-
> +/run/libvirt				d	755	0	0	-	-	-	-	-
> +/run/libvirt/hostdevmgr			d	755	0	0	-	-	-	-	-
> +/run/libvirt/network			d	755	0	0	-	-	-	-	-
> +/run/libvirt/qemu			d	755	0	0	-	-	-	-	-
> +/run/libvirt/storage			d	755	0	0	-	-	-	-	-
> +/var/lib/libvirt			d	755	0	0	-	-	-	-	-
> +/var/lib/libvirt/boot			d	711	0	0	-	-	-	-	-
> +/var/lib/libvirt/dnsmasq		d	755	0	0	-	-	-	-	-
> +/var/lib/libvirt/filesystems		d	711	0	0	-	-	-	-	-
> +/var/lib/libvirt/images			d	711	0	0	-	-	-	-	-
> +/var/lib/libvirt/network		d	700	0	0	-	-	-	-	-
> +/var/lib/libvirt/qemu			d	751	107	36	-	-	-	-	-
> +/var/lib/libvirt/qemu/channel		d	755	107	36	-	-	-	-	-
> +/var/lib/libvirt/qemu/channel/target	d	755	107	36	-	-	-	-	-
> +/var/lib/libvirt/qemu/dump		d	755	107	36	-	-	-	-	-
> +/var/lib/libvirt/qemu/nvram		d	755	107	36	-	-	-	-	-
> +/var/lib/libvirt/qemu/save		d	755	107	36	-	-	-	-	-
> +/var/lib/libvirt/qemu/snapshot		d	755	107	36	-	-	-	-	-
> +# These are lost if /var/cache and/or /var/log are mounted on a tmpfs but they are harmless, anyway
> +/var/cache/libvirt			d	711	0	0	-	-	-	-	-
> +/var/cache/libvirt/lxc			d	750	0	0	-	-	-	-	-
> +/var/cache/libvirt/qemu			d	750	107	36	-	-	-	-	-
> +/var/cache/libvirt/qemu/capabilities	d	755	0	0	-	-	-	-	-
> +/var/log/libvirt			d	700	0	0	-	-	-	-	-
> +/var/log/libvirt/lxc			d	750	0	0	-	-	-	-	-
> +/var/log/libvirt/qemu			d	750	107	36	-	-	-	-	-

Most of these entries don't need to be in a device table, they don't
adjust ownership/permissions.

For the remaining ones, using names for <uid> and <gid> is possible
since commit 95dda394d9f2487d54c6ec529c3f9a7fd341a582, so it would be
good to do that. This avoids the need to hardcode a fixed uid/gid.

> diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
> new file mode 100644
> index 0000000000..389a3c1670
> --- /dev/null
> +++ b/package/libvirt/libvirt.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256 4e7bcb209eeef99f026484293abc733e30ed06dabcdde62c4c3e95f71b2b67ba  libvirt-3.7.0.tar.xz

Hash for the license file would be nice.


> +# the interface driver requires either udev or netcf
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +LIBVIRT_CONF_OPTS += --with-udev --without-netcf --with-interface
> +LIBVIRT_DEPENDENCIES += udev
> +define LIBVIRT_INSTALL_UDEV_RULES
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/udev/rules.d
> +	echo 'KERNEL=="kvm", OWNER="root", GROUP="kvm", MODE="0660"' > \
> +		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules

Please have a file in package/libvirt/ with this udev rule, and install
it in $(TARGET_DIR)/etc/udev/rules.d rather than doing this echo.

> +endef
> +LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
> +LIBVIRT_INIT_DEV_KVM_PERMS =
> +else
> +# No udev, so we need an init script to set the permissions of /dev/kvm.
> +LIBVIRT_INIT_DEV_KVM_PERMS = package/libvirt/S30devkvmperms
> +ifeq ($(BR2_PACKAGE_NETCF),y)
> +LIBVIRT_CONF_OPTS += --with-netcf --without-udev --with-interface
> +LIBVIRT_DEPENDENCIES += netcf
> +else
> +LIBVIRT_CONF_OPTS += --without-udev --without-netcf --without-interface
> +endif
> +endif

As I said, this could be simplified in a first commit, if only the udev
case was supported.

> +
> +ifeq ($(BR2_PACKAGE_LIBVIRT),y)
> +BR2_ROOTFS_DEVICE_TABLE += package/libvirt/device_table.txt

Maybe with the device table becoming shorter with the comment I made
above, you can put it back in the .mk file ?

> +endif
> +
> +define LIBVIRT_USERS
> +	qemu 107 kvm 36 * - - - Libvirt qemu/kvm daemon

With the comment made above, you could use -1 and -1 as uid and gid.

> +define LIBVIRT_SET_USER_GROUP
> +	sed -i -e 's/^#user = "root"/user = "qemu"/;s/^#group = "root"/group = "kvm"/' \
> +		$(TARGET_DIR)/etc/libvirt/qemu.conf

Use $(SED). It's however strange that libvirt installs qemu.conf with
values that don't match --with-qemu-user and --with-qemu-group
configuration options.

> +endef
> +
> +LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_SET_USER_GROUP
> +
> +# S90, to start after S40network, S50radvd and S80dnsmasq
> +define LIBVIRT_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 -t $(TARGET_DIR)/etc/init.d \
> +		$(LIBVIRT_INIT_DEV_KVM_PERMS) package/libvirt/S90libvirt
> +endef

I'd rather have a variable called LIBVIRT_INSTALL_KVMPERMS_INIT_SCRIPT
that does:
	$(INSTALL) -D -m 0755 package/libvirt/S30devkvmperms \
		$(TARGET_DIR)/etc/init.d/S30devkvmperms

and then do:

define LIBVIRT_INSTALL_INIT_SYSV
	$(LIBVIRT_INSTALL_KVMPERMS_INIT_SCRIPT)
	$(INSTALL) -D -m 0755 package/libvirt/S90libvirt \
		$(TARGET_DIR)/etc/init.d/S90libvirt
endef

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
