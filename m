From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jan 2016 23:55:27 +0100
Subject: [Buildroot] [PATCH 4/8] vlc: remove dependency on C library
In-Reply-To: <1453148701-10036-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A6A7DF.1080607@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> vlc uses <spawn.h> which was not available in old uClibc
> versions. However, since we are removing support for uClibc 0.9.33, we
> can get rid of such dependency. In addition, <spawn.h> is provided by
> musl, and therefore VLC can be enabled with this C library.
> 
> Consequently, this commit completely removes any C library dependency
> for the vlc package. The only special case that needs to be handled is
> the Blackfin external toolchain from Analog Devices, which still uses
> an old uClibc version that doesn't provide <spawn.h>.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Build tested on a x86_64 musl toolchain.
Tested-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/vlc/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index 03e85c3..cad21e2 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -5,12 +5,12 @@ endif
>  
>  config BR2_PACKAGE_VLC
>  	bool "vlc"
> -	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
>  	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
>  	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
> @@ -32,7 +32,7 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
>  	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
>  
> -comment "vlc needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
> -	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
> -		|| !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
> +comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> 
