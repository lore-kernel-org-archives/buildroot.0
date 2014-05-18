From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 May 2014 23:36:14 +0200
Subject: [Buildroot] [PATCH] duma: not available on non-MMU platforms
In-Reply-To: <1400435100-10211-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1400435100-10211-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140518213614.GE3631@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-18 19:45 +0200, Thomas Petazzoni spake thusly:
> By design, building duma on Blackfin and other non-MMU platforms is
> quite useless: it uses page mappings to detect buffer overrun and
> use-after-free programming errors. Therefore, this commit simply marks
> duma as not available on non-MMU platforms.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/951/9519d7abb45c6a789874ec6bb84418c31a98916b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/duma/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/duma/Config.in b/package/duma/Config.in
> index e9cc9b2..7679e64 100644
> --- a/package/duma/Config.in
> +++ b/package/duma/Config.in
> @@ -2,6 +2,10 @@ config BR2_PACKAGE_DUMA
>  	bool "duma"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# By design, duma uses page mapping to isolate
> +	# allocations. Non-MMU platforms cannot perform such
> +	# things.
> +	depends on BR2_USE_MMU
>  	help
>  	  D.U.M.A. - Detect Unintended Memory Access. A fork of the
>  	  Electric Fence library. Detects buffer overflow and
> @@ -17,4 +21,5 @@ config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
>  endif # BR2_PACKAGE_DUMA
>  
>  comment "duma needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 1.9.3
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
