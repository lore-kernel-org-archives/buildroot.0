From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Dec 2013 12:41:49 +0100
Subject: [Buildroot] [PATCH] bonnie: does not support static builds
In-Reply-To: <1387279718-6528-1-git-send-email-spdawson@gmail.com>
References: <1387279718-6528-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131217124149.312b1d8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Tue, 17 Dec 2013 11:28:38 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Fixes autobuild failues such as the following.
> 
>   http://autobuild.buildroot.net/results/bb9/bb9665a957e4fed25dff3e36bbf105c523dcf0a7/
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/bonnie/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
> index 6dbd06d..a4a50f8 100644
> --- a/package/bonnie/Config.in
> +++ b/package/bonnie/Config.in
> @@ -2,11 +2,12 @@ config BR2_PACKAGE_BONNIE
>  	bool "bonnie++"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_PREFER_STATIC_LIB
>  	help
>  	  Filesystem tester
>  
>  	  http://www.coker.com.au/bonnie++/
>  
> -comment "bonnie++ needs a toolchain w/ C++"
> +comment "bonnie++ needs a toolchain w/ C++, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_INSTALL_LIBSTDCPP	|| BR2_PREFER_STATIC_LIB

I need to test this specific case, but I don't think this is the
correct fix. If you look at the config.log file, I'm pretty sure you
will see that configure bails out because libstdc++.a does not exist.
This is a problem in the internal toolchain rework I've done, and that
I need to have a look at (make sure it generates the static version of
libstdc++).

Therefore, I don't think this patch should be applied: bonnie++, by
itself, does not require dynamic library.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
