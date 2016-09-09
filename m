From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Sep 2016 23:06:26 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/libssh2: fix dependency on
	libgcrypt
In-Reply-To: <d43755749a1facb634718891552836557cb9d480.1473369033.git.yann.morin.1998@free.fr>
References: <cover.1473369033.git.yann.morin.1998@free.fr>
 <d43755749a1facb634718891552836557cb9d480.1473369033.git.yann.morin.1998@free.fr>
Message-ID: <dcfef5a3-cabd-4c14-fcc6-c6c5cf1e7714@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-16 23:11, Yann E. MORIN wrote:
> Since 2f89476 (package/libgpg-error: bump to version 1.23), libssh2 has
> inherited the dependency from libgcrypt (propagated from libgpg-error).
> 
> However, since libssh2 can use either openssl or libgcrypt as a backend,
> the dependency should be relaxed when openssl is available.
> 
> But the test is broken and inverted: it will make libssh unavailable as
> soon as openssl is enabled.
> 
> Fix this dependency byt doing what other similar packages do: select
> openssl if the other crypto backend (here libgcrypt) is not enabled.
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

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - invert the selection to use openssl as a fallback  (Thomas)
>   - drop the arch dependency  (Thomas)
> ---
>  package/libssh2/Config.in  | 3 +--
>  package/libssh2/libssh2.mk | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
> index 0deb3bb..2944624 100644
> --- a/package/libssh2/Config.in
> +++ b/package/libssh2/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LIBSSH2
>  	bool "libssh2"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
> -	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
>  	help
>  	  libssh2 is a client-side C library implementing the SSH2
>  	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 221fac4..847c2f1 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -11,8 +11,8 @@ LIBSSH2_LICENSE_FILES = COPYING
>  LIBSSH2_INSTALL_STAGING = YES
>  LIBSSH2_CONF_OPTS = --disable-examples-build
>  
> -# libssh2 must use either libgcrypt or OpenSSL
> -# Only select openssl if libgcrypt is not selected
> +# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
> +# Favour libgcrypt.
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  LIBSSH2_DEPENDENCIES += libgcrypt
>  LIBSSH2_CONF_OPTS += --with-libgcrypt \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
