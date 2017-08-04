From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:16:42 +0200
Subject: [Buildroot] [PATCH 02/10] add openssl as a dependency to
 certain packages
In-Reply-To: <20170804185521.12320-3-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-3-Adamduskett@outlook.com>
Message-ID: <4e8839b0-a879-2094-3022-714ad348732c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 20:55, Adam Duskett wrote:
[snip]
> diff --git a/package/luvi/Config.in b/package/luvi/Config.in
> index c9fd41739..c8921c320 100644
> --- a/package/luvi/Config.in
> +++ b/package/luvi/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LUVI
>  	depends on !BR2_STATIC_LIBS # libuv
>  	depends on BR2_PACKAGE_LUAJIT
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +	depends on BR2_PACKAGE_OPENSSL

 This makes no sense to me. luvi can be built without openssl, so why should it
depend on it? In fact, the only thing you should do is NOT modify the .mk file,
then lua-openssl will not be used if libressl is selected.

[snip]
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 345fe1047..921f3c609 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -13,6 +13,9 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wch
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
>  		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
>  
> +comment "nodejs needs OpenSSL"
> +	depends on !BR2_PACKAGE_OPENSSL
> +
>  config BR2_PACKAGE_NODEJS
>  	bool "nodejs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> @@ -21,6 +24,7 @@ config BR2_PACKAGE_NODEJS
>  	depends on BR2_HOST_GCC_AT_LEAST_4_8
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_PACKAGE_OPENSSL

 Similar situation here, I think.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
