From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Aug 2015 22:08:36 +0200
Subject: [Buildroot] [PATCH 5/9] libsigrok: depends on gcc >= 4.7
In-Reply-To: <1438711241-31792-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150804200835.GX3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-04 20:00 +0200, Thomas Petazzoni spake thusly:
> Until recently, only the C++ bindings of libsigrok needed a recent
> compiler because they are written in C++11. However, now, libsigrok
> itself is written in C11, which is only available since gcc 4.7.

Here are a few autobuild failures for this:  ;-)
    http://autobuild.buildroot.org/results/1d7/1d75497009f1e3b06236b3409fd768dcf7956b87/
    http://autobuild.buildroot.org/results/563/563378e3f6320980153c8c972ceba5e913fe933f/

With those added to the commit log;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Note that I have not even attempted to build it with a gcc-4.7 to
validate. This is only a review...

Regards,
Yann E. MORIN.

> So, this commit replaces the CodeSourcery-specific exclusions by a
> proper dependency on gcc >= 4.7.
> 
> The sigrok-cli and pulseview packages, which select libsigrok, are
> also updated accordingly.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libsigrok/Config.in  | 11 ++++-------
>  package/pulseview/Config.in  |  9 +++------
>  package/sigrok-cli/Config.in |  6 ++++--
>  3 files changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
> index 8bd7d99..6ef3776 100644
> --- a/package/libsigrok/Config.in
> +++ b/package/libsigrok/Config.in
> @@ -6,6 +6,8 @@ config BR2_PACKAGE_LIBSIGROK
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
> +	# std=c11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  Libsigrok is a shared library written in C, which provides
>  	  the basic hardware access drivers for logic analyzers and
> @@ -22,20 +24,15 @@ config BR2_PACKAGE_LIBSIGROKCXX
>  	bool "build C++ bindings"
>  	select BR2_PACKAGE_GLIBMM
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	# CS powerpc g++ are too old. libsigrokcxx needs C++11
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
> -		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	help
>  	  Build libsigrok C++ bindings as well.
>  
>  comment "C++ bindings need a toolchain w/ C++"
>  	depends on BR2_PACKAGE_LIBSIGROK
>  	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
> -		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  
>  endif
>  
> -comment "libsigrok needs a toolchain w/ wchar, threads"
> +comment "libsigrok needs a toolchain w/ wchar, threads, gcc >= 4.7"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
> index 2fb844b..e6ddc21 100644
> --- a/package/pulseview/Config.in
> +++ b/package/pulseview/Config.in
> @@ -17,18 +17,15 @@ config BR2_PACKAGE_PULSEVIEW
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
>  	# libsigrok
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
> -		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  PulseView is a Qt based logic analyzer, oscilloscope
>  	  and MSO GUI for sigrok.
>  
>  	  http://sigrok.org/wiki/PulseView
>  
> -comment "pulseview needs a toolchain w/ wchar, threads, C++"
> +comment "pulseview needs a toolchain w/ wchar, threads, C++, gcc >= 4.7"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_QT5
>  	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
> -		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
> index 4e7f137..b8eb60d 100644
> --- a/package/sigrok-cli/Config.in
> +++ b/package/sigrok-cli/Config.in
> @@ -5,12 +5,14 @@ config BR2_PACKAGE_SIGROK_CLI
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
> +	# libsigrok
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  Sigrok-cli is a command-line frontend for the sigrok
>  	  software suite.
>  
>  	  http://sigrok.org/wiki/Sigrok-cli
>  
> -comment "sigrok-cli needs a toolchain w/ wchar, threads"
> +comment "sigrok-cli needs a toolchain w/ wchar, threads, gcc >= 4.7"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> -- 
> 2.5.0
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
