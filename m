From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 6 Apr 2020 19:11:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/libclc: disable ccache
In-Reply-To: <20200406165045.2607140-1-aduskett@gmail.com>
References: <20200406165045.2607140-1-aduskett@gmail.com>
Message-ID: <8e448ddf-c8f8-5209-bfab-a5c813b90ff9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam, All,

Le 06/04/2020 ? 18:50, aduskett at gmail.com a ?crit?:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Configure.py extracts arch, vendor, and os from the passed
> toolchain string on line 180. When using ccache, the passed path string is
> "/usr/lib64/ccache/g++" which breaks the logic, causing the following error:
> 
> Traceback (most recent call last):
>   File "./configure.py", line 180, in <module>
>     (t_arch, t_vendor, t_os) = target.split('-')
> ValueError: not enough values to unpack (expected 3, got 1)
> 
> Use --with-cxx-compiler=$(HOSTCXX_NOCCACHE) instead of $(HOSTCXX) to fix the
> above error.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libclc/libclc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
> index 52249a7087..630616905c 100644
> --- a/package/libclc/libclc.mk
> +++ b/package/libclc/libclc.mk
> @@ -25,7 +25,7 @@ LIBCLC_CONF_OPTS = \
>  	--prefix=/usr \
>  	--includedir=/usr/share \
>  	--pkgconfigdir=/usr/lib/pkgconfig \
> -	--with-cxx-compiler=$(HOSTCXX)
> +	--with-cxx-compiler=$(HOSTCXX_NOCCACHE)

I don't use ccache while testing...

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  
>  define LIBCLC_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
> 
