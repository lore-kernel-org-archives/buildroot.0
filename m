From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 29 Oct 2014 09:35:44 +0100
Subject: [Buildroot] [PATCH] Revert "package/libcap: Fix build error
 with kernel headers < 3.6"
In-Reply-To: <1414445712-26011-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414445712-26011-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141029093544.7fb84bf9@PAL-U515208D001>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 27 Oct 2014 22:35:12 +0100, Thomas Petazzoni wrote :
> This reverts commit a759931c9b0cb4337dc30fd35d03ce123271c5a4.
> 
> This commit is wrong, for multiple reasons:
> 
>  * First, the XATTR_NAME_CAPS was *not* introduced in kernel 3.7 has
>    claimed by the commit log. The kernel commit
>    https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/linux/xattr.h?id=607ca46e97a1b6594b29647d98a32d545c24bdff
>    pointed by the commit log as the one introducing XATTR_NAME_CAPS
>    was badly interpreted. This commit is the one where the userspace
>    side of the kernel headers was separated from the kernel side of
>    the kernel headers (before we had only <linux/foo.h>, now we have
>    <linux/foo.h> and <uapi/linux/foo.h>). In reality, XATTR_CAP_NAMES
>    has been defined in <linux/xattr.h> since commit
>    af4f136056c984b0aa67feed7d3170b958370b2f which was merged in
>    2.6.36. And before that, the definition was anyway present in
>    <linux/capability.h>. XATTR_NAME_CAPS was originally introduced in
>    b53767719b6cd8789392ea3e7e2eb7b8906898f0, which was merged in
>    kernel 2.6.24.
> 
>  * Second, the libcap package builds just fine with the toolchain that
>    caused the build failure at
>    http://autobuild.buildroot.net/results/cce/cceb1ccacec36fb7ef41bb7cdb13b3014813b599/. Take
>    the simple defconfig that follows:
> 
>    BR2_powerpc=y
>    BR2_TOOLCHAIN_EXTERNAL=y
>    BR2_PACKAGE_LIBCAP=y
> 
>    Which is the exact same toolchain as the one used in the
>    autobuilder test, and you will see that it builds libcap just fine.
> 
> So instead, the real problem seems to be some interaction with another
> package built before, or a parallel build issue. But clearly, adding
> the dependency on 3.7 kernel headers is not the correct solution for
> this issue.

Tested-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

I built libcap, cdrkit and lxc with an external toolchain with 3.0
kernel headers:

BR2_x86_64=y
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0=y
BR2_PACKAGE_CDRKIT=y
BR2_PACKAGE_LIBCAP=y
BR2_PACKAGE_LXC=y

Best regards,

> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/cdrkit/Config.in  | 5 ++---
>  package/libcap/Config.in  | 4 ----
>  package/lxc/Config.in     | 6 ++----
>  package/squid/Config.in   | 6 ++----
>  package/systemd/Config.in | 1 -
>  5 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
> index cfbddb8..9ba5dbf 100644
> --- a/package/cdrkit/Config.in
> +++ b/package/cdrkit/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_CDRKIT
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_LIBCAP
>  	depends on BR2_LARGEFILE
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
>  	depends on BR2_USE_MMU # fork
>  	bool "cdrkit"
>  	help
> @@ -13,6 +12,6 @@ config BR2_PACKAGE_CDRKIT
>  
>  	  http://www.cdrkit.org/
>  
> -comment "cdrkit needs a toolchain w/ largefile, headers >= 3.7"
> +comment "cdrkit needs a toolchain w/ largefile"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	depends on !BR2_LARGEFILE
> diff --git a/package/libcap/Config.in b/package/libcap/Config.in
> index a019928..5b0c827 100644
> --- a/package/libcap/Config.in
> +++ b/package/libcap/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_LIBCAP
>  	bool "libcap"
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>  	help
>  	  This library implements the user-space interfaces to the
>  	  POSIX 1003.1e capabilities available in Linux kernels. These
> @@ -23,6 +22,3 @@ config BR2_PACKAGE_LIBCAP_TOOLS
>  	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
>  
>  endif
> -
> -comment "libcap needs headers >= 3.7"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> diff --git a/package/lxc/Config.in b/package/lxc/Config.in
> index bae83b9..3eae64a 100644
> --- a/package/lxc/Config.in
> +++ b/package/lxc/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_LXC
>  	select BR2_PACKAGE_LIBCAP
>  	depends on BR2_INET_IPV6
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
>  	depends on BR2_LARGEFILE
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_avr32 # no timerfd
> @@ -15,9 +14,8 @@ config BR2_PACKAGE_LXC
>  
>  	  https://linuxcontainers.org/
>  
> -comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.7"
> +comment "lxc needs a toolchain w/ IPv6, threads, largefile"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_avr32 # no timerfd
>  	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
> -	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
> diff --git a/package/squid/Config.in b/package/squid/Config.in
> index 4fadd04..ad9fab5 100644
> --- a/package/squid/Config.in
> +++ b/package/squid/Config.in
> @@ -1,14 +1,12 @@
> -comment "squid needs a toolchain w/ C++, IPv6, headers >= 3.7"
> +comment "squid needs a toolchain w/ C++, IPv6"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_avr32 # toolchain too old
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
>  
>  config BR2_PACKAGE_SQUID
>  	bool "squid"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_INET_IPV6
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
>  	# needs fork()
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_LIBCAP
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index be28975..58f76a5 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -15,7 +15,6 @@ config BR2_PACKAGE_SYSTEMD
>  	depends on BR2_INET_IPV6
>  	depends on !BR2_PREFER_STATIC_LIB # kmod
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
>  	depends on BR2_USE_MMU # dbus
>  	select BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_DBUS # runtime dependency only


-- 
Christophe Vu-Brugier
