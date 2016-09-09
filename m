From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Sep 2016 22:58:05 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/libssh: fix dependency on
	libgcrypt
In-Reply-To: <35cb1a1a8f3d459ffdd0a66b14db4ee4f92b329c.1473369033.git.yann.morin.1998@free.fr>
References: <cover.1473369033.git.yann.morin.1998@free.fr>
 <35cb1a1a8f3d459ffdd0a66b14db4ee4f92b329c.1473369033.git.yann.morin.1998@free.fr>
Message-ID: <dc3ef2bd-18a6-ac59-e290-9fd108889b56@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-16 23:11, Yann E. MORIN wrote:
> Since 2f89476 (package/libgpg-error: bump to version 1.23), libssh has
> inherited the dependency from libgcrypt (propagated from libgpg-error).
> 
> However, since libssh can use either openssl or libgcrypt as a backend,
> the dependency should be relaxed when openssl is available.
> 
> But the test is broken and inverted: it will make libssh unavailable as
> soon as openssl is enabled.
> 
> This in itself is already incorrect, but that can cause further issues,
> as some packages (e.g. Kodi) will select (indirectly) openssl, and has
> an option to select libssh; enabling that option causes unmet direct
> dependencies of libssh:
> 
>     warning: (BR2_PACKAGE_KODI_LIBSSH) selects BR2_PACKAGE_LIBSSH which
>     has unmet direct dependencies (BR2_USE_MMU && !BR2_STATIC_LIBS &&
>     BR2_TOOLCHAIN_HAS_THREADS && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>     && !BR2_PACKAGE_OPENSSL)
> 
> Fix this dependency byt doing what other similar packages do: select
                        ^

> openssl if the other crypto backend (here libgcrypt) is not enabled.

 Well, there are still some that prefer a different crypto backend: mosh prefers
nettle over openssl, shairport-sync prefers polarssl. But those packages don't
depend on anything so no problem.


Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> This also allows us to drop the propagated dependency on the arch
> condition.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Changes v1 -> v2:
>   - invert the selection to use openssl as a fallback  (Thomas)
>   - drop the arch dependency  (Thomas)
> ---
>  package/libssh/Config.in | 3 +--
>  package/libssh/libssh.mk | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libssh/Config.in b/package/libssh/Config.in
> index 6029f45..3dbfa7d 100644
> --- a/package/libssh/Config.in
> +++ b/package/libssh/Config.in
> @@ -4,8 +4,7 @@ config BR2_PACKAGE_LIBSSH
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# Either OpenSSL or libgcrypt are mandatory
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
> -	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
>  	help
>  	  libssh is a multiplatform C library implementing the SSHv2
>  	  and SSHv1 protocol on client and server side. With libssh,
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index 29bbf4e..429e3c1 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -23,14 +23,14 @@ else
>  LIBSSH_CONF_OPTS += -DWITH_ZLIB=OFF
>  endif
>  
> +# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
> +# Favour libgcrypt.
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
>  LIBSSH_DEPENDENCIES += libgcrypt
>  else
>  LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LIBSSH_DEPENDENCIES += openssl
>  endif
> -endif
>  
>  $(eval $(cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
