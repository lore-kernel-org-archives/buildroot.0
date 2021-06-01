From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:48:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: disable on riscv32
In-Reply-To: <20210528053443.640308-1-fontaine.fabrice@gmail.com>
References: <20210528053443.640308-1-fontaine.fabrice@gmail.com>
Message-ID: <5eca1cbd-e344-f4a4-59e0-fb4f549254bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 07:34, Fabrice Fontaine wrote:
> vlc unconditionally uses __NR_futex resulting in the following build
> failure on riscv32:
> 
> linux/thread.c:53:20: error: '__NR_futex' undeclared (first use in this function)
>    53 |     return syscall(__NR_futex, addr, op, val, to, addr2, val3);
>       |                    ^~~~~~~~~~
> 

 I added a comment that the upstream patch is rejected and applied to master,
thanks.

 Regards,
 Arnout

> Fixes:
>  - http://autobuild.buildroot.org/results/be0f2243919d7a052b33118d8a901c922f8d88e7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vlc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index 96ff8f2fcb..964b7660af 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_VLC
>  	bool "vlc"
> +	depends on !BR2_RISCV_32
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS
> @@ -23,6 +24,7 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
>  	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
>  
>  comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7"
> +	depends on !BR2_RISCV_32
>  	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
>  		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
> 
