From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 17:09:41 +0200
Subject: [Buildroot] [PATCH] pppd: Add an option to not to overwrite
 /etc/resolv.conf
In-Reply-To: <1508234054-22360-1-git-send-email-msalau@iotecha.com>
References: <1508234054-22360-1-git-send-email-msalau@iotecha.com>
Message-ID: <33618c20-7fa5-d02f-a937-e030506b0c77@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Maksim,

On 17-10-17 11:54, Maksim Salau wrote:
> By default pppd built by buildroot writes the list of nameservers to
> /etc/resolv.conf instead of /etc/ppp/resolv.conf
> This is not the default behavior of pppd and breaks name resolution
> if several network interfaces are used. The change makes this optional
> and enabled by default, to be backward compatible and to add a possibility
> to turn this behavior off, if required.
> 
> Signed-off-by: Maksim Salau <msalau@iotecha.com>

 Applied to master, thanks. I did extend the help text a bit to explain that the
pppd default doesn't work on a readonly rootfs out of the box.

 Regards,
 Arnout

> ---
>  package/pppd/Config.in | 7 +++++++
>  package/pppd/pppd.mk   | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/pppd/Config.in b/package/pppd/Config.in
> index 8c56421..9f77429 100644
> --- a/package/pppd/Config.in
> +++ b/package/pppd/Config.in
> @@ -23,6 +23,13 @@ config BR2_PACKAGE_PPPD_RADIUS
>  	help
>  	  Install RADIUS support for pppd
>  
> +config BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF
> +	bool "overwrite /etc/resolv.conf"
> +	default y
> +	help
> +	  Overwrite /etc/resolv.conf instead of maintaining the separate list
> +	  of nameservers in /etc/ppp/resolv.conf
> +
>  endif
>  
>  comment "pppd needs a uClibc or glibc toolchain w/ dynamic library"
> diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
> index 6139c5b..6b86a4d 100644
> --- a/package/pppd/pppd.mk
> +++ b/package/pppd/pppd.mk
> @@ -41,7 +41,9 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
>  define PPPD_SET_RESOLV_CONF
>  	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
>  endef
> +ifeq ($(BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF),y)
>  PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
> +endif
>  
>  define PPPD_CONFIGURE_CMDS
>  	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
