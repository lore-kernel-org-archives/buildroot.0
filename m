From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Sep 2017 08:55:24 +0200
Subject: [Buildroot] [PATCH 1/1] Openjpeg: Fix malloc poison issue,
 add C++ and threads dependencies
In-Reply-To: <20170908064510.4075-1-olivier.schonken@gmail.com>
References: <20170908064510.4075-1-olivier.schonken@gmail.com>
Message-ID: <20170908085524.2da019ee@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for looking into this build issue and finding a solution!

"Openjpeg" should be lowercase in the commit title

On Fri,  8 Sep 2017 08:45:10 +0200, Olivier Schonken wrote:
> The malloc poison issue has been fixed upstream, this patch will thus only
> be temporary.
> 
> Some of the autobuild issues related to missing g++ compilers
> and missing threading libraries.  Thus the dependency should solve that.

You should add a reference to the autobuilder failure being fixed.

> +++ b/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
> @@ -0,0 +1,53 @@
> +From 51a1dcaa6ed5713520dca36fc58cd9240c08b7ca Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Thu, 7 Sep 2017 17:52:59 +0200
> +Subject: [PATCH] Avoid malloc poisoning issue when including <pthread.h> of
> + uclibc (#1013)
> +

We need you to add your Signed-off-by here.

> diff --git a/package/openjpeg/Config.in b/package/openjpeg/Config.in
> index 738999fed7..65a629f6e9 100644
> --- a/package/openjpeg/Config.in
> +++ b/package/openjpeg/Config.in
> @@ -1,7 +1,12 @@
>  config BR2_PACKAGE_OPENJPEG
>  	bool "openjpeg"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Did you make sure that those new dependencies are propagated to the
packages that "select BR2_PACKAGE_OPENJPEG" ?

>  	help
>  	  The OpenJPEG library is an open-source JPEG 2000 codec
>  	  written in C.
>  
>  	  http://www.openjpeg.org
> +
> +comment "openjpeg needs a toolchain w/ C++, threads"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)

We normally write this as:

	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
