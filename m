From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 18:39:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/jsoncpp: Broken on musl
In-Reply-To: <1428750999-31816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428750999-31816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411163957.GK4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-11 13:16 +0200, Bernd Kuhls spake thusly:
> Also propagate to reverse dependency in sysdig,
> to keep bisectability do this in one commit.
> 
> Fixes compile error:
> 
> [ 16%] Building CXX object src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o
> In file included from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/xmmintrin.h:34:0,
>                  from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/x86intrin.h:31,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/x86_64-buildroot-linux-musl/bits/opt_random.h:33,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/random:50,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/bits/stl_algo.h:66,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/algorithm:62,
>                  from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:20:
> /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/mm_malloc.h:34:64: error: declaration of 'int posix_memalign(void**, size_t, size_t) throw ()' has a different exception specifier
>  extern "C" int posix_memalign (void **, size_t, size_t) throw ();
>                                                                 ^
> In file included from /home/fli4l/br3/output/build/jsoncpp-1.6.1/include/json/assertions.h:9:0,
>                  from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:7:
> /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/stdlib.h:98:5: error: from previous declaration 'int posix_memalign(void**, size_t, size_t)'
>  int posix_memalign (void **, size_t, size_t);
>      ^
> make[2]: *** [src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o] Error 1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Disable jsoncpp and reverse dependency with musl toolchain instead of patching gcc (Thomas)
>     FTR: gcc patches can be found here: http://patchwork.ozlabs.org/patch/460337/
> 
>  package/jsoncpp/Config.in |    2 ++
>  package/sysdig/Config.in  |    2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
> index 3ec02e1..a628598 100644
> --- a/package/jsoncpp/Config.in
> +++ b/package/jsoncpp/Config.in
> @@ -1,4 +1,5 @@
>  config BR2_PACKAGE_JSONCPP
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # posix_memalign
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	bool "jsoncpp"
>  	help
> @@ -11,4 +12,5 @@ config BR2_PACKAGE_JSONCPP
>  	  https://github.com/open-source-parsers/jsoncpp
>  
>  comment "jsoncpp needs a toolchain w/ C++"
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

This should be reflected in the test of the comment, too (even though we
do not have a documented way to say that). Here's what I'd suggest:

    comment "jsoncpp needs a (e)glibc or uClibc toolchain w/ C++"

>  	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 3d7ee67..d97aaf9 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSDIG
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_LUAJIT
>  	select BR2_PACKAGE_JSONCPP
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # jsoncpp
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_INSTALL_LIBSTDCPP # libjson
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> @@ -16,5 +17,6 @@ config BR2_PACKAGE_SYSDIG
>  	  http://sysdig.org
>  
>  comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

Ditto.

Regards,
Yann E. MORIN.

>  	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
