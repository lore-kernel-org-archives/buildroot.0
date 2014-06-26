From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jun 2014 20:58:24 +0300
Subject: [Buildroot] [PATCH] bmon: bump to version 3.2
In-Reply-To: <1403804911-29110-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403804911-29110-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140626175824.GW4155@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Jun 26, 2014 at 02:48:31PM -0300, Gustavo Zacarias wrote:
> And add license information, homepage and switch upstream source.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bmon/Config.in          | 14 +++++++++++---
>  package/bmon/bmon-curses.patch  | 26 --------------------------
>  package/bmon/bmon-gcc4.patch    | 36 ------------------------------------
>  package/bmon/bmon-nolibnl.patch | 24 ------------------------
>  package/bmon/bmon-nostrip.patch | 12 ------------
>  package/bmon/bmon.mk            | 23 ++++++++---------------
>  6 files changed, 19 insertions(+), 116 deletions(-)
>  delete mode 100644 package/bmon/bmon-curses.patch
>  delete mode 100644 package/bmon/bmon-gcc4.patch
>  delete mode 100644 package/bmon/bmon-nolibnl.patch
>  delete mode 100644 package/bmon/bmon-nostrip.patch
> 
> diff --git a/package/bmon/Config.in b/package/bmon/Config.in
> index 9f0dfa7..95ee4fc 100644
> --- a/package/bmon/Config.in
> +++ b/package/bmon/Config.in
> @@ -1,10 +1,18 @@
>  config BR2_PACKAGE_BMON
>  	bool "bmon"
>  	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBCONFUSE
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_NCURSES
>  	help
> -	  Linux bandwidth monitor
> +	  bmon is a bandwidth monitor capable of retrieving statistics from
> +	  various input modules. It provides various output methods
> +	  including a curses based interface.
>  
> -comment "bmon needs a toolchain w/ IPv6"
> +	  http://www.infradead.org/~tgr/bmon/
> +
> +comment "bmon needs a toolchain w/ IPv6, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INET_IPV6
> +	depends on !BR2_INET_IPV6 && !BR2_TOOLCHAIN_HAS_THREADS

Shouldn't this be

	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS

?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
