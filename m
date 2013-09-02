From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 23:32:08 +0200
Subject: [Buildroot] [PATCH 5/5] kmod: does not support static builds
In-Reply-To: <1376996584-4462-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 Aug 2013 13:03:04 +0200")
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uze9ag7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since kmod 14, the support for building a static library has been
 Thomas> removed completely from kmod. Therefore, we mark kmod as
 Thomas> !BR2_PREFER_STATIC_LIB, as well as all its reverse dependencies, which
 Thomas> includes the option to use the "udev" /dev management method.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/kmod/Config.in | 1 +
 Thomas>  package/udev/Config.in | 1 +
 Thomas>  system/Config.in       | 1 +
 Thomas>  3 files changed, 3 insertions(+)

 Thomas> diff --git a/package/kmod/Config.in b/package/kmod/Config.in
 Thomas> index 4965237..bd44316 100644
 Thomas> --- a/package/kmod/Config.in
 Thomas> +++ b/package/kmod/Config.in
 Thomas> @@ -1,5 +1,6 @@
 Thomas>  config BR2_PACKAGE_KMOD
 Thomas>  	bool "kmod"
 Thomas> +	depends on !BR2_PREFER_STATIC_LIB
 Thomas>  	help
 Thomas>  	  handle kernel modules
 
 Thomas> diff --git a/package/udev/Config.in b/package/udev/Config.in
 Thomas> index dd5ad7b..d4d97c1 100644
 Thomas> --- a/package/udev/Config.in
 Thomas> +++ b/package/udev/Config.in
 Thomas> @@ -3,6 +3,7 @@ config BR2_PACKAGE_UDEV
 Thomas>  	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 Thomas>  	depends on BR2_LARGEFILE # util-linux
 Thomas>  	depends on BR2_USE_WCHAR # util-linux
 Thomas> +	depends on !BR2_PREFER_STATIC_LIB # kmod
 Thomas>  	select BR2_PACKAGE_UTIL_LINUX
 Thomas>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 Thomas>  	select BR2_PACKAGE_KMOD
 Thomas> diff --git a/system/Config.in b/system/Config.in
 Thomas> index d41f184..55195e0 100644
 Thomas> --- a/system/Config.in
 Thomas> +++ b/system/Config.in
 Thomas> @@ -84,6 +84,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 Thomas>  	bool "Dynamic using udev"
 Thomas>  	depends on BR2_LARGEFILE # udev
 Thomas>  	depends on BR2_USE_WCHAR # udev
 Thomas> +	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
 Thomas>  	select BR2_PACKAGE_UDEV
 
 Thomas>  comment "udev requires a toolchain with LARGEFILE + WCHAR support"

The dependency between udev handling and !BR2_PREFER_STATIC_LIB isn't
directly obvious to users, so I've added a comment - Similar to how we
do it for toolchain options.

Committed with that added, thanks.

-- 
Bye, Peter Korsgaard
