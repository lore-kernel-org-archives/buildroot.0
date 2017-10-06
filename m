From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:58:19 +0200
Subject: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"
In-Reply-To: <20171004154313.25762-1-casantos@datacom.ind.br>
References: <20171004124920.7358-1-casantos@datacom.ind.br>
 <20171004154313.25762-1-casantos@datacom.ind.br>
Message-ID: <f45e607f-ebff-129a-0064-de7fa4255be6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

 Sorry to iterate yet another time on this patch...

On 04-10-17 17:43, Carlos Santos wrote:
> Ncat is a much-improved reimplementation of the venerable Netcat and is
> compatible with uClibc.
> 
> So far the "nc" options available to build with uClibc were the ancient

 uClibc and musl.

> GNU netcat and its Busybox double (the openbsd-netcat package cannot be

 The package is called netcat-openbsd.

> used because it requires GLIBC). Both lack features available in modern
> netcats like IPv6, proxies, and Unix sockets.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[snip]
> diff --git a/package/nmap/Config.in b/package/nmap/Config.in
> index 79f587afd1..a2e330dacd 100644
> --- a/package/nmap/Config.in
> +++ b/package/nmap/Config.in
> @@ -11,6 +11,19 @@ config BR2_PACKAGE_NMAP
>  
>  	  http://nmap.org
>  
> +if BR2_PACKAGE_NMAP
> +
> +config BR2_PACKAGE_NMAP_NCAT
> +	bool "nmap-ncat"

 ncat itself is very small (+- 150K) compared to the rest of nmap (+- 2.5M), so
it's not really worth making a config option for it.

 Conversely, it *could* be worthwhile to have an option
BR2_PACKAGE_NMAP_NCAT_ONLY that just installs the ncat tool (+symlink) from the
package. So my idea would be:

- always build with ncat and install the symlink;
- if BR2_PACKAGE_NMAP_NCAT_ONLY is selected, override the install commands to
just install ncat + symlink.

 Perhaps to be sure you can do it as two patches, first one that always enables
ncat and installs symlink, second one that adds the BR2_PACKAGE_NMAP_NCAT_ONLY
option. That kind of option is a bit controversial (it's a "negative" option
because it removes stuff from the nmap package; we generally  prefer additive
options instead, but that would be a bit complicated here).


 One more thing though: are the ncat options compatible with those for
netcat-openbsd? And I'm talking about the options that are not in busybox or GNU
netcat now. If they are not compatible (and a quick look at the man pages tells
me that only the -6 and -U options are the same), I feel awkward about creating
the symlink: since you need to know which netcat type you're using, you could
just as well call ncat directly. And for scripts that don't rely on any of
these, the busybox or GNU nc is enough.

 Regards,
 Arnout

> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	help
> +	  Ncat is a feature-packed networking utility which reads and
> +	  writes data across networks from the command line. Ncat was
> +	  written for the Nmap Project as a much-improved
> +	  reimplementation of the venerable Netcat.
> +
> +endif
> +
>  comment "nmap needs a toolchain w/ C++, threads"
>  	depends on BR2_USE_MMU
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 9db06d1455..fb16c2887d 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -10,7 +10,7 @@ NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>  NMAP_DEPENDENCIES = libpcap pcre
>  NMAP_CONF_OPTS = --without-liblua --without-zenmap \
>  	--with-libdnet=included --with-liblinear=included \
> -	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
> +	--with-libpcre="$(STAGING_DIR)/usr"
>  NMAP_LICENSE = GPL-2.0
>  NMAP_LICENSE_FILES = COPYING
>  
> @@ -50,4 +50,17 @@ else
>  NMAP_CONF_OPTS += --without-ndiff
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
> +
> +define NMAP_INSTALL_NCAT_SYMLINK
> +        ln -fs ncat $(TARGET_DIR)/usr/bin/nc
> +endef
> +NMAP_POST_INSTALL_TARGET_HOOKS += NMAP_INSTALL_NCAT_SYMLINK
> +
> +else
> +
> +NMAP_CONF_OPTS += --without-ncat
> +
> +endif
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
