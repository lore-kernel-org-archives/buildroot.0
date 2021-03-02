From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Mar 2021 22:04:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/kismet: server needs wchar
In-Reply-To: <20210103142101.781654-1-fontaine.fabrice@gmail.com>
References: <20210103142101.781654-1-fontaine.fabrice@gmail.com>
Message-ID: <6f9e9d0b-49a7-8ebf-3e75-262060258d51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/01/2021 15:21, Fabrice Fontaine wrote:
> kismet embeds its own copy of fmt since version 2019-04-R1 so add a
> dependency on wchar to avoid the following build failure when building
> the server:
> 
> ./fmt/core.h:1245:1:
>  std::wstring vformat(wstring_view format_str, wformat_args args);
>  ^~~
> ./fmt/core.h:1266:13: error: 'wstring' in namespace 'std' does not name a type
>  inline std::wstring format(wstring_view format_str, const Args & ... args) {
>              ^~~~~~~
> ./fmt/core.h:1266:8: note: 'std::wstring' is defined in header '<string>'; did you forget to '#include <string>'?
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f19b3d080514a799a1c75b38ff5f7ae4e8d2628d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/kismet/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 02046e7efb..d9f8ebe03d 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -59,14 +59,16 @@ config BR2_PACKAGE_KISMET_SERVER
>  	default y
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>  	select BR2_PACKAGE_PROTOBUF
>  
> -comment "server needs a toolchain w/ dynamic library, gcc >= 4.8"
> +comment "server needs a toolchain w/ dynamic library, wchar, gcc >= 4.8"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  
>  comment "server needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
