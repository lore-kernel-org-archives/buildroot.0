From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:12:16 +0200
Subject: [Buildroot] [PATCH 21/50 v2] package/busybox: invert dependency
 with nmap
In-Reply-To: <fba5b7de12815934cfa42099d998d5bbdd6ddb80.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <fba5b7de12815934cfa42099d998d5bbdd6ddb80.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <62372b6e-9150-55e0-18df-353e00731d75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 11:45, Yann E. MORIN wrote:
> We only need that dependency whan nmap's ncat is enabled.
> 
> For consistency, we add a dependency on nmap, not a suboption of it,
> to have a dependency list in busybox that is only about packages, and
> directly associates the upper-case package variable to the lower-case
> package name, e.g. NMAP <-> nmap.

 I have extended this commit message a little bit to make it explicit that we
get a spurious dependency, but that that's a small price to pay.

 Regards,
 Arnout

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Reviewed-by: Carlos Santos <casantos@datacom.com.br>
> 
> ---
> Changes v1 -> v2:
>   - fix typo  (Carlos)
> ---
>  package/busybox/busybox.mk | 1 +
>  package/nmap/nmap.mk       | 6 ------
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 1d3d202f53..55c3d25b8e 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
>  
>  # Packages that provide commands that may also be busybox applets:
>  BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_NMAP),nmap) \
>  	$(if $(BR2_PACKAGE_NTP),ntp) \
>  	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
>  	$(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 1c89b5424e..420aec82d7 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -76,12 +76,6 @@ else
>  NMAP_CONF_OPTS += --without-nping
>  endif
>  
> -# If we are going to install ncat, ensure Busybox gets built/installed
> -# before, so that this package overrides Busybox nc.
> -ifeq ($(BR2_PACKAGE_NMAP_NCAT)$(BR2_PACKAGE_BUSYBOX),yy)
> -NMAP_DEPENDENCIES += busybox
> -endif
> -
>  # Add a symlink to "nc" if none of the competing netcats is selected
>  ifeq ($(BR2_PACKAGE_NMAP_NCAT):$(BR2_PACKAGE_NETCAT)$(BR2_PACKAGE_NETCAT_OPENBSD),y:)
>  define NMAP_INSTALL_NCAT_SYMLINK
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
