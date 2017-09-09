From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Sep 2017 18:08:31 +0200
Subject: [Buildroot] [PATCH] stella: fix build without threads support
In-Reply-To: <1504955136-10831-1-git-send-email-sergio.prado@e-labworks.com>
References: <1504955136-10831-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20170909160831.GB2850@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2017-09-09 08:05 -0300, Sergio Prado spake thusly:
> Fix build error when building using toolchain without threads support:
> 
> src/common/tv_filters/AtariNTSC.hxx:172:16: error: 'thread' is not a member of 'std'
>      unique_ptr<std::thread[]> myThreads;
>                      ^~~
> 
> Since version 5.0.2, Stella needs a toolchain with threads support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bd30388ee24294158d0a373764408c8c846853d4
> http://autobuild.buildroot.net/results/ad1571cecfc697650b436c147b5f3a1b4326091d
> http://autobuild.buildroot.net/results/10b73362358f3af45534a0cd096672dd1460a7d0
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/stella/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/stella/Config.in b/package/stella/Config.in
> index 959169726f37..639b9e4ae787 100644
> --- a/package/stella/Config.in
> +++ b/package/stella/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_STELLA
>  	bool "stella"
>  	depends on !BR2_STATIC_LIBS # sdl2
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>  	select BR2_PACKAGE_SDL2
>  	select BR2_PACKAGE_LIBPNG
> @@ -11,6 +12,7 @@ config BR2_PACKAGE_STELLA
>  
>  	  https://stella-emu.github.io/
>  
> -comment "stella needs a toolchain w/ dynamic library, C++, gcc >= 4.9"
> +comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 4.9"
>  	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -- 
> 1.9.1
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
