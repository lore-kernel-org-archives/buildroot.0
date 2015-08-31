From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 31 Aug 2015 21:07:33 +0300
Subject: [Buildroot] [PATCH v2 1/4] package/rpm: bump to version 4.12.0.1
In-Reply-To: <1441041977-9160-1-git-send-email-james.knight@rockwellcollins.com>
References: <1441041977-9160-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150831180733.GL17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

On Mon, Aug 31, 2015 at 01:26:14PM -0400, James Knight wrote:
> The provided "bump" (suggested by Baruch Siach) switches from the rpm5
> implementation to rpm.org's more active stream.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---

[...]

> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index c6fc3b7..e79e9ce 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -1,21 +1,29 @@
> -comment "rpm needs a toolchain w/ threads"
> +comment "rpm needs a toolchain w/ threads and beecrypt or libnss"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PACKAGE_BEECRYPT && !BR2_PACKAGE_LIBNSS
>  	depends on BR2_USE_MMU # fork()
>  
>  config BR2_PACKAGE_RPM
>  	bool "rpm"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_BEECRYPT
> +	depends on BR2_PACKAGE_BEECRYPT || BR2_PACKAGE_LIBNSS

The convention is to do this instead:

	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS

Assuming that beecrypt is more lightweight then libnss (is it?).

This also obviates the need for the dependency comment change above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
