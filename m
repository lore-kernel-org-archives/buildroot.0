From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 11:46:02 +0200
Subject: [Buildroot] [PATCH] package/mono: fixing missing locale
In-Reply-To: <1437980581-9378-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1437980581-9378-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150727114602.4184ce0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 27 Jul 2015 09:03:01 +0200, Angelo Compagnucci wrote:
> This patch fixes compilation error in case of a missing locale in toolchain.
> 
> Fixes: http://autobuild.buildroot.net/results/a0fc33a4ed90844f9529acc76a6ba183fe253771/
>        http://autobuild.buildroot.net/results/3ff839e894f0b8f9c2e3af9629d45e8efc09aecd/
>        http://autobuild.buildroot.net/results/5e11117048d965bc1fc44c738bb51f11164304af/
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/mono/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 4445f4b..0c7129b 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_MONO
>  	bool "mono"
>  	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
>  	  An open source, cross-platform, implementation of C#
>  	  and the CLR that is binary compatible with Microsoft.NET.

This is not sufficient, as it does not guarantee that libiconv will be
built before mono. So you also need to modify the .mk file:

ifeq ($(BR2_PACKAGE_LIBICONV),y)
MONO_DEPENDENCIES += libiconv
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
