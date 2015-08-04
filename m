From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Aug 2015 22:12:58 +0200
Subject: [Buildroot] [PATCH 7/9] zmqpp: update to use the gcc version
 dependency mechanism
In-Reply-To: <1438711241-31792-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150804201258.GZ3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-04 20:00 +0200, Thomas Petazzoni spake thusly:
> This commit updates the zmqpp Config.in file to use the newly
> introduced gcc version dependency mechanism to depend on gcc >= 4.6
> instead of open-coding dependencies on specific toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/zmqpp/Config.in | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
> index 0aaeda3..756c810 100644
> --- a/package/zmqpp/Config.in
> +++ b/package/zmqpp/Config.in
> @@ -1,10 +1,7 @@
>  config BR2_PACKAGE_ZMQPP
>  	bool "zmqpp"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Too old gcc
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Too old gcc
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # c++0x support
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # c++0x support
> +	# c++0x support
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # util-linux
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> @@ -17,9 +14,9 @@ config BR2_PACKAGE_ZMQPP
>  
>  	  http://github.com/benjamg/zmqpp
>  
> -comment "zmqpp needs a toolchain w/ C++, wchar, threads"
> +comment "zmqpp needs a toolchain w/ C++, wchar, threads, gcc >= 4.6"
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
> -		BR2_TOOLCHAIN_HAS_THREADS)
> +		BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_6)

Don;t you want to take that opportunity to rewrite that with the more
usual  !foo || !bar || !buz  syntax?

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  if BR2_PACKAGE_ZMQPP
>  
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
