From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:07:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libressl: needs MMU
In-Reply-To: <20170723200844.13004-1-bernd.kuhls@t-online.de>
References: <20170723200844.13004-1-bernd.kuhls@t-online.de>
Message-ID: <20170724180723.4786fad5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 22:08:44 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/074/07429d3016c900894fa0ca19b7dad0a928e32e3f/
> http://autobuild.buildroot.net/results/1c1/1c1325d1a7a7aa98172d2d93d30322165af62348/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libressl/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libressl/Config.in b/package/libressl/Config.in
> index 0a1c9e273..d13b2068c 100644
> --- a/package/libressl/Config.in
> +++ b/package/libressl/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBRESSL
>  	bool "libressl"
>  	depends on !BR2_PACKAGE_OPENSSL
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  LibreSSL is a version of the TLS/crypto stack forked from
>  	  OpenSSL in 2014, with goals of modernizing the codebase,

On this one, I'd like to have the feedback from Waldemar. Indeed,
libressl is not using fork(), but __register_atfork(), which uClibc
does not implement, and I've not found why it doesn't exist for noMMU
platforms.

In addition, libressl interestingly has a special case for __GLIBC__
(which gets used for uclibc, because uclibc defines __GLIBC__):

#ifdef __GLIBC__
extern void *__dso_handle;
extern int __register_atfork(void (*)(void), void(*)(void), void (*)(void), void *);
#define _ARC4_ATFORK(f) __register_atfork(NULL, NULL, (f), __dso_handle)
#else
#define _ARC4_ATFORK(f) pthread_atfork(NULL, NULL, (f))
#endif

Waldemar, what do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
