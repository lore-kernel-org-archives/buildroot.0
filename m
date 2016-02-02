From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 16:55:12 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/kodi: not available using a
 musl-based toolchain
In-Reply-To: <1454168886-30961-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454168886-30961-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0D160.5060500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 16:48, Bernd Kuhls wrote:
> The build stops with
> configure: error: unsupported host (i586-buildroot-linux-musl)
> due to musl not being supported in
> https://github.com/xbmc/xbmc/blob/Isengard/m4/xbmc_arch.m4
> 
> Removing this obstacle will show that musl is really not being
> supported, the build will fail:
> 
> In file included from emu_msvcrt.cpp:64:0:
> emu_msvcrt.h:93:3: error: ?__off64_t? does not name a type
>    __off64_t dll_lseeki64(int fd, __off64_t lPos, int iWhence);
>    ^
> emu_msvcrt.h:94:3: error: ?__off_t? does not name a type
>    __off_t dll_lseek(int fd, __off_t lPos, int iWhence);
>    ^
> 
> I know these problems are fixable and the voidlinux projects seems to
> have done it already for 15.2-Isengard:
> https://github.com/voidlinux/void-packages/tree/99f74705bc6520297d689fae4bcc9606c71ad34f/srcpkgs/kodi/patches
> 
> Since Kodi 16.0-Jarvis is already at rc1 stage and the 15.x-branch
> being closed upstream as "final"[1] version I will put no effort
> providing a musl-compilable package for the current Kodi package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
> v2: added explanation for Kodi not being available for musl (Thomas)
> 
>  package/kodi/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index e697b52..ed90ed6 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -2,10 +2,11 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	bool
>  	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
>  
> -comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
> +comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library"
>  	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> +		|| BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_USE_MMU
>  
>  config BR2_PACKAGE_KODI_EGL_GLES
> @@ -89,6 +90,7 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
>  	depends on BR2_USE_MMU # python
>  	depends on BR2_USE_WCHAR
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
