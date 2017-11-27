From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Nov 2017 13:47:09 +0200
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <20171127104131.27975-4-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
Message-ID: <20171127114709.x4jo7de3qo5q2g4q@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Mon, Nov 27, 2017 at 08:41:31AM -0200, Carlos Santos wrote:
> Libvirt is collection of software that provides a convenient way to
> manage virtual machines and other virtualization functionality, such as
> storage and network interface management. These software pieces include
> an API library, a daemon (libvirtd), and a command line utility (virsh).
> 
> http://libvirt.org/
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> new file mode 100644
> index 0000000000..8e64c85188
> --- /dev/null
> +++ b/package/libvirt/Config.in
> @@ -0,0 +1,44 @@
> +config BR2_PACKAGE_LIBVIRT
> +	bool "libvirt"
> +	depends on !BR2_PACKAGE_NETCAT
> +	depends on !BR2_STATIC_LIBS # libnl, lvm2

libnl does not depend on !BR2_STATIC_LIBS.

baruch

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
> +	select BR2_PACKAGE_YAJL
> +	# run-time dependencies
> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
> +	select BR2_PACKAGE_DMIDECODE
> +	select BR2_PACKAGE_DNSMASQ
> +	select BR2_PACKAGE_IPTABLES
> +	select BR2_PACKAGE_IPROUTE2
> +	select BR2_PACKAGE_RADVD
> +	# These are required because there is no way to unequivocally select a modern netcat
> +	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
> +	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
> +	help
> +	  Libvirt is collection of software that provides a convenient
> +	  way to manage virtual machines and other virtualization
> +	  functionality, such as storage and network interface
> +	  management. These software pieces include an API library, a
> +	  daemon (libvirtd), and a command line utility (virsh).
> +
> +	  http://libvirt.org/
> +
> +comment "libvirt needs 'nmap-ncat' or 'netcat-openbsd' but netcat is selected"
> +	depends on BR2_PACKAGE_NETCAT
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +
> +comment "libvirt needs a glibc or uClibc toolchain w/ threads, dynamic library"
> +        depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
