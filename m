From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 31 Mar 2018 12:34:22 +0200
Subject: [Buildroot] [PATCH] netcat: add forced dependence on BusyBox
In-Reply-To: <20171012151418.3523-2-casantos@datacom.ind.br>
References: <20171012151418.3523-1-casantos@datacom.ind.br>
 <20171012151418.3523-2-casantos@datacom.ind.br>
Message-ID: <00cfde34-7006-40de-ecb5-307418aa97b8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Le 12/10/2017 ? 17:14, Carlos Santos a ?crit?:
> It may be necessary if packages become built in parallel, leading to a
> race condition on the creation of the "nc" link. Moreover, netcat is as
> shy as BusyBox and would not override an existing file/link, so we must
> remove $(TARGET_DIR)/usr/bin/nc in advance.
> 
> Of course this still leaves a race conditon if other netcat competitors
> but we must assume thet the user is a grown-up person who knows what is
> doing.

It seems you are using a custom busybox config file because the netcat applet is
disabled by default.

I'm agree, the dependency on busybox is missing but the TARGET_HOOKS doesn't
seems necessary. I removed it and netcat package is able to override the busybox
symlink.

 /usr/bin/install -c netcat output/target/usr/bin/netcat

Maybe we should check if other packages depending on
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS have a dependency on busybox.

Best regards,
Romain

> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/netcat/netcat.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
> index eb7ddcac27..c032eea56d 100644
> --- a/package/netcat/netcat.mk
> +++ b/package/netcat/netcat.mk
> @@ -9,4 +9,15 @@ NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VE
>  NETCAT_LICENSE = GPL-2.0+
>  NETCAT_LICENSE_FILES = COPYING
>  
> +# Ensure Busybox gets built/installed before, so that this package
> +# overrides Busybox nc. We must remove an existing file/link because
> +# netcat is as shy as Busybox and would not override existing files.
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +NETCAT_DEPENDENCIES += busybox
> +define NETCAT_RMOVE_NC_LINK
> +	rm -f $(TARGET_DIR)/usr/bin/nc
> +endef
> +NETCAT_PRE_INSTALL_TARGET_HOOKS += NETCAT_RMOVE_NC_LINK
> +endif
> +
>  $(eval $(autotools-package))
> 
