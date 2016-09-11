From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Sep 2016 00:22:57 +0200
Subject: [Buildroot] [PATCH] package/php-ssh2: fix kconfig circular deps
 after libssh2 fix
In-Reply-To: <1473630559-11339-1-git-send-email-yann.morin.1998@free.fr>
References: <1473630559-11339-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <a8d9fd1b-7d59-5952-2f26-22b9e24e5646@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 23:49, Yann E. MORIN wrote:
> After we simplified the libssh2 dependencies, the new dependencies were
> not propagated to the php-ssh2 package, causing circular dependencies:
> 
>     package/openssl/Config.in:1:error: recursive dependency detected!
>     package/openssl/Config.in:1:    symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBSSH2
>     package/libssh2/Config.in:1:    symbol BR2_PACKAGE_LIBSSH2 is selected by BR2_PACKAGE_PHP_SSH2
>     package/php-ssh2/Config.in:1:   symbol BR2_PACKAGE_PHP_SSH2 depends on BR2_PACKAGE_OPENSSL
> 
> Just drop the now-useless dependency inherited from libssh2: libssh2 now
> has no dependency.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Thanks for the speedy fix!

 Regards,
 Arnout

> ---
>  package/php-ssh2/Config.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
> index c795dd5..b457900 100644
> --- a/package/php-ssh2/Config.in
> +++ b/package/php-ssh2/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_PHP_SSH2
>  	bool "php-ssh2"
>  	depends on BR2_PACKAGE_PHP
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS \
> -		&& !BR2_PACKAGE_OPENSSL # libssh2, libgcrypt
>  	select BR2_PACKAGE_LIBSSH2
>  	help
>  	  PHP bindings for the libssh2 library.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
