From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 10:02:17 +0200
Subject: [Buildroot] [PATCH 6/6] libsemanage: bump to version 2.5
In-Reply-To: <1466736201-17310-6-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
 <1466736201-17310-6-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624100217.4d4d7f25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your patch. See my comments below.

On Thu, 23 Jun 2016 22:43:21 -0400, Adam Duskett wrote:

>  .../libsemanage/0001-execption-lib-path-fix.patch  | 14 -------------

You are removing this patch, why?

> diff --git a/package/libsemanage/0001-workaround-blackfin-issue.patch b/package/libsemanage/0001-workaround-blackfin-issue.patch
> new file mode 100644
> index 0000000..6208ee7
> --- /dev/null
> +++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
> @@ -0,0 +1,13 @@
> +diff --git a/src/dso.h b/src/dso.h
> +index 5c69aae..90ba3bf 100644

This patch got renamed, but in the process, you completely removed the
description of the patch and the Signed-off-by line. This is not good.


> diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
> index 5e9ad8f..cff4c07 100644
> --- a/package/libsemanage/Config.in
> +++ b/package/libsemanage/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_LIBSEMANAGE
>  	bool "libsemanage"
> -	select BR2_PACKAGE_LIBSELINUX
>  	select BR2_PACKAGE_USTR
>  	select BR2_PACKAGE_BZIP2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_LIBSELINUX

Why are you changing from a depends on to a select ? The original
"select" is the correct thing to do.

>  	depends on !BR2_STATIC_LIBS
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # getpwent_r()
>  	depends on !BR2_arc
> @@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBSEMANAGE
>  
>  	  http://selinuxproject.org/page/Main_Page
>  
> -comment "libsemanage needs a toolchain w/ threads, dynamic library"
> +comment "libsemanage needs a toolchain w/ threads, dynamic library, libselinux"
>  	depends on !BR2_arc
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_LIBSELINUX

As per my comment above, this change is not necessary.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
