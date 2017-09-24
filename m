From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:57:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/nmap: bump version to 7.60
In-Reply-To: <20170913131315.12129-1-bernd.kuhls@t-online.de>
References: <20170913131315.12129-1-bernd.kuhls@t-online.de>
Message-ID: <ae9b9621-c5ca-b0bf-93ca-8e3f57274528@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 15:13, Bernd Kuhls wrote:
> Version 7.60 added optional support for libssh2:
> http://seclists.org/nmap-announce/2017/4
> 
> Switched _SITE to https
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/nmap/nmap.hash |  4 ++--
>  package/nmap/nmap.mk   | 12 ++++++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
> index 239ca13816..740ec7a001 100644
> --- a/package/nmap/nmap.hash
> +++ b/package/nmap/nmap.hash
> @@ -1,2 +1,2 @@
> -# From https://nmap.org/dist/sigs/nmap-7.40.tar.bz2.digest.txt
> -sha256 9e14665fffd054554d129d62c13ad95a7b5c7a046daa2290501909e65f4d3188  nmap-7.40.tar.bz2
> +# From https://nmap.org/dist/sigs/nmap-7.60.tar.bz2.digest.txt
> +sha256 a8796ecc4fa6c38aad6139d9515dc8113023a82e9d787e5a5fb5fa1b05516f21  nmap-7.60.tar.bz2
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 37720e2cad..9db06d1455 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -NMAP_VERSION = 7.40
> -NMAP_SITE = http://nmap.org/dist
> +NMAP_VERSION = 7.60
> +NMAP_SITE = https://nmap.org/dist
>  NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>  NMAP_DEPENDENCIES = libpcap pcre
>  NMAP_CONF_OPTS = --without-liblua --without-zenmap \
> @@ -27,6 +27,14 @@ define NMAP_WRAPPER_EXEC
>  endef
>  NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
>  
> +ifeq ($(BR2_PACKAGE_LIBSSH2),y)
> +NMAP_CONF_OPTS += --with-libssh2="$(STAGING_DIR)/usr"
> +NMAP_DEPENDENCIES += libssh2
> +NMAP_LIBS_FOR_STATIC_LINK += `$(PKG_CONFIG_HOST_BINARY) --libs libssh2`
> +else
> +NMAP_CONF_OPTS += --without-libssh2
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
>  NMAP_DEPENDENCIES += host-pkgconf openssl
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
