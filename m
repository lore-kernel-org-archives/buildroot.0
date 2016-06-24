From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 09:38:05 +0200
Subject: [Buildroot] [PATCH 5/6] libselinux: bump to version 2.5
In-Reply-To: <1466736201-17310-5-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
 <1466736201-17310-5-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624093805.6793ed48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Jun 2016 22:43:20 -0400, Adam Duskett wrote:

> diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
> index bc8298d..af4d759 100644
> --- a/package/libselinux/Config.in
> +++ b/package/libselinux/Config.in
> @@ -6,6 +6,8 @@ config BR2_PACKAGE_LIBSELINUX
>  	depends on !BR2_STATIC_LIBS
>  	# Toolchain issue: "fixup not contained within frag"
>  	depends on !BR2_arc
> +   # Newer versions of libselinux won't compile against glibc 2.22.

Indentation must be done with one tab here.

> +	depends on !BR2_GLIBC_VERSION_2_22

What is the issue you're facing with glibc 2.22 ?

Adding a depends on !BR2_GLIBC_VERSION_2_22 is not possible, because
this symbol only makes sense when you're using the internal toolchain
mechanism (i.e when Buildroot builds the toolchain for you). When
you're using an external toolchain, this symbol has no meaning, so you
might very well have BR2_GLIBC_VERSION_2_22 disabled, but still have a
glibc 2.22 based external toolchain.

So I'd rather understand what is the build failure, and see if it can
be fixed.

>  	help
>  	  libselinux is the runtime SELinux library that provides
>  	  interfaces (e.g. library functions for the SELinux kernel
> @@ -17,6 +19,9 @@ config BR2_PACKAGE_LIBSELINUX
>  
>  	  http://selinuxproject.org/page/Main_Page
>  
> -comment "libselinux needs a toolchain w/ threads, dynamic library"
> +comment "libselinux needs a toolchain w/ threads, dynamic library, glibc version != 2.22"
>  	depends on !BR2_arc
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || BR2_GLIBC_VERSION_2_22
> +
> +
> +

Unnecessary line additions.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
