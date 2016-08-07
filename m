From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Aug 2016 22:08:48 +0200
Subject: [Buildroot] [PATCH] libcofi: disable for static-only builds
In-Reply-To: <1470558003-19548-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470558003-19548-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807200848.GE5855@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-07 10:20 +0200, Thomas Petazzoni spake thusly:
> The libcofi package unconditionally builds a shared library, so we need
> to make it unavailable on BR2_STATIC_LIBS=y configurations.

Given that the expected use of libcofi is via LD_PRELOAD, this makes
sense.

(Technically, nothing would prevent linking with it at build time,
though.)

> Fixes:
> 
>   http://autobuild.buildroot.net/results/329c09bf123cd5b6dbcfff6251ba7a2c7cce50b8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libcofi/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libcofi/Config.in b/package/libcofi/Config.in
> index e9914d6..df9ab71 100644
> --- a/package/libcofi/Config.in
> +++ b/package/libcofi/Config.in
> @@ -1,8 +1,14 @@
>  config BR2_PACKAGE_LIBCOFI
>  	bool "libcofi"
>  	depends on BR2_arm
> +	# builds a shared library
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  A replacement for memcpy and memset functionality for the
>  	  Raspberry Pi with the intention of gaining greater performance.
>  
>  	  https://github.com/simonjhall/copies-and-fills
> +
> +comment "libcofi needs a toolchain w/ dynamic library"
> +	depends on BR2_arm
> +	depends on BR2_STATIC_LIBS
> -- 
> 2.7.4
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
