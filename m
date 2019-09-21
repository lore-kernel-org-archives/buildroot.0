From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:11:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: needs host gcc >= 4.8
In-Reply-To: <20190921182328.5458-1-bernd.kuhls@t-online.de>
References: <20190921182328.5458-1-bernd.kuhls@t-online.de>
Message-ID: <59aeb585-261f-7543-ee49-ccf53226fe22@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 20:23, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/c20/c209e1128cf4601e2f7dc131f82eec0b5df39f75/

 No it doesn't...

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/harfbuzz/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
> index e8f407bb8f..4fa2135966 100644
> --- a/package/harfbuzz/Config.in
> +++ b/package/harfbuzz/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HARFBUZZ
>  	bool "harfbuzz"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8

 If a target package depends on a host compiler version, you really have to
explain why...

 In this case, it doesn't, actually. It is pango that depends on host-harfbuzz,
and *that* requires a host compiler >= 4.8.

 So, you have to add the dependency to pango, not harfbuzz. Which means
propagating it...

 Regards,
 Arnout

>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> @@ -14,4 +15,5 @@ config BR2_PACKAGE_HARFBUZZ
>  comment "harfbuzz needs a toolchain w/ C++, gcc => 4.8"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_HOST_GCC_AT_LEAST_4_8 || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
