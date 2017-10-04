From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 4 Oct 2017 17:08:53 +0300
Subject: [Buildroot] [PATCH] nmap: add option to build/install "ncat"
In-Reply-To: <20171004124920.7358-1-casantos@datacom.ind.br>
References: <20171004112008.4426cff9@windsurf.home>
 <20171004124920.7358-1-casantos@datacom.ind.br>
Message-ID: <20171004140853.s2ys3qp6zon7rdxj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Wed, Oct 04, 2017 at 09:49:20AM -0300, Carlos Santos wrote:
> Ncat is a much-improved reimplementation of the venerable Netcat and is
> compatible with uClibc.
> 
> So far the "nc" options available to build with uClibc were the ancient
> GNU netcat and its Busybox double (the openbsd-netcat package cannot be
> used because it requires GLIBC). Both lack features available in modern
> netcats like IPv6, proxies, and Unix sockets.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ------
> Changes v1->v2:
>   - Prevent build error
>     Makefile:537: *** nmap is in the dependency chain of nc that has \
>     added it to its _DEPENDENCIES variable without selecting it or \
>     depending on it from Config.in.  Stop.
> ------
>  package/Config.in                        |  3 +-
>  package/nc/Config.in                     | 84 ++++++++++++++++++++++++++++++++
>  package/nc/nc.mk                         |  7 +++
>  package/netcat-openbsd/Config.in         | 25 ----------
>  package/netcat-openbsd/netcat-openbsd.mk |  2 +
>  package/netcat/Config.in                 | 13 -----
>  package/netcat/netcat.mk                 |  1 +
>  package/nmap/Config.in                   |  4 ++
>  package/nmap/nmap.mk                     | 30 +++++++++++-
>  9 files changed, 127 insertions(+), 42 deletions(-)
>  create mode 100644 package/nc/Config.in
>  create mode 100644 package/nc/nc.mk
> ---
>  package/nmap/Config.in | 12 ++++++++++++
>  package/nmap/nmap.mk   | 21 ++++++++++++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nmap/Config.in b/package/nmap/Config.in
> index 79f587afd1..7986bd6544 100644
> --- a/package/nmap/Config.in
> +++ b/package/nmap/Config.in
> @@ -11,6 +11,18 @@ config BR2_PACKAGE_NMAP
>  
>  	  http://nmap.org
>  
> +if BR2_PACKAGE_NMAP
> +
> +config BR2_PACKAGE_NMAP_NCAT
> +	bool "nmap-ncat"
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
> index 9db06d1455..e41a66927c 100644
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
> @@ -50,4 +50,23 @@ else
>  NMAP_CONF_OPTS += --without-ndiff
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
> +
> +# If both nmap-ncat and busybox are selected, make certain coreutils

coreutils?

> +# wins the fight over who gets to have their utils actually installed.
> +ifeq ($(BR2_PACKAGE_BUSYBOX),Y)
> +NMAP_DEPENDENCIES += busybox
> +endif
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

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
