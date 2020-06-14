From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 09:23:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhttpserver: needs gcc >= 5
In-Reply-To: <20200613195730.2028789-1-fontaine.fabrice@gmail.com>
References: <20200613195730.2028789-1-fontaine.fabrice@gmail.com>
Message-ID: <20200614072322.GA2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-13 21:57 +0200, Fabrice Fontaine spake thusly:
> libhtpserver uses the following constructor since version 0.18.0 and
> https://github.com/etr/libhttpserver/commit/9cdc90177e12902adf4063300fd688fcfdbe8168:
> 
> http_request(http_request&& b) noexcept = default;
> 
> This raises the following build failure on gcc 4.8:
> 
> In file included from http_request.cpp:22:0:
> httpserver/http_request.hpp:234:9: error: function 'httpserver::http_request::http_request(httpserver::http_request&&)' defaulted on its first declaration with an exception-specification that differs from the implicit declaration 'httpserver::http_request::http_request(httpserver::http_request&&)'
>          http_request(http_request&& b) noexcept = default;
>          ^
> 
> This build failure is due to the following gcc bug:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59526
> 
> Instead of adding BR2_TOOLCHAIN_HAS_GCC_BUG_59526, simply add a
> dependency on gcc >= 5
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/18a29056e0191d9f23e1f9c6f72b13c07d03b300/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after slightly extending the comment (C++11 PR59526),
and moving the dependency first (seems more logical than in the middle
of other toolchain features).

Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libhttpserver/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
> index 03715d0569..0261e866b4 100644
> --- a/package/libhttpserver/Config.in
> +++ b/package/libhttpserver/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBHTTPSERVER
>  	bool "libhttpserver"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBMICROHTTPD
>  	help
> @@ -11,5 +12,6 @@ config BR2_PACKAGE_LIBHTTPSERVER
>  
>  	  https://github.com/etr/libhttpserver
>  
> -comment "libhttpserver needs a toolchain w/ C++, threads"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 5"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
